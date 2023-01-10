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

### v2.4.1 更新日志 2023-01-10
- 重构底层。
- 调整APP UI。
- 支持X64平台。
- 支持KernelSU。
- 完善冻它APP英文UI。
- 修复2.4.0不保存配置问题。
- 修复息屏播放会进入Doze。
- 修复部分应用前台状态识别异常。
- 修复部分CPU温度读取异常。
- 修复唤醒锁设置失败。
- 宽松应用冻结时[忽略唤醒锁]改为[禁止申请唤醒锁]。
- 休眠期间检查唤醒率，若异常活跃将重试Doze。
- 调整MIUI内存压力相关参数，缓解杀后台 (源自酷安 @moonheart)。

### v2.3.9 更新日志 2022-12-17
- 修复少数机型电池功率数值为零的BUG。
- 修复Android13系统框架部分功能Hook失效。
- 修复Android13激进识别功能。
- 杀死MSF进程功能改为QQ/TIM冻结时断网。
- 优化MIUI13/14[电量与性能]杀后台功能的禁用。
- 优化Xposed代码结构。

### v2.3.8 更新日志 2022-12-10
- 优化配置列表滑动性能、应用搜索速度。
- 优化进入Doze判断条件，屏幕状态读取转为冻它Xposed进行辅助。
- CPU图表优化，针对4+4、4+3+1、3+2+2+1架构使用不同颜色曲线。
- 针对三星OneUI:新增多数系统插件类应用为内置自由。
- 底层变更：更新配置信息到xposed进程的方式由文件 /data/system/freezeit.conf 转为 Socket传输，减少一个额外文件。

### v2.3.7Alpha 更新日志 2022-12-08
- 尝试修复宽松后台被冻结(音乐播放等)。
- 尝试修复进入Doze。

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
