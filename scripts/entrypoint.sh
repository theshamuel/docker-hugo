#!/bin/sh
echo "=>Start hugo"

#set TZ
cp /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone
hugo version
hugo new site ${SITE_NAME}_tmp
mv /${SITE_NAME}_tmp/* /${SITE_NAME}
rm -rf /${SITE_NAME}_tmp
cd /${SITE_NAME}

hugo
