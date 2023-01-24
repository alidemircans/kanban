if [ "$1" == "dev publish android ios" ]
then
  cd android && fastlane internal flavor:dev
  cd .. && cd ios && fastlane internal flavor:dev
elif [ "$1" == 'prod publish android ios' ]
then
  cd android && fastlane internal flavor:prod
  cd .. && ios && fastlane internal flavor:prod
elif [ "$1" == 'prod publish android' ]
then
  cd android && fastlane internal flavor:prod
elif [ "$1" == 'dev publish android' ]
then
  cd android && fastlane internal flavor:dev
elif [ "$1" == 'prod publish ios' ]
then
  cd ios && fastlane internal flavor:prod
elif [ "$1" == 'prod publish android' ]
then
  cd ios && fastlane internal flavor:prod
elif [ "$1" == 'dev publish ios' ]
then
  cd ios && fastlane internal flavor:dev
elif [ "$1" == 'dev publish ios patch'  ]
then
  cd ios && fastlane internal flavor:dev version:patch
elif [ "$1" == 'prod publish ios patch' ]
then
  cd ios && fastlane internal flavor:prod version:patch
elif [ "$1" == 'dev publish android patch' ]
then
  cd android && fastlane internal flavor:dev version:patch
elif [ "$1" == 'prod publish android patch' ]
then
  cd android && fastlane internal flavor:prod version:patch
fi


