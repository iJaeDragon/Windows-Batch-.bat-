# PowerShell 스크립트: AdjustHeadsetVolume.ps1

# 헤드셋 장치의 이름 또는 일부 키워드를 지정합니다.
$headsetDeviceName = "HEADPHONE(2- WH-XB910N)"

# 헤드셋과 관련된 장치를 찾습니다.
$headsetDevice = Get-PnpDevice | Where-Object { $_.FriendlyName -like "*$headsetDeviceName*" }

# 헤드셋이 발견되었는지 확인합니다.
if ($headsetDevice -eq $null) {
    Write-Host "헤드셋을 찾을 수 없습니다."
} else {
    # 헤드셋의 볼륨을 조절합니다.
    $volumeLevel = 0  # 원하는 볼륨 레벨로 변경하세요.

    # .NET Framework의 System.Media 네임스페이스를 활용하여 볼륨 조절
    Add-Type -AssemblyName System.Windows.Forms
    $volume = [System.Windows.Forms.SystemInformation]::PrimaryMonitorMaximizedWindowSize.Width
    $volumeObject = New-Object System.Media.SoundPlayer
    $volumeObject.Stream = ([System.IO.MemoryStream]::new(1..$volume | ForEach-Object { 0 }))
    $volumeObject.Play()
    
    Write-Host "헤드셋 볼륨이 $volumeLevel%로 조절되었습니다."
}