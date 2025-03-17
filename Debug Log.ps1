function D-Debug($text){
    $d_isDebug = $true
    $d_debugLogPath = ""
    If($d_isDebug){
        $ln = (Get-PSCallStack)[1].ScriptLineNumber
        $dt = (Get-Date).ToString()
        $msg = $text -join ", "
        $output = ($dt,"`t","Line: ",$ln,"`t",$msg)
        If($d_debugLogPath -eq ""){
            Write-Host $output
        }else {
            Add-Content -Path $debugLogPath -Value $output
        }
    }
}
# usage
D-Debug "hello"
D-Debug "test:",2,"hi"
