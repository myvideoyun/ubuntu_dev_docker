FROM ubuntu:bionic

# Feel free to change this to whatever your want
ENV DOCKER_USER wenyao

# Create user with passwordless sudo. This is only acceptable as it is a
# private development environment not exposed to the outside world. Do 
# NOT do this on your host machine or otherwise.
RUN apt-get update && \
    apt-get install -y sudo && \
    adduser --disabled-password --gecos '' "$DOCKER_USER" && \
    adduser "$DOCKER_USER" sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    touch /home/$DOCKER_USER/.sudo_as_admin_successful && \
    rm -rf /var/lib/apt/lists/*

USER "$DOCKER_USER"

WORKDIR "/home/$DOCKER_USER"

RUN yes | sudo unminimize && \
    sudo apt-get install -y man-db bash-completion build-essential curl openssh-client yasm git && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y tmux && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y neovim && \
    sudo rm -rf var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y cmake && \
    sudo rm -rf var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y valgrind && \
    sudo rm -rf var/lib/apt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y software-properties-common && \
    sudo rm -rf var/lib/apt/lists/*

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
RUN sudo add-apt-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main"

RUN sudo apt-get update && \
    sudo apt-get install -y libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime && \
    sudo rm -rf var/lib/opt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y clang-9 clang-tools-9 clang-9-doc libclang-common-9-dev libclang-9-dev libclang1-9 clang-format-9 python-clang-9 clangd-9 && \
    sudo rm -rf var/lib/opt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime && \
    sudo rm -rf var/lib/opt/lists/*

RUN sudo apt-get update && \
    sudo apt-get install -y clang-tidy && \
    sudo rm -rf var/lib/opt/lists/*
