FROM rust:latest

RUN git clone https://github.com/encointer/encointer-node.git
RUN cd encointer-node && git fetch && git checkout origin/personhood-democracy-1-delivery
RUN git clone https://github.com/encointer/pallets.git
RUN mv pallets/ encointer-pallets
RUN cd encointer-pallets && git fetch && git checkout origin/polkadot-v1.0.0-pallets-v1.3.0-democracy
RUN cd encointer-node && cargo fetch
RUN apt-get update
RUN apt-get install protobuf-compiler libclang-dev -y
RUN cd encointer-node && cargo build --release

RUN apt-get install python3 python3-pip python3.11-venv -y
RUN python3 -m venv env

RUN env/bin/pip install -r encointer-node/client/requirements.txt

RUN wget https://dist.ipfs.tech/kubo/v0.24.0/kubo_v0.24.0_linux-amd64.tar.gz
RUN tar -xvzf kubo_v0.24.0_linux-amd64.tar.gz
RUN cd kubo && bash install.sh
RUN ipfs init

COPY run.sh .
RUN chmod +x run.sh
CMD ["./run.sh"]