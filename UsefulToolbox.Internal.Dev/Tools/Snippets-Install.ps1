<#
	Copyright 2018 Igor Eroshkin

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
#>

$snippetsPath = "$PSScriptRoot\..\codeSnippets"
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