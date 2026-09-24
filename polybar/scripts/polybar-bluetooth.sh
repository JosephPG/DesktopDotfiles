#!/usr/bin/env bash

export LANG=en_US.UTF-8

# Verificar si el servicio de Bluetooth está corriendo
if ! bluetoothctl show | grep "Powered: yes"; then
    echo "%{F#666666}  󰂲%{F-} "
    exit 0
fi

# Detectar si el controlador tiene energía (Encendido/Apagado)
STATUS=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$STATUS" = "yes" ]; then
    # Comprobar si hay algún dispositivo conectado actualmente
    if bluetoothctl info | grep -q "Connected: yes"; then
        # Icono Bluetooth conectado (Azul o color activo)
        echo "  󰂰 "
    else
        # Icono Bluetooth encendido pero libre (Blanco/Normal)
        echo "   "
    fi
else
    # Icono Bluetooth apagado (Gris)
    echo " 󰂲 "
fi
