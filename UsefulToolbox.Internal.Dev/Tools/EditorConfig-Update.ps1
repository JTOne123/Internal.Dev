param ([string]$TargetPath = '.')

$editorConfigPath = "$PSScriptRoot\..\codingConventions\UsefulToolbox.editorconfig"
$targetEditorConfigPath = "$TargetPath\.editorconfig"

Copy-Item -Path $editorConfigPath -Destination $targetEditorConfigPath -Force