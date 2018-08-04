#!/bin/sh
echo "=>Start hugo"

#set TZ
cp /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone

if [ ! -f /${SITE_NAME}/content ]; then
  echo "=>Generate hugo site"
  hugo new site ${SITE_NAME}_tmp
  cp -vfr /${SITE_NAME}_tmp/* /${SITE_NAME}
  rm -rf /${SITE_NAME}_tmp
  echo "=>Successfully created new site"
fi
  cd /${SITE_NAME}

hugo -v
