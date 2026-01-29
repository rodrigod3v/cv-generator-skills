# Script to generate PDF from HTML using Chrome/Edge
$htmlPath = "c:\Users\777\Downloads\stitch_professional_resume_rodrigo_orlando_alves_v2\resume_print.html"
$pdfPath = "c:\Users\777\Downloads\stitch_professional_resume_rodrigo_orlando_alves_v2\Rodrigo_Orlando_Alves_Resume.pdf"

# Convert to file URI
$htmlUri = "file:///" + $htmlPath.Replace("\", "/")

Write-Host "Generating PDF from: $htmlUri"
Write-Host "Output PDF: $pdfPath"

# Try Chrome first
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
if (Test-Path $chromePath) {
    Write-Host "Using Google Chrome..."
    & $chromePath --headless --disable-gpu --print-to-pdf="$pdfPath" --print-to-pdf-no-header --no-margins "$htmlUri"
    Start-Sleep -Seconds 3
    if (Test-Path $pdfPath) {
        Write-Host "PDF generated successfully with Chrome!" -ForegroundColor Green
        exit 0
    }
}

# Try Edge if Chrome fails
$edgePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
if (Test-Path $edgePath) {
    Write-Host "Using Microsoft Edge..."
    & $edgePath --headless --disable-gpu --print-to-pdf="$pdfPath" --print-to-pdf-no-header --no-margins "$htmlUri"
    Start-Sleep -Seconds 3
    if (Test-Path $pdfPath) {
        Write-Host "PDF generated successfully with Edge!" -ForegroundColor Green
        exit 0
    }
}

Write-Host "Could not generate PDF automatically. Please follow these manual steps:" -ForegroundColor Yellow
Write-Host "1. Open resume_print.html in your browser"
Write-Host "2. Press Ctrl+P to print"
Write-Host "3. Select 'Save as PDF' as the printer"
Write-Host "4. Set margins to 'None' or 'Minimal'"
Write-Host "5. Enable 'Background graphics'"
Write-Host "6. Save as 'Rodrigo_Orlando_Alves_Resume.pdf'"
