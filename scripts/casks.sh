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
fi

if has_app "Visual Studio Code"; then
    get_consent "Install Visual Studio Code extensions, settings, and snippets"
    if has_consent; then
        e_pending "Installing Visual Studio Code extensions, settings, and snippets"
        code --install-extension alefragnani.project-manager
        code --install-extension anthropic.claude-code
        code --install-extension atomiks.moonlight
        code --install-extension bradlc.vscode-tailwindcss
        code --install-extension dbaeumer.vscode-eslint
        code --install-extension esbenp.prettier-vscode
        code --install-extension gruntfuggly.todo-tree
        code --install-extension l13rary.l13-diff
        code --install-extension mikestead.dotenv
        code --install-extension oxc.oxc-vscode
        code --install-extension prisma.prisma
        code --install-extension qwtel.sqlite-viewer
        code --install-extension stylelint.vscode-stylelint
        code --install-extension tyriar.sort-lines
        code --install-extension vitest.explorer
        code --install-extension voidzero.vite-plus-extension-pack
        code --install-extension vscode-icons-team.vscode-icons
        code --install-extension webpro.vscode-knip
        code --install-extension yoavbls.pretty-ts-errors
        cp ~/Downloads/mac-dev-setup/Code/* ~/Library/Application\ Support/Code/User
    fi
fi

# ------------------------------------------------------------------------------
e_message "Applications/Casks complete"
# ------------------------------------------------------------------------------
