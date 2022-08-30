# Sử dụng module trong Terraform


Trong bài lab này, chúng ta cần tạo 2 EC2 instance khác nhau sử dụng 2 keypair khác nhau.
Để tái sử dụng chức năng tạo keypair chúng ta tạo modules/keypair

Tham số truyền vào modules/keypair/var.tf là tên của keypair
```json
variable "keyname" {
  description = "Name of keypair"
  type        = string
  default     = "sshkey"
}
```


