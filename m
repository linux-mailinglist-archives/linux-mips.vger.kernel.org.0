Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA146118EC3
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 18:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfLJRT2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 12:19:28 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:46336 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbfLJRT2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 12:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575998365; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NEHOzUq86pm5C6FuO2HqR34lWVuZ0BvPcHxt/v7B1gk=;
        b=gIjpUySgNx7fYXuDBoDyGnQQHapKFt9KeKt85FalmI0MBYHfEdHP4sBdwGVUW3PO4x4xoL
        WAjQHTjG9PDG+MJHOErQIkdsQnAYfn7yCT9a1zuSIaUPa7asIoS61Np9L8BvoBddrUfS99
        /+rwtOjnGTvmxM8hTZ6VLZ1nDQoxZgs=
Date:   Tue, 10 Dec 2019 18:19:03 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 4/4] MIPS: Ingenic: Add YSH & ATIL CU Neo board
 support.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
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
Message-Id: <1575998343.3.2@crapouillou.net>
In-Reply-To: <1575979363-25956-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575979363-25956-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1575979363-25956-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mar., d=C3=A9c. 10, 2019 at 20:02, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yan=
jie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add a device tree for the Ingenic X1000 based YSH & ATIL CU Neo board.
> Note that this is unselectable via Kconfig until the X1000 SoC is made
> selectable in a later commit.

I believe it is now selectable via Kconfig, right?

For the whole series:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
Paul


> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v1->v2:
>     Rebase on top of mips-next, use TCU for system timer and=20
> clocksource.
>=20
>     v2->v3:
>     No change.
>=20
>     v3->v4:
>     1.Adjust "model" in "cu1000.dts" to match the description in=20
> "devices.yaml".
>     2.Adjust "bool" in "Kconfig" to avoid duplicate names with=20
> subsequent boards.
>=20
>     v4->v5:
>     1.Rename "cu1000" to "cu1000-neo" to prevent conflicts with=20
> subsequent boards
>       such as "cu1000-geo", and so on.
>     2.Remove "CONFIG_HZ=3D100" and "mem=3D32M@0x0" from defconfg.
>     3.Modify incorrect comments in DT.
>=20
>     v5->v6:
>     1.Use "stdout-path =3D "serial2:115200n8"" instead "stdout-path =3D=20
> &uart2" in DT.
>     2.Remove "console=3DttyS2,115200n8" and "CONFIG_CMDLINE_OVERRIDE=3Dy"=
=20
> from defconfg.
>=20
>     v6->v7:
>     Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
>     to "=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.=
com>" because
>     the old mailbox is in an unstable state.
>=20
>     v7->v8:
>     Merge [6/6] in v7 to this patch.
>=20
>  arch/mips/boot/dts/ingenic/Makefile       |   1 +
>  arch/mips/boot/dts/ingenic/cu1000-neo.dts |  99=20
> ++++++++++++++++++++++++++
>  arch/mips/configs/cu1000-neo_defconfig    | 111=20
> ++++++++++++++++++++++++++++++
>  arch/mips/jz4740/Kconfig                  |   4 ++
>  4 files changed, 215 insertions(+)
>  create mode 100644 arch/mips/boot/dts/ingenic/cu1000-neo.dts
>  create mode 100644 arch/mips/configs/cu1000-neo_defconfig
>=20
> diff --git a/arch/mips/boot/dts/ingenic/Makefile=20
> b/arch/mips/boot/dts/ingenic/Makefile
> index 9cc4844..e165429 100644
> --- a/arch/mips/boot/dts/ingenic/Makefile
> +++ b/arch/mips/boot/dts/ingenic/Makefile
> @@ -2,5 +2,6 @@
>  dtb-$(CONFIG_JZ4740_QI_LB60)	+=3D qi_lb60.dtb
>  dtb-$(CONFIG_JZ4770_GCW0)	+=3D gcw0.dtb
>  dtb-$(CONFIG_JZ4780_CI20)	+=3D ci20.dtb
> +dtb-$(CONFIG_X1000_CU1000_NEO)	+=3D cu1000-neo.dtb
>=20
>  obj-$(CONFIG_BUILTIN_DTB)	+=3D $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts=20
> b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> new file mode 100644
> index 00000000..b0733da
> --- /dev/null
> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "x1000.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/ingenic,tcu.h>
> +
> +/ {
> +	compatible =3D "yna,cu1000-neo", "ingenic,x1000";
> +	model =3D "YSH & ATIL General Board CU Neo";
> +
> +	aliases {
> +		serial2 =3D &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial2:115200n8";
> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x04000000>;
> +	};
> +};
> +
> +&exclk {
> +	clock-frequency =3D <24000000>;
> +};
> +
> +&tcu {
> +	/* 1500 kHz for the system timer and clocksource */
> +	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
> +	assigned-clock-rates =3D <1500000>, <1500000>;
> +
> +	/* Use channel #0 for the system timer channel #2 for the=20
> clocksource */
> +	ingenic,pwm-channels-mask =3D <0xfa>;
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_uart2>;
> +
> +	status =3D "okay";
> +};
> +
> +&mac {
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&lan8720a>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_mac>;
> +
> +	snps,reset-gpio =3D <&gpc 23 GPIO_ACTIVE_LOW>; /* PC23 */
> +	snps,reset-active-low;
> +	snps,reset-delays-us =3D <0 10000 30000>;
> +
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	status =3D "okay";
> +
> +	lan8720a: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-id0007.c0f0",=20
> "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +	};
> +};
> +
> +&msc0 {
> +	bus-width =3D <8>;
> +	max-frequency =3D <50000000>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_msc0>;
> +
> +	non-removable;
> +
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	pins_uart2: uart2 {
> +		function =3D "uart2";
> +		groups =3D "uart2-data-d";
> +		bias-disable;
> +	};
> +
> +	pins_mac: mac {
> +		function =3D "mac";
> +		groups =3D "mac";
> +		bias-disable;
> +	};
> +
> +	pins_msc0: msc0 {
> +		function =3D "mmc0";
> +		groups =3D "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/mips/configs/cu1000-neo_defconfig=20
> b/arch/mips/configs/cu1000-neo_defconfig
> new file mode 100644
> index 00000000..9f988ed
> --- /dev/null
> +++ b/arch/mips/configs/cu1000-neo_defconfig
> @@ -0,0 +1,111 @@
> +CONFIG_LOCALVERSION_AUTO=3Dy
> +CONFIG_KERNEL_GZIP=3Dy
> +CONFIG_SYSVIPC=3Dy
> +CONFIG_NO_HZ_IDLE=3Dy
> +CONFIG_HIGH_RES_TIMERS=3Dy
> +CONFIG_PREEMPT=3Dy
> +CONFIG_IKCONFIG=3Dy
> +CONFIG_IKCONFIG_PROC=3Dy
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_CGROUPS=3Dy
> +CONFIG_MEMCG=3Dy
> +CONFIG_MEMCG_KMEM=3Dy
> +CONFIG_CGROUP_SCHED=3Dy
> +CONFIG_CGROUP_FREEZER=3Dy
> +CONFIG_CGROUP_DEVICE=3Dy
> +CONFIG_CGROUP_CPUACCT=3Dy
> +CONFIG_NAMESPACES=3Dy
> +CONFIG_USER_NS=3Dy
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> +CONFIG_SYSCTL_SYSCALL=3Dy
> +CONFIG_KALLSYMS_ALL=3Dy
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLAB=3Dy
> +CONFIG_MACH_INGENIC=3Dy
> +CONFIG_X1000_CU1000_NEO=3Dy
> +CONFIG_HIGHMEM=3Dy
> +CONFIG_HZ_100=3Dy
> +# CONFIG_SECCOMP is not set
> +# CONFIG_SUSPEND is not set
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +# CONFIG_COMPACTION is not set
> +CONFIG_CMA=3Dy
> +CONFIG_CMA_AREAS=3D7
> +CONFIG_NET=3Dy
> +CONFIG_UNIX=3Dy
> +CONFIG_INET=3Dy
> +CONFIG_UEVENT_HELPER=3Dy
> +CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> +CONFIG_DEVTMPFS=3Dy
> +# CONFIG_FW_LOADER is not set
> +# CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_NETDEVICES=3Dy
> +CONFIG_STMMAC_ETH=3Dy
> +CONFIG_SMSC_PHY=3Dy
> +# CONFIG_INPUT_MOUSEDEV is not set
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> +CONFIG_LEGACY_PTY_COUNT=3D2
> +CONFIG_SERIAL_EARLYCON=3Dy
> +CONFIG_SERIAL_8250=3Dy
> +CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_8250_NR_UARTS=3D3
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D3
> +CONFIG_SERIAL_8250_INGENIC=3Dy
> +CONFIG_SERIAL_OF_PLATFORM=3Dy
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_GPIO_SYSFS=3Dy
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_JZ4740_WDT=3Dy
> +# CONFIG_HWMON is not set
> +# CONFIG_LCD_CLASS_DEVICE is not set
> +# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
> +# CONFIG_VGA_CONSOLE is not set
> +# CONFIG_HID is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_JZ4740=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_JZ4740=3Dy
> +CONFIG_DMADEVICES=3Dy
> +CONFIG_DMA_JZ4780=3Dy
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_NVMEM=3Dy
> +CONFIG_NVMEM_SYSFS=3Dy
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_DNOTIFY is not set
> +CONFIG_AUTOFS_FS=3Dy
> +CONFIG_PROC_KCORE=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_CONFIGFS_FS=3Dy
> +CONFIG_NLS=3Dy
> +CONFIG_NLS_CODEPAGE_936=3Dy
> +CONFIG_NLS_CODEPAGE_950=3Dy
> +CONFIG_NLS_ASCII=3Dy
> +CONFIG_NLS_ISO8859_1=3Dy
> +CONFIG_NLS_UTF8=3Dy
> +CONFIG_CRYPTO_ECHAINIV=3Dy
> +CONFIG_CRYPTO_AES=3Dy
> +CONFIG_CRYPTO_DEFLATE=3Dy
> +CONFIG_CRYPTO_LZO=3Dy
> +CONFIG_PRINTK_TIME=3Dy
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D15
> +CONFIG_CONSOLE_LOGLEVEL_QUIET=3D15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D7
> +CONFIG_DEBUG_INFO=3Dy
> +CONFIG_STRIP_ASM_SYMS=3Dy
> +CONFIG_DEBUG_FS=3Dy
> +CONFIG_MAGIC_SYSRQ=3Dy
> +CONFIG_PANIC_ON_OOPS=3Dy
> +CONFIG_PANIC_TIMEOUT=3D10
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +CONFIG_STACKTRACE=3Dy
> +# CONFIG_FTRACE is not set
> +CONFIG_CMDLINE_BOOL=3Dy
> +CONFIG_CMDLINE=3D"earlycon clk_ignore_unused"
> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
> index 6b96844..412d2fa 100644
> --- a/arch/mips/jz4740/Kconfig
> +++ b/arch/mips/jz4740/Kconfig
> @@ -16,6 +16,10 @@ config JZ4780_CI20
>  	bool "MIPS Creator CI20"
>  	select MACH_JZ4780
>=20
> +config X1000_CU1000_NEO
> +	bool "YSH & ATIL CU1000 Module with Neo backplane"
> +	select MACH_X1000
> +
>  endchoice
>=20
>  config MACH_JZ4740
> --
> 2.7.4
>=20

=

