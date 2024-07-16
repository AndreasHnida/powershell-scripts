# Get the current directory
$currentDir = (Get-Location).Path

# Get the current user PATH environment variable
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", "User")

# Check if the current directory is already in the PATH
if ($currentPath -notlike "*$currentDir*") {
    # Add the current directory to the PATH
    $newPath = "$currentPath;$currentDir"
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "Current directory added to PATH."
} else {
    Write-Host "Current directory is already in the PATH."
}
