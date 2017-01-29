install:
	install -m 0755 cloudshell /usr/bin
	install -m 0644 cloudshell.service /usr/lib/systemd/system
	systemctl daemon-reload

uninstall:
	rm /usr/bin/cloudshell
	rm /usr/lib/systemd/system/cloudshell.service
	systemctl disable cloudshell.service
	systemctl daemon-reload

