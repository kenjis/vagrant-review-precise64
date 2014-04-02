#!/bin/sh

# Shell Script to install Re:VIEW
#
# Copyright 2014, Kenji Suzuki <https://github.com/kenjis>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

apt-get update

echo "[installing add-apt-repository]"
apt-get -y install python-software-properties

echo "[installing Git, Zip]"
apt-get -y install git zip

echo "[installing Ruby 1.9.3, rake]"
apt-get -y install ruby1.9.3
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.3 500 \
  --slave /usr/bin/ri ri /usr/bin/ri1.9.3 \
  --slave /usr/bin/irb irb /usr/bin/irb1.9.3 \
  --slave /usr/bin/erb erb /usr/bin/erb1.9.3 \
  --slave /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.3
ln -sf /usr/bin/gem1.9.3 /etc/alternatives/gem
ln -sf /usr/share/man/man1/gem1.9.3.1.gz /usr/bin/gem.1.gz
apt-get -y install rake

echo "[installing TexLive]"
add-apt-repository ppa:texlive-backports
apt-get update && apt-get -y install texlive-lang-cjk
apt-get -y install texlive-fonts-recommended

if [ ! -e /home/vagrant/review ]; then
  echo "[installing Re:VIEW]"
  git clone git://github.com/kmuto/review.git
  sed -i -e '/\/review\/bin:/d' /home/vagrant/.profile
  echo 'PATH="$HOME/review/bin:$PATH"' >>/home/vagrant/.profile
fi

if [ ! -e /home/vagrant/review-project ]; then
  echo "[creating symlink]"
  ln -s /mnt/review-project review-project
fi
