# Part used for the restart button
Param
 (
 [String]$Restart
 )
 
If ($Restart -ne "") 
 {
  sleep 10
 }
  
# Declare assemblies 
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework')   | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')    | out-null
[System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null
<#
# Example of GUI to display
[xml]$xaml =  
@"
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
WindowStyle="None"
Height="600"
Width="400"
ResizeMode="NoResize"
ShowInTaskbar="False"
AllowsTransparency="True"
Background="Transparent"
>
<border  BorderBrush="Black" BorderThickness="1" Margin="10,10,10,10">
 
<grid Name="grid" Background="White">
 <stackpanel HorizontalAlignment="Center" VerticalAlignment="Center">
  <button Name="MyButton" Width="80" Height="20"></button>
 </StackPanel>  
</Grid> 
</Border>
</Window>
"@
#>

Function New-TextToSpeechMessage {
    <#
    .SYNOPSIS
        This will use Powershell to have a message read out loud through your computer speakers.
     
     
    .NOTES
        Name: New-TextToSpeechMessage
        Author: theSysadminChannel
        Version: 1.0
        DateCreated: 2021-Feb-28
     
    .LINK
        https://thesysadminchannel.com/powershell-text-to-speech-how-to-guide -
     
    .EXAMPLE
        New-TextToSpeechMessage -Message 'This is the text I want to have read out loud' -Voice Zira
    #>
        [CmdletBinding()]
        param(
            [Parameter(
                Position = 0,
                Mandatory = $true
            )]
     
            [string]    $Message,
     
     
            [Parameter(
                Position = 1,
                Mandatory = $false
            )]
     
            [ValidateSet('David', 'Zira')]
            [string]    $Voice = 'Zira'
        )
     
        BEGIN {
            if (-not ([appdomain]::currentdomain.GetAssemblies() | Where-Object {$_.Location -eq 'C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Speech\v4.0_4.0.0.0__31bf3856ad364e35\System.Speech.dll'})) {
                Add-Type -AssemblyName System.Speech
            }
        }
     
        PROCESS {
            try {
                $NewMessage = New-Object System.Speech.Synthesis.SpeechSynthesizer
     
                if ($Voice -eq 'Zira') {
                    $NewMessage.SelectVoice("Microsoft Zira Desktop")
                } else {
                    $NewMessage.SelectVoice("Microsoft David Desktop")
                }
         
                $NewMessage.Speak($Message)
         
            } catch {
                Write-Error $_.Exception.Message
            }       
        }
     
        END {}
    }
    
<#
# GUI to load
$window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xaml))
# Declare controls here
$MyButton = $window.findname("MyButton") 
$MyButton.Content = "Button 1"
 
#>

# Add an icon to the systrauy button
$icon = [System.Drawing.Icon]::ExtractAssociatedIcon("c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe")
 
# Create object for the systray 
$Systray_Tool_Icon = New-Object System.Windows.Forms.NotifyIcon
# Text displayed when you pass the mouse over the systray icon
$Systray_Tool_Icon.Text = "PowerTray"
# Systray icon
$Systray_Tool_Icon.Icon = $icon
$Systray_Tool_Icon.Visible = $true
 
# First menu displayed in the Context menu
$Menu1 = New-Object System.Windows.Forms.MenuItem
$Menu1.Text = "Menu 1"
 
# Second menu displayed in the Context menu
$Menu2 = New-Object System.Windows.Forms.MenuItem
$Menu2.Text = "Menu 2"

# Second menu displayed in the Context menu
$Menu3 = New-Object System.Windows.Forms.MenuItem
$Menu3.Text = "Menu 3"
 
# Third menu displayed in the Context menu - This will restart kill the systray tool and launched it again in 10 seconds
$Menu_Restart_Tool = New-Object System.Windows.Forms.MenuItem
$Menu_Restart_Tool.Text = "Restart the tool"
 
# Fourth menu displayed in the Context menu - This will close the systray tool
$Menu_Exit = New-Object System.Windows.Forms.MenuItem
$Menu_Exit.Text = "Exit"
 
# Create the context menu for all menus above
$contextmenu = New-Object System.Windows.Forms.ContextMenu
$Systray_Tool_Icon.ContextMenu = $contextmenu
$Systray_Tool_Icon.contextMenu.MenuItems.AddRange($Menu1)
$Systray_Tool_Icon.contextMenu.MenuItems.AddRange($Menu2)
$Systray_Tool_Icon.contextMenu.MenuItems.AddRange($Menu3)
$Systray_Tool_Icon.contextMenu.MenuItems.AddRange($Menu_Restart_Tool)
$Systray_Tool_Icon.contextMenu.MenuItems.AddRange($Menu_Exit)
 
# Create submenu for the menu 1
$Menu1_SubMenu1 = $Menu1.MenuItems.Add("1-1 Dialog Box Test")
$Menu1_SubMenu2 = $Menu1.MenuItems.Add("1-2")
 
# Create submenu for the menu 2
$Menu2_SubMenu1 = $Menu2.MenuItems.Add("2-1 Backup Repository")
$Menu2_SubMenu2 = $Menu2.MenuItems.Add("2-2 Generate Password")
 
# Create submenu for the menu 3
$Menu3_SubMenu1 = $Menu3.MenuItems.Add("3-1 Clipboard Test")
$Menu3_SubMenu2 = $Menu3.MenuItems.Add("3-2 Speak Test")
 
 
# Action after clicking on the systray icon - This will display the GUI mentioned above
$Systray_Tool_Icon.Add_Click({
 If ($_.Button -eq [Windows.Forms.MouseButtons]::Left) {
  $window.Left = $([System.Windows.SystemParameters]::WorkArea.Width-$window.Width)
  $window.Top = $([System.Windows.SystemParameters]::WorkArea.Height-$window.Height)
  $window.Show()
  $window.Activate() 
 }  
})
 
 
# Action after clicking on the Menu 1 - Submenu 1
$Menu1_SubMenu1.Add_Click({ 
 [System.Windows.Forms.MessageBox]::Show("Menu 1 - Submenu 1") 
})
 
# Action after clicking on the Menu 1 - Submenu 2
$Menu1_SubMenu2.Add_Click({ 
 [System.Windows.Forms.MessageBox]::Show("Menu 1 - Submenu 2")
})
 
# Action after clicking on the Menu 2 - Submenu 1
$Menu2_SubMenu1.Add_Click({ 
$ziptimer = (Get-Date -Format yyy-mm-dd-hhmm)
$zipfilename = "O:\Documents\PS_Backups\Archive_" + $ziptimer + ".zip"
Compress-Archive -Path "H:\PowerShell Repository\*" -Update -DestinationPath $ZipFilename
explorer O:\Documents\PS_Backups\
})
 
# Action after clicking on the Menu 2 - Submenu 2
$Menu2_SubMenu2.Add_Click({ 
$Alphabets = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'
$numbers = 0..9
$specialCharacters = '~,!,@,#,$,%,^,&,*,(,),>,<,?,\,/,_,-,=,+'
$array = @()
$array += $Alphabets.Split(',') | Get-Random -Count 8
$array[0] = $array[0].ToUpper()
$array[-1] = $array[-1].ToUpper()
$array += $numbers | Get-Random -Count 3
$array += $specialCharacters.Split(',') | Get-Random -Count 2
$pwd=($array | Get-Random -Count $array.Count) -join ""
$pwd | SCB
})
 
 # Action after clicking on the Menu 3 - Submenu 1
$Menu3_SubMenu1.Add_Click({ 
 "This Test has been Pasted from the ClipBoard" | SCB 
})
 
# Action after clicking on the Menu 3 - Submenu 2
$Menu3_SubMenu2.Add_Click({ 
    #New-TextToSpeechMessage -Message 'This is the text I want to have read out loud' -Voice Zira
    $mess="The Time is " + (Get-Date -format "HH:mm")
    New-TextToSpeechMessage -Message $mess -Voice Zira
    
})
 
 
# When Restart the tool is clicked, close everything and kill the PowerShell process then open again the tool
$Menu_Restart_Tool.add_Click({
 $Restart = "Yes"
 start-process -WindowStyle hidden powershell.exe ".\menu.ps1 '$Restart'"  
 
 $MDTMonitoring_Icon.Visible = $false
 $window.Close()
 # $window_Config.Close() 
 Stop-Process $pid
  
 $Global:Timer_Status = $timer.Enabled
 If ($Timer_Status -eq $true)
  {
   $timer.Stop() 
  }  
 })
  
 
# When Exit is clicked, close everything and kill the PowerShell process
$Menu_Exit.add_Click({
 $Systray_Tool_Icon.Visible = $false
 $window.Close()
 # $window_Config.Close() 
 Stop-Process $pid
  
 $Global:Timer_Status = $timer.Enabled
 If ($Timer_Status -eq $true)
  {
   $timer.Stop() 
  } 
 })
  
  
# Make PowerShell Disappear
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)
 
# Force garbage collection just to start slightly lower RAM usage.
[System.GC]::Collect()
 
# Create an application context for it to all run within.
# This helps with responsiveness, especially when clicking Exit.
$appContext = New-Object System.Windows.Forms.ApplicationContext
[void][System.Windows.Forms.Application]::Run($appContext)
