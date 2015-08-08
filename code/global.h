#ifndef GLOBAL
#define GLOBAL

#define AD_H 'E'
#define AD_L 'E'

//指令代码
#define RCS "RCS"	//读取单个触点的状态信息
#define WCS "WCS"	//写入单个触点的状态信息
#define RCP "RCP"	//读取多个触点的状态信息
#define WCP "WCP"	//写入多个触点的状态信息
#define RCC "RCC"	//读取字单位的触点的状态信
#define WCC "WCC"	//写入字单位的触点的状态信
#define SC  "SC"	//预置字单位的触点
#define RD  "RD"	//读取数据寄存器值
#define WD  "WD"	//写入数据寄存器值
#define SD  "SD"	//预置数据寄存器值
#define RS  "RS"	//读取定时器/计数器目标值
#define WS  "WS"	//写入定时器/计数器目标值
#define RK  "RK"	//读取定时器/计数器经过值
#define WK  "WK"	//写入定时器/计数器经过值
#define MC  "MC"	//登录及复位监控触点
#define MD  "MD"	//登录及复位监控数据
#define MG  "MG"   	//执行监控
#define	RR  "RR"    	//读取系统寄存器
#define	WR  "WR"   	//写入系统寄存器
#define	RT  "RT"    	//读取 PLC 当前状态
#define	RP  "RP"    	//读取程序
#define	WP  "WP"    	//写入程序
#define	RM  "RM"    	//遥控(运行/编程模式切换)
#define	AB  "AB"    	//传输终止指令

// //触点代码
//#define	X   "X"           //外部输入
//#define	Y   "Y"           //外部输出
//#define	R   "R"           //内部继电器
//#define	TPT   "T"           //定时器
//#define	C   "C"           //计数器
//#define	L   "L"           //链接继电器
//数据代码
//#define D   "D"           //数据寄存器 DT
//#define L   "L"           //链接寄存器 LD
//#define F   "F"           //文件寄存器 FL
//#define S   "S"           //目标值 SV
//#define K   "K"           //经过值 EV
//#define IX  "IX"          //索引寄存器 IX
//#define IY  "IY"          //索引寄存器 IY
//#define WX  "WX"          //字单位外部输入 WX
//#define WY  "WY"          //字单位外部输出 WY
//#define WR  "WR"          //字单位内部继电器 WR
//#define WL  "WL"          //字单位链接继电器 WL

//错误代码
#define  NOT_DEFINED	  0x20	 //未定义:     远程单元无法被正确识别，或者发生了数据错误.
#define	 NACK_ERROR       0x21     //NACK 错误:  用于远程单元的接收缓冲区已满.
#define	 WACK_ERROR       0x22     //WACK 错误:   远程单元编号(01 至 16)设置与本地单元重复.
#define	 MUlPORT_ERROR    0x23     //多重端口错误 试图发送不符合传输格式的数据.   或者某一帧数据溢出或发生了数据错误.
#define	 TMFMT_ERROR      0x24     //传输格式错误 传输系统硬件停止操作.
#define	 HARD_ERROR       0x25     //硬件错误:    远程单元的编号设置超出 01 至 63 的范围.
#define	 CELNO_ERROR      0x26     //单元号错误:  接收方数据帧溢出. 试图在不同的模块之间发送不
#define	 NOTSPT_ERROE     0x27     //不支持错误:  同帧长度的数据.
#define	 NORESP_ERROR     0x28     //无应答错误:  远程单元不存在. (超时)
#define	 BUFCLOSE_ERROR   0x29     //缓冲区关闭错 试图发送或接收处于关闭状态的缓冲区. 持续处于传输禁止状态.
#define	 TIMOUT_ERROR     0x30     //超时错误:
#define	 BCC_ERROR        0x40     //BCC 错误:    在指令数据中发生传输错误.
#define  FMT_ERROR        0x41     //格式错误:    所发送的指令信息不符合传输格式. 例: 指令中的数据项目过多或不足 缺少"#"符号及"目标站号".
#define  CMD_ERROR        0x42     //不支持错误:   发送了一个未被支持的指令.  向未被支持的目标站发送了指令
#define  PRO_ERROR        0x43     //处理步骤错误    在处于传输请求信息挂起时,发送了其他指令.
#define  LD_ERROR         0x50     //链接设置错误    设置了实际不存在的链接编号.
#define  ALSO_ERROR       0x51     //同时操作错误    当向其他单元发出指令时,本地单元的传输缓冲区已满.
#define  TMFOBID_ERROR    0x52     //传输禁止错误    无法向其他单元传输.
#define  BUSY_ERROR       0x53     //忙错误:         在接收到指令时,正在处理其他指令.
#define  PARMER_ERROR     0x60     //参数错误:       在指令中包含有无法使用的代码,或者代码没有附带区域指定参数(X,Y,D,等以外.)指令中的代码带有非法的功能指定参数(0,1,2,等).
#define  DATA_ERROR       0x61     //数据错误:       触点编号,区域编号,数据代码格式(BCD,hex,等)上溢出, 下溢出以及区域指定错误.
#define  RES_ERROR        0x62     //寄存器错误:     过多记录数据在未记录状态下的操作（监控记录、跟踪记录等。 ) 当记录溢出时，将进行重新记录。
#define  PLCMOD_ERROR     0x63     //PLC 模式错误:   当一条指令发出时，运行模式不能够对指令进 行处理。
#define  PRT_ERROR        0x65     //保护错误:       在存储保护状态下执行写操作到程序区域或 系统寄存器。
#define  ADD_ERROR        0x66     //地址错误:       地址（程序地址、绝对地址等）数据编码形式 （ BCD、 hex 等）、上溢、下溢或指定范围错误。
#define  DATLOST_ERROR    0x67     //丢失数据错误:   要读的数据不存在。（读取没有写入注释寄存 区的数据。）


//界面显示所用PLC数据定义
//1开机画面
#define    MSG1  "9011"    //走马灯讯息显示  R
//2主控画面
#define    MSG2  "0002"      //预设信息显示 WR 其他界面也使用到该量
#define    MSG2_H  "R0003"      //
#define    POLL  "30040"   //穿丝推力显示 DT
#define    PUSH  "30042"   //穿丝拉力显示 DT
#define    PUSH_H  "30043"   //穿丝拉力显示 DT
#define    SCNT_L  "30017"   //设定数显示低16 DT
#define    SCNT_H  "30018"   //设定数显示高16 DT
#define    MAIV    "30046"   //主轴速度显示DT
#define    MAIV_H  "30047"   //主轴速度显示DT
#define    STATE  "00114"    //状态显示DT    其他界面也有
#define    LATH   "00112"    //最后接触显示DT  其他界面也有
#define    TIME   "00115"    //计时显示DT    其他界面也有
#define    CCNT_L   "31004"  //当前数显示DT
#define    CCNT   "31005"  //当前数显示DT
#define    FTTH   "00110"    //首次接触显示DT
//3自动操作1界面
#define    BKWR  "00124"       //断丝显示 DT
#define    QTY   "31005"     //磨尖工具数量显示 DT
#define    STIP  "0169"       //搜寻丝尖状态显示 R
#define    GORG  "002E"        //总原点状态显示 R
#define    TOOL  "0390"       //磨尖工具状态显示 R
#define    GRND  "041C"       //插芯磨削状态显示 R
#define    IBOX  "0346"       //插芯入盒状态显示 R
#define    MIN   "0420"       //主轴进给状态显示 R
#define    PRLD  "0426"       //挤磨削液状态显示 R
#define    ULAD  "0350"       //插芯上载状态显示 R
#define    ISPY  "0320"       //插芯供给状态显示 R
#define    RESET  "0035"       //复位按钮对应的操作地址 可写R
#define    RESETEN  "0011"       //复位按钮生效位 可读
#define    RUNW  "0034"       //运行暂停按钮写 R
#define    RUNR  "002C"       //运行暂停按钮读 R
#define    AUTW  "0033"       //自动运行按钮写 R
#define    AUTR  "0020"       //自动运行按钮读 R
//4手动操作1
#define    MANUALR11 "0011"       //手动操作界面 字单位触点状态读取R11
#define    MANUALR12 "0012"       //手动操作界面 字单位触点状态读取R12
#define    MANUALR40 "0041"       //手动操作界面 位读取R41
#define    BUT1W "0010"       //插芯进给器写 L
#define    BUT1R "0110"      //插芯进给器读 R
#define    BUT2W "11"       //180水平旋转写 L
#define    BUT2R "111"      //180水平旋转读 R
#define    BUT3W "12"       //90度垂直旋转写 L
#define    BUT3R "112"      //90度垂直旋转读 R
#define    BUT4W "13"       //180前后横移写 L
#define    BUT4R "113"      //180前后横移读 R
#define    BUT5W "14"       //主轴夹持头 写 L
#define    BUT5R "114"      //主轴夹持头 读 R
#define    BUT6W "15"       //插芯顶针 写 L
#define    BUT6R "115"      //插芯顶针 读 R
#define    BUT7W "16"       //上装载夹子 写 L
#define    BUT7R "116"      //上装载夹子 读 R
#define    BUT8W "17"       //下卸载夹子 写 L
#define    BUT8R "117"      //下卸载夹子 读 R
//5手动操作2
#define    BUT9W "18"       //高速主轴 写 L
#define    BUT9R "118"      //高速主轴 读 R
#define    BUT10W "19"       //钻石液加注阀 写 L
#define    BUT10R "119"      //钻石液加注阀 读 R
#define    BUT11W "1A"       //磨削丝修整 写 L
#define    BUT11R "11A"      //磨削丝修整 读 R
#define    BUT12W "1B"       //激光扫描器 写 L
#define    BUT12R "11B"      //激光扫描器 读 R
#define    BUT13W "1C"       //磨削丝热切刀 写 L
#define    BUT13R "11C"      //磨削丝热切刀 读 R
#define    BUT14W "1D"       //丢弃废丝位吹气 写 L
#define    BUT14R "11D"      //丢弃废丝位吹气 读 R
#define    BUT15W "1E"       //喷嘴吹气 写 L
#define    BUT15R "11E"      //喷嘴吹气 读 R
#define    BUT16W "1F"       //丢弃废丝夹 写 L
#define    BUT16R "11F"      //丢弃废丝夹 读 R
//6手动操作3
#define    BUT17W "20"       //磨削丝顶杆 写 L
#define    BUT17R "120"      //磨削丝顶杆 读 R
#define    BUT18W "21"       //磨削丝张力杆 写 L
#define    BUT18R "121"      //磨削丝张力杆 读 R
#define    BUT19W "25"       //搅拌钻石液 写 L
#define    BUT19R "125"      //搅拌钻石液 读 R
#define    BUT20W "40"       //手动确认无错重新下落插芯 写 R
#define    BUT20R "41"       //手动确认无错重新下落插芯 读 R
//7监控画面1
#define    TIPSTA1 "01B"      //插芯顶针状态1 读 y
#define    TIPSTA2 "01C"      //插芯顶针状态2 读 y
#define    TIPSTA3 "01D"      //插芯顶针状态3 读 y
#define    ORGSTA  "01A"      //原点状态 读 y
#define    MANSTA  "011"      //主轴状态 读 y
//#define    OUTPUT  "310005"      //产量 读 y
#define    MANSTA  "011"      //主轴状态 读 y
#define    UPSTATE "018"      //上料状态 读 y
#define    DNSTATE "019"      //下料状态 读 y
#define    TPPST   "22"       //丝嘴位置 读 WR
#define    ORGPSTR "26"       //右原点位置 读 WR
#define    SFPST   "24"       //后安全位置 读 WR
#define    ORGPSTL "20"       //左原点位置 读 WR
#define    MI00046 "012"      //状态 读 X
#define    HM      "30046"    //位置 读 DT
#define    MI00044 "0D"      //状态 读 y
#define    MI00043 "0C"      //状态 读 y
#define    MI00041 "0E"      //状态 读 x
#define    MI00040 "0D"      //状态 读 x
#define    MI00039 "0F"      //状态 读 x
#define    MI00052 "0C"      //状态 读 x
#define    MI00038 "0B"      //状态 读 x
#define    MI00037 "19"      //状态 读 x
#define    MI00036 "09"      //状态 读 x
#define    MI00035 "1B"      //状态 读 x
#define    MI00034 "34"      //状态 读 x
#define    MI00033 "04"      //状态 读 x
#define    MI00030 "30"      //状态 读 x
#define    MI00031 "06"      //状态 读 x
#define    TIPST   "30016"   //穿丝位置 读 DT
#define    MANSHT   "30014"  //主轴横移 读 DT
#define    LPST   "30012"    //左旋位 读 DT
#define    RPST   "30010"    //右旋位 读 DT
#define    PLVAL   "11"      //拉力值 读 WY
#define    PHVAL   "10"      //推力值 读 WY
#define    MI00029 "18"      //状态 读 x
#define    MI00045 "17"      //状态 读 x
//9/左旋轮
#define    LEFT_DACFMEN  "0700"    //数据确认指定生效位地址 读 R
#define    LEFT_DACFM    "0070"    //数据确认指定地址 读 写L
#define    LEFT_ADJEN    "0211"    //调整按钮指定生效位地址 读 R
#define    LEFT_ADD      "0071"    //加值指定地址 读 写L
#define    LEFT_MINUS    "0072"    //减值指定地址 读 写L
#define    LEFT_SFTW     "0073"    //移至目标位指定地址  写L
#define    LEFT_SFTR     "1011"    //移至目标位指定地址  读R
#define    LEFT_BKORGW   "0074"    //回原点指定地址  写L
#define    LEFT_BKORGR   "1013"    //回原点指定地址  读R
#define    LEFT_SLTP     "01010"    //combobox选择位置指定地址  读写DT
#define    LEFT_SETV     "30174"    //预设值指定地址  读写DT
#define    LEFT_STEPV    "30176"    //步距值值指定地址  读写DT
#define    LEFT_CNTV     "31012"    //当前值指定地址  读写DT
#define    LEFT_CNTVH    "31013"    //当前值指定地址  读写DT
#define    LEFT_EN       "0011"    //显示指定生效位地址 读 R
#define    LEFT_ORG      "30100"    //原点 读写 DT
#define    LEFT_CFCONE   "30102"    //确认圆锥 读写 DT

#define    LEFT_FDCORE   "30104"    //插芯供给 读写 DT
#define    LEFT_OK       "30106"    //OK位 读写 DT
#define    LEFT_NOTCH    "30108"    //没有接触 读写 DT
#define    LEFT_NOPASS   "30110"    //没有通过 读写 DT
#define    LEFT_WAIT     "30112"    //等待位 读写 DT
#define    LEFT_OCORE    "30114"    //主轴出插芯 读写 DT
#define    LEFT_ICORE    "30117"    //主轴入插芯 读写 DT
#define    LEFT_MAN      "30020"    //手动 读写 DT
#define    LEFT_AUTO     "30021"    //自动 读写 DT
#define    LEFT_BKORG    "30022"    //回原点 读写 DT
//10/右旋轮
#define    RIGHT_DACFMEN  "0700"    //数据确认指定生效位地址 读 R
#define    RIGHT_DACFM    "0060"    //数据确认指定地址 读 写L
#define    RIGHT_ADJEN    "0212"    //调整按钮指定生效位地址 读 R
#define    RIGHT_ADD      "0061"    //加值指定地址 读 写L
#define    RIGHT_MINUS    "0062"    //减值指定地址 读 写L
#define    RIGHT_SFTW     "0063"    //移至目标位指定地址  写L
#define    RIGHT_SFTR     "1001"    //移至目标位指定地址  读R
#define    RIGHT_BKORGW   "0064"    //回原点指定地址  写L
#define    RIGHT_BKORGR   "1003"    //回原点指定地址  读R
#define    RIGHT_SLTP     "01000"    //combobox选择位置指定地址  读写DT
#define    RIGHT_SETV     "30170"    //预设值指定地址  读写DT
#define    RIGHT_STEPV    "30172"    //步距值值指定地址  读写DT
#define    RIGHT_CNTV     "31010"    //当前值指定地址  读写DT
#define    RIGHT_CNTVH    "31011"    //当前值指定地址  读写DT
#define    RIGHT_EN       "0011"    //显示指定生效位地址 读 R
#define    RIGHT_ORG      "30120"    //原点 读写 DT
#define    RIGHT_LASER    "30122"    //激光位 读写 DT
#define    RIGHT_WORK     "30124"    //磨削加工位 读写 DT
#define    RIGHT_BREAK    "30126"    //断丝位 读写 DT
#define    RIGHT_REPAIR   "30128"    //修磨位 读写 DT
#define    RIGHT_AMP      "30131"    //摆动幅度 读写 DT
#define    RIGHT_MAN      "30023"    //手动 读写 DT
#define    RIGHT_AUTO     "30024"    //自动 读写 DT
#define    RIGHT_BKORG    "30025"    //回原点 读写 DT
#define    RIGHT_MIXTIME  "30071"    //搅拌次数 读写 DT
#define    RIGHT_SCANTIME "30029"    //回原点 读写 DT
#define    RIGHT_M1       "00051"    //回原点 读写 DT
#define    RIGHT_M2       "00057"    //回原点 读写 DT
//10学习/主轴滑动
#define    MAIN_DACFMEN  "0700"    //数据确认指定生效位地址 读 R
#define    MAIN_DACFM    "0080"    //数据确认指定地址 读 写L
#define    MAIN_ADJEN    "0213"    //调整按钮指定生效位地址 读 R
#define    MAIN_ADD      "0081"    //加值指定地址 读 写L
#define    MAIN_MINUS    "0082"    //减值指定地址 读 写L
#define    MAIN_SFTW     "0083"    //移至目标位指定地址  写L
#define    MAIN_SFTR     "1021"    //移至目标位指定地址  读R
#define    MAIN_BKORGW   "0084"    //回原点指定地址  写L
#define    MAIN_BKORGR   "1023"    //回原点指定地址  读R
#define    MAIN_SLTP     "01020"    //combobox选择位置指定地址  读写DT
#define    MAIN_SETV     "30178"    //预设值指定地址  读写DT
#define    MAIN_STEPV    "30180"    //步距值值指定地址  读写DT
#define    MAIN_CNTV     "31014"    //当前值指定地址  读写DT
#define    MAIN_CNTVH     "31015"    //当前值指定地址  读写DT
#define    MAIN_EN       "0011"    //显示指定生效位地址 读 R
#define    MAIN_SAFE     "30132"    //安全位 读写 DT
#define    MAIN_ADDCORE  "30134"  //加载插芯 读写 DT
#define    MAIN_ORG      "30136"    //原点位 读写 DT
#define    MAIN_WAIT     "30138"    //等待位 读写 DT
#define    MAIN_WORK     "30140"    //工作位 读写 DT
#define    MAIN_DAMD     "30142"    //钻石液位 读写 DT
#define    MAIN_AMP      "30145"    //振荡幅度 读写 DT
#define    MAIN_AUTO     "30027"    //自动动 读写 DT
#define    MAIN_MAN      "30026"    //手动 读写 DT
#define    MAIN_BKORG    "30028"    //回原点 读写 DT
#define    MAIN_SPEED    "30068"    //搅拌次数 读写 DT

//进丝距离
#define    WIRE_DACFMEN  "0700"    //数据确认指定生效位地址 读 R
#define    WIRE_DACFM    "0090"    //数据确认指定地址 读 写L
#define    WIRE_ADJEN    "0213"    //调整按钮指定生效位地址 读 R
#define    WIRE_ADD      "0091"    //加值指定地址 读 写L
#define    WIRE_MINUS    "0092"    //减值指定地址 读 写L
#define    WIRE_SFTW     "0093"    //移至目标位指定地址  写L
#define    WIRE_SFTR     "1031"    //移至目标位指定地址  读R
#define    WIRE_BKORGW   "0094"    //回原点指定地址  写L
#define    WIRE_BKORGR   "1033"    //回原点指定地址  读R
#define    WIRE_SLTP     "01030"    //combobox选择位置指定地址  读写DT
#define    WIRE_SETV     "30182"    //预设值指定地址  读写DT
#define    WIRE_STEPV    "30184"    //步距值值指定地址  读写DT
#define    WIRE_CNTV     "31016"    //当前值指定地址  读写DT
#define    WIRE_CNTVH     "31017"    //当前值指定地址  读写DT
#define    WIRE_EN       "0011"    //显示指定生效位地址 读 R
#define    WIRE_MOUTH    "30150"    //丝嘴位置地址 读 R
#define    WIRE_ORG      "30152"    //原点位置 读写DT
#define    WIRE_FLUID    "30154"    //磨削液位 读写DT
#define    WIRE_INSERT   "30156"    //插入位置 读写DT
#define    WIRE_START    "30158"    //磨削开始读写DT
#define    WIRE_END      "30160"    //磨削结束 读写DT
#define    WIRE_BREAK    "30163"    //断丝位置 读写DT
#define    WIRE_MAN      "30030"    //手动速度 读写DT
#define    WIRE_PSTV     "30031"    //位置速度 读写DT
#define    WIRE_ORGV     "30032"    //原点速度 读写DT
#define    WIRE_INV      "30033"    //插入速度 读写DT
#define    WIRE_WORKV    "30034"    //工作速度 读写DT
#define    WIRE_BACKV    "30035"    //后退速度 读写DT
#define    WIRE_TIPV     "30036"    //磨尖速度 读写DT
#define    WIRE_STIPV    "30037"    //开始磨尖速度 读写DT

//计数设定
#define    CONSET_EN           "0011"    //显示指定生效位地址 读 R
#define    CONSET_NOPASS       "30000"    //未通过判定 读写DT
#define    CONSET_CONELMT      "30001"    //圆锥判断限值 读写DT
#define    CONSET_BACKFORTH    "30002"    //修磨往复 读写DT
#define    CONSET_NOPASSMAX    "30004"    //最大未通过 读写DT
#define    CONSET_NOPASSCTNCUT "30005"    //连续切未通过 读写DT
#define    CONSET_NOTCHMAX     "30006"    //最大不接触 读写DT
#define    CONSET_LOWRES       "30007"    //低速受阻 读写DT
#define    CONSET_RESTRYMAX    "30018"    //最大受阻尝试 读写DT
#define    CONSET_HOTCUTTIME   "30070"    //热切时间 读写DT
#define    CONSET_BACKFORTH1   "00053"    //修磨往复值 读写DT
#define    CONSET_CONENOW      "00055"    //圆锥当前值 读写DT
#define    CONSET_NOPASSTIME   "00120"    //未通过计数 读写DT
#define    CONSET_NOTCHTIME    "00121"    //未接触计数 读写DT
#define    CONSET_NOPASSNOW    "00122"    //未通过当前值 读写DT
#define    CONSET_NOPASSCTNCUTTIME "00123"    //连续切未过数 读写DT
#define    CONSET_RESNOW       "00129"    //受阻当前值 读写DT

#define    CONSET_BRKSPCNOW    "00124"    //断丝间隔当前 读写DT
#define    CONSET_BRKSPCSET    "30003"    //断丝间隔设定 读写DT
#define    CONSET_RESBKV       "30038"    //遇阻后退长度速度 读写DT
#define    CONSET_2COMPV       "30039"    //二次补偿速度 读写DT
#define    CONSET_MOD2V        "30072"    //模式2速度 读写DT
#define    CONSET_MOD1V1       "30074"    //模式1速度1 读写DT
#define    CONSET_MOD1V2       "30075"    //模式1速度2 读写DT
#define    CONSET_WORKVM2      "30164"    //WORK VM2 读写DT
#define    CONSET_BRKCMP       "30166"    //断丝递进补偿值 读写DT
#define    CONSET_2COMP        "30169"    //二次补偿 读写DT
#define    CONSET_WM1LEN       "30188"    //WM1长度 读写DT
#define    CONSET_BRKINLEN     "30190"    //断丝后进丝长度长度 读写DT
#define    CONSET_INCOMP       "30192"    //进丝补偿值 读写DT
#define    CONSET_SRHCONELEN   "30194"    //搜寻圆锥长度 读写DT
#define    CONSET_RESBKLEN     "30196"    //遇阻后退长度 读写DT
#define    CONSET_VM1COMP      "30199"    //WM1最后补偿 读写DT

#define    CONSET_CLIPTIME     "30008"    //夹持时间 读写DT
#define    CONSET_COREDELAY    "30009"    //顶插芯延时 读写DT
#define    CONSET_MAXWORKDLY   "30010"    //单颗最大加工时限 读写DT
#define    CONSET_MAINSTOP     "30011"    //高速主轴停止 读写DT
#define    CONSET_BRKMAXTIME   "30012"    //热刀断丝最大时间 读写DT
#define    CONSET_MINWORKDLY   "30013"    //单颗最小最短时限 读写DT
#define    CONSET_ADDLUID      "30014"    //磨削液加注 读写DT
#define    CONSET_OPENTIME     "30015"    //松开张力计时 读写DT
#define    CONSET_180CONF      "30016"    //180度确认 读写DT
#define    CONSET_SGTIME       "00118"    //单颗当前加工计时 读写DT
//设定/模拟量
#define    ALG_PUSH            "30040"    //推力值 读写DT
#define    ALG_PULL            "30042"    //拉力值 读写DT
#define    ALG_CUT             "30044"    //切断力 读写DT
#define    ALG_MAINV           "30047"    //主轴速度 读写DT

//高级设定/初始化
#define    HIGHSET_EN          "0011"    //显示指定生效位地址 读 R
#define    HIGHSET_COMBOXEN    "0700"    //单选框生效位地址 读 R
#define    HIGHSET_SAFEDOOR    "0036"    //按钮指定生效位地址 读 R
#define    HIGHSET_SOURCE      "0037"    //按钮指定生效位地址 读 R
#define    CONSET_COMBOX1      "01006"    //单颗当前加工计时 读写DT
#define    CONSET_COMBOX2      "01008"    //单颗当前加工计时 读写DT

//监控系统查询
#define    TIMER          "00115"    //计时 读 DT
#define    STATE          "00114"    //状态 读 DT
#define    DT30046        "30046"    //读 DT
#define    OUTPUT         "31005"    //产量 读 DT
#define    RIGHT          "31010"    //右旋 读 DT
#define    LEFT           "31012"    //左旋 读 DT
#define    MAIN           "31014"    //主轴横移 读 DT
#define    CHUANSI        "31017"    //穿丝 读 DT
#define    POSTION1       "0020"    //位置信息 读 WR
#define    POSTION2       "0022"    //位置信息 读 WR
#define    POSTION3       "0024"    //位置信息 读 WR
#define    POSTION4       "0026"    //位置信息 读 WR
#define    XSTART         "0000"    // 读 x0
#define    XEND           "0001"    // 读 x0001
#define    YSTART         "0000"    // 读 y0
#define    YEND           "0001"    // 读 y0001
#define    YSTART1        "0010"    // 读 y10
#define    YEND1          "0011"    // 读 y0011
#define    RELOAD_WRITE   "0040"    // 手动确认无错重新下落插芯 写
#define    RELOAD_READ    "0041"    // 手动确认无错重新下落插芯 读

//监控原点查询
#define    UPLOAD_READ    "0117"    // 上载夹子 读
#define    CHAXIN_READ    "0109"    // 插芯顶针 读
#define    FB180_READ     "0113"    // 180前后 读
#define    CURLOCCATION1        "0020"    // 当前定位点1 读 WR
#define    CURLOCCATION2        "0022"    // 当前定位点2 读 WR
#define    CURLOCCATION3        "0024"    // 当前定位点3 读 WR
#define    CURLOCCATION4        "0026"    // 当前定位点1 读 WR
#define    CURPOS1              "31010"    // 当前位置1 读 DT 32位浮点型数据
#define    CURPOS2              "31012"    // 当前位置2 读 DT 32位浮点型数据
#define    CURPOS3              "31014"    // 当前位置3 读 DT 32位浮点型数据
#define    CURPOS4              "31017"    // 当前位置4 读 DT 32位浮点型数据
#define    ORGSTATE             "002E"    //  显示原点状态的指示灯
#define    QGORG                "020A"    // 气缸原点 R
#define    XSTART1              "0030"    // 读 x0
#define    XEND1                "0040"    // 读 x0001
#define    YSTART2              "0030"    // 读 x0
#define    YEND2                "0040"    // 读 x0001

//监控运行数据统计
#define    OKOUTPUT              "31000"    // OK产量 读 DT 16位
#define    NOTAUCH               "31001"    // 未接触数量 读 DT 16位
#define    NOPASS                "31002"    // 未通过数量 读 DT 16位
#define    HOTCUT                "31003"    // 电热切刀 读 DT 16位
#define    REPAIR                "31004"    // 修整工具 读 DT 16位
#define    OUTPUT                "31005"    // 总产量 读 DT 16位
#define    OUTPUTSET             "30017"    // 总产量设定值 读写 DT 16位
#define    OKOUTPUTSET           "30063"    // OK产量设定值 读写 DT 16位
#define    NOTAUCHSET            "30064"    // 未接触数量设定值 读写 DT 16位
#define    NOPASSSET             "30065"    // 未通过数量设定值 读写 DT 16位
#define    HOTCUTSET             "30066"    // 电热切刀设定值 读写 DT 16位
#define    REPAIRSET             "30067"    // 修整工具设定值 读写 DT 16位
#define    SETZERO               "0008"     // 以字单位读取 读写 L16位
#define    MONTH                 "00125"     // 读 DT 16位
#define    YEAR                  "00128"     // 读 DT 16位

#endif // GLOBAL

