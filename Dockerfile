# This is a comment
FROM ubuntu:14.04
MAINTAINER Jonathan Hickford <jonathan.hickford@gmail.com>
RUN apt-get update && apt-get install -y git gcc libpng-dev libjpeg-dev libfftw3-dev make libavcodec-dev libavformat-dev libswscale-dev libdispatch-dev libev-dev libatlas-base-dev libblas-dev libgsl0-dev wget
RUN git clone https://github.com/liuliu/ccv.git
COPY make_ccv.sh /
RUN /make_ccv.sh
COPY run_ccv.sh /
EXPOSE 3350
CMD /run_ccv.sh

