Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E51D24A175
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 16:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgHSOQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 10:16:13 -0400
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:56196 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgHSOQN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 10:16:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07459106|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00916649-0.000605191-0.990228;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03294;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.IKEbisC_1597846562;
Received: from 192.168.10.194(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IKEbisC_1597846562)
          by smtp.aliyun-inc.com(10.147.40.7);
          Wed, 19 Aug 2020 22:16:03 +0800
Subject: Re: [PATCH v2 12/13] MIPS: configs: Regenerate configs of Ingenic
 boards
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200812001510.460382-1-paul@crapouillou.net>
 <20200812001510.460382-13-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <98620ba7-8c2d-dde1-819e-32b7f9790bf2@wanyeetech.com>
Date:   Wed, 19 Aug 2020 22:16:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200812001510.460382-13-paul@crapouillou.net>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2020/8/12 ÉÏÎç8:15, Paul Cercueil Ð´µÀ:
> For each board the MACH_INGENIC_SOC option was selected instead of
> MACH_INGENIC. Nothing else was changed in the menuconfig.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>
> Notes:
>      v2: Update cu1830-neo board config as well.
>
>   arch/mips/configs/ci20_defconfig       |  4 ++--
>   arch/mips/configs/cu1000-neo_defconfig | 16 ++--------------
>   arch/mips/configs/cu1830-neo_defconfig | 15 ++-------------
>   arch/mips/configs/gcw0_defconfig       |  2 +-
>   arch/mips/configs/qi_lb60_defconfig    |  5 ++---
>   arch/mips/configs/rs90_defconfig       |  4 ++--
>   6 files changed, 11 insertions(+), 35 deletions(-)
>
> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
> index 0a46199fdc3f..052c5ad0f2b1 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -22,7 +22,7 @@ CONFIG_EMBEDDED=y
>   # CONFIG_VM_EVENT_COUNTERS is not set
>   # CONFIG_COMPAT_BRK is not set
>   CONFIG_SLAB=y
> -CONFIG_MACH_INGENIC=y
> +CONFIG_MACH_INGENIC_SOC=y
>   CONFIG_JZ4780_CI20=y
>   CONFIG_HIGHMEM=y
>   CONFIG_HZ_100=y
> @@ -42,7 +42,7 @@ CONFIG_IP_PNP_DHCP=y
>   # CONFIG_IPV6 is not set
>   # CONFIG_WIRELESS is not set
>   CONFIG_DEVTMPFS=y
> -# CONFIG_FW_LOADER is not set
> +CONFIG_FW_LOADER=m
>   # CONFIG_ALLOW_DEV_COREDUMP is not set
>   CONFIG_MTD=y
>   CONFIG_MTD_RAW_NAND=y
> diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
> index 6b471cdb16cf..55d0690a3ffe 100644
> --- a/arch/mips/configs/cu1000-neo_defconfig
> +++ b/arch/mips/configs/cu1000-neo_defconfig
> @@ -1,5 +1,3 @@
> -CONFIG_LOCALVERSION_AUTO=y
> -CONFIG_KERNEL_GZIP=y
>   CONFIG_SYSVIPC=y
>   CONFIG_NO_HZ_IDLE=y
>   CONFIG_HIGH_RES_TIMERS=y
> @@ -9,7 +7,6 @@ CONFIG_IKCONFIG_PROC=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_CGROUPS=y
>   CONFIG_MEMCG=y
> -CONFIG_MEMCG_KMEM=y
>   CONFIG_CGROUP_SCHED=y
>   CONFIG_CGROUP_FREEZER=y
>   CONFIG_CGROUP_DEVICE=y
> @@ -17,13 +14,12 @@ CONFIG_CGROUP_CPUACCT=y
>   CONFIG_NAMESPACES=y
>   CONFIG_USER_NS=y
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> -CONFIG_SYSCTL_SYSCALL=y
This has already been dropped in the current mips-next tree.
>   CONFIG_KALLSYMS_ALL=y
>   CONFIG_EMBEDDED=y
>   # CONFIG_VM_EVENT_COUNTERS is not set
>   # CONFIG_COMPAT_BRK is not set
>   CONFIG_SLAB=y
> -CONFIG_MACH_INGENIC=y
> +CONFIG_MACH_INGENIC_SOC=y
>   CONFIG_X1000_CU1000_NEO=y
>   CONFIG_HIGHMEM=y
>   CONFIG_HZ_100=y
> @@ -32,7 +28,6 @@ CONFIG_HZ_100=y
>   # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>   # CONFIG_COMPACTION is not set
>   CONFIG_CMA=y
> -CONFIG_CMA_AREAS=7
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -41,19 +36,16 @@ CONFIG_CFG80211=y
>   CONFIG_UEVENT_HELPER=y
>   CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>   CONFIG_DEVTMPFS=y
> -# CONFIG_FW_LOADER is not set
>   # CONFIG_ALLOW_DEV_COREDUMP is not set
>   CONFIG_NETDEVICES=y
>   CONFIG_STMMAC_ETH=y
>   CONFIG_SMSC_PHY=y
>   CONFIG_BRCMFMAC=y
> -# CONFIG_INPUT_MOUSEDEV is not set
>   # CONFIG_INPUT_KEYBOARD is not set
>   # CONFIG_INPUT_MOUSE is not set
>   # CONFIG_SERIO is not set
>   CONFIG_VT_HW_CONSOLE_BINDING=y
>   CONFIG_LEGACY_PTY_COUNT=2
> -CONFIG_SERIAL_EARLYCON=y
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_SERIAL_8250_NR_UARTS=3
> @@ -67,8 +59,6 @@ CONFIG_GPIO_SYSFS=y
>   CONFIG_SENSORS_ADS7828=y
>   CONFIG_WATCHDOG=y
>   CONFIG_JZ4740_WDT=y
> -# CONFIG_LCD_CLASS_DEVICE is not set
> -# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
>   # CONFIG_VGA_CONSOLE is not set
>   # CONFIG_HID is not set
>   # CONFIG_USB_SUPPORT is not set
> @@ -83,8 +73,6 @@ CONFIG_RTC_DRV_JZ4740=y
>   CONFIG_DMADEVICES=y
>   CONFIG_DMA_JZ4780=y
>   # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_NVMEM=y
> -CONFIG_NVMEM_SYSFS=y
>   CONFIG_EXT4_FS=y
>   # CONFIG_DNOTIFY is not set
>   CONFIG_AUTOFS_FS=y
> @@ -109,8 +97,8 @@ CONFIG_CONSOLE_LOGLEVEL_QUIET=15
>   CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
>   CONFIG_DEBUG_INFO=y
>   CONFIG_STRIP_ASM_SYMS=y
> -CONFIG_DEBUG_FS=y
>   CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_FS=y
>   CONFIG_PANIC_ON_OOPS=y
>   CONFIG_PANIC_TIMEOUT=10
>   # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
> index cbfb62900273..e7064851a47a 100644
> --- a/arch/mips/configs/cu1830-neo_defconfig
> +++ b/arch/mips/configs/cu1830-neo_defconfig
> @@ -1,5 +1,3 @@
> -CONFIG_LOCALVERSION_AUTO=y
> -CONFIG_KERNEL_GZIP=y
>   CONFIG_SYSVIPC=y
>   CONFIG_NO_HZ_IDLE=y
>   CONFIG_HIGH_RES_TIMERS=y
> @@ -9,7 +7,6 @@ CONFIG_IKCONFIG_PROC=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_CGROUPS=y
>   CONFIG_MEMCG=y
> -CONFIG_MEMCG_KMEM=y
>   CONFIG_CGROUP_SCHED=y
>   CONFIG_CGROUP_FREEZER=y
>   CONFIG_CGROUP_DEVICE=y
> @@ -22,7 +19,7 @@ CONFIG_EMBEDDED=y
>   # CONFIG_VM_EVENT_COUNTERS is not set
>   # CONFIG_COMPAT_BRK is not set
>   CONFIG_SLAB=y
> -CONFIG_MACH_INGENIC=y
> +CONFIG_MACH_INGENIC_SOC=y
>   CONFIG_X1830_CU1830_NEO=y
>   CONFIG_HIGHMEM=y
>   CONFIG_HZ_100=y
> @@ -31,7 +28,6 @@ CONFIG_HZ_100=y
>   # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>   # CONFIG_COMPACTION is not set
>   CONFIG_CMA=y
> -CONFIG_CMA_AREAS=7
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -40,7 +36,6 @@ CONFIG_CFG80211=y
>   CONFIG_UEVENT_HELPER=y
>   CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>   CONFIG_DEVTMPFS=y
> -# CONFIG_FW_LOADER is not set
>   # CONFIG_ALLOW_DEV_COREDUMP is not set
>   CONFIG_MD=y
>   CONFIG_BLK_DEV_MD=y
> @@ -49,13 +44,11 @@ CONFIG_NETDEVICES=y
>   CONFIG_STMMAC_ETH=y
>   CONFIG_ICPLUS_PHY=y
>   CONFIG_BRCMFMAC=y
> -# CONFIG_INPUT_MOUSEDEV is not set
>   # CONFIG_INPUT_KEYBOARD is not set
>   # CONFIG_INPUT_MOUSE is not set
>   # CONFIG_SERIO is not set
>   CONFIG_VT_HW_CONSOLE_BINDING=y
>   CONFIG_LEGACY_PTY_COUNT=2
> -CONFIG_SERIAL_EARLYCON=y
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_SERIAL_8250_NR_UARTS=2
> @@ -69,8 +62,6 @@ CONFIG_GPIO_SYSFS=y
>   CONFIG_SENSORS_ADS7828=y
>   CONFIG_WATCHDOG=y
>   CONFIG_JZ4740_WDT=y
> -# CONFIG_LCD_CLASS_DEVICE is not set
> -# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
>   # CONFIG_VGA_CONSOLE is not set
>   # CONFIG_HID is not set
>   # CONFIG_USB_SUPPORT is not set
> @@ -85,8 +76,6 @@ CONFIG_RTC_DRV_JZ4740=y
>   CONFIG_DMADEVICES=y
>   CONFIG_DMA_JZ4780=y
>   # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_NVMEM=y
> -CONFIG_NVMEM_SYSFS=y
>   CONFIG_EXT4_FS=y
>   # CONFIG_DNOTIFY is not set
>   CONFIG_AUTOFS_FS=y
> @@ -111,8 +100,8 @@ CONFIG_CONSOLE_LOGLEVEL_QUIET=15
>   CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
>   CONFIG_DEBUG_INFO=y
>   CONFIG_STRIP_ASM_SYMS=y
> -CONFIG_DEBUG_FS=y
>   CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_FS=y
>   CONFIG_PANIC_ON_OOPS=y
>   CONFIG_PANIC_TIMEOUT=10
>   # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
> index 48131cb47e66..e0ee6c37f410 100644
> --- a/arch/mips/configs/gcw0_defconfig
> +++ b/arch/mips/configs/gcw0_defconfig
> @@ -4,7 +4,7 @@ CONFIG_HIGH_RES_TIMERS=y
>   CONFIG_PREEMPT_VOLUNTARY=y
>   CONFIG_EMBEDDED=y
>   CONFIG_PROFILING=y
> -CONFIG_MACH_INGENIC=y
> +CONFIG_MACH_INGENIC_SOC=y
>   CONFIG_JZ4770_GCW0=y
>   CONFIG_HIGHMEM=y
>   # CONFIG_SECCOMP is not set
> diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
> index 81bfbee72b0c..60428262ae9f 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -7,7 +7,7 @@ CONFIG_EMBEDDED=y
>   # CONFIG_VM_EVENT_COUNTERS is not set
>   # CONFIG_COMPAT_BRK is not set
>   CONFIG_SLAB=y
> -CONFIG_MACH_INGENIC=y
> +CONFIG_MACH_INGENIC_SOC=y
>   CONFIG_HZ_100=y
>   # CONFIG_SECCOMP is not set
>   CONFIG_MODULES=y
> @@ -72,7 +72,6 @@ CONFIG_DRM=y
>   CONFIG_DRM_FBDEV_OVERALLOC=200
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_DRM_INGENIC=y
> -# CONFIG_LCD_CLASS_DEVICE is not set
>   CONFIG_BACKLIGHT_CLASS_DEVICE=y
>   # CONFIG_BACKLIGHT_GENERIC is not set
>   # CONFIG_VGA_CONSOLE is not set
> @@ -170,9 +169,9 @@ CONFIG_PRINTK_TIME=y
>   CONFIG_DEBUG_INFO=y
>   CONFIG_STRIP_ASM_SYMS=y
>   CONFIG_READABLE_ASM=y
> +CONFIG_KGDB=y
>   CONFIG_DEBUG_KMEMLEAK=y
>   CONFIG_DEBUG_MEMORY_INIT=y
>   CONFIG_DEBUG_STACKOVERFLOW=y
>   CONFIG_PANIC_ON_OOPS=y
>   # CONFIG_FTRACE is not set
> -CONFIG_KGDB=y
> diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
> index de6752051ecc..dfbb9fed9a42 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -19,7 +19,7 @@ CONFIG_EMBEDDED=y
>   # CONFIG_PERF_EVENTS is not set
>   CONFIG_SLAB=y
>   CONFIG_PROFILING=y
> -CONFIG_MACH_INGENIC=y
> +CONFIG_MACH_INGENIC_SOC=y
>   CONFIG_JZ4740_RS90=y
>   CONFIG_PAGE_SIZE_16KB=y
>   CONFIG_HZ_100=y
> @@ -80,8 +80,8 @@ CONFIG_KEYBOARD_GPIO=y
>   # CONFIG_INPUT_MOUSE is not set
>   # CONFIG_SERIO is not set
>   CONFIG_LEGACY_PTY_COUNT=2
> -# CONFIG_DEVMEM is not set
>   # CONFIG_HW_RANDOM is not set
> +# CONFIG_DEVMEM is not set
>   # CONFIG_I2C_COMPAT is not set
>   # CONFIG_I2C_HELPER_AUTO is not set
>   CONFIG_POWER_SUPPLY=y
