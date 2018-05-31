echo "Installing OpenSSH"
cd 'c:/program files/openssh'
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1
net start sshd