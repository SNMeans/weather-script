param (
    [string]$zipcode = "29201"
)


$apiKey = "4fe81012b45c142a66aafdb79e5805f7"


$response = Invoke-RestMethod -Uri "http://api.openweathermap.org/data/2.5/weather?zip=$zipcode,us&units=imperial&appid=$apiKey"


$temperature = $response.main.temp
$weather = $response.weather[0].description


$color = "Yellow"
$description = "sunny"

if ($weather -match "rain") {
    $color = "Blue"
    $description = "rainy"
} elseif ($weather -match "cloud") {
    $color = "Gray"
    $description = "cloudy"
} elseif ($weather -match "snow") {
    $color = "White"
    $description = "snowy"
}


Write-Host "Currently, the weather for $zipcode is $description with a temperature of $temperature degrees Fahrenheit. Have an amazing day!!" -ForegroundColor $color
