import subprocess

def Disconnect_Internet(secret):
	result = subprocess.run(["netsh", "interface", "set", "interface", "Wi-Fi", "DISABLED"])
	print(result.returncode)