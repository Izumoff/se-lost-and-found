# lost-and-found
Campus Lost and Found web application (Agile/Scrum semester project) for CSC550

## How to update the Lost-n-Found system
go to the virtual machine

### Get fresh version
```bash
cd ~/se-lost-n-found
git fetch origin
git reset --hard origin/main
git clean -fd
```

### Deploy (update)
```bash
cd ~/se-lost-n-found/deploy
sudo bash updtate.sh
```
wait 8)

### How to check what I launched

go to http://<your_virtual_machine_IP>\
in the footer will be a string:\
 © 2026 - Lost and Found     v.0.0.0.137bbce\
whrere 137bbce is commit hash from git repository
