function Install-KarpathySkills {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('opencode', 'claude', 'cursor', 'universal')]
        [string]$Tool,

        [string]$Output
    )

    $RepoBase = if ($env:KARPATHY_SKILLS_BASE_URL) { $env:KARPATHY_SKILLS_BASE_URL } else { 'https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main' }

    function Get-RemoteContent($Url) {
        (Invoke-WebRequest -UseBasicParsing -Uri $Url).Content
    }

    function Ensure-ParentDir($Path) {
        $Parent = Split-Path -Parent $Path
        if ($Parent -and -not (Test-Path $Parent)) {
            New-Item -ItemType Directory -Path $Parent -Force | Out-Null
        }
    }

    function Append-MarkedBlock($Path, $Marker, $Content) {
        Ensure-ParentDir $Path

        if (Test-Path $Path) {
            $Existing = Get-Content -Raw $Path
            if ($Existing -like "*${Marker}*") {
                Write-Host "Already installed in $Path"
                return
            }

            if ($Existing.Trim().Length -gt 0) {
                Add-Content -Path $Path -Value "`r`n`r`n$Marker`r`n`r`n$Content`r`n`r`n$Marker"
            }
            else {
                Set-Content -Path $Path -Value "$Marker`r`n`r`n$Content`r`n`r`n$Marker"
            }
        }
        else {
            Set-Content -Path $Path -Value "$Marker`r`n`r`n$Content`r`n`r`n$Marker"
        }

        Write-Host "Installed to $Path"
    }

    function Write-ExactFile($Path, $Content) {
        Ensure-ParentDir $Path
        Set-Content -Path $Path -Value $Content
        Write-Host "Installed to $Path"
    }

    switch ($Tool) {
        'opencode' {
            $Content = Get-RemoteContent "$RepoBase/adapters/opencode/AGENTS.md"
            Append-MarkedBlock ($Output ? $Output : (Join-Path (Get-Location) 'AGENTS.md')) '<!-- karpathy-skills-anycoding:opencode -->' $Content
        }
        'claude' {
            $Content = Get-RemoteContent "$RepoBase/adapters/claude/CLAUDE.md"
            Append-MarkedBlock ($Output ? $Output : (Join-Path (Get-Location) 'CLAUDE.md')) '<!-- karpathy-skills-anycoding:claude -->' $Content
        }
        'cursor' {
            $Content = Get-RemoteContent "$RepoBase/adapters/cursor/.cursor/rules/karpathy-guidelines.mdc"
            Write-ExactFile ($Output ? $Output : (Join-Path (Get-Location) '.cursor/rules/karpathy-guidelines.mdc')) $Content
        }
        'universal' {
            $Content = Get-RemoteContent "$RepoBase/adapters/universal/SYSTEM_PROMPT.md"
            Append-MarkedBlock ($Output ? $Output : (Join-Path (Get-Location) 'AGENTS.md')) '<!-- karpathy-skills-anycoding:universal -->' $Content
        }
    }
}
