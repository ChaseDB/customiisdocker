


# We want the base to be represented by the latest version of iis
FROM microsoft/iis:latest

COPY ["/OpenSSH-Win64/.", "c:/program files/openssh"]
COPY ["/installssh.ps1", "c:"]
CMD ['C:/installssh.ps1']

EXPOSE 20