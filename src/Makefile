.PHONY: help build up down restart logs clean

# Default target
help:
	@echo "🚌 UltraBus Docker Commands"
	@echo "=========================="
	@echo "make up        - Khởi động toàn bộ hệ thống"
	@echo "make down      - Dừng hệ thống"
	@echo "make restart   - Khởi động lại hệ thống"
	@echo "make logs      - Xem logs của tất cả services"
	@echo "make build     - Build lại tất cả images"
	@echo "make clean     - Dọn dẹp containers và volumes"
	@echo "make status    - Kiểm tra trạng thái containers"

# Build và khởi động hệ thống
up:
	@echo "🚀 Khởi động hệ thống UltraBus..."
	docker-compose up --build -d
	@echo "✅ Hệ thống đã khởi động!"
	@echo "📱 Web: http://localhost:8082"
	@echo "🔧 Admin: http://localhost:8081"
	@echo "🌐 API: http://localhost:8080"

# Dừng hệ thống
down:
	@echo "🛑 Đang dừng hệ thống..."
	docker-compose down
	@echo "✅ Hệ thống đã dừng!"

# Khởi động lại
restart: down up

# Xem logs
logs:
	docker-compose logs -f

# Build lại images
build:
	@echo "🔨 Đang build lại images..."
	docker-compose build --no-cache
	@echo "✅ Build hoàn thành!"

# Dọn dẹp
clean:
	@echo "🧹 Đang dọn dẹp..."
	docker-compose down -v
	docker system prune -f
	@echo "✅ Dọn dẹp hoàn thành!"

# Kiểm tra trạng thái
status:
	@echo "📊 Trạng thái containers:"
	docker-compose ps
