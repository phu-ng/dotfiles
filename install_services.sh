#!/bin/bash

install_services() {
    syncthing
}

syncthing() {
    # Install Syncthing package
    echo "Installing Syncthing..."
    sudo dnf install -y syncthing

    # Create systemd user service file
    SERVICE_DIR="$HOME/.config/systemd/user"
    SERVICE_FILE="$SERVICE_DIR/syncthing.service"

    echo "Creating systemd user service file at $SERVICE_FILE..."
    mkdir -p "$SERVICE_DIR"

    cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Syncthing - Open Source Continuous File Synchronization
Documentation=man:syncthing(1)
StartLimitIntervalSec=60
StartLimitBurst=4

[Service]
ExecStart=/usr/bin/syncthing serve --no-browser --no-restart --logflags=0
Restart=on-failure
RestartSec=1
SuccessExitStatus=3 4
RestartForceExitStatus=3 4

# Hardening
SystemCallArchitectures=native
MemoryDenyWriteExecute=true
NoNewPrivileges=true

# Elevated permissions to sync ownership (disabled by default),
# see https://docs.syncthing.net/advanced/folder-sync-ownership
#AmbientCapabilities=CAP_CHOWN CAP_FOWNER

[Install]
WantedBy=default.target
EOF
    # Reload systemd user daemon, enable and start the service
    echo "Reloading systemd user daemon..."
    systemctl --user daemon-reload

    echo "Enabling syncthing.service..."
    systemctl --user enable syncthing.service

    echo "Starting syncthing.service..."
    systemctl --user start syncthing.service

    echo "✅ Syncthing is installed and running!"
}