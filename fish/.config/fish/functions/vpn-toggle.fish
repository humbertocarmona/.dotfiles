function vpn-toggle
    set service openvpn@gateway

    # Check whether the service is active
    if systemctl is-active --quiet $service
        echo "Stopping $service..."
        sudo systemctl stop $service
    else
        echo "Starting $service..."
        sudo systemctl start $service
    end
end
