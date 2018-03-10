param (
    [Parameter(Mandatory=$True)]
    [string]$Path
)

$snPath = "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.1 Tools\sn.exe"
$uniqueKey = [System.Guid]::NewGuid()
$publicKeyPath = "$Path.$uniqueKey.public"

& $snPath -p $Path $publicKeyPath
& $snPath -tp $publicKeyPath

Remove-Item -Path $publicKeyPath