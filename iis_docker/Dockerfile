


# We want the base to be represented by the latest version of iis
FROM microsoft/iis:latest

RUN powershell Install-WindowsFeature -Name Web-Mgmt-Service;
RUN powershell New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1 -Force;


COPY ["/cert/.","c:/cert"]

RUN powershell.exe -Command " \
Get-Service -Name WMSVC | Start-Service; \
net user admin 3dV!z /add; \
net localgroup administrators admin /add; "

RUN powershell.exe -Command " \
	$securepfxpass = (Get-Content -Path c:\cert\pass.txt) |ConvertTo-SecureString -AsPlainText -Force; \
	$cert = Import-PfxCertificate -Password $securepfxpass -CertStoreLocation Cert:\LocalMachine\CA -FilePath c:\cert\IngrnetWC_2018.pfx; \  
    Import-Module IISAdministration; \
    $certHash = $cert.GetCertHash(); \
    $sm = Get-IISServerManager; \
    $sm.Sites[\"Default Web Site\"].Bindings.Add(\"*:443:\", $certHash, \"CA\", \"0\"); \
    $sm.CommitChanges();"



	
EXPOSE 8172


	#$binding = Get-WebBinding -Name $siteName -Protocol "https"

	#$binding.AddSslCertificate($newCert.GetCertHashString(), "CA")