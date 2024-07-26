Import-Module PSWriteColor
if ($args.Count -eq 0)
{
    $items = (git for-each-ref --sort=-committerdate --count=20 --format='%(refname:short)' refs/heads/);
    #reverse items order    
    [array]::Reverse($items)
    
    $lineIndex = $items.Count
    Write-Host "Older branches: " -ForegroundColor Blue
    foreach ($i in $items) {
        $lineIndex -= 1

        if($lineIndex -cge 11) {
            Write-Color "($lineIndex)", " : $i" -Color Green,White
        }
        else{
            Write-Color "($lineIndex)", " : $i" -Color Green,Yellow
        }

        if($lineIndex -eq 11) {
            Write-Host "Most recent branches: " -ForegroundColor Blue
        }
    }
}
else
{
    $items = (git for-each-ref --sort=-committerdate --count=20 --format='%(refname:short)' refs/heads/);
    [array]::Reverse($items)
    $lineIndex = $items.Count
    foreach ($i in $items) {
        $lineIndex -= 1
        if ($lineIndex -eq $args[0]) {
            Write-Host "checkout: $i" -ForegroundColor Green
            git checkout $i $args[1]
        }
    }
}


