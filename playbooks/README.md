<H1>Một số chú ý khi sử dụng ansible playbook</H1>

```
ansible-playbook --ask-become-pass playbooks/install_nginx.yml
```
<h2> Làm việc với group </h2>

Việc khai báo group trong inventory file giúp việc chạy task sẽ giúp điều khiển công việc triển khai tốt hơn, quy hoạch nhóm host sẽ thực hiện gán các task cụ thể, ví dụ trong inventory file (file inventory_group)
```
[webservers]
192.168.10.3

[dbservers]
192.168.10.4
192.168.10.3
```

Tại file site.yml, việc thực hiện task với một group sẽ được ví dụ việc cài đặt nginx tại group [webservers]

```
- hosts: webservers  #đây là group được khai báo trong inventory file
  become: true
  tasks:
  
  - name: install nginx
    tags: webservers, centos
    yum:
      name: nginx
      state: latest
```

<h2> Làm việc với tags</h2>

Làm việc tới tags: Tags được gán với từng việc "name" trong tags, việc sử dụng tags để giảm thiểu việc hoạt động cả playbook với những thành phần không cần chạy trong thời điểm người dùng không mong muốn (ví dụ test một task cụ thể). Cụ thể, việc khai báo tags như sau:
- tags: always (đầu mục luôn được thực hiện)
- tags: var1, var2,..... -> chỉ định tên

```
file site.yml để biết thêm chi tiết các khai báo tags
List cụ thể các tags trong playbooks 
ansible-playbook --list-tags -i inventory_group playbooks/site.yml
```

```
Thực hiện task có tags "ubuntu"
ansible-playbook -i inventory_group playbooks/site.yml --tags ubuntu --ask-become-pass
```

```
Thực hiện các task có tags thuộc một trong những tag "centos, samba, ubuntu":
ansible-playbook -i inventory_group playbooks/site.yml --tags "centos, samba, ubuntu" --ask-become-pass
```
<h2>Điều khiển thực hiện một task với điều kiện 1 task khác đã thay đổi trạng thái (State)</h2>

Ví dụ về điều khiển task 2 chỉ thực hiện khi task1 đã thay đổi trạng thái
```
Ví dụ: 
- name: task1
    noidungtask1:
    ...
    register: pizza
    #Đặt trên trạng thái cho task bằng thông qua biến "register" có giá trị là pizza 

- name: task2:
    noidungtask2:
    ....
    when: pizza.changed
    #Task2 chỉ thực hiện khi state pizza ở task1 được thay đổi thông qua pizza.changed 
```
Tuy nhiên, khi chạy lại ansible playbook lại, state kia đã thực hiện rồi thì sẽ không thay đổi state và task2 cũng sẽ không được thực hiện 
