Add-Type -AssemblyName System.Speech
$Speech = New-Object System.Speech.Synthesis.SpeechSynthesizer

$Speech.GetInstalledVoices() | select -ExpandProperty VoiceInfo | select Name, Gender, Description

$Speech.SelectVoice("Microsoft Hazel Desktop")

$Message = 'This is awesome.  We now know how to use Powershell Text To Speech'
$Speech.Speak($Message)