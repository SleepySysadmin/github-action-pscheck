FROM mcr.microsoft.com/powershell
RUN pwsh -Command Install-Module -Name PSScriptAnalyzer -Force

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["/entrypoint.ps1"]