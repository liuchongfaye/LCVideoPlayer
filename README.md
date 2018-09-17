# 工程简介
视频APP的编写以及与播放器相关的评论，输入框等各方面的整合，以后还会增加弹幕，滤镜等效果

## 播放器
VideoPlayer文件夹存放的是视频播放器，是一个标准的MVC，其中
  - LCVideoViewController是Controller，以后在使用的创建播放器就是使用这个类
  - LCVideoView是存放AVPlayer的View层，完全可以不用修改
  - LCVideoControlView是播放器的控制层，可以添加返回按钮，控制条，全屏按钮，title，分享等，同时，这些操作大部分可以放在LCVideoViewController里做操作。
  
### 评论
Github：https://github.com/liuchongfaye/CellAutomaticHeight
Blog:https://www.jianshu.com/p/5f5c550d61a0

#### 效果图
![效果图](https://upload-images.jianshu.io/upload_images/10887362-d273940a446161dc.png?imageMogr2/auto-orient/)
