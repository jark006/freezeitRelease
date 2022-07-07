# freezeit 冻它

自动冻结那些较为耗电且非必须运行的第三方后台应用，由C++开发并原生运行，效率，省电。

Automatically freeze those third-party background applications that consume more power and do not have to run. It is developed by C++ and runs natively, which is efficient and power-saving.


- 更新内容 2022-07-07 Ver1.6.4 -> Ver2.0
  - 1.进一步优化自身功耗, 基于作者自测结果：相比使用Freezer机制的模块，压制能力更强, 相比使用kill/18/19/20机制、基于Xposed模块、Shell层实现的模块，效率更高，更加省电，可大大提升手机续航。
  - 2.完善APP通讯接口, 完整整合全新APP, [APP已开源]( https://github.com/jark006/freezeitapp )。
  - 3.不再开放手动配置白名单及查看日志文件, 所有操作只支持在APP中进行。
  - 4.针对部分毒瘤诈尸行为进行反制, 反制措施延迟最长不超过2分钟，仅限用户打开过，且没有被杀的应用。
  - 5.加入模块自校验机制, 防止模块被篡改, 反制措施不会立即触发, 而且是对手机使用毫无影响的小小逻辑炸弹。
  - 6.后台音乐/视频享有临时后台权限(支持视频播放悬浮窗了), 播放停止则撤消权限, 约10秒~1分钟后冻结。
      只开放各大主流音视频/听书应用, 并非播放后台音频就放行, 未来也只会调整放行名单, 不会放行全部, 若是刚需的小体量应用, 请加入白名单。

- Ver2.0 仍存在的问题: 
  - 1.接听电话正常(暂无反馈异常)，但有低概率拨号卡住, 安装了 NoANR 出现概率更低, 一般清后台可临时解决。
  - 2.后台应用无响应、拨号拨出卡住问题, 请安装NoANR, 并在[ Lsposed ]里面启用勾选系统框架, 然后重启。
  - 3.点击已冻结应用的推送消息的可能无法直接拉起, 但MIUI支持部分应用直接拉起。
  - 4.暂不支持 HMS推送拉起、微信代收拉起, 有需要请加白名单。

- 问题排除:
 - 1.部分MIUI13/MTK机型(红米K50Pro MIUI13.0.18), 当[抖音/快手]在后台时，有概率导致[ logd ]异常工作, 疯狂输出 "C2MtkBufferManager: over 5000ms not request from VCodec but callback hooked, slow BM Cc fetch thread", 严重耗电, 已排除冻它原因，正在定位是谁的锅：抖音/快手/MIUI/MTK解码(mediacodec: android.hardware.media.c2@1.2-mediatek-64b)。若logd异常，请自寻模块禁用logd, 或者杀[抖音/快手]后台。其他视频应用例如[B站]暂未发现以上问题。
  
- 基本说明( 使用前必读 ): 
  - 1.垃圾模块, 一定有大把BUG, 快去[ 酷安@JARK006 ]骂他。支持安卓8.0以上, 即覆盖 Android8.0 ~ Android 13 Beta3.3 全版本。
  - 2.模块有两份白名单, 代表均开放后台自由: 
      A.内置白名单:   包含主流第三方输入法(非全部), 部分魔法, 李跳跳(cn.litiaotiao.app)。
      B.自定义白名单: 由APP进行配置。
  - 3.开机日志会列出本机支持的全部 [ 内置白名单 / 自定义白名单 ]。
      模块不会接管系统应用, 若怀疑某个系统应用有问题, 请检查其是不是可卸载的(按第三方处理), 即使是官方出品的应用, 有需要请加入白名单。
  - 4.前台应用支持普通前台, 分屏, 单小窗, 多小窗, 多屏, virtualDisplay。
  - 5.请不要与其他功能类似的[ 墓碑模块 / 墓碑模式 / 黑域 / 各类乖巧模式 ]一同使用, 避免冲突, 暂时与系统自带[ 暂停执行已缓存的应用 ]无冲突。
  - 6.请不要与其他[ 保后台 ]的模块一同使用, 冻它已经将第三方应用(无论是否白名单)提权(-800 >> oom_score_adj)到系统应用运行级别, 这是目前最稳定的提权方案, 更加激进的提权策略会导致低概率的严重后果, 部分"保后台"模块会严重影响系统内存管理机制，也可能与[ 冻它 ]存在冲突，请在[ 冻它 ]和[ 其他保后台/墓碑模块 ]之间二选一, 谢谢。
  - 7.其他内存管理等功能擦边的模块, 其兼容性未知, 请自测并反馈, 谢谢合作。
  - 8.各类CPU调度请不要开启省电模式, 会严重影响系统体验, 冻它的后台管理/省电优化已经非常出色, 其续航增益远远大于第三方CPU省电模式调度，建议恢复默认官方调度，或者平衡模式。
  - 9.仅支持第三方应用冻结解冻, 杀后台行为由系统或其他模块管理。
  - 10.默认刷入可直接适合大部分人使用(微信默认在可配置白名单，可自行配置去除), 特定人群请自定义白名单。
  - 11.C++开发, 原生运行于Linux底层, 相较于其他 JAVA(Xposed)层, Shell层的类似功能, 效率更高, 也更加省电。
  - 12.冻它模块与App通信采用TCP_SOCKET(本地环回[127.0.0.1:50000]), 模块为Server, APP为Client), 因此通信范围仅限本机内部, 没有隐私泄漏风险。APP端开源, 但C++端屎山代码暂时闭源。
  - 13.本次依旧限时公测, Ver2.0将于[ 2022-08-01 00:00:00 ]过期, 因为短时间内无法及时发现所有BUG, 运行越久越容易触发未知BUG, 模块会在到测试到期前发布新版, 敬请留意, 适配了Magisk的模块更新机制, 能上GitHub就可以直接在Magisk更新。
  - 14.本人机型为红米K50Pro, MIUI13.0.18稳定版, 从开发到测试完全基于此机型, 故模块兼容依次从: 该机型 -> MIUI13(MTK) -> MIUI -> 其他平台 依次递减, 亲缘性越远, 兼容越差, 测试平台有限, 望谅解。
  - 15.建议提前做一个全局 dex-oat (建议Everything模式, 其他模式也行, 一次就好, 不用每次开机都做, 爱玩机和Scene均提供该功能), 提升运行效率, 但存储空间占用会大很多, 用空间换时间, 会省下亿点电, 各位自己决定。
  - 16.息屏时刻在前台的应用, 息屏后、息屏期间也一直属于前台, 不会冻结。
  - 17.首次使用或安装新应用后，请在冻它APP右上角更新[新安装应用]。
  - 18.只有播放音频的的应用悬浮窗享有后台权限, 单独悬浮窗(例如Scene的悬浮监视器)没有后台权限, 依旧会冻结，播放暂停超时也会冻结。
  - 19.从Ver2.0起，模块不会在任何地方创建文件，只会在模块目录内创建，卸载无残留。且模块安装时也会清理旧版本产生的文件。

- 未来计划: 
  - 1.针对已接入系统推送而收到消息的APP开放临时后台(优先适配MIpush), 点击消息可拉起应用。
  - 2.优化兼容系统自带[ 暂停执行已缓存的应用 ]服务。(目前暂无反馈有冲突情况)
  - 3.智能识别开放有下载服务的应用(百度网盘等龟速应用可能识别错误), 下载完成将进入超时列队, 超时后暂停。
  - 4.在APP中集成进程管理功能。
  - 5.解决广播问题，推送消息拉起问题，卡拨号问题。
