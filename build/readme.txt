Buildscript is Gen-Client.ps1 , written against PowerShell 5.0.
Version info is stored in version.json.

This build script will not work unless the IaconConfig repo is at overrides/config in the client repo.  Building without this submodule in place will generate an incomplete modpack.

Once that's done, open PowerShell, navigate to the build directory, then run Gen-Client and it should build and leave the zip file in the build directory, which is all that should be needed to upload to Curse for distribution.

