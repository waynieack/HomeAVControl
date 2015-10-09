xhost +local:root
sudo killall evrouter
sudo rm /tmp/.evrouter* #removes a previous lock file
sudo /usr/bin/evrouter -c /home/wayne/evrt /dev/input/by-id/usb-Gyration_Gyration_RF_Technology_Receiver-if01-event-mouse /dev/input/by-id/usb-Gyration_Gyration_RF_Technology_Receiver-event-kbd &
sudo /usr/bin/renice -n 20 $(/bin/pidof evrouter)
