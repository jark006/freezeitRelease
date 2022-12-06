# Freezeit 冻它

**[面具模块]** 模拟墓碑后台机制，自动暂停第三方应用后台运行。

**[MagiskModule]** Emulate the Tombstone mechanism to automatically suspend third-party apps running in the background. 

---

[教程 Tutorials](https://jark006.github.io/FreezeitIntroduction/)

[酷安 @JARK006](https://www.coolapk.com/u/1212220) 

[QQ群组 781222669](https://jq.qq.com/?_wv=1027&k=Q5aVUglt)
[Telegram Group 群组](https://t.me/+sjDX1oTk31ZmYjY1) [Channel 频道](https://t.me/freezeitRelease)
[蓝奏云](https://jark006.lanzout.com/b017oz9if) 密码: dy6i

---

### v2.3.6 更新日志 2022-12-06
- 尝试修复 Android 10-11 死机重启。
- 更换冻它APP包名。

### v2.3.4 更新日志 2022-12-04
- 尝试修复前台状态识别。
- 移除 [/dev/cg2_bpf] 路径的FreezerV2。

### v2.3.2 更新日志 2022-12-03
- 优化进Doze逻辑。
- 调整绑定核心顺序。

### v2.3.1 更新日志 2022-12-02
- 更新前/后台策略(详情请看教程)。
- 去除播放中不冻结，采用兼容性更强的宽松后台。
- 去除音频识别功能。
- 定时解冻最小时间改到3分钟。

### v2.2.18Fix 更新日志 2022-11-28
- 移除挂载FreezerV2。

### v2.2.18 更新日志 2022-11-24
- 修复定时器(Alarm)拦截不全。
- 微调进程wchan状态读取。
- 内置名单新增部分三星OneUI系统辅助应用。
- 尝试修复运行时间久可能导致网络异常的问题(影响范围：v2.2.15-v2.2.17)。
- 开机压制的时刻由30秒改到开机1分钟时再压制(主要用于压制自启，禁止自启功能待考虑)。
- 优化挂载FreezerV2逻辑。

### v2.2.17 更新日志 2022-11-22
- 完善唤醒锁(WakeupLock)拦截：设为冻结的应用禁止获得唤醒锁，设为播放中不冻结的应用在冻结时，其唤醒锁权限将设为可忽略。
- 完善定时器(Alarm)拦截：设为冻结的应用禁止设置定时器。
- 为以上两个机制兼容旧版安卓太繁琐，故最低支持安卓版本提升到安卓10/Q (SDK29+)。

### v2.2.16 更新日志 2022-11-20
- 尝试修复过度拦截前台应用的广播(该BUG导致面具卡启动、QQ不能切换主题、爱玩机不能获取电池信息等等)。

### v2.2.15 更新日志 2022-10-24
- 设为冻结的应用在前台时不再屏蔽广播。

### v2.2.14 更新日志 2022-10-20
- 修复部分设备设置保存失败。

### v2.2.13 更新日志 2022-10-18
- 修复"播放中不冻结"应用在冻结状态无法响应广播导致各种卡住(卡通话/安装等等)。
- 调整定时解冻功能，若设为最小值10分, 则为关闭定时解冻。
- 调整部分功能词语描述。

### v2.2.12 更新日志 2022-10-13
- 完善息屏深度Doze(息屏超时3分钟, 白名单的第三方列表为冻它的自由后台、内置自由应用)。
- 新增息屏冻结(息屏超时3分钟将冻结前台, 自由后台除外)。
- 部分功能换成NDK原生API, 优化功耗。

### v2.2.11 更新日志 2022-10-02
- 修复一处可能导致FreezerV1泄漏的地方。
- 修复FreezerV2识别错误。
- 新增检查进程wchan状态, 可检查进程已否已经冻结。

### v2.2.10 更新日志 2022-10-01
- 微调UI, 新增图示说明。
- 新增应用CPU使用时间。
- 优化底层代码效率，新增更多工作异常输出日志。
- 删除开机超时自闭机制, 请常备救砖模块防止模块冲突。
- 调整唤醒锁：黑名单应用无法获得唤醒锁，动态应用冻结时忽略其唤醒锁功能。
- 尝试解决socket:accept()异常(待验证)。

### v2.2.8.Dev 更新日志 2022-09-20
- 调整FreezerV1机制。
- 处理冻结应用唤醒锁。
- 新增[定时唤醒]，定时可调，唤醒时长为[超时冻结]的参数。
- [定时压制]改为30分钟一次，不可更改，[定时唤醒]已承担部分[定时压制]功能。
- 已安装的全部输入法强制列入内置白名单。
- 冻结QQ/TIM时，可选择是否杀死MSF进程。

### v2.2.5.Dev 更新日志 2022-09-13
- 设置页新增电流校正，修复电流单位，电池功率。
- 尝试挂载FreezerV2(frozen)。
- 细节调整。

### v2.2.4.Dev 更新日志 2022-09-10
- 新增Freezer模式(可挂载v1，原生v2需系统支持)。
- 新增开机超时禁用自身功能，开机超过5分钟未进入桌面则禁用自身，并退出。
- 新增冻结模式反转按钮，一键反转Freezer和kill模式。操作不再立即生效，需点击右下角保存。
- 移除lmk设置参数。
- 移除底层调整oom功能。
- APP电流显示微调。
- 开机后30秒时会执行一次定时压制。
- 根据反馈日志改进了很多，但很多反馈BUG在我本机(红米K50Pro, MIUI13.0.23稳定版)难以复现，所以BUG修复情况未知。
