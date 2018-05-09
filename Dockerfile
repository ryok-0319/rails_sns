FROM ubuntu:trusty
RUN apt-get update && \
    apt-get -y install git curl make openssl zlib1g-dev libssl-dev libreadline-dev sysv-rc-conf build-essential imagemagick libmagickwand-dev libmagickcore-dev mysql-client libmysqlclient-dev ssh xvfb zip awscli && \
    useradd ubuntu -m -s /bin/bash -u 1000 && \
    /bin/echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    ln -sf /usr/share/zoneinfo/UTC /etc/localtime && \
    mkdir -p /home/ubuntu/rails_sns && \
    chown ubuntu:ubuntu /home/ubuntu/rails_sns && \
    mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd
ENV LANG=ja_JP.UTF-8
COPY middleware/docker/etc/ssh/ssh_config /etc/ssh/ssh_config
USER ubuntu
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    echo 'export PATH="~/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    CONFIGURE_OPTS='--disable-install-rdoc' /home/ubuntu/.rbenv/bin/rbenv install 2.5.0 && \
    mkdir /home/ubuntu/.ssh && \
    chmod 700 /home/ubuntu/.ssh
COPY middleware/docker/run_utc.sh /home/ubuntu/
COPY middleware/docker/rbenv.sh /etc/profile.d/
COPY middleware/docker/.ssh/authorized_keys /home/ubuntu/.ssh/authorized_keys
RUN sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
RUN /home/ubuntu/.rbenv/versions/2.5.0/bin/gem update --system 2.6.13
ADD . /home/ubuntu/rails_sns
USER root
RUN chown -R ubuntu:ubuntu /home/ubuntu/rails_sns
