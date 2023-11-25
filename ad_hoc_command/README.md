Lệnh Ansible ad hoc sử dụng công cụ dòng lệnh/usr/bin/ansible để tự động hóa một tác vụ duy nhất 
trên một hoặc nhiều nút được quản lý. các lệnh đặc biệt nhanh chóng và dễ dàng nhưng chúng không 
thể sử dụng lại được. 
Các lệnh đặc biệt rất phù hợp cho những công việc bạn hiếm khi lặp lại. Ví dụ: nếu bạn muốn tắt 
nguồn tất cả các máy trong phòng thí nghiệm của mình trong kỳ nghỉ Giáng sinh, bạn có thể thực hiện 
một thao tác nhanh trong Ansible mà không cần viết sổ tay. Một lệnh đặc biệt trông như thế này
'''
$ ansible [pattern] -m [module] -a "[module options]"
'''
