# Mục tiêu
Triển khain web site PHP vào tên miền hocphp.fun

Các đầu việc bạn cần chỉnh sửa:

1. Đăng ký một tên miền trên namecheap rồi trỏ sang Route53 Host Zone
2. Tạo Elastic IP để gắn vào EC2 khai báo ở file var.tf
3. sửa lại tên miền trong trường `server_name    hocphp.fun www.hocphp.fun;` file phpsite.conf

# Cài đặt template provider
Lỗi khi chạy lệnh `terraform init` nếu bạn dùng MacM1 thì báo lỗi sau 
```
Error: Incompatible provider version
│ 
│ Provider registry.terraform.io/hashicorp/template v2.2.0 does not have a package available for your current
│ platform, darwin_arm64.
```

```
brew install kreuzwerker/taps/m1-terraform-provider-helper
m1-terraform-provider-helper activate
m1-terraform-provider-helper install hashicorp/template -v v2.2.0
```

# Tham khảo
https://youtu.be/cRYYFCekOIk

