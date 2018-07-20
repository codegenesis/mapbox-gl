FROM gcc:4.9

MAINTAINER skant@rccl.com

ENV APP_DIRECTORY /usr/src/app/mapbox-offline
ENV APP_LIB_DIR /usr/src/app/mapbox-offline/lib/
ENV JMX_PORT 3333

RUN echo "Creating APP Directory $APP_DIRECTORY"
RUN mkdir -p $APP_DIRECTORY

RUN echo "Creating APP Library Directory $APP_LIB_DIR"
RUN mkdir -p $APP_LIB_DIR

RUN echo "Copying jars to  APP Library Directory $APP_LIB_DIR"
COPY ./maven/* $APP_LIB_DIR

RUN echo "Compile offline.cpp"
RUN g++ --o offline offline.cpp

RUN echo "Adding entryPoint.sh"
ADD ./maven/bin/entryPoint.sh /entryPoint.sh

ENTRYPOINT ["/entryPoint.sh","$APP_DIRECTORY","$APP_LIB_DIR"]

