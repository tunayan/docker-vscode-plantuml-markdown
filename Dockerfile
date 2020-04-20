FROM ubuntu

ENV USER=code

RUN groupadd ${USER}_grp
RUN useradd -m -G ${USER}_grp $USER

RUN apt-get update && apt-get -y install \
    --no-install-recommends \
    libx11-xcb1 \
    libxtst6 \
    libxss1 \
    libgtk2.0-0 \
    git \
    openssh-server \
    xauth \
    graphviz \
    ca-certificates \
    default-jre \
    gpg \
    curl \
    apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get update \
 && apt-get install -y code \
 && apt-get install -f

USER $USER

RUN code --install-extension ms-vscode.cpptools
RUN code --install-extension jebbs.plantuml
RUN code --install-extension shd101wyy.markdown-preview-enhanced
RUN code --install-extension mdickin.markdown-shortcuts
RUN code --install-extension PKief.material-icon-theme
RUN code --install-extension streetsidesoftware.code-spell-checker
RUN code --install-extension esbenp.prettier-vscode
RUN code --install-extension janisdd.vscode-edit-csv

WORKDIR /home/$USER

ENTRYPOINT /usr/bin/code --verbose
