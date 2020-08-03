FROM aryerson9/psscriptanalyzer

COPY entrypoint.ps1 /entrypoint.ps1
RUN chmod +x /entrypoint.ps1

ENTRYPOINT ["/entrypoint.ps1"]