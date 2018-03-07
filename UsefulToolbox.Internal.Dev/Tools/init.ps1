param($installPath, $toolsPath, $package, $project)

$snippetsPath = "$installPath\CodeSnippets"
$documentsPath = [Environment]::getFolderPath("MyDocuments")

$vsPaths = Get-ChildItem -Path $documentsPath -Directory -Filter "Visual Studio *"
foreach ($vsPath in $vsPaths)
{
  $vsSnippetsPath = $vsPath.FullName + "\Code Snippets\Visual C#"
  if (Test-Path $vsSnippetsPath)
  {
    $snippetsTargetPath = "$vsSnippetsPath\UsefulToolbox"

    if (Test-Path $snippetsTargetPath)
    {
      Get-ChildItem -Path $snippetsTargetPath -Include "*.snippet" -File | foreach { $_.Delete()}
    }
    else 
    {
      New-Item -ItemType Directory -Path $snippetsTargetPath | Out-Null
    }

    Write-Host "Importing Useful Toolbox code snippets from $snippetsPath to $snippetsTargetPath"
    Copy-Item -Path "$snippetsPath\*.snippet" -Destination $snippetsTargetPath
  }
}