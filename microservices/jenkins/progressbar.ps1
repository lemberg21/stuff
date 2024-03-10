fuction ProgressBarr {
 for($ = 1; $i -le 100; $i++ ){
     Write-Progress -Activity "Action in Progress" -Status "$i% Complete:" -percentCmplete $i
     Start-Sleep -Miliseconds 250 
 }
}
