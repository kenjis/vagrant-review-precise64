# VagrantによるRe:VIEW実行環境（Ubuntu 12.04, 64bit）

[English](README.md)

「Re:VIEW」は簡単に使える、書籍および電子書籍のためのデジタル出版システムです。

このリポジトリは、Re:VIEWをすぐに使える仮想マシンを提供します。

## 必要なソフトウェア

* VirtualBox ... フリーな仮想化ソフトウェア [ダウンロード](https://www.virtualbox.org/wiki/Downloads)
* Vagrant 1.3+ ... VirtualBoxのイメージを操作するツール [ダウンロード](http://downloads.vagrantup.com/)

### テストされた環境

* Ubuntu 12.04 ... VirtualBox 4.2.18 & Vagrant 1.5.0
* Mac OS X 10.8.5 ... VirtualBox 4.3.6 & Vagrant 1.4.3

## 仮想マシンに含まれるもの

* Tex Live
* Re:VIEW ... GitHubの最新開発版（~/review/にインストールされる）

## セットアップ方法とディレクトリ構成

review-projectフォルダを作成し、そこにRe:VIEWファイルを配置するものとします。

	$ mkdir review-project
	$ cd review-project

review-projectフォルダの中にこのリポジトリをvagrantとしてcloneします。

	$ git clone git@github.com:kenjis/vagrant-review-precise64 vagrant

あるいは、[Zipファイル](https://github.com/kenjis/vagrant-review-precise64/archive/master.zip)をダウンロードして解凍し、vagrantフォルダとして配置してください。

ディレクトリ構成は以下のようになります。

	review-project/
	review-project/vagrant

## 使い方

### 1. ホストOSで

	$ cd review-project/vagrant
	$ vagrant up    # 仮想マシンを起動する

なお、初回の`vagrant up`は、仮想マシンのイメージファイルをダウンロードし、仮想マシンを起動し、必要なソフトウェアをダウンロードしインストールするため、非常に時間（数時間？）がかかります。

	$ vagrant ssh   # 仮想マシンにSSH接続する

### 2. 仮想マシンで

	$ cd ~/review-project
	$ review-pdfmaker sample.yaml   # reviewコマンドを実行する
	$ review-epubmaker sample.yaml  # reviewコマンドを実行する

## Vagrantの使い方

よく使うコマンド

* `vagrant up` ... 仮想マシンを起動しプロビジョンします
* `vagrant suspend` ... 仮想マシンの状態を保存して停止します
* `vagrant halt` ... 仮想マシンを停止 (シャットダウン) します
* `vagrant ssh` ... 仮想マシンへのSSHアクセスを提供します

もっと知りたい場合は、http://docs.vagrantup.com/v2/ を参照してください。

## 関連URL

* Re:VIEW公式リポジトリ https://github.com/kmuto/review
* Re:VIEW Wiki https://github.com/kmuto/review/wiki
* Re:VIEWの書籍サンプルデータ https://github.com/takahashim/review-sample-book
* Re:VIEW Tips http://qiita.com/tags/review/items
