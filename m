Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8420411A98F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2019 12:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbfLKLDS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Dec 2019 06:03:18 -0500
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:55330 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbfLKLDS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Dec 2019 06:03:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436433|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.259899-0.0152997-0.724801;DS=CONTINUE|ham_alarm|0.022388-0.00192985-0.975682;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07447;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GEyoadp_1576062153;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GEyoadp_1576062153)
          by smtp.aliyun-inc.com(10.147.44.118);
          Wed, 11 Dec 2019 19:02:59 +0800
Subject: Re: [PATCH v8 4/4] MIPS: Ingenic: Add YSH & ATIL CU Neo board
 support.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1575979363-25956-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1575979363-25956-5-git-send-email-zhouyanjie@wanyeetech.com>
 <1575998343.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        alexandre.belloni@bootlin.com, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io, ak@linux.intel.com,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, prasannatsmkumar@gmail.com,
        keescook@chromium.org, ebiederm@xmission.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, 772753199@qq.com
From:   zhouyanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF0CCCA.60404@wanyeetech.com>
Date:   Wed, 11 Dec 2019 19:02:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1575998343.3.2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2019年12月11日 01:19, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mar., déc. 10, 2019 at 20:02, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add a device tree for the Ingenic X1000 based YSH & ATIL CU Neo board.
>> Note that this is unselectable via Kconfig until the X1000 SoC is made
>> selectable in a later commit.
>
> I believe it is now selectable via Kconfig, right?
>

Oh, apologize for my careless, it should be selectable now.
Do I need to send a v9 to fix the commit message?

Thanks and best regards!

> For the whole series:
> Acked-by: Paul Cercueil <paul@crapouillou.net>
>
> Cheers,
> Paul
>
>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     Rebase on top of mips-next, use TCU for system timer and 
>> clocksource.
>>
>>     v2->v3:
>>     No change.
>>
>>     v3->v4:
>>     1.Adjust "model" in "cu1000.dts" to match the description in 
>> "devices.yaml".
>>     2.Adjust "bool" in "Kconfig" to avoid duplicate names with 
>> subsequent boards.
>>
>>     v4->v5:
>>     1.Rename "cu1000" to "cu1000-neo" to prevent conflicts with 
>> subsequent boards
>>       such as "cu1000-geo", and so on.
>>     2.Remove "CONFIG_HZ=100" and "mem=32M@0x0" from defconfg.
>>     3.Modify incorrect comments in DT.
>>
>>     v5->v6:
>>     1.Use "stdout-path = "serial2:115200n8"" instead "stdout-path = 
>> &uart2" in DT.
>>     2.Remove "console=ttyS2,115200n8" and "CONFIG_CMDLINE_OVERRIDE=y" 
>> from defconfg.
>>
>>     v6->v7:
>>     Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
>>     to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
>>     the old mailbox is in an unstable state.
>>
>>     v7->v8:
>>     Merge [6/6] in v7 to this patch.
>>
>>  arch/mips/boot/dts/ingenic/Makefile       |   1 +
>>  arch/mips/boot/dts/ingenic/cu1000-neo.dts |  99 
>> ++++++++++++++++++++++++++
>>  arch/mips/configs/cu1000-neo_defconfig    | 111 
>> ++++++++++++++++++++++++++++++
>>  arch/mips/jz4740/Kconfig                  |   4 ++
>>  4 files changed, 215 insertions(+)
>>  create mode 100644 arch/mips/boot/dts/ingenic/cu1000-neo.dts
>>  create mode 100644 arch/mips/configs/cu1000-neo_defconfig
>>
>> diff --git a/arch/mips/boot/dts/ingenic/Makefile 
>> b/arch/mips/boot/dts/ingenic/Makefile
>> index 9cc4844..e165429 100644
>> --- a/arch/mips/boot/dts/ingenic/Makefile
>> +++ b/arch/mips/boot/dts/ingenic/Makefile
>> @@ -2,5 +2,6 @@
>>  dtb-$(CONFIG_JZ4740_QI_LB60)    += qi_lb60.dtb
>>  dtb-$(CONFIG_JZ4770_GCW0)    += gcw0.dtb
>>  dtb-$(CONFIG_JZ4780_CI20)    += ci20.dtb
>> +dtb-$(CONFIG_X1000_CU1000_NEO)    += cu1000-neo.dtb
>>
>>  obj-$(CONFIG_BUILTIN_DTB)    += $(addsuffix .o, $(dtb-y))
>> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts 
>> b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>> new file mode 100644
>> index 00000000..b0733da
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +
>> +#include "x1000.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/ingenic,tcu.h>
>> +
>> +/ {
>> +    compatible = "yna,cu1000-neo", "ingenic,x1000";
>> +    model = "YSH & ATIL General Board CU Neo";
>> +
>> +    aliases {
>> +        serial2 = &uart2;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial2:115200n8";
>> +    };
>> +
>> +    memory {
>> +        device_type = "memory";
>> +        reg = <0x0 0x04000000>;
>> +    };
>> +};
>> +
>> +&exclk {
>> +    clock-frequency = <24000000>;
>> +};
>> +
>> +&tcu {
>> +    /* 1500 kHz for the system timer and clocksource */
>> +    assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
>> +    assigned-clock-rates = <1500000>, <1500000>;
>> +
>> +    /* Use channel #0 for the system timer channel #2 for the 
>> clocksource */
>> +    ingenic,pwm-channels-mask = <0xfa>;
>> +};
>> +
>> +&uart2 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pins_uart2>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&mac {
>> +    phy-mode = "rmii";
>> +    phy-handle = <&lan8720a>;
>> +
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pins_mac>;
>> +
>> +    snps,reset-gpio = <&gpc 23 GPIO_ACTIVE_LOW>; /* PC23 */
>> +    snps,reset-active-low;
>> +    snps,reset-delays-us = <0 10000 30000>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&mdio {
>> +    status = "okay";
>> +
>> +    lan8720a: ethernet-phy@0 {
>> +        compatible = "ethernet-phy-id0007.c0f0", 
>> "ethernet-phy-ieee802.3-c22";
>> +        reg = <0>;
>> +    };
>> +};
>> +
>> +&msc0 {
>> +    bus-width = <8>;
>> +    max-frequency = <50000000>;
>> +
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pins_msc0>;
>> +
>> +    non-removable;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&pinctrl {
>> +    pins_uart2: uart2 {
>> +        function = "uart2";
>> +        groups = "uart2-data-d";
>> +        bias-disable;
>> +    };
>> +
>> +    pins_mac: mac {
>> +        function = "mac";
>> +        groups = "mac";
>> +        bias-disable;
>> +    };
>> +
>> +    pins_msc0: msc0 {
>> +        function = "mmc0";
>> +        groups = "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
>> +        bias-disable;
>> +    };
>> +};
>> diff --git a/arch/mips/configs/cu1000-neo_defconfig 
>> b/arch/mips/configs/cu1000-neo_defconfig
>> new file mode 100644
>> index 00000000..9f988ed
>> --- /dev/null
>> +++ b/arch/mips/configs/cu1000-neo_defconfig
>> @@ -0,0 +1,111 @@
>> +CONFIG_LOCALVERSION_AUTO=y
>> +CONFIG_KERNEL_GZIP=y
>> +CONFIG_SYSVIPC=y
>> +CONFIG_NO_HZ_IDLE=y
>> +CONFIG_HIGH_RES_TIMERS=y
>> +CONFIG_PREEMPT=y
>> +CONFIG_IKCONFIG=y
>> +CONFIG_IKCONFIG_PROC=y
>> +CONFIG_LOG_BUF_SHIFT=14
>> +CONFIG_CGROUPS=y
>> +CONFIG_MEMCG=y
>> +CONFIG_MEMCG_KMEM=y
>> +CONFIG_CGROUP_SCHED=y
>> +CONFIG_CGROUP_FREEZER=y
>> +CONFIG_CGROUP_DEVICE=y
>> +CONFIG_CGROUP_CPUACCT=y
>> +CONFIG_NAMESPACES=y
>> +CONFIG_USER_NS=y
>> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> +CONFIG_SYSCTL_SYSCALL=y
>> +CONFIG_KALLSYMS_ALL=y
>> +CONFIG_EMBEDDED=y
>> +# CONFIG_VM_EVENT_COUNTERS is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +CONFIG_SLAB=y
>> +CONFIG_MACH_INGENIC=y
>> +CONFIG_X1000_CU1000_NEO=y
>> +CONFIG_HIGHMEM=y
>> +CONFIG_HZ_100=y
>> +# CONFIG_SECCOMP is not set
>> +# CONFIG_SUSPEND is not set
>> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>> +# CONFIG_COMPACTION is not set
>> +CONFIG_CMA=y
>> +CONFIG_CMA_AREAS=7
>> +CONFIG_NET=y
>> +CONFIG_UNIX=y
>> +CONFIG_INET=y
>> +CONFIG_UEVENT_HELPER=y
>> +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>> +CONFIG_DEVTMPFS=y
>> +# CONFIG_FW_LOADER is not set
>> +# CONFIG_ALLOW_DEV_COREDUMP is not set
>> +CONFIG_NETDEVICES=y
>> +CONFIG_STMMAC_ETH=y
>> +CONFIG_SMSC_PHY=y
>> +# CONFIG_INPUT_MOUSEDEV is not set
>> +# CONFIG_INPUT_KEYBOARD is not set
>> +# CONFIG_INPUT_MOUSE is not set
>> +# CONFIG_SERIO is not set
>> +CONFIG_VT_HW_CONSOLE_BINDING=y
>> +CONFIG_LEGACY_PTY_COUNT=2
>> +CONFIG_SERIAL_EARLYCON=y
>> +CONFIG_SERIAL_8250=y
>> +CONFIG_SERIAL_8250_CONSOLE=y
>> +CONFIG_SERIAL_8250_NR_UARTS=3
>> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3
>> +CONFIG_SERIAL_8250_INGENIC=y
>> +CONFIG_SERIAL_OF_PLATFORM=y
>> +# CONFIG_HW_RANDOM is not set
>> +CONFIG_GPIO_SYSFS=y
>> +CONFIG_WATCHDOG=y
>> +CONFIG_JZ4740_WDT=y
>> +# CONFIG_HWMON is not set
>> +# CONFIG_LCD_CLASS_DEVICE is not set
>> +# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
>> +# CONFIG_VGA_CONSOLE is not set
>> +# CONFIG_HID is not set
>> +# CONFIG_USB_SUPPORT is not set
>> +CONFIG_MMC=y
>> +CONFIG_MMC_JZ4740=y
>> +CONFIG_RTC_CLASS=y
>> +CONFIG_RTC_DRV_JZ4740=y
>> +CONFIG_DMADEVICES=y
>> +CONFIG_DMA_JZ4780=y
>> +# CONFIG_IOMMU_SUPPORT is not set
>> +CONFIG_NVMEM=y
>> +CONFIG_NVMEM_SYSFS=y
>> +CONFIG_EXT4_FS=y
>> +# CONFIG_DNOTIFY is not set
>> +CONFIG_AUTOFS_FS=y
>> +CONFIG_PROC_KCORE=y
>> +# CONFIG_PROC_PAGE_MONITOR is not set
>> +CONFIG_TMPFS=y
>> +CONFIG_CONFIGFS_FS=y
>> +CONFIG_NLS=y
>> +CONFIG_NLS_CODEPAGE_936=y
>> +CONFIG_NLS_CODEPAGE_950=y
>> +CONFIG_NLS_ASCII=y
>> +CONFIG_NLS_ISO8859_1=y
>> +CONFIG_NLS_UTF8=y
>> +CONFIG_CRYPTO_ECHAINIV=y
>> +CONFIG_CRYPTO_AES=y
>> +CONFIG_CRYPTO_DEFLATE=y
>> +CONFIG_CRYPTO_LZO=y
>> +CONFIG_PRINTK_TIME=y
>> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
>> +CONFIG_CONSOLE_LOGLEVEL_QUIET=15
>> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
>> +CONFIG_DEBUG_INFO=y
>> +CONFIG_STRIP_ASM_SYMS=y
>> +CONFIG_DEBUG_FS=y
>> +CONFIG_MAGIC_SYSRQ=y
>> +CONFIG_PANIC_ON_OOPS=y
>> +CONFIG_PANIC_TIMEOUT=10
>> +# CONFIG_SCHED_DEBUG is not set
>> +# CONFIG_DEBUG_PREEMPT is not set
>> +CONFIG_STACKTRACE=y
>> +# CONFIG_FTRACE is not set
>> +CONFIG_CMDLINE_BOOL=y
>> +CONFIG_CMDLINE="earlycon clk_ignore_unused"
>> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>> index 6b96844..412d2fa 100644
>> --- a/arch/mips/jz4740/Kconfig
>> +++ b/arch/mips/jz4740/Kconfig
>> @@ -16,6 +16,10 @@ config JZ4780_CI20
>>      bool "MIPS Creator CI20"
>>      select MACH_JZ4780
>>
>> +config X1000_CU1000_NEO
>> +    bool "YSH & ATIL CU1000 Module with Neo backplane"
>> +    select MACH_X1000
>> +
>>  endchoice
>>
>>  config MACH_JZ4740
>> -- 
>> 2.7.4
>>
>

