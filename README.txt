#
# Useful info
#

ROCm					# https://rocmdocs.amd.com/en/latest/index.html

ROCm Intall Guide 			# https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html

Supported Servers			# https://www.amd.com/en/graphics/servers-radeon-instinct-mi-powered-servers

~/rocm-tools				# https://github.com/umanglaamd/rocm-tools
~/rocminstaller				# https://github.com/srinivamd/rocminstaller

/opt/rocm/bin/rocm-bandwidth-test	# ROCm Bandwidth Test
/opt/rocm/rvs/rvs			# ROCm Validation Suite

/opt/kcbench/kcbench			# kcbench https://github.com/knurd/kcbench

/etc/apt/sources.list.d/rocm.list
	# deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main
	deb [arch=amd64] http://repo.radeon.com/rocm/apt/3.5/ xenial main

To enable persistent boot logs across reboots, please run:
	sudo mkdir -p /var/log/journal
	sudo systemctl restart systemd-journald.service

