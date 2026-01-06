@echo off
chcp 65001 >nul
echo ========================================
echo Подготовка к пушу в GitHub
echo ========================================
echo.

REM Проверка инициализации git
if not exist .git (
    echo Инициализация git репозитория...
    git init
    echo.
)

REM Добавление remote (если еще не добавлен)
git remote remove origin 2>nul
git remote add origin https://github.com/SpiritWalker84/SFadmin_TRG.git
echo Remote добавлен: https://github.com/SpiritWalker84/SFadmin_TRG.git
echo.

REM Добавление всех файлов
echo Добавление файлов...
git add .
echo.

REM Проверка статуса
echo Текущий статус:
git status
echo.

REM Commit
echo Создание commit...
git commit -m "Initial commit: Telegram Reminder Bot готов к деплою на Render"
echo.

REM Push
echo Отправка в GitHub...
echo ВНИМАНИЕ: Вам может потребоваться ввести логин и пароль (или токен доступа)
git push -u origin main
if errorlevel 1 (
    echo.
    echo Если push не удался, попробуйте:
    echo git branch -M main
    echo git push -u origin main
    echo.
    echo Или используйте токен доступа вместо пароля
)

echo.
echo ========================================
echo Готово!
echo ========================================
pause

