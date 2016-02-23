Buildscript is Gen-Client.ps1 , written against PowerShell 5.0.
Version info is stored in version.json.

This build script will not work unless the IaconConfig repo is at overrides/config in the client repo.  Building without this submodule in place will generate an incomplete modpack.

From PowerShell, do the the following:
1) Navigate to IaconClient/build
2) .\Clean-Repo.ps1
3) .\Gen-Client.ps1
4) .\Cleanup.ps1

From testing, if the script is not broken into three different steps, the zip file created isn't valid, and the cleanup is not as complete.  The delay introduced by the human element fixes these timing issues.
