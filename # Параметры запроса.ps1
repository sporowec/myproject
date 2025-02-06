# Параметры запроса
$SiteUrl = "https://m365x22435451.sharepoint.com/sites/GoodGod"
$ListTitle = "Progulki_s_dino"
$Uri = "$SiteUrl/_api/web/lists/GetByTitle('$ListTitle')/items"

# Заголовки запроса
$Headers = @{
    "Accept" = "application/json;odata=verbose"
}

try {
    # Отправка запроса
    $Results = Invoke-RestMethod -Uri $Uri -Method Get -Headers $Headers -UseDefaultCredentials

    # Обработка результатов
    $Results.d.results | ForEach-Object {
        Write-Host "Title: $($_.Title)"
    }

} catch {
    # Обработка ошибок
    Write-Host "Ошибка: $($_.Exception.Message)" -ForegroundColor Red
}