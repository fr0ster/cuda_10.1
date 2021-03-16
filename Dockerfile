FROM nvidia/cuda:10.1-cudnn7-devel
WORKDIR /workdir
RUN apt update -y && apt install wget gzip sudo -y
RUN wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz -O /tmp/go1.16.2.linux-amd64.tar.gz && \
rm -rf /usr/local/go && tar xvf /tmp/go1.16.2.linux-amd64.tar.gz -C /usr/local
# Create non-root user
RUN useradd -m dev && \
  adduser dev sudo && \
  echo "dev:dev" | chpasswd

# Initilise base user
USER dev
WORKDIR /home/dev
ENV HOME /home/dev
ENV PATH=/home/dev/go/bin:/usr/local/go/bin:$PATH
ENV GOPATH=/home/dev/go
ENV GOROOT=/usr/local/go
RUN wget https://github.com/NVIDIA/cuda-samples/archive/v10.1.tar.gz && tar xvf v10.1.tar.gz -C /home/dev && go get golang.org/x/tour
