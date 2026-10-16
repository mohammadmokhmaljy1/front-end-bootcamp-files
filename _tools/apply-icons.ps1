# Applies the custom folder icons (Windows only). Safe to run many times.
# Reads _tools\folders.json, copies each icon into its folder and writes a hidden desktop.ini.
$ErrorActionPreference = 'Continue'
$toolsDir = $PSScriptRoot
$root     = Split-Path -Parent $toolsDir
$manifest = Join-Path $toolsDir 'folders.json'
$iconsDir = Join-Path $toolsDir 'icons'

if (-not (Test-Path -LiteralPath $manifest)) { Write-Host 'folders.json not found.'; exit 1 }
$map = Get-Content -LiteralPath $manifest -Raw -Encoding UTF8 | ConvertFrom-Json

$applied = 0
$skipped = 0
foreach ($entry in $map.PSObject.Properties) {
    $rel     = ($entry.Name -replace '/', '\')
    $folder  = Join-Path $root $rel
    $iconSrc = Join-Path $iconsDir $entry.Value
    if (-not (Test-Path -LiteralPath $folder -PathType Container) -or -not (Test-Path -LiteralPath $iconSrc -PathType Leaf)) {
        $skipped++
        continue
    }
    $iconDst = Join-Path $folder 'folder.ico'
    $ini     = Join-Path $folder 'desktop.ini'

    # make existing copies writable so they can be replaced
    foreach ($f in @($iconDst, $ini)) {
        if (Test-Path -LiteralPath $f) { [System.IO.File]::SetAttributes($f, [System.IO.FileAttributes]::Normal) }
    }

    Copy-Item -LiteralPath $iconSrc -Destination $iconDst -Force
    $iniText = "[.ShellClassInfo]`r`nIconResource=folder.ico,0`r`nIconFile=folder.ico`r`nIconIndex=0`r`n"
    [System.IO.File]::WriteAllText($ini, $iniText, [System.Text.Encoding]::ASCII)

    $hiddenSystem = [System.IO.FileAttributes]'Hidden, System'
    [System.IO.File]::SetAttributes($iconDst, $hiddenSystem)
    [System.IO.File]::SetAttributes($ini, $hiddenSystem)

    # Windows only reads desktop.ini when the folder itself is Read-only (or System)
    $attrs = [System.IO.File]::GetAttributes($folder)
    [System.IO.File]::SetAttributes($folder, ($attrs -bor [System.IO.FileAttributes]::ReadOnly))
    $applied++
}

# tell Explorer to refresh icons
try {
    if (-not ('ShellNotify' -as [type])) {
        Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public static class ShellNotify { [DllImport("shell32.dll")] public static extern void SHChangeNotify(int wEventId, uint uFlags, IntPtr dwItem1, IntPtr dwItem2); }'
    }
    [ShellNotify]::SHChangeNotify(0x08000000, 0, [IntPtr]::Zero, [IntPtr]::Zero)
} catch { }
try { & ie4uinit.exe -show } catch { }

Write-Host ("Folder icons applied: {0} (skipped: {1})" -f $applied, $skipped)
Write-Host 'If icons do not appear yet: close the folder window and open it again, or press F5.'
