if [ "$1" == "dev" ]
then
  if [ "$2" == "apk" ]
  then
      flutter build apk -t lib/main_dev.dart  --flavor dev --build-name="$3" --build-number="$4"
      open build/app/outputs/flutter-apk
  elif [ "$2" == "bundle" ]
      then
      flutter build appbundle -t lib/main_dev.dart  --flavor dev --build-name="$3" --build-number="$4"
      open build/app/outputs/bundle/devRelease
  fi
fi
if [ "$1" == "prod" ]
then
  if [ "$2" == "apk" ]
  then
      flutter build apk -t lib/main_dev.dart  --flavor prod --build-name="$3" --build-number="$4"
       open build/app/outputs/flutter-apk
  elif [ "$2" == "bundle" ]
      then
      flutter build appbundle -t lib/main_dev.dart  --flavor prod --build-name="$3" --build-number="$4"
      open build/app/outputs/bundle/prodRelease
  fi
fi
