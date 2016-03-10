﻿# Pull in the Build info and generate temp directory and zip file strings
$Version = Get-Content -Raw -path version.json | convertFrom-Json
$directory = $PSScriptRoot.Substring(0, $PSScriptRoot.Length - 6)
$ZipPath = "$PSScriptRoot\Iacon_$($Version.minecraft)_$($Version.modpack)"
$ZipFile = "$ZipPath.zip"

# Create temp directory containing mod files
if(-Not (Test-Path $ZipPath))
{
    New-Item $ZipPath -ItemType directory > $silencer
    echo "Creating directory $ZipPath"
}

# Generate a filtered copy of the repo
echo "Copying files..."
foreach($file in Get-ChildItem $directory -Recurse)
{
    # filter out directories, build directory contents, and all .git* files
    if(-not ($file.FullName.Contains($PSSCriptRoot) -or $file.FullName.contains(".git") -or (Test-Path $file.FullName -PathType Container)))
    {
        if($file.DirectoryName.Length -gt $directory.Length)
        {
            $relPath = $file.DirectoryName.Substring($directory.Length)
        }
        else
        {
            $relPath = ""
        }
        if(-Not (Test-Path "$ZipPath$relPath"))
        {
            New-Item "$ZipPath$relPath" -ItemType directory > $silencer
            echo "Creating directory $ZipPath$relPath"
        }
        Copy-Item $file.FullName "$ZipPath$relPath"
        echo "$ZipPath$relPath$($file.Name)"
    }
}

# Need to pull $$MC_VER$$ and $$MP_VER$$ from the JSON files
echo "Performing `$`$MC_VER`$`$ and `$`$MP_VER`$`$ replacement..."
$overrideManifest = "$ZipPath\overrides\manifest.json"
$manifest = "$ZipPath\manifest.json"
(Get-Content $overrideManifest) | ForEach-Object { $_.ToString().Replace('$$MP_VER$$', $Version.modpack).Replace('$$MC_VER$$', $Version.minecraft) }| Out-File $overrideManifest
(Get-Content $manifest) | ForEach-Object { $_.ToString().Replace('$$MP_VER$$', $Version.modpack).Replace('$$MC_VER$$', $Version.minecraft) }| Out-File $manifest
echo "Replacement complete..."

echo "Cleaning complete"