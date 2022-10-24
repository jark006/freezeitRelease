# freezeit 冻它

自动冻结那些较为耗电且非必须运行的第三方后台应用，由C++开发并原生运行，效率，省电。

Automatically freeze those third-party background applications that consume more power and do not have to run. It is developed by C++ and runs natively, which is efficient and power-saving.


- 更新内容 2022-10-24 2.2.14 -> v2.2.15
  - 1.设为冻结的应用在前台时不再屏蔽广播。

- 基本说明( 使用前必读 ): 
  - 1.模块有内置白名单(后台自由, 不冻结), 不可更改, 其他应用可配置五种模式：
      A.超时则杀死  (该应用进入后台超时就直接杀死, 设置里调整可超时参数)
      B.Kill-19冻结 (使用 SIGSTOP(19),SIGCONT(18) 信号进行冻结和解冻)
      C.Freezer冻结 (FreezerV2或V1由设备决定, 具体看日志, V1已解决内存泄漏, 但不是即时生效, 不用刻意关注内存)
      D.播放中不冻结 (停止播放则优先Freezer冻结, 部分设备不能识别蓝牙播放状态)
      E.后台自由 (不会冻结该应用, 可在后台自由运行) 
      注：建议优先使用Freezer, 其次Kill-19(压制效果好, 但更加容易导致应用异常, 闪弹, 重载等等)。
  - 2.前台应用只支持顶层窗口显示的应用, 包括普通前台, 分屏, MIUI小窗, 多屏, virtualDisplay，不包括前台服务的应用。
  - 3.悬浮窗暂时不能识别为前台应用, 依旧会冻结(例如Scene的悬浮监视器)。如果是画中画视频悬浮窗, 建议设为自由后台或播放不冻结。
  - 4.请不要与其他功能类似的[ 墓碑模块 / 墓碑模式 / 黑域 / 各类乖巧模式 ]一同使用, 避免冲突, 暂时与系统自带[ 暂停执行已缓存的应用 ]无冲突。
  - 5.模块开发测试机型为红米K50Pro(matisee/MIUI13.0.23)、一加6(enchilada/PixelExperientPlus/Android12)。测试平台有限, 望谅解。
  - 6.底层进程与App通信采用TCP_SOCKET(本地环回[127.0.0.1:60613], 模块为Server, APP为Client), 因此通信范围仅限本机内部, 没有隐私泄漏风险。APP端开源, 但底层C++代码闭源。
  - 7.仅支持第三方应用冻结解冻, 模块不会接管系统应用, 部分系统辅助类应用以第三方应用形式存在(可卸载), 被冻结后会导致系统异常, 请手动设为自由后台, 并及时给作者反馈。
  - 8.模块所需文件大多创建于模块目录内。以下两个特殊例外：
      A.模块发生异常时, 异常日志会追加到:[ /sdcard/Android/freezeit_crash_log.txt ] 若发现存在异常内容, 请向作者反馈。若运行一切正常, 将不会产生异常。
      B.模块会创建一个配置文件供Xposed部分使用, 位于[ /data/system/freezeit.conf ] 普通用户不用理会这个。
      注: 以上两个文件在卸载冻它Magisk模块时, 会在重启阶段自动清除。
