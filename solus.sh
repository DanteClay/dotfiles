#/usr/bin/env bash
set -e

pkg() {
    sudo eopkg up -y
    sudo eopkg it fish git source-code-pro golang vscode micro -y
}


gnome_settings() {
    gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

    for ((x=1 ; x <= 10 ; x++)) ; do
            gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$x "[\"<Super>$x\"]"
            gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$x "[\"<Super><Shift>$x\"]"
    done
    gsettings set org.gnome.desktop.input-sources xkb-options "['caps:hyper']"
}

gnome_terminal() {
    # Profiles
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1}
    terminal="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/"

    # Font.
    gsettings set $terminal use-system-font false
    gsettings set $terminal font "'Source Code Pro 13'"

    # Custom startup command.
    gsettings set $terminal use-custom-command true
    gsettings set $terminal custom-command "'/usr/bin/fish'"

    ## Modified Jellybeans colors for gnome-terminal (with dconf).
    palette="['#888888888888', '#cfcf6a6a4c4c', '#8787afaf5f5f', '#fafad0cf7a79', '#8181a3a3eded', '#c6c5b6b6eeee', '#8f8fbfbedcdc', '#e8e8e8e8d3d3', '#888888888888', '#cfcf6a6a4c4c', '#8787afaf5f5f', '#fafad0cf7a79', '#8181a3a3eded', '#c6c5b6b6eeee', '#8f8fbfbedcdc', '#e8e8e8e8d3d3']"
    foreground_color="'#e8e8d3'"
    background_color="'#151515'"

    # Color palette.
    gsettings set $terminal palette "$palette"

    # Foreground, background and highlight color.
    gsettings set $terminal foreground-color "$foreground_color"
    gsettings set $terminal background-color "$background_color"

    # Profile does not use theme colors.
    gsettings set $terminal use-theme-colors false

    # Highlighted color different from foreground color.
    gsettings set $terminal bold-color-same-as-fg true

	# Non-Transparency 
	gsettings set $terminal use-transparent-background false
}

pkg
gnome_settings
gnome_terminal
