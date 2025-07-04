@echo off
REM Script để chạy ứng dụng UltraBus với Docker (không có warning)

echo 🚌 Đang khởi động hệ thống UltraBus (Simple Version)...
echo =====================================================

REM Kiểm tra Docker có đang chạy không
docker info >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker chưa được khởi động. Vui lòng khởi động Docker Desktop trước.
    pause
    exit /b 1
)

echo ✅ Docker đã sẵn sàng

REM Dọn dẹp containers cũ nếu có
echo 🧹 Dọn dẹp containers cũ...
docker-compose -f docker-compose-simple.yml down >nul 2>&1

REM Build và chạy các services
echo 🔨 Đang build và khởi động các services...
echo Quá trình này có thể mất vài phút lần đầu...
echo.

docker-compose -f docker-compose-simple.yml up --build
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
echo 📱 Web người dùng:  http://localhost:3001
echo 🔧 Admin panel:     http://localhost:3000
echo 🌐 API Backend:     http://localhost:5000
echo 🗄️  SQL Server:      localhost:1433
echo.
echo Để dừng hệ thống, nhấn Ctrl+C
pause
