# Pull in the Build info and generate temp directory and zip file strings
$ZipPath = Get-Content -Raw -path version.json | convertFrom-Json
$directory = $PSScriptRoot.Substring(0, $PSScriptRoot.Length - 6)
$ZipPath = "$PSScriptRoot\Iacon_$($ZipPath.minecraft)_$($ZipPath.modpack)"
$ZipFile = "$ZipPath.zip"

# Create temp directory containing mod files
if(-Not (Test-Path $ZipPath))
{
    New-Item $ZipPath -ItemType directory > $silencer
    echo "Creating directory $ZipPath"
}

# Get list of client files
$files = [System.Collections.Arraylist]::new() #New-Object System.Collections.ArrayList;
$directory = $PSScriptRoot.Substring(0, $PSScriptRoot.Length - 6)
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

# Remove exsiting zip if it exists, then compress client
if(Test-Path $ZipFile)
{
    echo "$ZipFile already exists, removing..."
    Remove-Item $ZipFile
    echo "Starting cleaup..."
    Remove-Item $ZipPath -Recurse
    echo "Cleanup complete..."
    echo "Restarting script..." #restart needed because script thinks file is still present
    Start-Sleep 3
    cls
    .\Gen-Client.ps1
}
else
{
    echo "Starting creation of $ZipFile"
    Compress-Archive -Path "$ZipPath\*" -DestinationPath $ZipFile -CompressionLevel Optimal -Update
    echo "Creation of $ZipFile complete"
    echo "Starting cleanup..."
    Remove-Item $ZipPath -Recurse
    echo "Cleanup complete..."
}
