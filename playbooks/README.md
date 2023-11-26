```
ansible-playbook --ask-become-pass playbooks/install_nginx.yml
```
Làm việc tới tags:
(1) Tags được gán với từng việc "name" trong tags, trong đó:
- tags: always (đầu mục luôn được thực hiện)
- tags: var1, var2,..... -> chỉ định tên
```
List cụ thể các tags trong playbooks:
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
