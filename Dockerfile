
FROM aryerson9/psscriptanalyzer:latest

COPY entrypoint.ps1 /entrypoint.ps1
RUN chmod +x /entrypoint.ps1

ENTRYPOINT ["/entrypoint.ps1"]