Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B596B116FDC
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 16:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfLIPHm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 10:07:42 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:47868 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPHm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 10:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575904058; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xwHOmmEeu2eYACHyX+W/1JmkDRO9vyXjLPc/BjErkck=;
        b=YCqcLXE2zvQ3KaiUaxSq7tlr7q3DETPMjvUQ72aQfBuZhq56kpwgGbViI4A0q6x33sZUun
        kjc6+vQCJEGccXOSBqOgzLggfl3CEAQGyy27kxDP5P5YY3l3xbbl5/bjgtkEP+mK1sSkaV
        /fpHPvT7mJDAkIDWGiwLayoa9j1Lqb4=
Date:   Mon, 09 Dec 2019 16:07:28 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 6/6] MIPS: CU1000: Add devicetree & config with
 PDMA/MSC/RTC/WDT/NET enabled.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        ebiederm@xmission.com, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Message-Id: <1575904048.3.2@crapouillou.net>
In-Reply-To: <1575896438-9562-7-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1575896438-9562-7-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

You modify here in patch [06/06] two files that were introduced in=20
[04/06]. Just merge the two patches into one then, and make it last in=20
the patchset.

-Paul


Le lun., d=C3=A9c. 9, 2019 at 21:00, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanj=
ie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add the CU1000 Neo devicetree and defconfig with PDMA, MMC, RTC, WDT
> and NET enabled.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v7:
>     New patch, merge[06/12],[08/12],[10/12],[12/12] in v6.
>=20
>  arch/mips/boot/dts/ingenic/cu1000-neo.dts | 47=20
> +++++++++++++++++++++++++++++++
>  arch/mips/configs/cu1000-neo_defconfig    | 17 +++++++++--
>  2 files changed, 62 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts=20
> b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> index 6f1a7e9..b0733da 100644
> --- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> @@ -43,10 +43,57 @@
>  	status =3D "okay";
>  };
>=20
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
>  &pinctrl {
>  	pins_uart2: uart2 {
>  		function =3D "uart2";
>  		groups =3D "uart2-data-d";
>  		bias-disable;
>  	};
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
>  };
> diff --git a/arch/mips/configs/cu1000-neo_defconfig=20
> b/arch/mips/configs/cu1000-neo_defconfig
> index 4fafe92..9f988ed 100644
> --- a/arch/mips/configs/cu1000-neo_defconfig
> +++ b/arch/mips/configs/cu1000-neo_defconfig
> @@ -16,8 +16,6 @@ CONFIG_CGROUP_DEVICE=3Dy
>  CONFIG_CGROUP_CPUACCT=3Dy
>  CONFIG_NAMESPACES=3Dy
>  CONFIG_USER_NS=3Dy
> -CONFIG_BLK_DEV_INITRD=3Dy
> -CONFIG_INITRAMFS_SOURCE=3D"arch/mips/boot/ramdisk.cpio.gz"
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>  CONFIG_SYSCTL_SYSCALL=3Dy
>  CONFIG_KALLSYMS_ALL=3Dy
> @@ -35,11 +33,17 @@ CONFIG_HZ_100=3Dy
>  # CONFIG_COMPACTION is not set
>  CONFIG_CMA=3Dy
>  CONFIG_CMA_AREAS=3D7
> +CONFIG_NET=3Dy
> +CONFIG_UNIX=3Dy
> +CONFIG_INET=3Dy
>  CONFIG_UEVENT_HELPER=3Dy
>  CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
>  CONFIG_DEVTMPFS=3Dy
>  # CONFIG_FW_LOADER is not set
>  # CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_NETDEVICES=3Dy
> +CONFIG_STMMAC_ETH=3Dy
> +CONFIG_SMSC_PHY=3Dy
>  # CONFIG_INPUT_MOUSEDEV is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
> @@ -55,17 +59,26 @@ CONFIG_SERIAL_8250_INGENIC=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  # CONFIG_HW_RANDOM is not set
>  CONFIG_GPIO_SYSFS=3Dy
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_JZ4740_WDT=3Dy
>  # CONFIG_HWMON is not set
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  # CONFIG_BACKLIGHT_CLASS_DEVICE is not set
>  # CONFIG_VGA_CONSOLE is not set
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_JZ4740=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_JZ4740=3Dy
> +CONFIG_DMADEVICES=3Dy
> +CONFIG_DMA_JZ4780=3Dy
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_NVMEM=3Dy
>  CONFIG_NVMEM_SYSFS=3Dy
>  CONFIG_EXT4_FS=3Dy
>  # CONFIG_DNOTIFY is not set
> +CONFIG_AUTOFS_FS=3Dy
>  CONFIG_PROC_KCORE=3Dy
>  # CONFIG_PROC_PAGE_MONITOR is not set
>  CONFIG_TMPFS=3Dy
> --
> 2.7.4
>=20

=

