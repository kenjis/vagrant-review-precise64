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
