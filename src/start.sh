#!/bin/bash

# Script để chạy ứng dụng UltraBus với Docker

echo "🚌 Đang khởi động hệ thống UltraBus..."
echo "=================================="

# Kiểm tra Docker có đang chạy không
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker chưa được khởi động. Vui lòng khởi động Docker Desktop trước."
    exit 1
fi

# Kiểm tra docker-compose có tồn tại không
if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose chưa được cài đặt."
    exit 1
fi

echo "✅ Docker đã sẵn sàng"

# Dọn dẹp containers cũ nếu có
echo "🧹 Dọn dẹp containers cũ..."
docker-compose down 2>/dev/null

# Build và chạy các services
echo "🔨 Đang build và khởi động các services..."
echo "Quá trình này có thể mất vài phút lần đầu..."

if docker-compose up --build; then
    echo ""
    echo "🎉 Hệ thống UltraBus đã khởi động thành công!"
    echo "=================================="
    echo "📱 Web người dùng:  http://localhost:3001"
    echo "🔧 Admin panel:     http://localhost:3000"
    echo "🌐 API Backend:     http://localhost:5000"
    echo "🗄️  SQL Server:      localhost:1433"
    echo ""
    echo "Để dừng hệ thống, nhấn Ctrl+C"
else
    echo "❌ Có lỗi xảy ra khi khởi động hệ thống."
    echo "Vui lòng kiểm tra logs và thử lại."
    exit 1
fi
