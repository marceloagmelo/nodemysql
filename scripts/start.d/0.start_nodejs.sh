#!/bin/bash


function nodejscollector_find(){

   regex_appName='^[A-Za-z0-9]*$'
   string="$NODEJSCOLLECTOR"
   if [[ $string =~ $regex_appName ]]
   then
       echo "Internal nodejscollector"
       return 1 
   else
       echo "External nodejscollector"
       return 0
   fi

}



echo "========================================="
echo "Starting application"
echo "========================================="
env | sort

if [ -n $NODE_PATH ]
then
  APP_HOME="$APP_HOME/$NODE_PATH"
fi

  pushd $APP_HOME

if [ ! -d "node_modules" ]
then
  if [ -n "$NPM_REGISTRY" ]
  then
     npm config set strict-ssl false
     npm config set registry $NPM_REGISTRY
  fi
  if [ -n "$NPM_LOGLEVEL" ]
  then
     npm config set loglevel $NPM_LOGLEVEL
  fi

  npm i
fi
    
echo "NodejsCollector not defined. Will not send metrics to APM."
exec npm start

popd
