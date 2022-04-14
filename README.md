# Typecho-Plugin-SrsPlayer

SRS Player是一个音视频播放器插件，可以支持直播协议HLS/HTTP-FLV/WebRTC等，还可以播放点播的MP4和HLS地址。

## Usage

首先，你得有一个直播流或者点播文件。很简单的，可以一键操作，建议用[SRS云服务器](https://ossrs.net/lts/blog/2022/04/09/SRS-Cloud-Tutorial)
一键创建自己的直播服务器，并开始推流，这样就有了自己的直播流了。

然后，需要在Typecho中安装SrsPlayer插件，请参考下面的[安装](#install)步骤，并在后台`控制台 > 插件`启用SrsPlayer插件。

最后，新建一个博客文件，在文章中插入简码：

* HLS流: `[srs_player url="https://your_droplet_ip/live/livestream.m3u8"]`
* WebRTC流: `[srs_player url="webrtc://your_droplet_ip/live/livestream"]`
* HTTP-FLV流: `[srs_player url="https://your_droplet_ip/live/livestream.flv"]`

若有问题请加SRS的微信群[SRS](https://github.com/ossrs/srs)。

## Install

由于Typecho不支持上传压缩包，也没有插件市场，所以安装插件会麻烦些。

**命令行**：若你喜欢命令行方式，可以登录服务器后，一键执行下面的命令安装：

```bash
cd typecho/usr/plugins
curl -L -O https://gitee.com/ossrs/Typecho-Plugin-SrsPlayer/repository/archive/main.zip
unzip -q main.zip
rm -rf SrsPlayer
mv Typecho-Plugin-SrsPlayer-main/SrsPlayer .
rm -rf Typecho-Plugin-SrsPlayer-main main.zip
```

**手动下载**: 

手动从[GitHub](https://github.com/ossrs/Typecho-Plugin-SrsPlayer/releases/latest/download/SrsPlayer.zip)，
或者从[Gitee](https://gitee.com/ossrs/Typecho-Plugin-SrsPlayer/tags)，选择需要下载的附件。

解压后，将`SrsPlayer`文件夹，上传到Typecho的`typecho/usr/plugins`目录。

Winlin 2022

