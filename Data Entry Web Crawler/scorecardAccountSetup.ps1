$ie = new-object -com "InternetExplorer.Application"
$ie.navigate("https://spectrum.convergint.com")
$ie.Visible = $true  # change this to false before deploying

Start-Sleep -s 2; # see if we can change this to await

$username = Read-Host -Prompt "Please enter your Spectrum username"
$password = Read-Host -Prompt "Please enter your Spectrum password"

$inputs = $ie.Document.getElementsByName('d_username')
foreach($element in $inputs) {
    $element.value="$username"
}

# figure out how to remove loop as it shouldn't be necessary
$inputs = $ie.Document.getElementsByName('j_password')
foreach($element in $inputs) {
     $element.value="$password"
}

Start-Sleep -s 2

$ie.Document.getElementById('doLogin').click()

Start-Sleep -s 2

$inputs = $ie.Document.getElementById('aurora_widgets_FeedListItem_3').click()

Start-Sleep -s 5

$inputs = $ie.Document.getElementsByClassName('proiv-treegridSelectedFocus proiv-fixed-treegridSelectedFocus proiv-treegridDataCell proiv-fixed-treegridDataCell')
foreach($element in $inputs) {
     $element.click()
}
