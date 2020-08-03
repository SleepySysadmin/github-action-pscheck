#! /usr/bin/pwsh

$tests = Invoke-ScriptAnalyzer -Path $GITHUB_WORKSPACE -Settings PSGallery -Recurse

foreach ($test in $tests)
{

    $Severity = $test.Severity
    $Message = $test.Message
    $Line = $test.Line

    if ($Severity -like "*Error*")
    {

        $errorHash = @{
            Severity = $Severity
            Message  = $Message
            Line     = $Line
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