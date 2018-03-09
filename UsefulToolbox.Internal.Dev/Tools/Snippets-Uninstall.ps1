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
      Write-Host "Remove Useful Toolbox code snippets from $snippetsTargetPath"
      Get-ChildItem -Path $snippetsTargetPath -Include "*.snippet" -File | foreach { $_.Delete()}
      Remove-Item -Path $snippetsTargetPath -Force -Recurse
    }
  }
}