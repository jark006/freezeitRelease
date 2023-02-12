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

### v2.5.0 更新日志 2023-02-13
- 新增系统应用冻结。
- 修复2.4.7 APP闪退。
- 优化APP体积。

### v2.4.7 更新日志 2023-02-08
- 修复内存数值异常。
- 修复超大分辨率(8K)下CPU曲线图绘制错误。

### v2.4.6 更新日志 2023-02-01
- 微调APP界面。
- 完善Binder冻结机制(内核5.4+)。

### v2.4.3 更新日志 2023-01-17
- APP[设置页]的跳转链接拆分到[关于页]。
- APP[配置列表]调整为优先按配置排列，其次按宽松严格排列。
- XPosed调整ANR处理(应该可以大幅度减少ANR杀进程)。
- XPosed调整广播处理，避免与红魔自带墓碑的广播处理机制冲突。
- 调整内置自由名单。
- Doze期间不再记录电池变化。
- 修复小概率日志出现[数据格式异常]。
- 修复[杀死后台]日志显示为[冻结]的问题。

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
