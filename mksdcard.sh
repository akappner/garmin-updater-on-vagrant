touch /tmp/trash.bin
truncate --size $((2**32)) /tmp/trash.bin
parted -s /tmp/trash.bin mklabel msdos mkpart primary fat32 1MiB 3500MiB
mkfs.vfat -n NAVDB -v --offset 2048 /tmp/trash.bin
chmod 777 /tmp/trash.bin

touch /tmp/trash2.bin
truncate --size $((2**32)) /tmp/trash2.bin
parted -s /tmp/trash2.bin mklabel msdos mkpart primary fat32 1MiB 3500MiB
mkfs.vfat -n SUPP -v --offset 2048 /tmp/trash2.bin
chmod 777 /tmp/trash2.bin
