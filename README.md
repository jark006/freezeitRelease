# freezeit 冻它

自动冻结那些较为耗电且非必须运行的后台应用。 

Automatically freeze background apps that are power-hungry and not necessarily running.


- 基本说明 Ver1.4：
  - 1.白名单模式强制开放主流第三方输入法(非全部)、[ 微信(推送)/
      QQ/TIM/钉钉 ]，所以上述应用都不用手动配白名单。
  - 2.微信已单独保留推送进程而暂停其余进程，所以微信消息比较多
      的用户只有推送进程在工作，其余进程休眠，比较省电。
  - 3.开机日志会列出本机支持的全部 [开放后台/服务/自定义白名单]。
  - 4.支持普通前台，小窗，分屏。而多窗口(未测)，多屏(未测)。
  - 5.请不要与其他功能类似的模块一同使用，避免冲突。
  - 6.仅支持第三方应用冻结解冻，杀后台行为由系统或其他模块管理。
  - 7.默认刷入可直接适合大部分人使用，特定人群请自定义白名单。
  - 8.C++开发，原生运行于系统底层，相较于其他JAVA层，Shell层
      的类似功能，效率更高，省电效果不是一般大。

- 已知问题：
  - 1.垃圾模块，一定有大把BUG，快去[ 酷安@JARK006 ]骂他。
  - 2.正在播放音视频的应用切后台冻结后，再解冻有概率停止播放。
  - 3.息屏时刻在前台的应用，息屏后也一直属于前台，不会冻结，其实
      拿来放后台音乐挺好的。
  - 4.后台应用无响应问题，请暂时使用 NoANR，因为[ 冻它APP ]正
      在开发, NoANR2.3.apk 已包含在本模块包里，有需要请手动安装
      并到 LSPosed 里开启它，然后重启。
  - 5.不支持亮屏的后台音乐，但支持播放中直接息屏，播放不受影响，
      悬浮应用暂不支持，正在攻关。请加入白名单，或悬挂小窗。

- 2022-06-20 Ver1.4更新内容：
  - 1.全面切换到白名单模式，该开发分支的效果灰常好，已并入主分支，
      已取消后续黑名单模式的开发(之前的黑/白名单热切换机制白费了)。
  - 2.新增强制白名单内容 (均为第三方应用)：
      a.推送服务：微信，除推送进程外，其余均可暂停后台，消息接收正常。
      b.应用：企微/QQ/TIM/钉钉 暂不支持单独保留推送消息进程，只能
        整个进入强制白名单。
      c.输入法：[ 百度/搜狗/讯飞/QQ拼音/KK键盘/章鱼/见萌/流行/
        不折叠/东噶藏文/奥云蒙古文/谷歌Gboard/微软swiftkey ]
      c.其他 [ 李跳跳 ]
  - 3.后台任务冻结由[立即执行]改为[超时10秒]，修复打开应用时被系统
      授权弹窗干扰而卡死的BUG.
  - 4.本次依旧限时公测，将于[ 2022-07-16 00:00:00 ]过期，因为短
      时间内无法及时发现所有BUG, 运行越久越容易触发未知BUG,不想留
      给后来人承受这些恶果，模块会在到期前发布新版，敬请留意，适配
      了Magisk的模块更新机制，能连上GitHub就可以在里面更新，顺道
      关注我的动态呗。

- 普通计划(一定会做，但不知道什么时候做和做完🕊️)：
  - 1.配套APP已经在做了，别催。
  - 2.计划新增应用杀不死功能，建议别关ZRAM。
  - 3.将增加息屏亮屏检测，息屏期间逐步放缓系统状态轮询，但后期
      可能直接丢弃，进而转 surfaceflinger。
  - 4.将对 surfaceflinger 进程拦截注入，放弃轮询，进而Hook上
      系统显示/触控相关事件，实现亮屏期间优先响应触控事件的相关
      进程，非触控期间放缓CPU到甜点频率。以上这些工作，特别感谢
      [yc9559] 大佬的现有成果 [Uperf]，但本模块将会与之冲突，
      一山不容二虎，对不住了🐷，别打我😭。
  - 5.未来将在安装时进行兼容性检查，禁用可能冲突的模块。用户可决定
      是否手动再次开启，本模块不再干预，但发生冲突将不会对此负责。
      
- 画大饼🤩，得掉头发🥵(一边NDK/C++,一边Framework/JAVA，人没了)：
  - 1.计划研究Framework，ActivityManager等底层，重塑Activity生命
      周期，主要是[OnPause/OnResume]等底层机制。 Android提供的
      [重回应用]机制是给你更新过时页面信息的，不是拿来再次显示广告的。
  - 2.最后提一嘴，Android的硬件真心不差，只是某些系统机制和ART运
      行时真心喜欢不来，如果以上大饼完成。。。。


