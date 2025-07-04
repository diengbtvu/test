# UltraBus Docker Setup

Hệ thống đặt vé xe online UltraBus được đóng gói bằng Docker với docker-compose.

## 🏗️ Kiến trúc hệ thống

Dự án sử dụng **Entity Framework Core ORM** với **Code First approach**:
- ✅ **Migrations tự động**: Database được tạo tự động từ EF Migrations
- ✅ **Seeder tự động**: Dữ liệu mẫu được tạo tự động qua Seeder
- ✅ **Không cần SQL script thủ công**

## Cấu trúc dự án

- **ultrabus-admin**: Giao diện quản trị (Next.js) - Port 3000
- **ultrabus-web**: Giao diện người dùng (Next.js) - Port 3001  
- **UltraBusAPI**: Backend API (.NET 8 + EF Core) - Port 5000
- **SQL Server**: Cơ sở dữ liệu - Port 1433

## Yêu cầu hệ thống

- Docker Desktop
- Docker Compose v3.8+
- Ít nhất 4GB RAM
- 10GB dung lượng đĩa trống

## Cách chạy ứng dụng

### 1. Chạy toàn bộ hệ thống với một lệnh duy nhất:

```bash
# Cách 1 (khuyến nghị - không có warning):
docker-compose -f docker-compose-simple.yml up --build

# Cách 2 (có warning nhưng vẫn chạy được):
docker-compose up --build
```

### 2. Chạy trong chế độ nền:

```bash
docker-compose up --build -d
```

### 3. Xem logs:

```bash
docker-compose logs -f
```

### 4. Dừng hệ thống:

```bash
docker-compose down
```

### 5. Dừng và xóa volumes (bao gồm cả dữ liệu database):

```bash
docker-compose down -v
```

## Truy cập ứng dụng

Sau khi chạy thành công, bạn có thể truy cập:

- **Web người dùng**: http://localhost:3001
- **Admin panel**: http://localhost:3000  
- **API Backend**: http://localhost:5000
- **API Documentation (Swagger)**: http://localhost:5000/swagger
- **SQL Server**: localhost:1433 (sa/YourStrong@Passw0rd)

## ⚡ Quá trình khởi động tự động

1. **SQL Server khởi động** và chờ sẵn sàng
2. **API Backend khởi động** và tự động:
   - Chạy EF Migrations để tạo database schema
   - Chạy Seeders để thêm dữ liệu mẫu
   - Khởi động API endpoints
3. **Frontend applications khởi động** và kết nối đến API

## Cấu hình

### Database
- Username: `sa`
- Password: `YourStrong@Passw0rd`
- Database: `UltraBus` (tự động tạo)

### API Configuration
- Environment: Production
- JWT Secret: Đã được cấu hình sẵn
- CORS: Cho phép tất cả origins
- Swagger: Enabled trong Production

## 🛠️ Các lệnh hữu ích

### Sử dụng Makefile (nếu có Make)
```bash
make up        # Khởi động hệ thống
make down      # Dừng hệ thống
make restart   # Khởi động lại
make logs      # Xem logs
make clean     # Dọn dẹp hoàn toàn
```

### Sử dụng Scripts
```bash
# Windows
start.bat

# Linux/Mac
./start.sh
```

## Troubleshooting

### 0. Lỗi "version is obsolete":
```bash
# Lỗi: time="2025-07-04T14:03:28+07:00" level=warning msg="...the attribute `version` is obsolete"
# Giải pháp: Lỗi này là warning, có thể bỏ qua hoặc sử dụng file đơn giản:
docker-compose -f docker-compose-simple.yml up --build
```

### 1. Lỗi SQL Server không khởi động:
```bash
# Kiểm tra logs
docker-compose logs sqlserver

# Restart SQL Server container
docker-compose restart sqlserver
```

### 2. Lỗi EF Migrations:
```bash
# Kiểm tra logs API
docker-compose logs ultrabus-api

# Restart API để chạy lại migrations
docker-compose restart ultrabus-api
```

### 3. Lỗi build Next.js:
```bash
# Clean và rebuild
docker-compose down
docker system prune -f
docker-compose up --build --force-recreate
```

### 4. Port đã được sử dụng:
Thay đổi port trong file `.env`:
```bash
API_PORT=5001
ADMIN_PORT=3002
WEB_PORT=3003
```

### 5. Reset hoàn toàn database:
```bash
# Xóa tất cả containers và volumes
docker-compose down -v
docker-compose up --build
```

## 📊 Monitoring

### Kiểm tra trạng thái containers:
```bash
docker-compose ps
```

### Kiểm tra health của API:
```bash
curl http://localhost:5000/health
```

### Xem logs real-time:
```bash
# Tất cả services
docker-compose logs -f

# Chỉ API
docker-compose logs -f ultrabus-api

# Chỉ Database
docker-compose logs -f sqlserver
```

## Development

Để phát triển:

1. Clone repository
2. Chạy `docker-compose up --build`
3. Database và dữ liệu mẫu sẽ được tạo tự động
4. Chỉnh sửa code (containers sẽ tự động rebuild khi cần)

## Production

Để deploy production:

1. Thay đổi mật khẩu database trong `.env`
2. Cập nhật JWT secret trong `appsettings.Production.json`
3. Cấu hình HTTPS
4. Sử dụng external database nếu cần
5. Tắt Swagger trong production (nếu muốn)

## 🗄️ Backup Database

```bash
# Backup
docker exec ultrabus-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P YourStrong@Passw0rd -Q "BACKUP DATABASE UltraBus TO DISK = '/var/opt/mssql/backup/UltraBus.bak'"

# Copy backup file ra host
docker cp ultrabus-sqlserver:/var/opt/mssql/backup/UltraBus.bak ./backup/
```

## 🎯 Các tính năng tự động

- ✅ **Auto Database Creation**: Tự động tạo database từ EF Migrations
- ✅ **Auto Data Seeding**: Tự động thêm dữ liệu mẫu
- ✅ **Health Checks**: Kiểm tra sức khỏe services
- ✅ **Auto Restart**: Tự động khởi động lại khi có lỗi
- ✅ **Persistent Data**: Dữ liệu không bị mất khi restart
- ✅ **Production Ready**: Tối ưu cho production
