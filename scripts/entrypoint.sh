#!/bin/sh
echo "=>Start hugo"

#set TZ
cp /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone
hugo version
hugo new site ${SITE_NAME}1
mv /${SITE_NAME}1/* /${SITE_NAME}
rm -rf /${SITE_NAME}1
cd /${SITE_NAME}
ls -la

hugo server -D --bind=0.0.0.0
