echo Criando o HD para a VM
qemu-img create -f qcow2 hd.img 90G
echo Executando o download da iso para o sistema
wget www.ittics.com/?dl_id=85
echo executando o sistema
qemu-system-x86_64 -m 2048 -cdrom Win10_2004_x64.iso -hda hd.img -netdev user,id=n0 -device rtl8139,netdev=n0 -vnc 127.0.0.1:2
