#day la file ad-hoc command

#kiem tra moi thu dang hoat dong ok
# ~ la home directory
ansible all --key-file ~/.ssh/ansible -i inventory -m ping

#sau khi khai bao cau hinh file ansible.cfg, bao gom dia chi key
# va duong dan inventory, lenh ansible se duoc rut gon nhu sau
ansible all -m ping

#kiem tra cac host 
ansible all --list-hosts

#thu thap cac thong tin cua host
ansible all -m gather_facts

#thu thap cac thong tin cua 1 host, su dung --limit
ansible all -m gather_facts --limit 192.168.10.4
