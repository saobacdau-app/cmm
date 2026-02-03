# DEPLOY Module CMM
## Môi trường kiểm thử
    Ubuntu 22.04

## Cài đặt docker/docker compose

    https://docs.docker.com/engine/install/

## Cài đặt Git

    https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## pull CMM từ github
    
    git clone https://github.com/saobacdau-app/cmm.git

## Đổi cấu hình trong file .env (Options)

## RUN
    cd cmm
    docker compose up -d

## Truy cập giao diện
    https://IP-Server

    user/pass: admin@system.local/admin123

# Cấu hình tham số
    1. Thông tin kết nối tới CMS: Cài đặt hệ thống => Danh sách CMS
    2. Địa chỉ nhận Call CDR: Cài đặt hệ thống => Cấu hình hệ thống => CMM_CDR_RECEIVER (Thay IP bằng IP của server triển khai phục vụ nhận CDR từ CMS)


