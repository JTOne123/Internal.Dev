param($installPath, $toolsPath, $package, $project)

$snippetsPath = "$installPath\CodeSnippets"
$vsVersion = [System.Version]::Parse($dte.Version)
$vsYear = "20" + ($vsVersion.Major + 1).ToString()
$documentsPath = [Environment]::getFolderPath("MyDocuments")
$snippetsLinkPath = "$documentsDir\Visual Studio $vsYear\Code Snippets\Visual C#\UsefulToolbox"

if (Test-Path $snippetsTargetPath)
{
  (Get-Item $snippetsTargetPath).Delete()
}

New-Item -ItemType SymbolicLink -Path $snippetsLinkPath -Target $snippetsPath