FROM sickcodes/docker-osx:auto


RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN brew install ansible

ARG TAGS
ENV TERMS_OF_USE=i_agree
ENV HOMEBREW_NO_AUTO_UPDATE=1

COPY . ./setup
CMD ["sh", "-c", "ansible-playbook $TAGS setup/local.yml"]

