#day la file ad-hoc command
#file nay se co command thay doi duoc cau hinh cua host

#sudo yum update
ansible all -m yum -a update_cache=true --become --ask-become-pass
#trong do: -m la su dung module, -a la argument bien trong module
# --become la tang privilge (len sudo), --ask-become-pass la cung cap mat khau sudo cua host

#cai dat nginx tren host su dung ad hoc
ansible all -m yum -a name=nginx --become --ask-become-pass 

#xoa nginx su dung ad hoc va xoa tren host cu the su dung --limit
ansible all -m yum -a "name=nginx state=absent" --become --ask-become-pass --limit 192.168.10.4

