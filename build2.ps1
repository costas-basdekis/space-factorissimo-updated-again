$version = (Get-Content "info.json" | ConvertFrom-Json).version
$version = $version.Replace(' ', '').Replace('"', '')

$zipName = "space-factorissimo-updated-again_$version.zip"
Compress-Archive -Path "../space-factorissimo-updated-again" -DestinationPath $zipName