# Pull in the Build info and generate temp directory and zip file strings
$ZipPath = Get-Content -Raw -path version.json | convertFrom-Json
$ZipPath = "$PSScriptRoot\Iacon_$($ZipPath.minecraft)_$($ZipPath.modpack)"
$ZipFile = "$ZipPath.zip"

# Remove exsiting zip if it exists, then compress client
if(Test-Path $ZipFile)
{
    echo "$ZipFile already exists, removing..."
    Remove-Item $ZipFile
    echo "Restarting script..." #restart needed because script thinks file is still present
    Start-Sleep 3
    .\Gen-Client.ps1
}
else
{
    echo "Starting creation of $ZipFile"
    Add-Type -Assembly "System.IO.Compression.FileSystem" ;
    [System.IO.Compression.ZipFile]::CreateFromDirectory($ZipPath, $ZipFile)
    echo "Creation of $ZipFile complete"
}
