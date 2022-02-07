#! /usr/bin/pwsh

## Explicitly have to import the module from its path
Import-Module -Name /root/.local/share/powershell/Modules/PSScriptAnalyzer/ -Verbose -Force

Get-Variable

ls /github/workspace

$tests = Invoke-ScriptAnalyzer -Path /github/workspace -Settings PSGallery -Recurse

foreach ($test in $tests)
{

    if ($($test.Severity) -like "*Error*")
    {

        $errorHash = @{
            Severity = $($test.Severity)
            Message  = $($test.Message)
            Line     = $($test.Line)
        }

        $errorOutput = New-Object -TypeName System.Management.Automation.PSObject -Property $errorHash

        Write-warning "Error Detected:"
        Write-Error $errorOutput
        Write-warning "--------------"

    }

    else
    {

        Write-Output $test

    }

}
