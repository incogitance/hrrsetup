# hrrsetup
Sets up a fresh linux install for the hackreactor immersive

Contains some optional installs

build-essentials
zlib1g-dev
mesa-common-dev
libgl1-mesa-dev
libglu1-mesa-dev

NVIDIA Graphics drivers 440

Uses apt-get install for the following:
wget
unzip
git
mongodb
apache2
nodejs
npm


Will download and apt install current(as of this writing) .deb versions of the following:
Chrome - dev
Zoom Meetings client
Slack client
VS Code
NPM

Installs extensions necessary for VS Code
ESlint
LiveShare

Installs using npm are as follows:
eslint - globally
reactorcore/eslint-config-hackreactor - globally

Optional -
wakatime extension
chrome debugger extension

Sets up the proper settings.json for VS Code as per HackReactor guidance

When finished gives the option of creating a $HOME/HackReactor workspace
also offers to set a custom folder icon

Happy Hacking!!

