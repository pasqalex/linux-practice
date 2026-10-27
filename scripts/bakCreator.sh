#!/bin/bash

LOG_DIR="<your path>"
SRC_DIR="<your path>"

exec >> "$LOG_DIR/backup.log" 2>&1

DATE="$(date +%d-%m-%Y\ %H:%M:%S)"

back() {
  local count=0

while [ $count -lt 5 ]
do
  if tar -czf "$LOG_DIR/backup-$(date +%F).tar.gz" -C "$SRC_DIR" .
  then
	  echo "Backup успешно создан! $DATE "
	  echo "----------------------------------------"
	  return 0
  else
	  count=$((count + 1))
	  echo "Не удалось создать backup! Попробую ещё несколько раз..." 
  fi
done

echo "[$DATE] Не удалось создать backup за пять попыток"
return 1
}

back
