# Freeze_it 冻它模块

自动冻结那些较为耗电且非必须运行的后台应用。 

Automatically freeze background apps that are power-hungry and not necessarily running.
- 说明：
  - 1.黑名单模式，进入解冻，离开冻结。白名单模式则相反。
  - 2.支持普通前台，小窗，分屏，多窗口(未测)，多屏(未测)。
  - 4.请不要与其他功能类似的模块一同使用，避免冲突。
  - 5.仅支持第三方应用冻结和解冻，杀不杀后台由系统或其他模块管理。
  - 6.C++开发，相较于其他JAVA层，Shell层的类似功能，效率更高，更加省电。
- 已知问题：
  - 1.有大把BUG，快来[ 酷安@JARK006 ]告诉我。
  - 2.悬浮应用有BUG，正在攻关。
  - 3.暂不支持后台音乐，请去掉黑名单或加入白名单，或悬挂小窗。
  - 4.息屏时刻在前台的应用，息屏后也一直属于前台，不会冻结。
  - 3.后台应用无响应问题，请暂时使用 NoANR，因为配套APP正在开发。
- 2022-06-16 更新内容：
  - 1.初版工程，全是更新内容
  - 2.本次是内测版本，将于 2022-07-01 00:00:00 过期。
- 未来计划 (画大饼🤩(不是)，掉头发🥵(才是))：
  - 1.计划研究Native、Freamwork，ActivityManager等底层，重塑Activity生命周期。
  - 2.配套APP已经在做了，别催。
  - 3.计划新增应用杀不死功能，建议别关ZRAM。


