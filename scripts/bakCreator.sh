#!/bin/bash
exec >>/home/pasqalex/archive-log/log.log 2>&1

DATE="$(date +%d-%m-%Y\ %H:%M:%S)"

back() {
local count=0

while [ $count -lt 5 ]
do
if tar -czf /home/pasqalex/archive-log/backup-$(date +%F).tar.gz -C /home/pasqalex side-scripts-logs
then
	
	echo "Backup успешно создан! $DATE "
	echo "----------------------------------------"
	return 0
else
	count=$((count + 1))
	echo "Не удалось создать backup! Попробую ещё несколько раз..." 
fi
done

echo "Не удалось создать backup за пять попыток"
return 1
}

back
