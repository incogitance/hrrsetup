#!/bin/bash

#variables for URL's using wget due to lack of package in Ubuntu repo
CHROMEURL='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
CHROME='google-chrome-stable_current_amd64.deb'

ZOOMURL='https://zoom.us/client/latest/zoom_amd64.deb'
ZOOM='zoom_amd64.deb'

VSCODEURL='https://az764295.vo.msecnd.net/stable/9579eda04fdb3a9bba2750f15193e5fafe16b959/code_1.41.0-1576089540_amd64.deb'
VSCODE='code_1.41.0-1576089540_amd64.deb'

SLACKURL='https://downloads.slack-edge.com/linux_releases/slack-desktop-4.2.0-amd64.deb'
SLACK='slack-desktop-4.2.0-amd64.deb'

HACKREACTORLOGO='https://images.squarespace-cdn.com/content/v1/522a22cbe4b04681b0bff826/1480444061936-DOLI9BP7ZRSW3SOWIDMB/ke17ZwdGBToddI8pDm48kPJXHKy2-mnvrsdpGQjlhod7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmrMDYraMJMCQwFxTSOIP7LpSBEQpA-g5k6VTjWbSuadHJq0dp98hg5AZvIaPb3DoM/favicon.ico'

NVIDIADRIVERS='http://us.download.nvidia.com/XFree86/Linux-x86_64/440.44/NVIDIA-Linux-x86_64-440.44.run'
NVIDIAVERSION='x86_64-440.44'
NVIDIAFILE='NVIDIA-Linux-x86_64-440.44.run'


#-- setup linux for dev environment

#-- install build-essential which includes following packages:
echo -e '\n'
echo 'Optional developer tools from repository include the following:'
echo 'build-essential -- Compiler toolset'
echo 'zlib1g-dev ------- Compression file develepor tools'
echo 'mesa-common-dev -- OpenGL API development files'
echo 'libgl1-mesa-dev -- OpenGL GLX'
echo 'libglu1-mesa-dev - OpenGL'
echo -e '\t\U0001f62f\n'
echo 'Would you like to install optional developer tools? (y)yes/(n)no:'
read build
echo "Would you like to install Nvidia drivers ${NVIDIAVERSION}"
read nvidia
echo 'Would you like to install WakaTime Extension for VScode? (y)yes/(n)no:'
read waka
echo ''
echo 'Not Recommended by HackReactor'
echo 'Would you like to install Chrome Debugger Extension for VScode? (y)yes/(n)no:'
read chrome
echo "Would you like to remove the Downloaded files in $HOME/Downloads after completion? (y)yes/(n)no :"
read remove

#-- Update and upgrade everything before we begin
sudo apt-get update
sudo apt-get upgrade

echo -e '\n\U0001f44d'-----Installing wget package from repo so we can download files from URL-----'\U0001f44d'
sudo apt-get install wget
if [ $nvidia = 'y' -o $nvidia = 'yes' -o $nvidia = 'Y' -o $nvidia = 'YES' ]
then
wget $NVIDIADRIVERS -P $HOME/Downloads
sudo apt-get install unzip
sudo sh $HOME/Downloads/$NVIDIAFILE
fi

if [ $build = 'y' -o $build = 'yes' -o $build = 'Y' -o $build = 'YES' ]
echo -e '\n\U0001f44d'-----Install Optional Development Tools packages and dependencies-----'\U0001f44d'
then
echo -e '\n\U0001f44d'-----Installing Build Essential packages and dependencies-----'\U0001f44d'
sudo apt-get -y install build-essential
echo -e '\U0001f603'-----Done with build-essential package installation-----'\U0001f603'
# dpkg-dev (>= 1.17.11) - Debian package development tools
# g++ (>= 4:7.2) - GNU C++ compiler
# gcc (>= 4:7.2) - GNU C compiler
# libc6-dev - GNU C Library: Development Libraries and Header Files or libc-dev virtual package provided by libc6-dev
# make -  utility for directing compilation also a virtual package provided by make-guile

#Compression file development
echo -e '\n\U0001f44d'-----Installing Compression file dev package-----'\U0001f44d'
sudo apt-get install zlib1g-dev
echo -e '\U0001f603'-----Done with Compression file development package-----'\U0001f603'

#free implementation of the OpenGL API -- GLX development files
echo -e '\n\U0001f44d'-----Installing OpenGL API development packages-----'\U0001f44d'
sudo apt-get install mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev
echo -e '\U0001f603'-----Done with OpenGL development packages-----'\U0001f603'
fi

echo -e '\n\U0001f44d'-----Installing Git from Repositories-----'\U0001f44d'
sudo apt-get -y install git
echo -e '\n\U0001f44d'-----Installing Mongodb from Repositories-----'\U0001f44d'
sudo apt-get install mongodb

#-- install the slack application for chat
if [ ! -f $HOME/Downloads/$SLACK ]
then
    echo -e '\n\U0001f310'-----Downloading Slack Chat Application from URL-----'\U0001f310'
    wget $SLACKURL -P $HOME/Downloads
fi
echo -e '\n\U0001f44d'-----Installing Slack Chat application-----'\U0001f44d'
sudo apt install $HOME/Downloads/$SLACK

#-- setup the zoom application for meetings
if [ ! -f $HOME/Downloads/$ZOOM ]
then
    echo -e '\n\U0001f310'-----Downloading Zoom Video Meeting Application from URL-----'\U0001f310'
    wget $ZOOMURL -P $HOME/Downloads
fi
echo -e '\n\U0001f44d'-----Installing Zoom Video Meeting Client-----'\U0001f44d'
sudo apt install $HOME/Downloads/$ZOOM

#-- setup the chrome browser
if [ ! -f $HOME/Downloads/$CHROME ]
then
    echo -e '\n\U0001f310'-----Downloading Chrome Browser from URL-----'\U0001f310'
    wget $CHROMEURL -P $HOME/Downloads
fi
echo -e '\n\U0001f44d'-----Installing Google Chrome Stable Branch-----'\U0001f44d'
sudo apt install $HOME/Downloads/$CHROME

#-- setup VScode
if [ ! -f $HOME/Downloads/$VSCODE ]
then
    echo -e '\n\U0001f310'-----Downloading Visual Studio Code-----'\U0001f310'
    wget $VSCODEURL -P $HOME/Downloads
fi
echo -e '\n\U0001f44d'-----Installing VScode-----'\U0001f44d'
sudo apt install $HOME/Downloads/$VSCODE

if [ $remove = 'y' -o $remove = 'yes' -o $remove = 'Y' -o $remove = 'YES' ]
then
    echo -e '\n\U0001f603'-----Cleaning up downloaded files in $HOME/Downloads-----'\U0001f603'
    rm -f $HOME/Downloads/$CHROME
    rm -f $HOME/Downloads/$ZOOM
    rm -f $HOME/Downloads/$SLACK
    rm -f $HOME/Downloads/$VSCODE
    rm -f $HOME/Downloads/$NVIDIAFILE
fi

echo -e '\n\U0001f60f'-----Setting up HackReactor specific settings.json for VScode-----'\U0001f60f'
#-- VScode settings that are specific to HackReactor
cat <<EOM >~/.config/Code/User/settings.json

    {
         "editor.lightbulb.enabled": false,
         "editor.parameterHints.enabled": false,
         "editor.renderWhitespace": "all",
         "editor.snippetSuggestions": "none",
         "editor.tabSize": 2,
         "editor.wordWrap": "on",
         "emmet.showExpandedAbbreviation": "never",
         "files.trimTrailingWhitespace": true,
         "javascript.suggest.enabled": false,
         "javascript.updateImportsOnFileMove.enabled": "never",
         "javascript.validate.enable": false
    }
EOM

#-- install extentions for VScode
echo -e '\n\U0001f44d'-----Install HackReactor Recommended VScode Extentions----'\U0001f44d'

echo ''

code --install-extension CoenraadS.bracket-pair-colorizer
echo -e '\n\t\U0001f48e'-------Installing ESlint Extension-------'\U0001f48e'
code --install-extension dbaeumer.vscode-eslint
echo -e '\n\t\U0001f48e'-------Installing LiveShare Extension-------'\U0001f48e'
code --install-extension ms-vsliveshare.vsliveshare

if [ $waka = 'y' -o $waka = 'yes' -o $waka = 'Y' -o $waka = 'YES' ]
then
    echo -e '\n\t\U0001f48e'-------Installing WakaTime Extension-------'\U0001f48e'
    code --install-extension WakaTime.vscode-wakatime
fi

if [ $chrome = 'y' -o $chrome = 'yes' -o $chrome = 'Y' -o $chrome = 'YES' ]
then
    echo -e '\n\t\U0001f48e'-------Installing Chrome Debugger Extension-------'\U0001f48e'
    code --install-extension msjsdiag.debugger-for-chrome
fi

#-- install nodejs
echo -e '\n\U0001f44d'-----Installing NodeJS Packages from Repositories-----'\U0001f44d'
sudo apt-get -y install nodejs


#-- install npm
echo -e '\n\U0001f44d'-----Installing Node Package Manager from Repositories-----'\U0001f44d'
sudo apt-get -y install npm

#-- With this you can simply use create-react-app [program] to start making a react app
echo -e '\n\U0001f44d'-----Installing Node create-react-app from Repositories-----'\U0001f44d'
sudo npm install -g create-react-app

#-- install eslint globally
echo -e '\n\U0001f44d'-----Installing ESLint Globally using Node Package Manager-----'\U0001f44d'
sudo npm install -g eslint
#-- install HackReactor Style Enforcement
echo -e '\n\U0001f44d'-----Installing ESLint HackReactor Config Globally-----'\U0001f44d'
sudo npm install -g reactorcore/eslint-config-hackreactor

#-- make the HackReactor folder for source files
echo 'Would you like to create a HackReactor Workspace? (y)yes/(n)no:'
read hrworkspace
if [ $hrworkspace = 'y' -o $hrworkspace = 'yes' -o $hrworkspace = 'Y' -o $hrworkspace = 'YES' ]
then
    echo -e '\n\U0001f4bc\U0001f44d'-----Creating $HOME/HackReactor Workspace-----'\U0001f44d\U0001f4bc'
    if [ ! -d ~/HackReactor ]
    then
        sudo mkdir ~/HackReactor
    fi
    cd ~/HackReactor
    echo 'Would you like to make the folder icon the HackReactor Logo? (y)yes/(n)no:'
    read hricon
    icon=$hricon
    if [ $hricon = 'y' -o $hricon = 'yes' -o $hricon = 'Y' -o $hricon = 'YES' ]
    then
        echo -e '\n\U0001f48e'-----Downloading HackReactor Logo-----'\U0001f48e'
        wget $HACKREACTORLOGO -P $HOME/HackReactor
    else
        echo 'Would you like to set a custom folder icon for your new HackReactor Workspace folder? (y)yes/(n)no:'
        read icon
        if [ $icon = 'y' -o $icon = 'yes' -o $icon = 'Y' -o $icon = 'YES' ]
        then
            echo 'Please ensure that the icon file (*.png) is currently located in '$HOME'/HackReactor before continueing!!'
            echo 'The folder icon file must be of type png or ico'
            echo 'Press [enter] when ready.'
            read temp
        fi
    fi
    #--
    if [ $icon = 'y' -o $icon = 'yes' -o $icon = 'Y' -o $icon = 'YES' ]
    then
        echo 'Setting the custom folder icon'
        # Determine if there is an icon file
        iconfile=$(find $HOME/HackReactor/ -maxdepth 1 -name '*.ico')
        icoicon='ico'
        if [ -f $iconfile ]
        then
            iconfile=$(find $HOME/HackReactor/ -maxdepth 1 -name '*.png')
            icoicon='png'
        fi

        if [ $icoicon = 'ico' ]
        then
            mv $iconfile $HOME/HackReactor/.foldericon.ico
            #-- set the standard::custom-icon metadata to $HOME/HackReactor/.foldericon.ico
            gio set $HOME/HackReactor metadata::custom-icon file://$HOME/HackReactor/.foldericon.ico
        # Otherwise rename the containing png file.
        fi
        if [ $icoicon = 'png' ]
        then
            mv $iconfile $HOME/HackReactor/.foldericon.png
        #-- set the standard::custom-icon metadata to $HOME/HackReactor/.foldericon.png
            gio set $HOME/HackReactor metadata::custom-icon file://$HOME/HackReactor/.foldericon.png

        fi

        gio info $HOME/HackReactor
    fi
fi
#-- Show a nice ending message
echo -e '\n\U0001f44dCompleted\n'
echo -e '\n\t\U0001f61b!!'Have a Happy 'time' Hacking'!!\U0001f61b\n'
exit 0
