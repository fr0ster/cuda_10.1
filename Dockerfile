FROM nvidia/cuda:10.1-cudnn7-devel
RUN apt update -y && apt install wget gzip -y
RUN wget https://github.com/NVIDIA/cuda-samples/archive/v10.1.tar.gz -O /tmp/v10.1.tar.gz && tar xvf /tmp/v10.1.tar.gz -C / && \
wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz -O /tmp/go1.16.2.linux-amd64.tar.gz && \
rm -rf /usr/local/go && tar xvf /tmp/go1.16.2.linux-amd64.tar.gz -C /usr/local
WORKDIR /cuda-samples-10.1
ENV PATH=/usr/local/go/bin:$PATH
