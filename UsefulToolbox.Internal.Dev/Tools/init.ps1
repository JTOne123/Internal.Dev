param($installPath, $toolsPath, $package, $project)

$snippetsPath = "$installPath\CodeSnippets"
$vsVersion = [System.Version]::Parse($dte.Version)
$vsYear = "20" + ($vsVersion.Major + 1).ToString()
$documentsPath = [Environment]::getFolderPath("MyDocuments")
$snippetsLinkPath = "$documentsDir\Visual Studio $vsYear\Code Snippets\Visual C#\UsefulToolbox"

if (Test-Path $snippetsLinkPath)
{
  (Get-Item $snippetsLinkPath).Delete()
}

New-Item -ItemType SymbolicLink -Path $snippetsLinkPath -Target $snippetsPath