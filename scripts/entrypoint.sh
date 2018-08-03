#!/bin/sh
echo "=>Start hugo"

#set TZ
cp /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone
(
if [ ! -f /${SITE_NAME}/content ]; then
  echo "=>Generate hugo site"
  hugo new site ${SITE_NAME}_tmp
  cp -vfr /${SITE_NAME}_tmp/* /${SITE_NAME}
  rm -rf /${SITE_NAME}_tmp
  echo "=>Successfully created new site"
fi
  cd /${SITE_NAME}

hugo && hugo server --watch=true
)&
(
if [ ! -f /blog.${SITE_NAME}/content ]; then
  cd ../
  echo "=>Generate hugo site"
  hugo new site blog.${SITE_NAME}_tmp
  cp -vfr /blog.${SITE_NAME}_tmp/* /blog.${SITE_NAME}
  rm -rfr /blog.${SITE_NAME}_tmp
  echo "=>Successfully created blog"
fi
  cd /blog.${SITE_NAME}
hugo && hugo server --watch=true
)&