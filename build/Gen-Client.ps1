# Pull in the Build info and generate build string
$BuildString = Get-Content -Raw -path version.json | convertFrom-Json
$BuildString = "$PSSCriptRoot\Iacon_$($BuildString.minecraft)_$($BuildString.modpack).zip"

# Get list of client files
$files = [System.Collections.Arraylist]::new() #New-Object System.Collections.ArrayList;
$directory = $PSScriptRoot.Substring(0, $PSScriptRoot.Length - 6)
echo "Finding files to compress..."
foreach($file in Get-ChildItem $directory -Recurse)
{
    # filter out directories, build directory contents, and all .git* files
    if(-not ($file.FullName.Contains($PSSCriptRoot) -or $file.FullName.contains(".git") -or (Test-Path $file.FullName -PathType Container)))
    {
        echo $file.FullName
        $files.Add($file.FullName)
    }
}

# Remove exsiting client if it exists, then compress client
if(Test-Path $BuildString)
{
    echo "$BuildString already exists, removing..."
    Remove-Item $BuildString
    echo "Restarting script..." #restart needed because script thinks file is still present
    Start-Sleep 3
    cls
    .\Gen-Client.ps1
}
else
{
    echo "Starting creation of $BuildString"
    Compress-Archive -Path $files.ToArray() -DestinationPath $BuildString -CompressionLevel Optimal
    echo "Creation of $BuildString complete"
}