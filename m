Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAA12AA78E
	for <lists+linux-mips@lfdr.de>; Sat,  7 Nov 2020 20:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbgKGTL5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Nov 2020 14:11:57 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:10979 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgKGTL5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 7 Nov 2020 14:11:57 -0500
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Sat, 07 Nov 2020 14:11:55 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604776314;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=OPRgp9UsREfM7Mmx5OYLnZZb3CUnT2GK/fsquy1v550=;
        b=lvUkNQ7B5JUxqYoKLlEFep1zNwyPKD1UaX/s4QTJQPEyddj9JxEc/Pr8E9j9ipbrLf
        bLR47P9hYEcc1fREXStonShzcxllM1usvG+pd4Bwz1QONYpa6OYamLGK0cid05pbY90Z
        ovPj+PUFWSt/TCMItysCV/fIMeBEszXtdmgRIHBUE/OjDIT+UNEQcS2gJVbd2qZ4/7nR
        OuWvFCyhMKrsKqt6jj+g3UvYPlpIL5fy7QnY7rsF0upE55ScClrBhMPt3xyn0SpiYjyt
        x+an5XQz3PhzFDRtFSeMWtAZKdeAWChcd3A1e0L7jvzlo89wTEgYBXv6LdbTr9TlF3uw
        IsoQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXAgNkQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id d04888wA7J5p7Ts
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 7 Nov 2020 20:05:51 +0100 (CET)
Subject: Re: [PATCH 2/2] MIPS: Ingenic: Refresh defconfig for Ingenic SoCs based boards.
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20201107115251.86182-3-zhouyanjie@wanyeetech.com>
Date:   Sat, 7 Nov 2020 20:05:50 +0100
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        nixiaoming@huawei.com, paulburton@kernel.org, krzk@kernel.org,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4F963CAF-23DA-4798-8948-F3BD89B2D55E@goldelico.com>
References: <20201107115251.86182-1-zhouyanjie@wanyeetech.com> <20201107115251.86182-3-zhouyanjie@wanyeetech.com>
To:     =?utf-8?Q?=22=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29=22?= 
        <zhouyanjie@wanyeetech.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 07.11.2020 um 12:52 schrieb =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie) <zhouyanjie@wanyeetech.com>:
>=20
> 1.Refresh defconfig of CI20 to support OTG and RNG.
> 2.Refresh defconfig of CU1000-Neo to support OTG/RNG/OST/SC16IS752.
> 3.Refresh defconfig of CU1830-Neo to support OTG/DTRNG/OST/SC16IS752.
>=20
> Tested-by: =E5=91=A8=E6=AD=A3 (Zhou Zheng) <sernia.zhou@foxmail.com>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
> ---
> arch/mips/configs/ci20_defconfig       | 14 ++++++++++++--
> arch/mips/configs/cu1000-neo_defconfig | 28 =
+++++++++++++++++++++++-----
> arch/mips/configs/cu1830-neo_defconfig | 32 =
+++++++++++++++++++++++++-------
> 3 files changed, 60 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/mips/configs/ci20_defconfig =
b/arch/mips/configs/ci20_defconfig
> index 052c5ad0f2b1..80fbe57d68d4 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -49,6 +49,8 @@ CONFIG_MTD_RAW_NAND=3Dy
> CONFIG_MTD_NAND_JZ4780=3Dy
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_FASTMAP=3Dy
> +CONFIG_SCSI=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> CONFIG_NETDEVICES=3Dy
> # CONFIG_NET_VENDOR_ARC is not set
> # CONFIG_NET_VENDOR_BROADCOM is not set
> @@ -77,7 +79,6 @@ CONFIG_SERIAL_8250_NR_UARTS=3D5
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D5
> CONFIG_SERIAL_8250_INGENIC=3Dy
> CONFIG_SERIAL_OF_PLATFORM=3Dy
> -# CONFIG_HW_RANDOM is not set
> CONFIG_I2C=3Dy
> CONFIG_I2C_JZ4780=3Dy
> CONFIG_SPI=3Dy
> @@ -99,7 +100,12 @@ CONFIG_IR_GPIO_TX=3Dm
> CONFIG_MEDIA_SUPPORT=3Dm
> # CONFIG_VGA_CONSOLE is not set
> # CONFIG_HID is not set
> -# CONFIG_USB_SUPPORT is not set
> +CONFIG_USB=3Dy
> +CONFIG_USB_STORAGE=3Dy
> +CONFIG_USB_DWC2=3Dy
> +CONFIG_USB_SERIAL=3Dy
> +CONFIG_USB_SERIAL_CH341=3Dy
> +CONFIG_USB_GADGET=3Dy
> CONFIG_MMC=3Dy
> CONFIG_MMC_JZ4740=3Dy
> CONFIG_NEW_LEDS=3Dy
> @@ -131,8 +137,12 @@ CONFIG_MEMORY=3Dy
> CONFIG_JZ4780_NEMC=3Dy
> CONFIG_PWM=3Dy
> CONFIG_PWM_JZ4740=3Dm

maybe you can add

+CONFIG_JZ4780_EFUSE=3Dy

here. It was forgotten when we made the NVRAM for Ethernet working.

> +CONFIG_JZ4770_PHY=3Dy
> CONFIG_EXT4_FS=3Dy
> # CONFIG_DNOTIFY is not set
> +CONFIG_AUTOFS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_PROC_KCORE=3Dy
> # CONFIG_PROC_PAGE_MONITOR is not set
> CONFIG_TMPFS=3Dy
> diff --git a/arch/mips/configs/cu1000-neo_defconfig =
b/arch/mips/configs/cu1000-neo_defconfig
> index 55d0690a3ffe..9d75f5b77d5d 100644
> --- a/arch/mips/configs/cu1000-neo_defconfig
> +++ b/arch/mips/configs/cu1000-neo_defconfig
> @@ -25,6 +25,7 @@ CONFIG_HIGHMEM=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_SECCOMP is not set
> # CONFIG_SUSPEND is not set
> +CONFIG_MODULES=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> # CONFIG_COMPACTION is not set
> CONFIG_CMA=3Dy
> @@ -32,15 +33,17 @@ CONFIG_NET=3Dy
> CONFIG_PACKET=3Dy
> CONFIG_UNIX=3Dy
> CONFIG_INET=3Dy
> -CONFIG_CFG80211=3Dy
> +CONFIG_CFG80211=3Dm
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_SCSI=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_STMMAC_ETH=3Dy
> CONFIG_SMSC_PHY=3Dy
> -CONFIG_BRCMFMAC=3Dy
> +CONFIG_BRCMFMAC=3Dm
> # CONFIG_INPUT_KEYBOARD is not set
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_SERIO is not set
> @@ -52,16 +55,25 @@ CONFIG_SERIAL_8250_NR_UARTS=3D3
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D3
> CONFIG_SERIAL_8250_INGENIC=3Dy
> CONFIG_SERIAL_OF_PLATFORM=3Dy
> -# CONFIG_HW_RANDOM is not set
> +CONFIG_SERIAL_SC16IS7XX=3Dy
> +# CONFIG_SERIAL_SC16IS7XX_I2C is not set
> +CONFIG_SERIAL_SC16IS7XX_SPI=3Dy
> CONFIG_I2C=3Dy
> CONFIG_I2C_JZ4780=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> -CONFIG_SENSORS_ADS7828=3Dy
> +CONFIG_SENSORS_ADS7828=3Dm
> CONFIG_WATCHDOG=3Dy
> CONFIG_JZ4740_WDT=3Dy
> # CONFIG_VGA_CONSOLE is not set
> # CONFIG_HID is not set
> -# CONFIG_USB_SUPPORT is not set
> +CONFIG_USB=3Dy
> +CONFIG_USB_STORAGE=3Dy
> +CONFIG_USB_DWC2=3Dy
> +CONFIG_USB_SERIAL=3Dy
> +CONFIG_USB_SERIAL_CH341=3Dy
> +CONFIG_USB_GADGET=3Dy
> CONFIG_MMC=3Dy
> CONFIG_MMC_JZ4740=3Dy
> CONFIG_NEW_LEDS=3Dy
> @@ -72,16 +84,22 @@ CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_DRV_JZ4740=3Dy
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMA_JZ4780=3Dy
> +# CONFIG_INGENIC_TIMER is not set
> +CONFIG_INGENIC_SYSOST=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_JZ4770_PHY=3Dy
> CONFIG_EXT4_FS=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_AUTOFS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_PROC_KCORE=3Dy
> # CONFIG_PROC_PAGE_MONITOR is not set
> CONFIG_TMPFS=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NLS=3Dy
> +CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_ASCII=3Dy
> diff --git a/arch/mips/configs/cu1830-neo_defconfig =
b/arch/mips/configs/cu1830-neo_defconfig
> index e7064851a47a..29decd0003c6 100644
> --- a/arch/mips/configs/cu1830-neo_defconfig
> +++ b/arch/mips/configs/cu1830-neo_defconfig
> @@ -25,6 +25,7 @@ CONFIG_HIGHMEM=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_SECCOMP is not set
> # CONFIG_SUSPEND is not set
> +CONFIG_MODULES=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> # CONFIG_COMPACTION is not set
> CONFIG_CMA=3Dy
> @@ -32,18 +33,20 @@ CONFIG_NET=3Dy
> CONFIG_PACKET=3Dy
> CONFIG_UNIX=3Dy
> CONFIG_INET=3Dy
> -CONFIG_CFG80211=3Dy
> +CONFIG_CFG80211=3Dm
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_SCSI=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> CONFIG_MD=3Dy
> -CONFIG_BLK_DEV_MD=3Dy
> -CONFIG_BLK_DEV_DM=3Dy
> +CONFIG_BLK_DEV_MD=3Dm
> +CONFIG_BLK_DEV_DM=3Dm
> CONFIG_NETDEVICES=3Dy
> CONFIG_STMMAC_ETH=3Dy
> CONFIG_ICPLUS_PHY=3Dy
> -CONFIG_BRCMFMAC=3Dy
> +CONFIG_BRCMFMAC=3Dm
> # CONFIG_INPUT_KEYBOARD is not set
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_SERIO is not set
> @@ -55,16 +58,25 @@ CONFIG_SERIAL_8250_NR_UARTS=3D2
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D2
> CONFIG_SERIAL_8250_INGENIC=3Dy
> CONFIG_SERIAL_OF_PLATFORM=3Dy
> -# CONFIG_HW_RANDOM is not set
> +CONFIG_SERIAL_SC16IS7XX=3Dy
> +# CONFIG_SERIAL_SC16IS7XX_I2C is not set
> +CONFIG_SERIAL_SC16IS7XX_SPI=3Dy
> CONFIG_I2C=3Dy
> CONFIG_I2C_JZ4780=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> -CONFIG_SENSORS_ADS7828=3Dy
> +CONFIG_SENSORS_ADS7828=3Dm
> CONFIG_WATCHDOG=3Dy
> CONFIG_JZ4740_WDT=3Dy
> # CONFIG_VGA_CONSOLE is not set
> # CONFIG_HID is not set
> -# CONFIG_USB_SUPPORT is not set
> +CONFIG_USB=3Dy
> +CONFIG_USB_STORAGE=3Dy
> +CONFIG_USB_DWC2=3Dy
> +CONFIG_USB_SERIAL=3Dy
> +CONFIG_USB_SERIAL_CH341=3Dy
> +CONFIG_USB_GADGET=3Dy
> CONFIG_MMC=3Dy
> CONFIG_MMC_JZ4740=3Dy
> CONFIG_NEW_LEDS=3Dy
> @@ -75,16 +87,22 @@ CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_DRV_JZ4740=3Dy
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMA_JZ4780=3Dy
> +# CONFIG_INGENIC_TIMER is not set
> +CONFIG_INGENIC_SYSOST=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_JZ4770_PHY=3Dy
> CONFIG_EXT4_FS=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_AUTOFS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_PROC_KCORE=3Dy
> # CONFIG_PROC_PAGE_MONITOR is not set
> CONFIG_TMPFS=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NLS=3Dy
> +CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_ASCII=3Dy
> --=20
> 2.11.0
>=20

