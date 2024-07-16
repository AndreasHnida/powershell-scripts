param (
    [string]$directoryName,
    [switch]$f
)

function Create-DirectoryAndCDIntoIt {
    param (
        [string]$directoryName,
        [switch]$f
    )

    # Create the directory
    New-Item -ItemType Directory -Path $directoryName -ErrorAction Stop

    # Change to the new directory
    Set-Location -Path $directoryName

    if ($f) {
        # Create a new file within the directory
        $fileName = "$directoryName.py"
        New-Item -ItemType File -Path $fileName -ErrorAction Stop
    }
}

# Check if the directoryName argument is present
if (-not $directoryName) {
    Write-Host "Usage: .\gomd.ps1 <directory name> [-f]"
    exit
}

Write-Host "createFile: $f"
Write-Host "Creating directory: $directoryName"

Create-DirectoryAndCDIntoIt -directoryName $directoryName -f:$f

