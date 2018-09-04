# 工程简介
视频APP的编写以及与播放器相关的评论，输入框等各方面的整合，以后还会增加弹幕，滤镜等效果

## VideoPlayer
VideoPlayer文件夹存放的是视频播放器，是一个标准的MVC，其中
  - LCVideoViewController是Controller，以后在使用的创建播放器就是使用这个类
  - LCVideoView是存放AVPlayer的View层，完全可以不用修改
  - LCVideoControlView是播放器的控制层，可以添加返回按钮，控制条，全屏按钮，title，分享等，同时，这些操作大部分可以放在LCVideoViewController里做操作。
