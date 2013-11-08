bash 'install_lastpass' do
  code <<-CODE
    mkdir -p /tmp/lpinstall
    cd /tmp/lpinstall

    if [ -d ~/.mozilla/firefox ]
    then
      rm -f lp_linux.xpi
      wget https://lastpass.com/lp_linux.xpi
      if [ $? != 0 ]
      then
        echo "Failed to download Firefox extension!"
        exit
      fi

      if [ -f ~/.mozilla/firefox/profiles.ini ]
      then
        for i in `egrep "^Path=.*" ~/.mozilla/firefox/profiles.ini | cut -c 6-`
        do
          i=~/.mozilla/firefox/$i
          if [ -d $i ]
          then
            mkdir -p "$i/extensions/support@lastpass.com"
            unzip -o "lp_linux.xpi" -d "$i/extensions/support@lastpass.com"
          fi
        done
      fi
    fi

    rm -f lpchrome_linux.crx
    wget https://lastpass.com/lpchrome_linux.crx
    if [ $? != 0 ]
    then
      echo "Failed to download Chrome extension!"
      exit
    fi

    if [ -d ~/.config/google-chrome -o -d ~/.config/chromium ]
    then
      mkdir -p ~/.lastpass
      #sudo mkdir -p /opt/google/chrome/
      #CRX=/opt/google/chrome/lpchrome.crx
      #sudo cp lpchrome_linux.crx $CRX
      #VERSION=`unzip -c $CRX manifest.json 2>/dev/null | egrep "\"version\"" | egrep -o [0-9.]+`
      #echo "{ \"external_crx\": \"$CRX\", \"external_version\": \"$VERSION\" }" > hdokiejnpimakedhajhdlcegeplioahd.json
      #sudo mkdir -p /opt/google/chrome/extensions/
      #sudo chmod a+rx /opt/google/chrome/extensions/
      #sudo cp -f hdokiejnpimakedhajhdlcegeplioahd.json /opt/google/chrome/extensions/
      #sudo chmod a+r /opt/google/chrome/extensions/hdokiejnpimakedhajhdlcegeplioahd.json
      #sudo mkdir -p /usr/share/chromium/extensions/
      #sudo chmod a+rx /usr/share/chromium/extensions/
      #sudo mv -f hdokiejnpimakedhajhdlcegeplioahd.json /usr/share/chromium/extensions/
      #sudo chmod a+r /usr/share/chromium/extensions/hdokiejnpimakedhajhdlcegeplioahd.json

      echo "{ \"ExtensionInstallSources\": [\"https://lastpass.com/*\", \"https://*.lastpass.com/*\", \"https://*.cloudfront.net/lastpass/*\"] }" > lastpass_policy.json
      sudo mkdir -p /etc/opt/chrome/policies/managed/
      sudo chmod a+rx /etc/opt/chrome/policies/managed/
      sudo cp -f lastpass_policy.json /etc/opt/chrome/policies/managed/
      sudo mkdir -p /etc/chromium/policies/managed/
      sudo chmod a+rx /etc/chromium/policies/managed/
      sudo mv -f lastpass_policy.json /etc/chromium/policies/managed/
    fi

    mkdir -p chrome
    unzip -o "lpchrome_linux.crx" -d "chrome" 2>/dev/null
    if [ -d /usr/lib64/opera/plugins/ ]
    then
      sudo cp -f chrome/libnplastpass64.so /usr/lib64/opera/plugins/
    fi
    if [ -d /usr/lib64/opera-next/plugins/ ]
    then
      sudo cp -f chrome/libnplastpass64.so /usr/lib64/opera-next/plugins/
    fi
    if [ -d /usr/lib64/operanext/plugins/ ]
    then
      sudo cp -f chrome/libnplastpass64.so /usr/lib64/operanext/plugins/
    fi
    if [ -d /usr/lib64/ ]
    then
      sudo mkdir -p /usr/lib64/mozilla/plugins/
      sudo cp -f chrome/libnplastpass64.so /usr/lib64/mozilla/plugins/
    fi
    if [ `uname -m` == "x86_64" ]
    then
      NPLASTPASS=libnplastpass64.so
    else
      NPLASTPASS=libnplastpass.so
    fi
    if [ -d /usr/lib/opera/plugins/ ]
    then
      sudo cp -f chrome/$NPLASTPASS /usr/lib/opera/plugins/
    fi
    if [ -d /usr/lib/opera-next/plugins/ ]
    then
      sudo cp -f chrome/$NPLASTPASS /usr/lib/opera-next/plugins/
    fi
    if [ -d /usr/lib/operanext/plugins/ ]
    then
      sudo cp -f chrome/$NPLASTPASS /usr/lib/operanext/plugins/
    fi
    if [ -d /usr/lib/ ]
    then
      sudo mkdir -p /usr/lib/mozilla/plugins/
      sudo cp -f chrome/$NPLASTPASS /usr/lib/mozilla/plugins/
    fi
    touch ~/.lastpass/.chef_installed
  CODE
  group 'root'
  user 'root'
  not_if 'test -e ~/.lastpass/.chef_installed'
end
