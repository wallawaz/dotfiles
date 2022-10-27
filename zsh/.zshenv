export EDITOR=vim

x86_ON=0
if [ $(arch) = "i386" ]; then
  x86_ON=1
fi

export x86_ON=$x86_ON

# psycopg-2 issue
if [ "$x86_ON" -eq 1 ]; then
  echo 'x86';
  export PATH="/usr/local/sbin:$PATH";

  # 20220131 - psycopg2==2.9.3
  export LDFLAGS="-L/usr/local/opt/openssl/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl/include"
else
  echo 'arm';
  export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/libffi/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/libffi/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
fi
