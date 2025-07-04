@echo off
REM Script để chạy ứng dụng UltraBus với Docker trên Windows

echo 🚌 Đang khởi động hệ thống UltraBus...
echo ==================================

REM Kiểm tra Docker có đang chạy không
docker info >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker chưa được khởi động. Vui lòng khởi động Docker Desktop trước.
    pause
    exit /b 1
)

REM Kiểm tra docker-compose có tồn tại không
docker-compose --version >nul 2>&1
if errorlevel 1 (
    echo ❌ docker-compose chưa được cài đặt.
    pause
    exit /b 1
)

echo ✅ Docker đã sẵn sàng

REM Dọn dẹp containers cũ nếu có
echo 🧹 Dọn dẹp containers cũ...
docker-compose down >nul 2>&1

REM Kiểm tra cấu hình docker-compose
echo 🔍 Kiểm tra cấu hình...
docker-compose config >nul 2>&1
if errorlevel 1 (
    echo ❌ Có lỗi trong cấu hình docker-compose.yml
    echo Vui lòng kiểm tra lại file cấu hình.
    pause
    exit /b 1
)

REM Build và chạy các services
echo 🔨 Đang build và khởi động các services...
echo Quá trình này có thể mất vài phút lần đầu...
echo.

docker-compose up --build
if errorlevel 1 (
    echo.
    echo ❌ Có lỗi xảy ra khi khởi động hệ thống.
    echo Vui lòng kiểm tra logs và thử lại.
    pause
    exit /b 1
)

echo.
echo 🎉 Hệ thống UltraBus đã khởi động thành công!
echo ==================================
echo 📱 Web người dùng:  http://localhost:8082
echo 🔧 Admin panel:     http://localhost:8081
echo 🌐 API Backend:     http://localhost:8080
echo 📊 Swagger API:     http://localhost:8080/swagger
echo 🗄️  SQL Server:      localhost:1434
echo.
echo Để dừng hệ thống, nhấn Ctrl+C
pause
