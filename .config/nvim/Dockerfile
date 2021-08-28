FROM alpine:edge

RUN apk --no-cache add git neovim bash nodejs npm ripgrep alpine-sdk



WORKDIR /root/.config/nvim
COPY . .
# RUN git clone https://github.com/jrodal98/dotfiles /tmp/dotfiles && mkdir -p ~/.config/nvim && mv /tmp/dotfiles/.config/nvim ~/.config/ && rm -rf /tmp/dotfiles

# wait for packer downloads to finish
RUN nvim --headless +PackerSync +"sleep 10" +qall

WORKDIR /project

ENTRYPOINT ["/usr/bin/nvim"]
