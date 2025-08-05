@echo off
REM HTML 파일을 생성할 경로 설정
set "output_html=index.html"

REM HTML 파일 초기화
echo ^<!DOCTYPE html^> > "%output_html%"
echo ^<html lang="en"^> >> "%output_html%"
echo ^<head^> >> "%output_html%"
echo ^    ^<meta charset="UTF-8"^> >> "%output_html%"
echo ^    ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> "%output_html%"
echo ^    ^<title^>PNG Image Display^</title^> >> "%output_html%"
echo ^    ^<style^> >> "%output_html%"
echo ^        body { >> "%output_html%"
echo ^            display: flex; >> "%output_html%"
echo ^            flex-wrap: wrap; >> "%output_html%"
echo ^            justify-content: center; >> "%output_html%"
echo ^        } >> "%output_html%"
echo ^        .image-container { >> "%output_html%"
echo ^            position: relative; >> "%output_html%"
echo ^            width: 240px; >> "%output_html%"
echo ^            height: 320px; >> "%output_html%"
echo ^            margin: 10px; >> "%output_html%"
echo ^            text-align: center; >> "%output_html%"
echo ^            margin-bottom: 60px; >> "%output_html%"
echo ^        } >> "%output_html%"
echo ^        .image-container img { >> "%output_html%"
echo ^            position: relative; >> "%output_html%"
echo ^            width: 240px; >> "%output_html%"
echo ^            height: 320px; >> "%output_html%"
echo ^            z-index: 1; >> "%output_html%"
echo ^        } >> "%output_html%"
echo ^        .image-container p { >> "%output_html%"
echo ^            margin-top: 10px; >> "%output_html%"
echo ^        } >> "%output_html%"
echo ^</style^> >> "%output_html%"
echo ^</head^> >> "%output_html%"
echo ^<body^> >> "%output_html%"

REM PNG 파일들을 HTML에 추가
for %%f in (*.png) do (
    echo ^    ^<div class="image-container"^> >> "%output_html%"
    echo ^        ^<img src="%%f" alt="%%f"^> >> "%output_html%"
    REM 확장자를 제외한 파일 이름 가져오기
    for /f "delims=." %%a in ("%%~nf") do (
        echo ^        ^<p^>%%a^</p^> >> "%output_html%"
    )
    echo ^    ^</div^> >> "%output_html%"
)

REM HTML 닫기 태그 추가
echo ^</body^> >> "%output_html%"
echo ^</html^> >> "%output_html%"

echo HTML 파일이 %output_html%로 생성되었습니다.
start "" "%output_html%"
