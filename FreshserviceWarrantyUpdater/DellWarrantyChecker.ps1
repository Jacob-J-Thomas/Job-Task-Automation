$csvTarget = "Device name"
$deviceList = import-csv '.\Devices.csv' | Group-Object $csvTarget
$allST = @()

# function Get-ST($servicetag) {
#     if ($servicetag.Length -eq '7') {
#         $allST += $servicetag
#     }
# }

foreach ($device in $deviceList) {
    $name = $device.name
    if ($name.Length -ne '7' -And $name.Length -ne '10') {
        $st = "device excluded"
        Write-Host "$st................ $name"
    }
    #older devices are configured to have -AP
    elseif ($name.Contains("-AP")) {
        $st = $name.split('-')[0]
        if ($st.Length -eq '7') {
            $allST += $st
        }
    }
    elseif ($name.Contains("-")) {
        $st = $name.split('-')[1]
        if ($st.Length -eq '7') {
            $allST += $st
        }
    }
    else {
        if ($st.Length -eq '7') {
            $allST += $st
        }
    }
}
Write-Host $allST
Start-Sleep -seconds 120

# Authentication function to be used after we get the API key from Dell

# Function Get-OAuthToken()
# {
#     param([Parameter(Mandatory=$true)][string]$AuthURI,
#           [Parameter(Mandatory=$true)][string]$ClientID,
#           [Parameter(Mandatory=$true)][string]$ClientSecret)

#     $Result = $false
#     $OAuth = "$ClientID`:$ClientSecret"
#     $Bytes = [System.Text.Encoding]::ASCII.GetBytes($OAuth)
#     $EncodedOAuth = [Convert]::ToBase64String($Bytes)
#     Write-Host $EncodedOAuth
#     $Headers = @{}
#     $Headers.Add("authorization", "Basic $EncodedOAuth")
#     Write-Host ($Headers | Format-Table -AutoSize | Out-String)
#     $Authbody = 'grant_type=client_credentials'
#     Try
#     {
#         $AuthResult = Invoke-RESTMethod -Method Post -Uri $AuthURI -Body $AuthBody -Headers $Headers
#         $Result = $AuthResult
#     }
#     Catch
#     {
#         $ErrorMessage = $Error[0].Exception.Message + $Error[0].Exception.InnerException
#         Write-Error "Failed to retrieve authentication token from $AuthURI."
#         Write-Error $ErrorMessage        
#     }
#     return $Result
# }
