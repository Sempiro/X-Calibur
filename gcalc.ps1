#!/bin/pwsh
# get shabanged, idiot

#region [extras]
    function sstv {
        Write-Host "
        ██████████████  ██  ████████    ██  ██████████████
        ██          ██  ██████    ██    ██  ██          ██
        ██  ██████  ██      ██████████      ██  ██████  ██
        ██  ██████  ██      ████  ██████    ██  ██████  ██
        ██  ██████  ██  ██████  ██  ██  ██  ██  ██████  ██
        ██          ██  ██      ████    ██  ██          ██
        ██████████████  ██  ██  ██  ██  ██  ██████████████
                        ██  ████        ██
        ██████    ████  ██████  ████  ████████████    ████
        ██████████  ██  ████  ████  ████  ████  ██  ████
        ██          ██  ██    ████    ████      ██████  ██
        ████  ██        ████          ██  ████  ████
        ██    ██    ██    ██          ████  ██          ██
        ████    ██  ██████      ██  ██████████      ████
        ████  ████████      ██████    ████  ██    ████  ██
            ██  ██  ██████          ████  ██  ██████
        ██████████  ██      ██████  ██  ██████████    ██
                        ██    ██    ██  ██      ██      ██
        ██████████████    ██  ████      ██  ██  ██      ██
        ██          ██  ██          ██  ██      ██    ██
        ██  ██████  ██    ██████  ██  ████████████    ██
        ██  ██████  ██    ██████████████  ██    ██  ████
        ██  ██████  ██  ██    ██    ██  ██    ██████  ████
        ██          ██  ██    ████    ██████  ████
        ██████████████  ██  ████        ██████    ██    ██"    
    }
    function Show-Credits {
        $creds = ("
        𝒳-𝒞𝒶𝓁𝒾𝒷𝓊𝓇 is made solely by    
                                        
    ▌ ▌▐█ ║ █│█▌██▐▐ ▌▌██ ▐▐║ █ ▌ █ ██▐█ ▌▌
    ▌ ▌▐█ ║ █│█▌██▐▐ ▌▌██ ▐▐║ █ ▌ █ ██▐█ ▌▌
    ▌        S  E  M  P  I  R  O          ▌
                                        
                    o  f                  
                                        
    ▌│║█ ║ █ │║█ ║ ▌║ ║█ ║ █ │║█ │║█│║█ │║▌
    ▌│║█ ║ █ │║█ ║ ▌║ ║█ ║ █ │║█ │║█│║█ │║▌
    ▌S T A T E S O L I D  S O F T W A R E ▌
                                        
        ")
        $creds = $creds -split '(.{39})' -ne ''
        for ($i = 0; $i -lt $creds.Count; $i++) {
            if($i % 2 -ne 0){
                Write-Host $creds[$i]
            }
            
            Start-Sleep -Milliseconds 25
        }
        pause
    }
#endregion

#region [2 points]
    function Set-InputPoints {
        clear-host
        do{$x1 = Read-Host "x1"}until($x1 -match '\d')
        do{$y1 = Read-Host "y1"}until($y1 -match '\d')
        do{$x2 = Read-Host "x2"}until($x2 -match '\d')
        do{$y2 = Read-Host "y2"}until($y2 -match '\d')

        if (gci *temp-math){
            Remove-Item -Path ".\temp-math" -Force
            New-Item -Path .\ -Name temp-math -Force | Out-Null
        }else{
            New-Item -Path .\ -Name temp-math -Force | Out-Null
        }
        
        
        Write-Output $x1 > .\temp-math
        Write-Output $y1 >> .\temp-math
        Write-Output $x2 >> .\temp-math
        Write-Output $y2 >> .\temp-math

        clear-host
    }
    function Get-dist {
        clear-host

        $filereadr = @()
        $filereadr = Get-Content .\temp-math

        $x1 = $filereadr[0]
        $y1 = $filereadr[1]
        $x2 = $filereadr[2]
        $y2 = $filereadr[3]

        <#
            you may ask why would you EVER need $filereadr?
            it's my lazy solution to have functions talk to eachother and to retain points through sessions
        #>

        write-host "`n`r The distance is $([System.Math]::Sqrt([math]::pow(([decimal]$x2 - [decimal]$x1),2) + [math]::pow(([decimal]$y2 - [decimal]$y1),2))) unit(s)"
        echo "$([System.Math]::Sqrt([math]::pow(([decimal]$x2 - [decimal]$x1),2) + [math]::pow(([decimal]$y2 - [decimal]$y1),2)))" > .\temp-math-output
        Start-Menu2Points
    }
    function Get-midpoint {
        clear-host
        
        $filereadr = @()
        $filereadr = cat .\temp-math

        $x1 = $filereadr[0]
        $y1 = $filereadr[1]
        $x2 = $filereadr[2]
        $y2 = $filereadr[3]
        
        Write-Host "`n`r The midpoint is ($(([decimal]$x1 + [decimal]$x2)/2) , $(([decimal]$y1 + [decimal]$y2)/2)) `r"

        Start-Menu2Points
    }
    function Get-partition {
        $filereadr = @()
        $filereadr = Get-Content .\temp-math

        $x1 = [decimal]$filereadr[0]
        $y1 = [decimal]$filereadr[1]
        $x2 = [decimal]$filereadr[2]
        $y2 = [decimal]$filereadr[3]

        do{
            clear-host
            do{$M1 = Read-Host "Input M1"}until($M1 -match '\d')
            clear-host
            do{$M2 = Read-Host "Input M2"}until($M2 -match '\d')
            write-host "${M1}:${M2}"
            do{$cont = read-host "Continue [y/n]"}until($cont -like "y" -or $cont -like "n")
            
        }until($cont -like "y")

        clear-host
        write-host "($((([decimal]$M1 * [decimal]$X2)+([decimal]$M2 * [decimal]$X1))/([decimal]$M1 + [decimal]$M2)),$((([decimal]$M1 * [decimal]$Y2)+([decimal]$M2 * [decimal]$Y1))/([decimal]$M1 + [decimal]$M2))) at ${M1}:${M2} (internal section)"
        write-host "($((([decimal]$M1 * [decimal]$X2)-([decimal]$M2 * [decimal]$X1))/([decimal]$M1 - [decimal]$M2)),$((([decimal]$M1 * [decimal]$Y2)-([decimal]$M2 * [decimal]$Y1))/([decimal]$M1 - [decimal]$M2))) at ${M1}:${M2} (external section)"
        write-host "($($X1 + (($M1/$M2)*($X2 - $X1))),$($Y1 + (($M1/$M2)*($Y2 - $Y1))))at ${M1}:${M2} (partial distance formula)"
        
        New-Item .\temp-math-output -force | out-null
        Write-Output "[($X1,$Y1),($X2,$Y2)]" > .\temp-math-output
        Write-Output "($((([decimal]$M1 * [decimal]$X2)+([decimal]$M2 * [decimal]$X1))/([decimal]$M1 + [decimal]$M2)),$((([decimal]$M1 * [decimal]$Y2)+([decimal]$M2 * [decimal]$Y1))/([decimal]$M1 + [decimal]$M2)))" >> .\temp-math-output
        Write-Output "($((([decimal]$M1 * [decimal]$X2)-([decimal]$M2 * [decimal]$X1))/([decimal]$M1 - [decimal]$M2)),$((([decimal]$M1 * [decimal]$Y2)-([decimal]$M2 * [decimal]$Y1))/([decimal]$M1 - [decimal]$M2)))" >> .\temp-math-output
        Write-Output "($($X1 + (($M1/$M2)*($X2 - $X1))),$($Y1 + (($M1/$M2)*($Y2 - $Y1))))" >> .\temp-math-output 
        <#  Q:Why are there [decimal]'s everywhere?
            A:it's the only way to make it work >:v  #>
        Start-Menu2Points
    }
    function Get-slope {
        
        $filereadr = @()
        $filereadr = cat .\temp-math

        $x1 = [decimal]$filereadr[0]
        $y1 = [decimal]$filereadr[1]
        $x2 = [decimal]$filereadr[2]
        $y2 = [decimal]$filereadr[3]

        if($x1.GetType() -eq [System.Double] -or $x2.GetType() -eq [System.Double] -or $y1.GetType() -eq [System.Double] -or $y2.GetType() -eq [System.Double]){
            do{
                Set-InputPoints

                $filereadr = @()
                $filereadr = cat .\temp-math
        
                $x1 = [decimal]$filereadr[0]
                $y1 = [decimal]$filereadr[1]
                $x2 = [decimal]$filereadr[2]
                $y2 = [decimal]$filereadr[3]
                
            }until($x1.GetType() -ne [System.Double] -or $x2.GetType() -ne [System.Double] -or $y1.GetType() -ne [System.Double] -or $y2.GetType() -ne [System.Double])
        }

        $rise = ($y2 - $y1)
        $run = ($x2 - $x1)

        if($rise -eq $run){
            $slopey = 1
        }else{
            $a = $rise
            $b = $run
            do{
                $c = $a % $b
                $a = $b
                $b = $c
            }while ($b -gt 0)
            $gcd = $a
            $slopex = ($run / $gcd)
            $slopey = ($rise / $gcd)
        }
        if($slopex -eq 1){
            clear-host
            Write-Host "`n`r The slope is $slopey"
        }elseif ($gcd -ne 0) {
            clear-host
            Write-Host "`n`r The slope is $slopey / $slopex"
        }else{
            clear-host
            Write-Host "`n`r The slope is $rise / $run"
        }

        $m = ($slopey / $slopex)

        $eqright = $m * $x1
        if($y1 -le 0){
            $yint = ($eqright + [math]::abs($y1))
        }else{
            $yint = $y1 - $eqright
        }        

        if($yint -le 0){
            if($yint -eq 0){
                $yint = ''
                write-host " The equation for the line is ${m}x"
            }else{
                write-host " The equation for the line is ${m}x  $yint"
            }
            
        }else{
            write-host " The equation for the line is ${m}x + $abyint"
        }

        echo "[($x1,$y1),($x2,$y2)]" > .\temp-math-output

        if($yint -le 0){
            echo "$slopey/${slopex}x$yint" >> .\temp-math-output
        }else{
            echo "$slopey/${slopex}x+$abyint" >> .\temp-math-output
        }

        Start-Menu2Points
    }
#endregion

#region [1 point, 1 equation]
    function Set-Input1p1e {
        clear-host
        do{$x1 = Read-Host "x1"}until($x1 -match '\d')
        do{$y1 = Read-Host "y1"}until($y1 -match '\d')
        $eq = Read-Host "Equation"


        if (gci *temp-math){
            Remove-Item -Path ".\temp-math" -Force
            New-Item -Path .\ -Name temp-math -Force | Out-Null
        }else{
            New-Item -Path .\ -Name temp-math -Force | Out-Null
        }
        
        
        Write-Output $x1 > .\temp-math
        Write-Output $y1 >> .\temp-math
        Write-Output $eq >> .\temp-math

        clear-host
    }
    function Get-Parallel {
        $filereadr = @()
        $filereadr = Get-Content .\temp-math

        $x1 = [decimal]$filereadr[0]
        $y1 = [decimal]$filereadr[1]
        $eq = $filereadr[2]

        if ($eq -match '(y=)|(=y)') {

            if ($eq -match '-(?=x)') {
                $m = -1
            }elseif ($eq -match '\D(?=x)') {
                $m = 1
            }else{
                $m = $eq -replace '(?!(-?\d?\/?\d(?=x))).'
            }

            $h = @()
            if($m -match '/'){
                $h = $m -split '/'
                $b = $h[0] / $h[1]
                $eqright = [decimal]$b * [decimal]$x1
            }else{
                $eqright = [decimal]$m * [decimal]$x1
            }
            
            
            if($y1 -le 0){
                $yint = ($eqright + [math]::abs($y1))
            }else{
                $yint = $y1 - $eqright
            } 
    
            if($yint -le 0){
                if($yint -eq 0){
                    write-host " The equation for the line is ${m}x"
                }elseif($yint -lt 0){
                    write-host " The equation for the line is ${m}x  $yint"
                }
            }else{
                write-host " The equation for the line is ${m}x+$yint"
            } 

            echo "($x1,$y1)" > .\temp-math-output
            echo "$eq" >> .\temp-math-output
            
            if($yint -le 0){
                echo "${m}x$yint" >> .\temp-math-output
            }else{
                echo "${m}x+$abyint" >> .\temp-math-output
            }
    
        }else{
            Write-Host "Make sure the equation is in y=mx+b form"
            Set-Input1p1e
        }
        Start-Menu1P1E
    }
#endregion

#region [1 equation]
    function convert-sf {
        $eq = Read-Host "Input Equation"
        $se = (($eq -split '[\+\-\=]') -replace '[xy]')
        $a = ([decimal]$se[0] * -1) / [decimal]$se[1]
        $ba = [decimal]$se[2] / [decimal]$se[1]

        #region[dec-frac]
        $dec = ($a -replace '0(?=\.)|[\D]' | measure-object -Character).Characters
        $10p = [System.Math]::Pow(10,$dec)
        $nu = ($a*$10p)-$a
        $de = $10p - 1
        $mul = [System.Math]::Pow(10,$(($nu -replace '\d(?!\.)|\D' | measure-object -Character).Characters))
        $nu = $nu*$mul
        $de = $de*$mul

        $b = $nu
        $a = $de

        do{
            $c = $a % $b
            $a = $b
            $b = $c
        }while ($b -gt 0)
        $gcd = $a

        $nu = $nu/$gcd
        $de = $de/$gcd
        #endregion

        $a ="$nu/$de"
        if ($ba -gt 0) {
            write-host "The equation is y=${a}x+$ba"
            Set-Clipboard "y=${a}x+$ba"
        }else {
            write-host "The equation is y=${a}x$ba"
            Set-Clipboard "y=${a}x$ba"
        }
    }
#endregion

#region [algebra]
    function Get-X{
        Clear-Host
        do{Clear-Host
            $equation = Read-Host 'Input Equation'
            if ((((((($($equation -replace '[^a-z]' -split '') | get-unique) | measure-object -Character | Select-Object -Property Characters | Out-String))) -split "\n") -replace '[^1-9]')[3]-notlike 1){
                Write-Host "Error: More than 1 type of variable present" -BackgroundColor Red -ForegroundColor Black
                write-host "" -
            }
        }until((((((($($equation -replace '[^a-z]' -split '') | get-unique) | measure-object -Character | Select-Object -Property Characters | Out-String))) -split "\n") -replace '[^1-9]')[3]-like 1)

        Clear-Host
        
        $split = $equation -split '='
        $leftterms = $split[0] -split '[\+\^=-]' -replace '\n'
        $leftterms
        $leftoperations = $split[0] -replace '[^\+\^=-]' -split ''
        $leftoperations

        $rightterms = $split[1] -split '[\+\^=-]'
        $rightterms
        $rightoperations = $split[1] -replace '[^\+\^=-]' -split ''
        $rightoperations


        <# combining like terms #>

        for ($i = 0; $i -lt $leftterms.Count; $i++) {
            if($leftterms[$i] -match '(?<=\()'){}
        
        

        

        }
    }
#endregion

#region [menus]
    function Start-Menu {
        clear-host
        $points = New-Object System.Management.Automation.Host.ChoiceDescription '&2 Points', 'Does stuff with points'
        $1p1e = New-Object System.Management.Automation.Host.ChoiceDescription '&1 Point', '1 Equation'
        $credits = New-Object System.Management.Automation.Host.ChoiceDescription '&Credits', 'Credits'
        ${x-it} = New-Object System.Management.Automation.Host.ChoiceDescription '&Exit', 'Exits'
        $621 = New-Object System.Management.Automation.Host.ChoiceDescription '&',''


        $options = [System.Management.Automation.Host.ChoiceDescription[]]($points,$1p1e,$credits,${x-it},$621)
        $title = '𝒳-𝒞𝒶𝓁𝒾𝒷𝓊𝓇'
        $message = "The calculator to defeat geometry"
        $result = $host.ui.PromptForChoice($title, $message, $options, 0)

        switch ($result)
        {
            0{Set-InputPoints;Start-Menu2Points}
            1{Set-Input1p1e;Start-Menu1P1E}
            2{clear-host;Show-Credits;Start-Menu}
            3{Clear-Host;if((get-random -Minimum 0 -Maximum 621) % 10 -gt 8){Write-Host 'UwU'}elseif((get-random -Minimum 0 -Maximum 621) % 10 -gt 9){Write-Host 'OwO'}else{Exit-PSHostProcess}}

        }
        
    }
    function Start-Menu2Points {
        

        $filereadr = @()
        $filereadr = Get-Content .\temp-math

        $x1 = [decimal]$filereadr[0]
        $y1 = [decimal]$filereadr[1]
        $x2 = [decimal]$filereadr[2]
        $y2 = [decimal]$filereadr[3]

        $mpf = New-Object System.Management.Automation.Host.ChoiceDescription '&Midpoint', 'Midpoint Formula'
        $dist = New-Object System.Management.Automation.Host.ChoiceDescription '&Distance', 'Distance Formula'
        $prt = New-Object System.Management.Automation.Host.ChoiceDescription '&Partition', 'Partition Formula w/ given ratio'
        $slp = New-Object System.Management.Automation.Host.ChoiceDescription '&Slope' , 'Calculates slope'
        $rst = New-Object System.Management.Automation.Host.ChoiceDescription '&ResetInput', 'Reset your inputs'
        $cpy = New-Object System.Management.Automation.Host.ChoiceDescription '&CopyOutput', 'Copies recent output for Desmos'
        $bak = New-Object System.Management.Automation.Host.ChoiceDescription '&Back', 'Back to Starting Menu'
        

        $options = [System.Management.Automation.Host.ChoiceDescription[]]($mpf, $dist, $prt, $slp, $rst, $cpy, $bak)
        $title = 'Points'
        $message = "($x1 , $y1) ($x2 , $y2)"
        $result = $host.ui.PromptForChoice($title, $message, $options, 0)

        switch ($result)
        {
            0 {get-midpoint}
            1 {get-dist}
            2 {get-partition}
            3 {get-slope}

            4 {Set-InputPoints;clear-host;Start-Menu2Points}
            5 {set-clipboard (Get-Content .\temp-math-output);clear-host; Start-Menu2Points}
            6 {Start-menu}
        }
    }
    function Start-Menu1P1E {
        $filereadr = @()
        $filereadr = Get-Content .\temp-math

        $x1 = [decimal]$filereadr[0]
        $y1 = [decimal]$filereadr[1]
        $eq = $filereadr[2]

        $gpl = New-Object System.Management.Automation.Host.ChoiceDescription '&Parallel', 'Gets a parallel line that intersects a point'
        $rst = New-Object System.Management.Automation.Host.ChoiceDescription '&ResetInput', 'Resets Input'
        $cpy = New-Object System.Management.Automation.Host.ChoiceDescription '&CopyOutput', 'Copies the output'
        $bak = New-Object System.Management.Automation.Host.ChoiceDescription '&Back', 'Back'


        $options = [System.Management.Automation.Host.ChoiceDescription[]]($gpl,$rst,$cpy,$bak)
        $title = 'Points & Equations'
        $message = "($x1 , $y1) $eq"
        $result = $host.ui.PromptForChoice($title, $message, $options, 0)

        switch ($result)
        {
            0{clear-host;Get-Parallel}

            1{Set-Input1p1e;Start-Menu1P1E}
            2{set-clipboard (Get-Content .\temp-math-output);clear-host; Start-Menu1P1E}
            3{Start-Menu}
        }
    }
#endregion

Start-Menu


