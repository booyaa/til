# to run in docker
# $ docker run -it --rm -v $(pwd):/scripts ailispaw/powershell
# PS /> ./scripts/params.ps1 -computerName "foo" -filePath "bar"
Param(
  [string]$computerName,
  [string]$filePath
)

write-output "computerName: $computerName"
write-output "filePath: $filePath"