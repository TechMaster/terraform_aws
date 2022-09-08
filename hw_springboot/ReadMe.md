# Deploy SpringBoot App

Các bước tiến hành

1. Biên dịch file Jar bằng cách gõ các lệnh sau
```
cd file_upload_custom_folder
mvn package
mv target/*.jar ../
```

Chú ý file demoupload-1.0.jar sẽ được copy ra thư mục ngoài

2. Khởi động Terraform

```
t init
t validate
t apply -auto-approve
```

