#!/bin/sh

. ./_utils.sh

# ------------------------------------------------------------------------------
e_message "Checking applications/casks"
# ------------------------------------------------------------------------------

if has_command "brew"; then
    # Casks
    NAME="font-jetbrains-mono-nerd-font"
    DESC="JetBrainsMono Nerd Font"
    test_cask "$NAME" "$DESC"
    if ! has_cask "$NAME"; then
        get_consent "Install $DESC"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_cask "$NAME" "$DESC"
        fi
    fi

    # Apps
    NAME="1password"
    DESC="1Password"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="brave-browser"
    DESC="Brave Browser"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="bruno"
    DESC="Bruno"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="discord"
    DESC="Discord"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="figma"
    DESC="Figma"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="ghostty"
    DESC="Ghostty"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="google-chrome"
    DESC="Google Chrome"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="iterm2"
    DESC="iTerm"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="rectangle"
    DESC="Rectangle"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="slack"
    DESC="Slack"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="sourcetree"
    DESC="Sourcetree"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="spotify"
    DESC="Spotify"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="visual-studio-code"
    DESC="Visual Studio Code"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="warp"
    DESC="Warp"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi

    NAME="zoom"
    DESC="Zoom.us"
    test_app "$DESC"
    if ! has_app "$DESC"; then
        get_consent "Install $DESC.app"
        if has_consent; then
            e_pending "Installing $NAME"
            brew install --cask $NAME
            test_app "$DESC"
        fi
    fi
fi

if has_app "Visual Studio Code"; then
    get_consent "Install Visual Studio Code extensions, settings, and snippets"
    if has_consent; then
        e_pending "Installing Visual Studio Code extensions, settings, and snippets"
        code --install-extension alefragnani.project-manager
        code --install-extension atomiks.moonlight
        code --install-extension bradlc.vscode-tailwindcss
        code --install-extension christian-kohler.npm-intellisense
        code --install-extension christian-kohler.path-intellisense
        code --install-extension codeforge.remix-forge
        code --install-extension dbaeumer.vscode-eslint
        code --install-extension docker.docker
        code --install-extension eamodio.gitlens
        code --install-extension editorconfig.editorconfig
        code --install-extension esbenp.prettier-vscode
        code --install-extension formulahendry.auto-rename-tag
        code --install-extension github.copilot
        code --install-extension github.copilot-chat
        code --install-extension github.vscode-github-actions
        code --install-extension gruntfuggly.todo-tree
        code --install-extension l13rary.l13-diff
        code --install-extension mikestead.dotenv
        code --install-extension ms-azuretools.vscode-docker
        code --install-extension orta.vscode-twoslash-queries
        code --install-extension prisma.prisma
        code --install-extension qwtel.sqlite-viewer
        code --install-extension stylelint.vscode-stylelint
        code --install-extension tyriar.sort-lines
        code --install-extension unifiedjs.vscode-mdx
        code --install-extension vscode-icons-team.vscode-icons
        code --install-extension yoavbls.pretty-ts-errors
        code --install-extension zignd.html-css-class-completion
        cp ~/Downloads/mac-dev-setup/Code/* ~/Library/Application\ Support/Code/User
    fi
fi

# ------------------------------------------------------------------------------
e_message "Applications/Casks complete"
# ------------------------------------------------------------------------------
