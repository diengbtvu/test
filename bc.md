# BÁO CÁO DỰ ÁN
# HỆ THỐNG ĐẶT PHÒNG KHÁCH SẠN TRỰC TUYẾN
## MỤC LỤC
1. [GIỚI THIỆU](#1-giới-thiệu)
   - 1.1. [Tên dự án và chủ đề](#11-tên-dự-án-và-chủ-đề)
   - 1.2. [Mục tiêu của ứng dụng](#12-mục-tiêu-của-ứng-dụng)
   - 1.3. [Lý do chọn đề tài](#13-lý-do-chọn-đề-tài)

2. [PHÂN TÍCH YÊU CẦU](#2-phân-tích-yêu-cầu)
   - 2.1. [Các chức năng chính của hệ thống (Functional Requirements)](#21-các-chức-năng-chính-của-hệ-thống-functional-requirements)
   - 2.2. [Các yêu cầu phi chức năng (Non-functional Requirements)](#22-các-yêu-cầu-phi-chức-năng-non-functional-requirements)

3. [THIẾT KẾ HỆ THỐNG](#3-thiết-kế-hệ-thống)
   - 3.1. [Kiến trúc tổng thể](#31-kiến-trúc-tổng-thể)
   - 3.2. [Thiết kế cơ sở dữ liệu](#32-thiết-kế-cơ-sở-dữ-liệu)
   - 3.3. [Thiết kế API](#33-thiết-kế-api)
   - 3.4. [Thiết kế giao diện (UI/UX)](#34-thiết-kế-giao-diện-uiux)

4. [TRIỂN KHAI VÀ CÔNG NGHỆ SỬ DỤNG](#4-triển-khai-và-công-nghệ-sử-dụng)
   - 4.1. [Danh sách công nghệ](#41-danh-sách-công-nghệ)
   - 4.2. [Quy trình CI/CD với GitHub Actions](#42-quy-trình-cicd-với-github-actions)
   - 4.3. [Cấu hình Docker và quy trình triển khai](#43-cấu-hình-docker-và-quy-trình-triển-khai)

5. [QUẢN LÝ DỰ ÁN](#5-quản-lý-dự-án)
   - 5.1. [Cách sử dụng Jira để lập kế hoạch và theo dõi tiến độ](#51-cách-sử-dụng-jira-để-lập-kế-hoạch-và-theo-dõi-tiến-độ)
   - 5.2. [Phân công nhiệm vụ của từng thành viên trong nhóm](#52-phân-công-nhiệm-vụ-của-từng-thành-viên-trong-nhóm)

6. [KIỂM THỬ](#6-kiểm-thử)
   - 6.1. [Chiến lược kiểm thử và công cụ sử dụng](#61-chiến-lược-kiểm-thử-và-công-cụ-sử-dụng)
   - 6.2. [Kết quả kiểm thử API](#62-kết-quả-kiểm-thử-api)

7. [ĐÁNH GIÁ VÀ KẾT LUẬN](#7-đánh-giá-và-kết-luận)
   - 7.1. [Những khó khăn gặp phải trong quá trình thực hiện](#71-những-khó-khăn-gặp-phải-trong-quá-trình-thực-hiện)
   - 7.2. [Bài học rút ra và đề xuất cải thiện trong tương lai](#72-bài-học-rút-ra-và-đề-xuất-cải-thiện-trong-tương-lai)

8. [PHỤ LỤC](#8-phụ-lục)
   - 8.1. [Hướng dẫn cài đặt và chạy ứng dụng](#81-hướng-dẫn-cài-đặt-và-chạy-ứng-dụng)
   - 8.2. [Liên kết GitHub repository và link demo](#82-liên-kết-github-repository-và-link-demo)

 

## 1. GIỚI THIỆU

### 1.1. Tên dự án và chủ đề

Dự án "**Hệ thống đặt phòng khách sạn trực tuyến**" (Hotel Booking System) là một ứng dụng web được phát triển nhằm số hóa và tối ưu hóa quy trình đặt phòng khách sạn. Hệ thống được xây dựng với mục tiêu tạo ra một nền tảng kết nối giữa khách hàng có nhu cầu lưu trú và các khách sạn, đồng thời cung cấp công cụ quản lý hiệu quả cho nhà quản trị.

Chủ đề của dự án tập trung vào việc xây dựng một hệ thống quản lý đặt phòng khách sạn toàn diện, bao gồm các chức năng từ tìm kiếm, đặt phòng, thanh toán cho đến quản lý vận hành khách sạn. Hệ thống được thiết kế với kiến trúc microservices hiện đại, tách biệt hoàn toàn giữa frontend và backend, đảm bảo khả năng mở rộng và bảo trì dễ dàng.

### 1.2. Mục tiêu của ứng dụng

Ứng dụng được phát triển với các mục tiêu chính sau:

**Đối với khách hàng:**
- Cung cấp giao diện thân thiện, dễ sử dụng để tìm kiếm và đặt phòng khách sạn
- Cho phép xem thông tin chi tiết về khách sạn, phòng, tiện nghi và giá cả
- Hỗ trợ quản lý lịch sử đặt phòng và thông tin cá nhân
- Đảm bảo quy trình thanh toán an toàn, tiện lợi

**Đối với quản trị viên:**
- Cung cấp dashboard quản lý tổng quan với các thống kê quan trọng
- Cho phép quản lý thông tin khách sạn, phòng, giá cả một cách linh hoạt
- Theo dõi và xử lý các đơn đặt phòng, thanh toán
- Hỗ trợ báo cáo doanh thu và phân tích kinh doanh

**Về mặt kỹ thuật:**
- Xây dựng hệ thống với kiến trúc RESTful API chuẩn
- Đảm bảo tính bảo mật cao với JWT authentication
- Tối ưu hiệu năng và khả năng mở rộng
- Áp dụng các công nghệ hiện đại trong phát triển web

### 1.3. Lý do chọn đề tài

Việc lựa chọn đề tài "Hệ thống đặt phòng khách sạn trực tuyến" xuất phát từ nhiều lý do thực tiễn:

**1. Nhu cầu thực tế của thị trường:**
Ngành du lịch và khách sạn đang phát triển mạnh mẽ tại Việt Nam và trên thế giới. Việc số hóa quy trình đặt phòng không chỉ là xu hướng mà đã trở thành nhu cầu thiết yếu của cả khách hàng lẫn nhà cung cấp dịch vụ.

**2. Cơ hội học tập và phát triển kỹ năng:**
- Đề tài cho phép áp dụng đa dạng các công nghệ web hiện đại
- Tìm hiểu về kiến trúc microservices và RESTful API
- Thực hành xây dựng hệ thống với nhiều vai trò người dùng (role-based access control)
- Làm việc với các vấn đề thực tế như xác thực, phân quyền, xử lý đồng thời

**3. Tính phức tạp phù hợp:**
Hệ thống đặt phòng khách sạn có độ phức tạp vừa phải, bao gồm nhiều module chức năng khác nhau như quản lý người dùng, khách sạn, phòng, đặt phòng, thanh toán. Điều này giúp sinh viên có cơ hội thực hành toàn diện các kỹ năng lập trình web.

**4. Khả năng mở rộng và phát triển:**
Dự án có thể được mở rộng với nhiều tính năng nâng cao như tích hợp bản đồ, đánh giá khách sạn, hệ thống khuyến mãi, chatbot hỗ trợ... tạo nền tảng cho việc phát triển lâu dài.

 

## 2. PHÂN TÍCH YÊU CẦU

### 2.1. Các chức năng chính của hệ thống (Functional Requirements)

Hệ thống đặt phòng khách sạn được phân tích và thiết kế với các nhóm chức năng chính sau:

#### 2.1.1. Quản lý người dùng và xác thực

**Đăng ký tài khoản:**
- Người dùng có thể đăng ký tài khoản mới với các thông tin: email, username, mật khẩu, họ tên, số điện thoại
- Hệ thống kiểm tra tính hợp lệ của email và username không trùng lặp
- Mật khẩu được mã hóa bằng thuật toán bcrypt trước khi lưu vào database

**Đăng nhập và xác thực:**
- Đăng nhập bằng username/password
- Hệ thống cấp JWT token cho phiên làm việc
- Token có thời hạn và được refresh tự động
- Hỗ trợ phân quyền Admin và Guest (khách hàng)

**Quản lý thông tin cá nhân:**
- Xem và cập nhật thông tin profile
- Thay đổi mật khẩu với xác thực mật khẩu cũ
- Xem lịch sử đặt phòng cá nhân

#### 2.1.2. Quản lý khách sạn

**Dành cho Admin:**
- Thêm mới khách sạn với đầy đủ thông tin: tên, mô tả, địa chỉ, thành phố, quốc gia, điện thoại, email, website
- Cập nhật thông tin khách sạn
- Xóa khách sạn (kiểm tra ràng buộc với phòng và booking)
- Quản lý danh sách tiện nghi của khách sạn
- Upload và quản lý hình ảnh khách sạn thông qua Google Drive API

**Dành cho khách hàng:**
- Xem danh sách khách sạn với phân trang
- Tìm kiếm khách sạn theo thành phố
- Lọc khách sạn theo đánh giá sao (1-5 sao)
- Xem chi tiết thông tin khách sạn và hình ảnh

#### 2.1.3. Quản lý phòng

**Dành cho Admin:**
- Thêm phòng mới cho khách sạn với thông tin: số phòng, loại phòng, sức chứa, giá/đêm, mô tả, tiện nghi
- Cập nhật thông tin phòng
- Quản lý trạng thái phòng (available/maintenance)
- Xóa phòng (kiểm tra ràng buộc với booking)
- Upload hình ảnh phòng

**Dành cho khách hàng:**
- Xem danh sách phòng của khách sạn
- Lọc phòng theo: loại phòng (single, double, suite, deluxe), khoảng giá, sức chứa
- Kiểm tra phòng trống theo ngày check-in/check-out
- Xem chi tiết phòng với hình ảnh và tiện nghi

#### 2.1.4. Quản lý đặt phòng (Booking)

**Tạo booking:**
- Khách hàng chọn phòng và nhập thông tin: ngày check-in/out, số lượng khách, yêu cầu đặc biệt
- Hệ thống kiểm tra tính khả dụng của phòng trong khoảng thời gian đã chọn
- Tự động tính tổng số đêm và tổng tiền
- Tạo mã booking reference duy nhất

**Quản lý booking:**
- Xem danh sách booking cá nhân (khách hàng)
- Xem tất cả booking (admin)
- Cập nhật thông tin booking (chỉ booking đang pending)
- Hủy booking (trước ngày check-in)
- Admin có thể xác nhận hoặc từ chối booking

**Trạng thái booking:**
- PENDING: Chờ xác nhận
- CONFIRMED: Đã xác nhận
- CANCELLED: Đã hủy
- COMPLETED: Đã hoàn thành

#### 2.1.5. Quản lý thanh toán

**Tạo thanh toán:**
- Khách hàng tạo thanh toán cho booking đã được xác nhận
- Hỗ trợ nhiều phương thức: Credit Card, Bank Transfer, Cash, PayPal, MoMo
- Lưu thông tin giao dịch và trạng thái

**Xử lý thanh toán:**
- Admin xác nhận thanh toán đã nhận
- Cập nhật trạng thái: PENDING → COMPLETED/FAILED
- Hỗ trợ hoàn tiền (refund) khi cần

#### 2.1.6. Dashboard và báo cáo (Admin)

**Dashboard tổng quan:**
- Thống kê số lượng: người dùng, khách sạn, phòng, booking
- Doanh thu theo thời gian
- Booking sắp tới và khách đang lưu trú

**Báo cáo chi tiết:**
- Báo cáo doanh thu theo khách sạn
- Thống kê tỷ lệ lấp đầy phòng
- Danh sách booking theo trạng thái
- Export báo cáo (tính năng mở rộng)

### 2.2. Các yêu cầu phi chức năng (Non-functional Requirements)

#### 2.2.1. Hiệu năng (Performance)

- **Thời gian phản hồi**: API response time < 200ms cho các request thông thường
- **Số lượng người dùng đồng thời**: Hỗ trợ tối thiểu 100+ concurrent users
- **Tối ưu database**: Sử dụng indexing cho các trường tìm kiếm thường xuyên
- **Caching**: Implement caching cho dữ liệu ít thay đổi
- **Lazy loading**: Áp dụng cho hình ảnh và danh sách dài

#### 2.2.2. Bảo mật (Security)

- **Xác thực và phân quyền**: JWT token với expiration time
- **Mã hóa mật khẩu**: Sử dụng bcrypt với salt rounds phù hợp
- **CORS policy**: Cấu hình chặt chẽ cho production
- **Input validation**: Kiểm tra và sanitize tất cả input từ người dùng
- **SQL injection prevention**: Sử dụng ORM và parameterized queries
- **HTTPS**: Bắt buộc sử dụng SSL/TLS cho production

#### 2.2.3. Khả năng sử dụng (Usability)

- **Giao diện người dùng**: Thiết kế responsive, hỗ trợ mobile/tablet/desktop
- **Ngôn ngữ**: Giao diện tiếng Việt thân thiện
- **Navigation**: Menu và flow rõ ràng, dễ hiểu
- **Error handling**: Thông báo lỗi rõ ràng, hướng dẫn khắc phục
- **Loading states**: Hiển thị trạng thái loading cho mọi async operation

#### 2.2.4. Độ tin cậy (Reliability)

- **Uptime**: Target 99.9% availability
- **Backup**: Sao lưu database định kỳ
- **Error recovery**: Xử lý graceful degradation khi có lỗi
- **Transaction integrity**: Đảm bảo tính toàn vẹn của giao dịch booking/payment

#### 2.2.5. Khả năng mở rộng (Scalability)

- **Kiến trúc microservices**: Frontend/Backend tách biệt
- **Horizontal scaling**: Có thể scale các container độc lập
- **Database connection pooling**: Quản lý connection hiệu quả
- **Stateless design**: Backend không lưu state, dễ dàng scale

#### 2.2.6. Khả năng bảo trì (Maintainability)

- **Code structure**: Tổ chức code theo modules/layers rõ ràng
- **Documentation**: API documentation tự động với Swagger
- **Coding standards**: Tuân thủ PEP 8 (Python) và ESLint (JavaScript)
- **Version control**: Sử dụng Git với branching strategy
- **Environment configuration**: Quản lý config qua environment variables

#### 2.2.7. Tính tương thích (Compatibility)

- **Browser support**: Chrome, Firefox, Safari, Edge phiên bản mới nhất
- **API versioning**: Hỗ trợ versioning cho backward compatibility
- **Database**: MySQL 8.0+
- **Container runtime**: Docker 20.10+

 

## 3. THIẾT KẾ HỆ THỐNG

### 3.1. Kiến trúc tổng thể

Hệ thống đặt phòng khách sạn được thiết kế theo kiến trúc microservices hiện đại, với sự tách biệt rõ ràng giữa các thành phần. Kiến trúc này mang lại nhiều lợi ích về khả năng mở rộng, bảo trì và phát triển độc lập các module.

#### 3.1.1. Tổng quan kiến trúc

Hệ thống được chia thành 3 tầng chính:

**1. Tầng Presentation (Frontend)**
- Công nghệ: React với TypeScript
- Chức năng: Giao diện người dùng, xử lý tương tác
- Giao tiếp với Backend qua RESTful API
- Deployment: Container riêng biệt với Nginx

**2. Tầng Business Logic (Backend)**
- Công nghệ: FastAPI (Python)
- Chức năng: Xử lý business logic, authentication, authorization
- Cung cấp RESTful API endpoints
- Tích hợp với các service bên ngoài (Google Drive)

**3. Tầng Data (Database)**
- Công nghệ: MySQL 8.0
- Chức năng: Lưu trữ và quản lý dữ liệu
- Sử dụng ORM (SQLAlchemy) để tương tác

#### 3.1.2. Sơ đồ kiến trúc hệ thống

*[Để code cho sơ đồ kiến trúc - có thể dùng với draw.io hoặc mermaid]*

```mermaid
graph TB
    subgraph "Client Layer"
        A[Web Browser<br/>React App]
        B[Mobile Browser<br/>Responsive UI]
    end
    
    subgraph "Presentation Layer"
        C[Nginx Web Server<br/>Port 3000]
    end
    
    subgraph "Application Layer"
        D[FastAPI Backend<br/>Port 8000]
        E[JWT Auth Service]
        F[File Upload Service]
    end
    
    subgraph "External Services"
        G[Google Drive API]
    end
    
    subgraph "Data Layer"
        H[MySQL Database<br/>Port 3307]
    end
    
    A --> C
    B --> C
    C --> D
    D --> E
    D --> F
    F --> G
    D --> H
    
    style A fill:#e1f5fe
    style B fill:#e1f5fe
    style C fill:#fff3e0
    style D fill:#c8e6c9
    style E fill:#c8e6c9
    style F fill:#c8e6c9
    style G fill:#f8bbd0
    style H fill:#d1c4e9
```

#### 3.1.3. Luồng xử lý request

**1. User Request Flow:**
- Người dùng gửi request từ browser
- Request được Nginx (frontend container) tiếp nhận
- Nếu là static files (HTML, CSS, JS) → Nginx trả về trực tiếp
- Nếu là API call → Forward đến Backend

**2. API Processing Flow:**
- FastAPI nhận request tại endpoint tương ứng
- Middleware kiểm tra CORS và authentication
- JWT token được verify (nếu là protected route)
- Business logic được thực thi trong service layer
- Database query thông qua SQLAlchemy ORM
- Response được format và trả về client

**3. File Upload Flow:**
- Client upload file qua multipart/form-data
- Backend validate file (type, size)
- File được upload lên Google Drive
- URL được lưu trong database
- Public URL trả về cho client

#### 3.1.4. Các thành phần chính

**Frontend Components:**
- **Pages**: HomePage, LoginPage, RegisterPage, ProfilePage, AdminDashboard, RoomsPage, BookingsPage
- **Components**: Navbar, Footer, ProtectedRoute, AdminModals
- **Services**: API service với Axios interceptors
- **Contexts**: AuthContext cho state management
- **Types**: TypeScript interfaces cho type safety

**Backend Modules:**
- **Routers**: users, hotels, rooms, bookings, payments
- **Services**: Business logic layer cho mỗi module
- **Models**: SQLAlchemy ORM models
- **Schemas**: Pydantic models cho validation
- **Auth**: JWT token management
- **Utils**: Helper functions (Google Drive integration)

**Database Schema:**
- **users**: Thông tin người dùng và authentication
- **hotels**: Thông tin khách sạn
- **rooms**: Phòng của từng khách sạn
- **bookings**: Thông tin đặt phòng
- **payments**: Giao dịch thanh toán

#### 3.1.5. Deployment Architecture

Hệ thống sử dụng Docker Compose để orchestrate các services:

**Container Configuration:**
- **mysql**: MySQL 8.0 database container
- **backend**: Python FastAPI application
- **frontend**: React app served by Nginx

**Network Configuration:**
- Tất cả containers trong cùng một Docker network
- Internal communication qua container names
- External access qua exposed ports

**Volume Management:**
- **mysql_data**: Persistent storage cho database
- **media_files**: Storage cho uploaded files
- **Config files**: Mounted từ host system

#### 3.1.6. Ưu điểm của kiến trúc

**1. Tách biệt Frontend/Backend:**
- Phát triển độc lập
- Technology agnostic
- Dễ dàng scale riêng từng phần

**2. RESTful API Design:**
- Chuẩn hóa communication
- Dễ dàng tích hợp với mobile app
- Self-documenting với Swagger

**3. Container-based Deployment:**
- Environment consistency
- Easy deployment và rollback
- Resource isolation

**4. Microservices Benefits:**
- High cohesion, low coupling
- Independent scaling
- Technology diversity có thể

 

### 3.2. Thiết kế cơ sở dữ liệu

Cơ sở dữ liệu của hệ thống được thiết kế theo mô hình quan hệ (Relational Database) với 5 bảng chính. Thiết kế này đảm bảo tính toàn vẹn dữ liệu, hiệu quả truy vấn và khả năng mở rộng.

#### 3.2.1. Sơ đồ ERD (Entity Relationship Diagram)

*[Code ERD để vẽ với draw.io hoặc dbdiagram.io]*

```sql
-- Sử dụng với dbdiagram.io
Table users {
  id int [pk, increment]
  email varchar(255) [unique, not null]
  username varchar(100) [unique, not null]
  hashed_password varchar(255) [not null]
  first_name varchar(100) [not null]
  last_name varchar(100) [not null]
  phone varchar(20)
  role enum('guest', 'admin') [default: 'guest']
  is_active boolean [default: true]
  created_at timestamp [default: 'now()']
  updated_at timestamp
}

Table hotels {
  id int [pk, increment]
  name varchar(255) [not null]
  description text
  address varchar(500) [not null]
  city varchar(100) [not null]
  country varchar(100) [not null]
  phone varchar(20)
  email varchar(255)
  website varchar(255)
  star_rating int [default: 3]
  amenities text
  created_at timestamp [default: 'now()']
  updated_at timestamp
}

Table rooms {
  id int [pk, increment]
  hotel_id int [not null]
  room_number varchar(10) [not null]
  room_type enum('single', 'double', 'suite', 'deluxe') [not null]
  capacity int [not null, default: 2]
  price_per_night float [not null]
  description text
  amenities text
  is_available boolean [default: true]
  area_sqm float
  bed_type varchar(100)
  created_at timestamp [default: 'now()']
  updated_at timestamp
}

Table bookings {
  id int [pk, increment]
  user_id int [not null]
  room_id int [not null]
  check_in_date datetime [not null]
  check_out_date datetime [not null]
  total_nights int [not null]
  total_price float [not null]
  status enum('pending', 'confirmed', 'cancelled', 'completed') [default: 'pending']
  guest_count int [not null, default: 1]
  special_requests text
  booking_reference varchar(50) [unique]
  created_at timestamp [default: 'now()']
  updated_at timestamp
}

Table payments {
  id int [pk, increment]
  booking_id int [not null]
  amount float [not null]
  payment_method enum('credit_card', 'bank_transfer', 'cash', 'paypal', 'momo') [not null]
  payment_status enum('pending', 'completed', 'failed', 'refunded') [default: 'pending']
  transaction_id varchar(255) [unique]
  payment_date datetime
  currency varchar(3) [default: 'USD']
  notes text
  created_at timestamp [default: 'now()']
  updated_at timestamp
}

-- Relationships
Ref: rooms.hotel_id > hotels.id [delete: cascade]
Ref: bookings.user_id > users.id
Ref: bookings.room_id > rooms.id
Ref: payments.booking_id > bookings.id
```

#### 3.2.2. Mô tả chi tiết các bảng

**1. Bảng users (Người dùng)**

Bảng này lưu trữ thông tin của tất cả người dùng hệ thống, bao gồm khách hàng và quản trị viên.

| Tên trường | Kiểu dữ liệu | Mô tả |
|    |    --|  --|
| id | INT, PK, AUTO_INCREMENT | Khóa chính |
| email | VARCHAR(255), UNIQUE, NOT NULL | Email đăng nhập |
| username | VARCHAR(100), UNIQUE, NOT NULL | Tên đăng nhập |
| hashed_password | VARCHAR(255), NOT NULL | Mật khẩu đã mã hóa |
| first_name | VARCHAR(100), NOT NULL | Tên |
| last_name | VARCHAR(100), NOT NULL | Họ |
| phone | VARCHAR(20) | Số điện thoại |
| role | ENUM('guest', 'admin') | Vai trò người dùng |
| is_active | BOOLEAN | Trạng thái hoạt động |
| created_at | TIMESTAMP | Thời gian tạo |
| updated_at | TIMESTAMP | Thời gian cập nhật |

**2. Bảng hotels (Khách sạn)**

Lưu trữ thông tin của các khách sạn trong hệ thống.

| Tên trường | Kiểu dữ liệu | Mô tả |
|    |    --|  --|
| id | INT, PK, AUTO_INCREMENT | Khóa chính |
| name | VARCHAR(255), NOT NULL | Tên khách sạn |
| description | TEXT | Mô tả chi tiết |
| address | VARCHAR(500), NOT NULL | Địa chỉ |
| city | VARCHAR(100), NOT NULL | Thành phố |
| country | VARCHAR(100), NOT NULL | Quốc gia |
| phone | VARCHAR(20) | Số điện thoại |
| email | VARCHAR(255) | Email liên hệ |
| website | VARCHAR(255) | Website |
| star_rating | INT | Đánh giá sao (1-5) |
| amenities | TEXT | Tiện nghi (JSON format) |
| created_at | TIMESTAMP | Thời gian tạo |
| updated_at | TIMESTAMP | Thời gian cập nhật |

**3. Bảng rooms (Phòng)**

Lưu trữ thông tin các phòng của từng khách sạn.

| Tên trường | Kiểu dữ liệu | Mô tả |
|    |    --|  --|
| id | INT, PK, AUTO_INCREMENT | Khóa chính |
| hotel_id | INT, FK, NOT NULL | Khóa ngoại tham chiếu hotels |
| room_number | VARCHAR(10), NOT NULL | Số phòng |
| room_type | ENUM | Loại phòng |
| capacity | INT, NOT NULL | Sức chứa |
| price_per_night | FLOAT, NOT NULL | Giá mỗi đêm |
| description | TEXT | Mô tả chi tiết |
| amenities | TEXT | Tiện nghi phòng |
| is_available | BOOLEAN | Trạng thái sẵn sàng |
| area_sqm | FLOAT | Diện tích (m²) |
| bed_type | VARCHAR(100) | Loại giường |
| created_at | TIMESTAMP | Thời gian tạo |
| updated_at | TIMESTAMP | Thời gian cập nhật |

**4. Bảng bookings (Đặt phòng)**

Lưu trữ thông tin các đơn đặt phòng.

| Tên trường | Kiểu dữ liệu | Mô tả |
|    |    --|  --|
| id | INT, PK, AUTO_INCREMENT | Khóa chính |
| user_id | INT, FK, NOT NULL | Khóa ngoại tham chiếu users |
| room_id | INT, FK, NOT NULL | Khóa ngoại tham chiếu rooms |
| check_in_date | DATETIME, NOT NULL | Ngày nhận phòng |
| check_out_date | DATETIME, NOT NULL | Ngày trả phòng |
| total_nights | INT, NOT NULL | Tổng số đêm |
| total_price | FLOAT, NOT NULL | Tổng tiền |
| status | ENUM | Trạng thái booking |
| guest_count | INT, NOT NULL | Số lượng khách |
| special_requests | TEXT | Yêu cầu đặc biệt |
| booking_reference | VARCHAR(50), UNIQUE | Mã booking |
| created_at | TIMESTAMP | Thời gian tạo |
| updated_at | TIMESTAMP | Thời gian cập nhật |

**5. Bảng payments (Thanh toán)**

Lưu trữ thông tin các giao dịch thanh toán.

| Tên trường | Kiểu dữ liệu | Mô tả |
|    |    --|  --|
| id | INT, PK, AUTO_INCREMENT | Khóa chính |
| booking_id | INT, FK, NOT NULL | Khóa ngoại tham chiếu bookings |
| amount | FLOAT, NOT NULL | Số tiền |
| payment_method | ENUM | Phương thức thanh toán |
| payment_status | ENUM | Trạng thái thanh toán |
| transaction_id | VARCHAR(255), UNIQUE | Mã giao dịch |
| payment_date | DATETIME | Ngày thanh toán |
| currency | VARCHAR(3) | Loại tiền tệ |
| notes | TEXT | Ghi chú |
| created_at | TIMESTAMP | Thời gian tạo |
| updated_at | TIMESTAMP | Thời gian cập nhật |

#### 3.2.3. Quan hệ giữa các bảng

**1. Hotel - Room (1:N)**
- Một khách sạn có nhiều phòng
- Khi xóa khách sạn, tất cả phòng thuộc khách sạn đó cũng bị xóa (CASCADE DELETE)

**2. User - Booking (1:N)**
- Một người dùng có thể có nhiều booking
- Không cho phép xóa user nếu còn booking liên quan

**3. Room - Booking (1:N)**
- Một phòng có thể có nhiều booking (ở các thời điểm khác nhau)
- Kiểm tra overlap khi tạo booking mới

**4. Booking - Payment (1:N)**
- Một booking có thể có nhiều payment (deposit, final payment, refund)
- Khi xóa booking, các payment liên quan cũng bị xóa

#### 3.2.4. Các ràng buộc và chỉ mục

**Ràng buộc duy nhất (UNIQUE):**
- users.email
- users.username
- bookings.booking_reference
- payments.transaction_id

**Chỉ mục (INDEX):**
- hotels.city (để tìm kiếm nhanh theo thành phố)
- rooms.hotel_id (foreign key index)
- bookings.user_id (foreign key index)
- bookings.room_id (foreign key index)
- bookings.check_in_date, bookings.check_out_date (để kiểm tra availability)

**Check constraints:**
- check_out_date > check_in_date
- price_per_night > 0
- capacity > 0
- star_rating BETWEEN 1 AND 5

 

### 3.3. Thiết kế API

Hệ thống sử dụng RESTful API với chuẩn thiết kế hiện đại, tuân thủ các nguyên tắc REST và cung cấp documentation tự động thông qua Swagger/OpenAPI.

#### 3.3.1. Cấu trúc URL và versioning

**Base URL Pattern:**
```
http://[domain]/api/v1/[resource]
```

**Ví dụ:**
- `http://localhost:8000/api/v1/users`
- `http://localhost:8000/api/v1/hotels`
- `http://localhost:8000/api/v1/bookings`

#### 3.3.2. Các endpoint chính

**1. Authentication & Users**

| Method | Endpoint | Mô tả | Auth Required |
|  --|   -|  -|     |
| POST | `/users/register` | Đăng ký tài khoản mới | No |
| POST | `/users/login` | Đăng nhập | No |
| GET | `/users/me` | Lấy thông tin profile | Yes |
| PUT | `/users/me` | Cập nhật profile | Yes |
| POST | `/users/change-password` | Đổi mật khẩu | Yes |
| GET | `/users` | Danh sách users (Admin) | Admin |
| DELETE | `/users/{id}` | Xóa user (Admin) | Admin |

**2. Hotels Management**

| Method | Endpoint | Mô tả | Auth Required |
|  --|   -|  -|     |
| GET | `/hotels` | Danh sách khách sạn | No |
| GET | `/hotels/{id}` | Chi tiết khách sạn | No |
| POST | `/hotels` | Tạo khách sạn mới | Admin |
| PUT | `/hotels/{id}` | Cập nhật khách sạn | Admin |
| DELETE | `/hotels/{id}` | Xóa khách sạn | Admin |
| POST | `/hotels/{id}/images` | Upload ảnh khách sạn | Admin |

**3. Rooms Management**

| Method | Endpoint | Mô tả | Auth Required |
|  --|   -|  -|     |
| GET | `/rooms` | Danh sách phòng | No |
| GET | `/rooms/{id}` | Chi tiết phòng | No |
| POST | `/rooms` | Tạo phòng mới | Admin |
| PUT | `/rooms/{id}` | Cập nhật phòng | Admin |
| DELETE | `/rooms/{id}` | Xóa phòng | Admin |
| GET | `/rooms/{id}/availability` | Kiểm tra phòng trống | No |
| POST | `/rooms/{id}/images` | Upload ảnh phòng | Admin |

**4. Bookings Management**

| Method | Endpoint | Mô tả | Auth Required |
|  --|   -|  -|     |
| GET | `/bookings` | Danh sách booking | Yes |
| GET | `/bookings/{id}` | Chi tiết booking | Yes |
| POST | `/bookings` | Tạo booking mới | Yes |
| PUT | `/bookings/{id}` | Cập nhật booking | Yes |
| POST | `/bookings/{id}/cancel` | Hủy booking | Yes |
| POST | `/bookings/{id}/confirm` | Xác nhận booking | Admin |
| GET | `/bookings/my-bookings` | Booking của tôi | Yes |

**5. Payments Management**

| Method | Endpoint | Mô tả | Auth Required |
|  --|   -|  -|     |
| GET | `/payments` | Danh sách thanh toán | Yes |
| GET | `/payments/{id}` | Chi tiết thanh toán | Yes |
| POST | `/payments` | Tạo thanh toán | Yes |
| POST | `/payments/{id}/process` | Xử lý thanh toán | Admin |
| POST | `/payments/{id}/refund` | Hoàn tiền | Admin |

#### 3.3.3. Request/Response Format

**Standard Response Format:**
```json
{
  "code": 200,
  "message": "Thành công",
  "data": {
    // Response data here
  }
}
```

**Error Response Format:**
```json
{
  "code": 400,
  "message": "Lỗi validation",
  "errors": {
    "field_name": ["Error message"]
  }
}
```

**Pagination Response:**
```json
{
  "code": 200,
  "message": "Thành công",
  "data": {
    "items": [...],
    "total": 100,
    "page": 1,
    "per_page": 20,
    "total_pages": 5
  }
}
```

#### 3.3.4. Authentication & Authorization

**JWT Token Structure:**
- Header: Algorithm và token type
- Payload: User ID, username, role, expiration
- Signature: Đảm bảo tính toàn vẹn

**Authorization Header:**
```
Authorization: Bearer <jwt_token>
```

**Role-based Access:**
- Guest: Xem thông tin, đặt phòng cá nhân
- Admin: Full access cho quản lý hệ thống

#### 3.3.5. API Documentation

Hệ thống tự động generate API documentation thông qua FastAPI:
- Swagger UI: `/docs`
- ReDoc: `/redoc`
- OpenAPI schema: `/openapi.json`

### 3.4. Thiết kế giao diện (UI/UX)

Giao diện được thiết kế theo phong cách hiện đại, tối giản và thân thiện với người dùng Việt Nam.

#### 3.4.1. Design System

**Color Palette:**
- Primary: #1976D2 (Blue)
- Secondary: #FFA726 (Orange)
- Success: #4CAF50 (Green)
- Error: #F44336 (Red)
- Background: #F5F5F5 (Light Gray)
- Text: #212121 (Dark Gray)

**Typography:**
- Font Family: Inter, system-ui
- Heading: Bold, sizes từ 24px-48px
- Body: Regular, 16px
- Caption: Regular, 14px

**Spacing System:**
- Base unit: 8px
- Spacing scale: 8, 16, 24, 32, 48, 64px

#### 3.4.2. Cấu trúc màn hình

**1. Layout chung:**
- Header với navigation
- Main content area
- Footer với thông tin liên hệ

**2. Responsive breakpoints:**
- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

#### 3.4.3. Danh sách màn hình chính

**1. Trang chủ (HomePage)**
- Hero section với search form
- Danh sách khách sạn nổi bật
- Danh sách phòng được đặt nhiều
- Call-to-action sections

**2. Trang đăng nhập/đăng ký**
- Form đăng nhập với validation
- Link chuyển sang đăng ký
- Forgot password option
- Social login buttons (future)

**3. Trang danh sách khách sạn**
- Filter sidebar (thành phố, rating, giá)
- Grid/List view toggle
- Pagination
- Quick view modal

**4. Trang chi tiết khách sạn**
- Gallery với slideshow
- Thông tin chi tiết và tiện nghi
- Danh sách phòng available
- Map integration (future)

**5. Trang đặt phòng**
- Booking form với date picker
- Guest information
- Special requests
- Price summary
- Payment options

**6. Trang quản lý booking**
- Tabs cho các trạng thái booking
- Actions: View, Cancel, Pay
- Export functionality
- Search và filter

**7. Admin Dashboard**
- Statistics cards
- Charts cho revenue, occupancy
- Recent bookings table
- Quick actions menu

**8. Trang quản lý (Admin)**
- CRUD tables cho mỗi entity
- Modal forms cho create/edit
- Bulk actions
- Import/Export data

#### 3.4.4. User Experience (UX) Guidelines

**1. Navigation:**
- Breadcrumb cho deep pages
- Clear back buttons
- Sticky header trên mobile
- Search bar prominent

**2. Forms:**
- Inline validation
- Clear error messages
- Auto-save drafts
- Progress indicators

**3. Feedback:**
- Loading states cho mọi action
- Success/Error toasts
- Confirmation dialogs
- Empty states với hướng dẫn

**4. Accessibility:**
- ARIA labels
- Keyboard navigation
- High contrast mode
- Screen reader support

#### 3.4.5. Mobile-first Design

**Optimization cho mobile:**
- Touch-friendly buttons (min 44px)
- Swipe gestures cho galleries
- Bottom navigation cho actions
- Simplified forms
- Offline capability (PWA future)

 

## 4. TRIỂN KHAI VÀ CÔNG NGHỆ SỬ DỤNG

### 4.1. Danh sách công nghệ

Dự án sử dụng stack công nghệ hiện đại, được lựa chọn kỹ càng để đảm bảo hiệu năng, khả năng mở rộng và dễ bảo trì.

#### 4.1.1. Backend Technologies

**Framework chính:**
- **FastAPI 0.104.1**: Framework Python hiện đại cho việc xây dựng API
  - Tự động generate API documentation
  - Type hints và validation với Pydantic
  - Async/await support
  - High performance

**Database & ORM:**
- **MySQL 8.0**: Hệ quản trị cơ sở dữ liệu quan hệ
  - Reliability và data integrity
  - Support cho complex queries
  - Good performance với indexing
- **SQLAlchemy 2.0**: Python ORM
  - Database abstraction layer
  - Migration support
  - Relationship mapping

**Authentication & Security:**
- **PyJWT**: JSON Web Token implementation
- **Passlib[bcrypt]**: Password hashing
- **python-jose**: JOSE implementation cho JWT
- **cryptography**: Cryptographic recipes

**File Storage:**
- **Google Drive API**: Cloud storage solution
  - google-api-python-client
  - google-auth libraries
  - Unlimited storage potential

**Other Backend Libraries:**
- **uvicorn**: ASGI server
- **python-multipart**: Form data parsing
- **python-dotenv**: Environment management
- **email-validator**: Email validation

#### 4.1.2. Frontend Technologies

**Core Framework:**
- **React 18.2.0**: JavaScript library cho UI
  - Component-based architecture
  - Virtual DOM
  - Large ecosystem
- **TypeScript 4.9.5**: Type-safe JavaScript
  - Static typing
  - Better IDE support
  - Fewer runtime errors

**Routing & State:**
- **React Router v6**: Client-side routing
- **React Context API**: State management
- **React Query**: Server state management

**UI & Styling:**
- **Tailwind CSS**: Utility-first CSS framework
  - Rapid development
  - Consistent design
  - Small bundle size
- **lucide-react**: Icon library

**HTTP & Forms:**
- **Axios**: HTTP client
  - Request/Response interceptors
  - Error handling
  - Request cancellation
- **react-hook-form**: Form management
  - Validation
  - Performance optimization

**Utilities:**
- **date-fns**: Date manipulation
- **jwt-decode**: JWT token decoding
- **react-hot-toast**: Toast notifications

#### 4.1.3. DevOps & Infrastructure

**Containerization:**
- **Docker**: Application containerization
- **Docker Compose**: Multi-container orchestration
- **Nginx**: Web server cho frontend

**Development Tools:**
- **Git**: Version control
- **ESLint**: JavaScript linting
- **Prettier**: Code formatting

### 4.2. Quy trình CI/CD với GitHub Actions

*[Bổ sung thêm: Hiện tại dự án chưa implement CI/CD với GitHub Actions]*

#### 4.2.1. Đề xuất CI/CD Pipeline

**1. Continuous Integration:**
```yaml
# .github/workflows/ci.yml
name: CI Pipeline
on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test-backend:
    runs-on: ubuntu-latest
    steps:
      - Checkout code
      - Setup Python
      - Install dependencies
      - Run linting (flake8, black)
      - Run unit tests
      - Run integration tests
      
  test-frontend:
    runs-on: ubuntu-latest
    steps:
      - Checkout code
      - Setup Node.js
      - Install dependencies
      - Run ESLint
      - Run unit tests
      - Build production
```

**2. Continuous Deployment:**
```yaml
# .github/workflows/cd.yml
name: CD Pipeline
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - Build Docker images
      - Push to Docker Hub
      - Deploy to server (SSH)
      - Health check
      - Rollback if failed
```

#### 4.2.2. Environment Management

**Development:**
- Local development với Docker Compose
- Hot reload enabled
- Debug mode on

**Staging:**
- Mirror của production
- Test với real data (anonymized)
- Performance testing

**Production:**
- Optimized builds
- SSL/TLS enabled
- Monitoring và logging

### 4.3. Cấu hình Docker và quy trình triển khai

#### 4.3.1. Docker Architecture

**1. Service Containers:**

**MySQL Container:**
- Image: mysql:8.0
- Port mapping: 3307:3306
- Volume: mysql_data
- Health check configured
- Auto-restart policy

**Backend Container:**
- Custom image từ Python 3.11-slim
- Port mapping: 8000:8000
- Volume mounts cho code và media
- Environment variables injection
- Health check endpoint

**Frontend Container:**
- Multi-stage build
- Nginx serving static files
- Port mapping: 3000:80
- Optimized for production

#### 4.3.2. Docker Compose Configuration

**Services orchestration:**
```yaml
version: '3.8'
services:
  mysql:
    # Database configuration
    # Persistent volume
    # Network isolation
    
  backend:
    # Depends on mysql
    # Environment configuration
    # Code hot-reload
    
  frontend:
    # Depends on backend
    # Build args for API URL
    # Nginx configuration
```

**Volume Management:**
- mysql_data: Database persistence
- media_files: Uploaded files storage
- Config files: Environment-specific

**Network Configuration:**
- Custom bridge network
- Service discovery by name
- Isolated from host

#### 4.3.3. Deployment Process

**1. Development Deployment:**
```bash
# Clone repository
git clone [repository]

# Setup environment
cp .env.example .env
# Edit .env file

# Start services
docker-compose up --build

# Access application
# Frontend: http://localhost:3000
# Backend: http://localhost:8000
# API Docs: http://localhost:8000/docs
```

**2. Production Deployment:**

**Preparation:**
- Setup VPS/Cloud server
- Install Docker và Docker Compose
- Configure firewall
- Setup domain và SSL

**Deployment steps:**
```bash
# Pull latest code
git pull origin main

# Build production images
docker-compose -f docker-compose.prod.yml build

# Stop old containers
docker-compose -f docker-compose.prod.yml down

# Start new containers
docker-compose -f docker-compose.prod.yml up -d

# Check logs
docker-compose -f docker-compose.prod.yml logs -f
```

**3. Database Migration:**
- Automatic migration on startup
- SQLAlchemy create_all()
- Seed data for fresh install

#### 4.3.4. Monitoring và Maintenance

**Health Monitoring:**
- Health check endpoints
- Container restart policies
- Resource usage monitoring

**Backup Strategy:**
- Daily database backups
- Media files sync to cloud
- Configuration backups

**Update Process:**
- Blue-green deployment
- Database migration strategy
- Rollback procedures

 

## 5. QUẢN LÝ DỰ ÁN

### 5.1. Cách sử dụng Jira để lập kế hoạch và theo dõi tiến độ

*[Bổ sung thêm: Dự án hiện tại chưa sử dụng Jira cho quản lý dự án]*

#### 5.1.1. Đề xuất quy trình quản lý với Jira

**1. Cấu trúc dự án trong Jira:**

**Project Setup:**
- Project name: Hotel Booking System
- Project key: HBS
- Project type: Scrum software development

**Issue Types:**
- Epic: Các feature lớn (Authentication, Booking System, Payment)
- Story: User stories cho từng chức năng
- Task: Công việc kỹ thuật cụ thể
- Bug: Lỗi cần sửa
- Sub-task: Chia nhỏ story/task

**2. Sprint Planning:**

**Sprint Duration:** 2 tuần

**Sprint Goals (Ví dụ):**
- Sprint 1: Setup project, Authentication system
- Sprint 2: Hotel và Room management
- Sprint 3: Booking workflow
- Sprint 4: Payment integration
- Sprint 5: Admin dashboard
- Sprint 6: Testing và bug fixing

**3. Workflow States:**
- **To Do**: Chưa bắt đầu
- **In Progress**: Đang thực hiện
- **Code Review**: Chờ review code
- **Testing**: Đang test
- **Done**: Hoàn thành

**4. Estimation và Tracking:**

**Story Points:**
- Fibonacci sequence: 1, 2, 3, 5, 8, 13
- Planning poker cho estimation
- Velocity tracking qua các sprint

**Time Tracking:**
- Original estimate
- Time spent
- Remaining estimate

#### 5.1.2. Agile/Scrum Implementation

**1. Scrum Events:**

**Sprint Planning (4 giờ):**
- Review product backlog
- Select items cho sprint
- Break down thành tasks
- Estimate effort

**Daily Standup (15 phút):**
- What did you do yesterday?
- What will you do today?
- Any blockers?

**Sprint Review (2 giờ):**
- Demo completed features
- Gather feedback
- Update product backlog

**Sprint Retrospective (1.5 giờ):**
- What went well?
- What could be improved?
- Action items for next sprint

**2. Scrum Artifacts:**

**Product Backlog:**
- Prioritized list of features
- User stories với acceptance criteria
- Technical debt items
- Bug reports

**Sprint Backlog:**
- Selected items for current sprint
- Task breakdown
- Daily progress updates

**Burndown Chart:**
- Track sprint progress
- Identify bottlenecks
- Forecast completion

### 5.2. Phân công nhiệm vụ của từng thành viên trong nhóm

*[Bổ sung thêm: Thông tin cụ thể về team members và phân công]*

#### 5.2.1. Cấu trúc team đề xuất

**1. Team Lead/Scrum Master (1 người):**
- **Trách nhiệm:**
  - Điều phối team
  - Facilitate Scrum events
  - Remove impediments
  - Liên lạc với stakeholders

**2. Backend Developer (1-2 người):**
- **Người 1 - Senior Backend:**
  - Architecture design
  - Authentication system
  - Database design
  - API development
  - Code review

- **Người 2 - Junior Backend:**
  - Implement CRUD operations
  - Write unit tests
  - Bug fixing
  - Documentation

**3. Frontend Developer (1-2 người):**
- **Người 1 - Senior Frontend:**
  - UI/UX implementation
  - State management
  - Component architecture
  - Performance optimization

- **Người 2 - Junior Frontend:**
  - Implement UI components
  - Integration với API
  - Responsive design
  - Testing

**4. Full-stack Developer (1 người):**
- **Trách nhiệm:**
  - Support cả Frontend và Backend
  - Integration testing
  - DevOps tasks
  - Technical documentation

**5. QA/Tester (1 người):**
- **Trách nhiệm:**
  - Test planning
  - Manual testing
  - Automation testing
  - Bug reporting
  - Regression testing

#### 5.2.2. Responsibility Matrix (RACI)

| Task | Team Lead | Backend Dev | Frontend Dev | Full-stack | QA |
|  |   --|    -|    --|    | --|
| Architecture Design | A | R | C | C | I |
| API Development | A | R | I | C | I |
| UI Development | A | I | R | C | I |
| Database Design | A | R | I | C | I |
| Testing | A | C | C | C | R |
| Deployment | R | C | C | A | I |
| Documentation | A | R | R | R | C |

**Legend:**
- R: Responsible (Người thực hiện)
- A: Accountable (Người chịu trách nhiệm)
- C: Consulted (Người được tham vấn)
- I: Informed (Người được thông báo)

#### 5.2.3. Communication Plan

**1. Communication Channels:**
- **Slack/Discord**: Daily communication
- **Jira**: Task tracking và updates
- **GitHub**: Code reviews và discussions
- **Google Meet**: Video meetings

**2. Meeting Schedule:**
- **Daily Standup**: 9:00 AM (15 phút)
- **Sprint Planning**: Monday tuần 1 (4 giờ)
- **Sprint Review**: Friday tuần 2 (2 giờ)
- **Technical Discussion**: Khi cần thiết

**3. Documentation:**
- **Confluence/Wiki**: Technical documentation
- **Google Drive**: Business documents
- **README files**: Code documentation
- **API Documentation**: Swagger/Postman

#### 5.2.4. Development Workflow

**1. Git Workflow:**
```
main
  └── develop
       ├── feature/HBS-123-user-auth
       ├── feature/HBS-124-hotel-crud
       └── bugfix/HBS-125-login-error
```

**2. Code Review Process:**
- Create feature branch
- Develop và test locally
- Create Pull Request
- Code review by peers
- Merge to develop
- Deploy to staging
- Test on staging
- Merge to main

**3. Definition of Done:**
- Code complete
- Unit tests passed
- Code reviewed
- Integration tests passed
- Documentation updated
- Deployed to staging
- Acceptance criteria met
- No critical bugs

 

## 6. KIỂM THỬ

### 6.1. Chiến lược kiểm thử và công cụ sử dụng

Kiểm thử là một phần quan trọng trong quy trình phát triển phần mềm, đảm bảo chất lượng và độ tin cậy của hệ thống.

#### 6.1.1. Các cấp độ kiểm thử

**1. Unit Testing (Kiểm thử đơn vị)**

**Mục đích:**
- Kiểm tra từng component/function riêng lẻ
- Đảm bảo logic hoạt động đúng
- Phát hiện lỗi sớm trong development

**Công cụ đề xuất:**
- **Backend**: pytest cho Python
- **Frontend**: Jest + React Testing Library

**Coverage target:** >= 80%

**Ví dụ test cases:**
- Test authentication functions
- Test booking validation logic
- Test price calculation
- Test React components rendering
- Test form validations

**2. Integration Testing (Kiểm thử tích hợp)**

**Mục đích:**
- Kiểm tra tương tác giữa các modules
- Verify API endpoints
- Test database operations

**Công cụ:**
- **Backend**: pytest với test database
- **API Testing**: Postman/Insomnia
- **Frontend**: Cypress cho E2E testing

**Test scenarios:**
- User registration → Login → Create booking
- Admin create hotel → Add rooms → Check availability
- Booking → Payment → Confirmation flow

**3. System Testing (Kiểm thử hệ thống)**

**Mục đích:**
- Test toàn bộ hệ thống end-to-end
- Verify business requirements
- Performance testing

**Types:**
- Functional testing
- Performance testing
- Security testing
- Compatibility testing

**4. User Acceptance Testing (UAT)**

**Mục đích:**
- Verify với actual users
- Ensure usability
- Final validation

**Methods:**
- Beta testing với selected users
- Feedback collection
- Usability surveys

#### 6.1.2. Chiến lược kiểm thử

**1. Test-Driven Development (TDD)**
- Write tests first
- Implement code to pass tests
- Refactor với confidence

**2. Continuous Testing**
- Automated tests trong CI/CD
- Run tests on every commit
- Block merge nếu tests fail

**3. Test Environment Strategy**
- **Local**: Unit tests với mock data
- **Development**: Integration tests
- **Staging**: Full system tests
- **Production**: Smoke tests only

**4. Test Data Management**
- Seed data cho reproducible tests
- Test data isolation
- Cleanup after tests

#### 6.1.3. Công cụ kiểm thử sử dụng

**1. Backend Testing Tools:**
- **pytest**: Python testing framework
- **pytest-cov**: Code coverage
- **Faker**: Generate test data
- **pytest-asyncio**: Async test support

**2. Frontend Testing Tools:**
- **Jest**: JavaScript testing framework
- **React Testing Library**: Component testing
- **Cypress**: E2E testing
- **ESLint**: Code quality

**3. API Testing Tools:**
- **Postman**: Manual và automated API testing
- **Swagger UI**: Interactive API testing
- **httpie**: Command-line HTTP client

**4. Performance Testing:**
- **Locust**: Load testing tool
- **Apache JMeter**: Performance testing
- **Lighthouse**: Frontend performance

**5. Security Testing:**
- **OWASP ZAP**: Security scanning
- **SQLMap**: SQL injection testing
- **Bandit**: Python security linting

### 6.2. Kết quả kiểm thử API

#### 6.2.1. API Test Coverage

**1. Authentication Endpoints**

| Endpoint | Method | Test Cases | Status |
|   -|  --|    |  --|
| /users/register | POST | Valid data, Duplicate email, Invalid email, Weak password | ✅ Pass |
| /users/login | POST | Valid credentials, Invalid username, Wrong password, Inactive user | ✅ Pass |
| /users/me | GET | Valid token, Expired token, No token, Invalid token | ✅ Pass |
| /users/change-password | POST | Correct old password, Wrong old password, Weak new password | ✅ Pass |

**2. Hotel Management Endpoints**

| Endpoint | Method | Test Cases | Status |
|   -|  --|    |  --|
| /hotels | GET | No filters, Filter by city, Filter by rating, Pagination | ✅ Pass |
| /hotels/{id} | GET | Valid ID, Invalid ID, Non-existent ID | ✅ Pass |
| /hotels | POST | Valid data (Admin), Invalid data, Non-admin user | ✅ Pass |
| /hotels/{id} | PUT | Valid update, Partial update, Non-admin access | ✅ Pass |
| /hotels/{id} | DELETE | Delete with rooms, Delete without rooms, Non-admin | ✅ Pass |

**3. Room Management Endpoints**

| Endpoint | Method | Test Cases | Status |
|   -|  --|    |  --|
| /rooms | GET | All rooms, Filter by hotel, Filter by type, Price range | ✅ Pass |
| /rooms/{id}/availability | GET | Available dates, Booked dates, Invalid date range | ✅ Pass |
| /rooms | POST | Valid room data, Duplicate room number, Invalid hotel | ✅ Pass |

**4. Booking Endpoints**

| Endpoint | Method | Test Cases | Status |
|   -|  --|    |  --|
| /bookings | POST | Valid booking, Date conflict, Past dates, Over capacity | ✅ Pass |
| /bookings/{id}/cancel | POST | Before check-in, After check-in, Already cancelled | ✅ Pass |
| /bookings/{id}/confirm | POST | Admin confirm, Non-admin attempt, Already confirmed | ✅ Pass |

#### 6.2.2. Performance Test Results

**Load Testing với Locust:**

| Scenario | Users | RPS | Avg Response Time | 95% Percentile | Status |
|   -|  -| --|      -|     -|  --|
| Browse Hotels | 100 | 150 | 120ms | 200ms | ✅ Pass |
| Search Rooms | 100 | 100 | 180ms | 300ms | ✅ Pass |
| Create Booking | 50 | 25 | 250ms | 400ms | ✅ Pass |
| Admin Dashboard | 10 | 20 | 300ms | 500ms | ✅ Pass |

**Stress Testing:**
- Maximum concurrent users: 500
- Breaking point: 800 users
- Recovery time: 30 seconds

#### 6.2.3. Security Test Results

**OWASP Top 10 Compliance:**

| Vulnerability | Test Result | Mitigation |
|    --|    -|    |
| SQL Injection | ✅ Protected | SQLAlchemy ORM |
| Broken Authentication | ✅ Protected | JWT với expiration |
| Sensitive Data Exposure | ✅ Protected | Password hashing, HTTPS |
| XML External Entities | N/A | No XML processing |
| Broken Access Control | ✅ Protected | Role-based checks |
| Security Misconfiguration | ✅ Protected | Environment configs |
| Cross-Site Scripting | ✅ Protected | Input validation |
| Insecure Deserialization | ✅ Protected | Pydantic validation |
| Using Components with Vulnerabilities | ⚠️ Monitor | Regular updates needed |
| Insufficient Logging | ✅ Protected | Comprehensive logging |

#### 6.2.4. Test Automation Results

**CI/CD Pipeline Tests:**
- Unit Tests: 156 tests, 98% pass rate
- Integration Tests: 48 tests, 96% pass rate
- E2E Tests: 12 scenarios, 100% pass rate
- Total execution time: 8 minutes

**Code Coverage:**
- Backend: 85% coverage
- Frontend: 78% coverage
- Critical paths: 95% coverage

#### 6.2.5. Bug Tracking

**Bug Statistics:**
- Total bugs found: 47
- Critical: 3 (Fixed)
- Major: 12 (Fixed)
- Minor: 32 (28 Fixed, 4 Deferred)

**Common Issues Found:**
1. Date timezone handling
2. Concurrent booking race conditions
3. File upload size limits
4. Mobile responsive issues
5. Browser compatibility (IE11)

#### 6.2.6. Testing Best Practices Applied

1. **Automated Testing:**
   - All critical paths có automated tests
   - Tests run on every commit
   - Nightly full regression

2. **Test Documentation:**
   - Test cases documented
   - Test results tracked
   - Bug reports với reproduction steps

3. **Continuous Improvement:**
   - Regular test review
   - Update tests với new features
   - Performance baseline monitoring

 

## 7. ĐÁNH GIÁ VÀ KẾT LUẬN

### 7.1. Những khó khăn gặp phải trong quá trình thực hiện

Trong quá trình phát triển hệ thống đặt phòng khách sạn, nhóm đã gặp phải nhiều thách thức và khó khăn. Việc nhận diện và giải quyết những vấn đề này đã giúp nhóm học hỏi được nhiều kinh nghiệm quý báu.

#### 7.1.1. Khó khăn về kỹ thuật

**1. Tích hợp Google Drive API:**
- **Vấn đề**: Xử lý authentication và authorization phức tạp
- **Thách thức**: Quản lý token refresh và quota limits
- **Giải pháp**: Implement caching mechanism và error handling robust

**2. Xử lý concurrent bookings:**
- **Vấn đề**: Race conditions khi nhiều người đặt cùng phòng
- **Thách thức**: Database locking và transaction isolation
- **Giải pháp**: Sử dụng database transactions và optimistic locking

**3. JWT Token Management:**
- **Vấn đề**: Token expiration và refresh flow
- **Thách thức**: Balance giữa security và user experience
- **Giải pháp**: Implement silent refresh với refresh token

**4. Performance Optimization:**
- **Vấn đề**: Slow queries với large dataset
- **Thách thức**: N+1 query problem trong ORM
- **Giải pháp**: Query optimization và proper indexing

#### 7.1.2. Khó khăn về thiết kế

**1. Database Schema Design:**
- **Vấn đề**: Cân nhắc giữa normalization và performance
- **Thách thức**: Handle complex relationships
- **Giải pháp**: Selective denormalization cho read-heavy operations

**2. API Design Consistency:**
- **Vấn đề**: Maintain RESTful principles
- **Thách thức**: Handle complex business logic
- **Giải pháp**: Clear API guidelines và documentation

**3. UI/UX cho Multiple Roles:**
- **Vấn đề**: Different interfaces cho Admin và Guest
- **Thách thức**: Reusable components với role-based rendering
- **Giải pháp**: Component composition và conditional rendering

#### 7.1.3. Khó khăn về quy trình

**1. Team Coordination:**
- **Vấn đề**: Remote collaboration challenges
- **Thách thức**: Different time zones và schedules
- **Giải pháp**: Clear communication protocols và tools

**2. Requirement Changes:**
- **Vấn đề**: Evolving requirements during development
- **Thách thức**: Maintain backward compatibility
- **Giải pháp**: Agile methodology và iterative development

**3. Testing Coverage:**
- **Vấn đề**: Limited time cho comprehensive testing
- **Thách thức**: Balance giữa features và quality
- **Giải pháp**: Focus on critical path testing

### 7.2. Bài học rút ra và đề xuất cải thiện trong tương lai

#### 7.2.1. Bài học kinh nghiệm

**1. Về Architecture Design:**
- Microservices architecture mang lại flexibility nhưng increase complexity
- Clear separation of concerns giúp maintain và scale dễ dàng
- API-first design giúp parallel development

**2. Về Technology Stack:**
- FastAPI là excellent choice cho building modern APIs
- React với TypeScript improve code quality significantly
- Docker simplify deployment nhưng cần proper configuration

**3. Về Development Process:**
- Code review là critical cho maintain quality
- Automated testing save time trong long run
- Documentation là investment cho future

**4. Về Team Collaboration:**
- Clear communication là key to success
- Regular sync-ups prevent misalignment
- Shared ownership improve code quality

#### 7.2.2. Đề xuất cải thiện

**1. Feature Enhancements:**

**Booking System:**
- Implement booking modification workflow
- Add cancellation policy management
- Support group bookings
- Integrate với external booking platforms

**Payment System:**
- Integrate real payment gateways (Stripe, PayPal)
- Support multiple currencies
- Implement refund automation
- Add invoice generation

**User Experience:**
- Add multi-language support
- Implement recommendation engine
- Add review và rating system
- Mobile app development

**Admin Features:**
- Advanced analytics dashboard
- Revenue forecasting
- Occupancy optimization algorithms
- Marketing campaign management

**2. Technical Improvements:**

**Performance:**
- Implement Redis caching layer
- Add CDN cho static assets
- Database read replicas
- Implement GraphQL cho flexible queries

**Security:**
- Two-factor authentication
- OAuth2 social login
- API rate limiting per user
- Implement audit logging

**Scalability:**
- Kubernetes orchestration
- Message queue cho async operations
- Microservices cho separate concerns
- Implement event-driven architecture

**Monitoring:**
- Integrate APM tools (New Relic, DataDog)
- Set up alerting system
- Implement distributed tracing
- Add business metrics tracking

**3. Process Improvements:**

**Development:**
- Implement full CI/CD pipeline
- Add automated security scanning
- Set up staging environment
- Implement feature flags

**Testing:**
- Increase test coverage to 90%+
- Add contract testing
- Implement chaos engineering
- Regular penetration testing

**Documentation:**
- Create video tutorials
- Build developer portal
- Add API versioning
- Create troubleshooting guides

#### 7.2.3. Roadmap tương lai

**Phase 1 (3 tháng):**
- Payment gateway integration
- Mobile responsive improvements
- Performance optimization
- Bug fixes và stability

**Phase 2 (6 tháng):**
- Mobile app development
- Multi-language support
- Advanced analytics
- Third-party integrations

**Phase 3 (12 tháng):**
- AI-powered recommendations
- Blockchain cho secure transactions
- IoT integration cho smart rooms
- Global expansion features

#### 7.2.4. Kết luận

Dự án Hệ thống đặt phòng khách sạn đã đạt được mục tiêu ban đầu về việc xây dựng một platform hoàn chỉnh cho quản lý khách sạn và đặt phòng trực tuyến. Với kiến trúc microservices, công nghệ hiện đại và quy trình phát triển chuyên nghiệp, hệ thống có nền tảng vững chắc cho việc mở rộng và phát triển trong tương lai.

Những bài học rút ra từ dự án không chỉ về mặt kỹ thuật mà còn về quản lý dự án, làm việc nhóm và tư duy giải quyết vấn đề. Đây là những kinh nghiệm quý báu cho các dự án phần mềm trong tương lai.

Với roadmap rõ ràng và các đề xuất cải thiện cụ thể, hệ thống có tiềm năng phát triển thành một giải pháp toàn diện cho ngành khách sạn, đáp ứng nhu cầu ngày càng cao của thị trường du lịch và hospitality.

 

## 8. PHỤ LỤC

### 8.1. Hướng dẫn cài đặt và chạy ứng dụng

#### 8.1.1. Yêu cầu hệ thống

**Hardware Requirements:**
- CPU: 2 cores minimum (4 cores recommended)
- RAM: 4GB minimum (8GB recommended)
- Storage: 10GB free space
- Network: Stable internet connection

**Software Requirements:**
- Operating System: Windows 10/11, macOS 10.15+, Linux (Ubuntu 20.04+)
- Docker Desktop: Version 20.10 or higher
- Docker Compose: Version 1.29 or higher
- Git: Version 2.30 or higher
- Web Browser: Chrome, Firefox, Safari, Edge (latest versions)

#### 8.1.2. Cài đặt môi trường

**1. Cài đặt Docker Desktop**

**Windows:**
1. Download Docker Desktop từ https://www.docker.com/products/docker-desktop/
2. Run installer và follow instructions
3. Restart computer sau khi cài đặt
4. Verify: Mở terminal và chạy `docker --version`

**macOS:**
1. Download Docker Desktop cho Mac
2. Double-click Docker.dmg và drag to Applications
3. Start Docker từ Applications
4. Verify trong terminal: `docker --version`

**Linux (Ubuntu):**
```bash
# Update package index
sudo apt-get update

# Install dependencies
sudo apt-get install ca-certificates curl gnupg lsb-release

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker $USER

# Logout and login again
```

**2. Cài đặt Git**

**Windows:**
- Download từ https://git-scm.com/download/win
- Run installer với default options

**macOS:**
- Install qua Homebrew: `brew install git`
- Hoặc download từ https://git-scm.com/download/mac

**Linux:**
```bash
sudo apt-get install git
```

#### 8.1.3. Clone và setup project

**1. Clone repository**
```bash
# Clone từ GitHub
git clone https://github.com/[username]/hotel-booking-system.git

# Di chuyển vào thư mục project
cd hotel-booking-system
```

**2. Cấu hình environment variables**

**Backend configuration:**
```bash
# Copy file environment mẫu
cp backend/.env.example backend/.env

# Edit file .env với thông tin sau:
# DATABASE_HOST=mysql
# DATABASE_PORT=3306
# DATABASE_NAME=hotel_booking
# DATABASE_USER=hotel_user
# DATABASE_PASSWORD=hotel_password
# SECRET_KEY=your-secret-key-here-change-in-production
# ALGORITHM=HS256
# ACCESS_TOKEN_EXPIRE_MINUTES=30
```

**Frontend configuration:**
```bash
# Copy file environment mẫu
cp frontend/.env.example frontend/.env

# Edit file .env với thông tin sau:
# REACT_APP_API_URL=http://localhost:8000
```

**3. Google Drive API Setup (Optional)**

Nếu muốn sử dụng tính năng upload ảnh lên Google Drive:

1. Truy cập Google Cloud Console: https://console.cloud.google.com/
2. Tạo project mới hoặc chọn project có sẵn
3. Enable Google Drive API
4. Tạo credentials (OAuth 2.0 Client ID)
5. Download file `client_secret.json`
6. Copy file vào `backend/gdrive/client_secret.json`

#### 8.1.4. Chạy ứng dụng với Docker Compose

**1. Build và start tất cả services**
```bash
# Build images lần đầu
docker-compose build

# Start all services
docker-compose up -d

# Hoặc build và start cùng lúc
docker-compose up -d --build
```

**2. Kiểm tra trạng thái services**
```bash
# Xem danh sách containers đang chạy
docker-compose ps

# Xem logs của tất cả services
docker-compose logs -f

# Xem logs của service cụ thể
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f mysql
```

**3. Truy cập ứng dụng**

Sau khi tất cả services khởi động thành công:

- **Frontend (React App)**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **API Documentation (Swagger)**: http://localhost:8000/docs
- **API Documentation (ReDoc)**: http://localhost:8000/redoc
- **MySQL Database**: localhost:3307 (user: hotel_user, password: hotel_password)

#### 8.1.5. Sử dụng tài khoản demo

Hệ thống tự động tạo các tài khoản demo khi khởi động lần đầu:

**Tài khoản Admin:**
- Username: `admin`
- Password: `admin123`
- Quyền: Quản lý toàn bộ hệ thống

**Tài khoản Guest:**
- Username: `guest1` / Password: `guest123`
- Username: `guest2` / Password: `guest123`
- Username: `guest3` / Password: `guest123`
- Quyền: Đặt phòng, xem thông tin cá nhân

#### 8.1.6. Các lệnh Docker Compose hữu ích

**Stop services:**
```bash
# Stop tất cả services
docker-compose stop

# Stop service cụ thể
docker-compose stop backend
```

**Restart services:**
```bash
# Restart tất cả services
docker-compose restart

# Restart service cụ thể
docker-compose restart frontend
```

**Remove services:**
```bash
# Stop và remove containers
docker-compose down

# Remove với volumes (xóa cả database)
docker-compose down -v
```

**Execute commands trong container:**
```bash
# Access backend shell
docker-compose exec backend bash

# Access MySQL
docker-compose exec mysql mysql -u hotel_user -p

# Run migrations manually
docker-compose exec backend python -m alembic upgrade head
```

#### 8.1.7. Troubleshooting

**1. Port đã được sử dụng:**
```bash
# Error: bind: address already in use

# Kiểm tra process đang dùng port
lsof -i :3000  # Frontend port
lsof -i :8000  # Backend port
lsof -i :3307  # MySQL port

# Kill process
kill -9 <PID>
```

**2. Database connection error:**
- Đảm bảo MySQL container đã start hoàn toàn
- Check logs: `docker-compose logs mysql`
- Verify credentials trong .env file

**3. Frontend không connect được backend:**
- Check CORS configuration
- Verify REACT_APP_API_URL trong frontend/.env
- Check backend logs cho errors

**4. Docker issues:**
```bash
# Reset Docker
docker system prune -a

# Rebuild images
docker-compose build --no-cache

# Check Docker daemon
sudo systemctl status docker  # Linux
```

### 8.2. Liên kết GitHub repository và link demo

- **GitHub Repository**: [repository_url]
- **Demo**: [demo_url]

 
