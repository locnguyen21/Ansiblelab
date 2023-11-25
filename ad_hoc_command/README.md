Lệnh Ansible ad hoc sử dụng công cụ dòng lệnh/usr/bin/ansible để tự động hóa một tác vụ duy nhất trên một hoặc nhiều nút được quản lý. các lệnh đặc biệt nhanh chóng và dễ dàng nhưng chúng không thể sử dụng lại được. 

Các lệnh đặc biệt rất phù hợp cho những công việc bạn hiếm khi lặp lại. Ví dụ: nếu bạn muốn tắt nguồn tất cả các máy trong phòng thí nghiệm của mình trong kỳ nghỉ Giáng sinh, bạn có thể thực hiện một thao tác nhanh trong Ansible mà không cần viết sổ tay. Ad hoc được sử dụng như thế này:
```
# ansible [-i /path/inventory-file] [pattern-host] [-m module] [-a arguments]
Trong đó:
<-i>: biến inventory host khai báo, mặc định không khai báo sẽ nằm ở /etc/ansible/inventory
<pattern>: chỉ định thông tin host máy chủ remote
<module>: chỉ định module sử dụng, mặc định là 'command'
<arguments> truyền tham số của module
```
Ví dụ: Muốn restart các server nằm trong group [webservers] được khai báo ở inventory
```
ansible webserver -a "reboot -f"
```
