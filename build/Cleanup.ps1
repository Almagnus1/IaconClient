# Pull in the Build info and generate temp directory and zip file strings
$ZipPath = Get-Content -Raw -path version.json | convertFrom-Json
$ZipPath = "$PSScriptRoot\Iacon_$($ZipPath.minecraft)_$($ZipPath.modpack)"

echo "Starting cleanup..."
Remove-Item $ZipPath -Recurse
echo "Cleanup complete..."
