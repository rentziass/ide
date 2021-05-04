FROM golang:alpine

WORKDIR /root

RUN apk update && apk upgrade && \
    apk add --no-cache \
    zsh git openssh curl

# dotfiles
ENV DOTFILES_REPO_PATH=/root/dotfiles
RUN go get github.com/rhysd/dotfiles
RUN dotfiles clone rentziass/dotfiles --https
RUN dotfiles link

# prompt
RUN apk add starship

# vim
RUN apk add neovim

CMD ["zsh"]
