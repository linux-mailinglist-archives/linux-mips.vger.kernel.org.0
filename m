Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF432AAB05
	for <lists+linux-mips@lfdr.de>; Sun,  8 Nov 2020 13:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgKHMsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 07:48:16 -0500
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:43863 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgKHMsP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Nov 2020 07:48:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0755932|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.235119-0.0038911-0.76099;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=18;RT=18;SR=0;TI=SMTPD_---.Iu5FFCC_1604839687;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Iu5FFCC_1604839687)
          by smtp.aliyun-inc.com(10.147.41.138);
          Sun, 08 Nov 2020 20:48:08 +0800
Subject: Re: [PATCH 2/2] MIPS: Ingenic: Refresh defconfig for Ingenic SoCs
 based boards.
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        nixiaoming@huawei.com, paulburton@kernel.org, krzk@kernel.org,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20201107115251.86182-1-zhouyanjie@wanyeetech.com>
 <20201107115251.86182-3-zhouyanjie@wanyeetech.com>
 <4F963CAF-23DA-4798-8948-F3BD89B2D55E@goldelico.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <fea3a4f9-dcd3-296d-6f3e-f45bae763d30@wanyeetech.com>
Date:   Sun, 8 Nov 2020 20:48:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4F963CAF-23DA-4798-8948-F3BD89B2D55E@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Nikolaus,

On 2020/11/8 上午3:05, H. Nikolaus Schaller wrote:
>> Am 07.11.2020 um 12:52 schrieb 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>:
>>
>> 1.Refresh defconfig of CI20 to support OTG and RNG.
>> 2.Refresh defconfig of CU1000-Neo to support OTG/RNG/OST/SC16IS752.
>> 3.Refresh defconfig of CU1830-Neo to support OTG/DTRNG/OST/SC16IS752.
>>
>> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>> arch/mips/configs/ci20_defconfig       | 14 ++++++++++++--
>> arch/mips/configs/cu1000-neo_defconfig | 28 +++++++++++++++++++++++-----
>> arch/mips/configs/cu1830-neo_defconfig | 32 +++++++++++++++++++++++++-------
>> 3 files changed, 60 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
>> index 052c5ad0f2b1..80fbe57d68d4 100644
>> --- a/arch/mips/configs/ci20_defconfig
>> +++ b/arch/mips/configs/ci20_defconfig
>> @@ -49,6 +49,8 @@ CONFIG_MTD_RAW_NAND=y
>> CONFIG_MTD_NAND_JZ4780=y
>> CONFIG_MTD_UBI=y
>> CONFIG_MTD_UBI_FASTMAP=y
>> +CONFIG_SCSI=y
>> +CONFIG_BLK_DEV_SD=y
>> CONFIG_NETDEVICES=y
>> # CONFIG_NET_VENDOR_ARC is not set
>> # CONFIG_NET_VENDOR_BROADCOM is not set
>> @@ -77,7 +79,6 @@ CONFIG_SERIAL_8250_NR_UARTS=5
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=5
>> CONFIG_SERIAL_8250_INGENIC=y
>> CONFIG_SERIAL_OF_PLATFORM=y
>> -# CONFIG_HW_RANDOM is not set
>> CONFIG_I2C=y
>> CONFIG_I2C_JZ4780=y
>> CONFIG_SPI=y
>> @@ -99,7 +100,12 @@ CONFIG_IR_GPIO_TX=m
>> CONFIG_MEDIA_SUPPORT=m
>> # CONFIG_VGA_CONSOLE is not set
>> # CONFIG_HID is not set
>> -# CONFIG_USB_SUPPORT is not set
>> +CONFIG_USB=y
>> +CONFIG_USB_STORAGE=y
>> +CONFIG_USB_DWC2=y
>> +CONFIG_USB_SERIAL=y
>> +CONFIG_USB_SERIAL_CH341=y
>> +CONFIG_USB_GADGET=y
>> CONFIG_MMC=y
>> CONFIG_MMC_JZ4740=y
>> CONFIG_NEW_LEDS=y
>> @@ -131,8 +137,12 @@ CONFIG_MEMORY=y
>> CONFIG_JZ4780_NEMC=y
>> CONFIG_PWM=y
>> CONFIG_PWM_JZ4740=m
> maybe you can add
>
> +CONFIG_JZ4780_EFUSE=y
>
> here. It was forgotten when we made the NVRAM for Ethernet working.


Sure, I will add it in the next version.


>> +CONFIG_JZ4770_PHY=y
>> CONFIG_EXT4_FS=y
>> # CONFIG_DNOTIFY is not set
>> +CONFIG_AUTOFS_FS=y
>> +CONFIG_VFAT_FS=y
>> +CONFIG_FAT_DEFAULT_UTF8=y
>> CONFIG_PROC_KCORE=y
>> # CONFIG_PROC_PAGE_MONITOR is not set
>> CONFIG_TMPFS=y
>> diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
>> index 55d0690a3ffe..9d75f5b77d5d 100644
>> --- a/arch/mips/configs/cu1000-neo_defconfig
>> +++ b/arch/mips/configs/cu1000-neo_defconfig
>> @@ -25,6 +25,7 @@ CONFIG_HIGHMEM=y
>> CONFIG_HZ_100=y
>> # CONFIG_SECCOMP is not set
>> # CONFIG_SUSPEND is not set
>> +CONFIG_MODULES=y
>> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>> # CONFIG_COMPACTION is not set
>> CONFIG_CMA=y
>> @@ -32,15 +33,17 @@ CONFIG_NET=y
>> CONFIG_PACKET=y
>> CONFIG_UNIX=y
>> CONFIG_INET=y
>> -CONFIG_CFG80211=y
>> +CONFIG_CFG80211=m
>> CONFIG_UEVENT_HELPER=y
>> CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>> CONFIG_DEVTMPFS=y
>> # CONFIG_ALLOW_DEV_COREDUMP is not set
>> +CONFIG_SCSI=y
>> +CONFIG_BLK_DEV_SD=y
>> CONFIG_NETDEVICES=y
>> CONFIG_STMMAC_ETH=y
>> CONFIG_SMSC_PHY=y
>> -CONFIG_BRCMFMAC=y
>> +CONFIG_BRCMFMAC=m
>> # CONFIG_INPUT_KEYBOARD is not set
>> # CONFIG_INPUT_MOUSE is not set
>> # CONFIG_SERIO is not set
>> @@ -52,16 +55,25 @@ CONFIG_SERIAL_8250_NR_UARTS=3
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3
>> CONFIG_SERIAL_8250_INGENIC=y
>> CONFIG_SERIAL_OF_PLATFORM=y
>> -# CONFIG_HW_RANDOM is not set
>> +CONFIG_SERIAL_SC16IS7XX=y
>> +# CONFIG_SERIAL_SC16IS7XX_I2C is not set
>> +CONFIG_SERIAL_SC16IS7XX_SPI=y
>> CONFIG_I2C=y
>> CONFIG_I2C_JZ4780=y
>> +CONFIG_SPI=y
>> +CONFIG_SPI_GPIO=y
>> CONFIG_GPIO_SYSFS=y
>> -CONFIG_SENSORS_ADS7828=y
>> +CONFIG_SENSORS_ADS7828=m
>> CONFIG_WATCHDOG=y
>> CONFIG_JZ4740_WDT=y
>> # CONFIG_VGA_CONSOLE is not set
>> # CONFIG_HID is not set
>> -# CONFIG_USB_SUPPORT is not set
>> +CONFIG_USB=y
>> +CONFIG_USB_STORAGE=y
>> +CONFIG_USB_DWC2=y
>> +CONFIG_USB_SERIAL=y
>> +CONFIG_USB_SERIAL_CH341=y
>> +CONFIG_USB_GADGET=y
>> CONFIG_MMC=y
>> CONFIG_MMC_JZ4740=y
>> CONFIG_NEW_LEDS=y
>> @@ -72,16 +84,22 @@ CONFIG_RTC_CLASS=y
>> CONFIG_RTC_DRV_JZ4740=y
>> CONFIG_DMADEVICES=y
>> CONFIG_DMA_JZ4780=y
>> +# CONFIG_INGENIC_TIMER is not set
>> +CONFIG_INGENIC_SYSOST=y
>> # CONFIG_IOMMU_SUPPORT is not set
>> +CONFIG_JZ4770_PHY=y
>> CONFIG_EXT4_FS=y
>> # CONFIG_DNOTIFY is not set
>> CONFIG_AUTOFS_FS=y
>> +CONFIG_VFAT_FS=y
>> +CONFIG_FAT_DEFAULT_UTF8=y
>> CONFIG_PROC_KCORE=y
>> # CONFIG_PROC_PAGE_MONITOR is not set
>> CONFIG_TMPFS=y
>> CONFIG_CONFIGFS_FS=y
>> CONFIG_NFS_FS=y
>> CONFIG_NLS=y
>> +CONFIG_NLS_CODEPAGE_437=y
>> CONFIG_NLS_CODEPAGE_936=y
>> CONFIG_NLS_CODEPAGE_950=y
>> CONFIG_NLS_ASCII=y
>> diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
>> index e7064851a47a..29decd0003c6 100644
>> --- a/arch/mips/configs/cu1830-neo_defconfig
>> +++ b/arch/mips/configs/cu1830-neo_defconfig
>> @@ -25,6 +25,7 @@ CONFIG_HIGHMEM=y
>> CONFIG_HZ_100=y
>> # CONFIG_SECCOMP is not set
>> # CONFIG_SUSPEND is not set
>> +CONFIG_MODULES=y
>> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>> # CONFIG_COMPACTION is not set
>> CONFIG_CMA=y
>> @@ -32,18 +33,20 @@ CONFIG_NET=y
>> CONFIG_PACKET=y
>> CONFIG_UNIX=y
>> CONFIG_INET=y
>> -CONFIG_CFG80211=y
>> +CONFIG_CFG80211=m
>> CONFIG_UEVENT_HELPER=y
>> CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>> CONFIG_DEVTMPFS=y
>> # CONFIG_ALLOW_DEV_COREDUMP is not set
>> +CONFIG_SCSI=y
>> +CONFIG_BLK_DEV_SD=y
>> CONFIG_MD=y
>> -CONFIG_BLK_DEV_MD=y
>> -CONFIG_BLK_DEV_DM=y
>> +CONFIG_BLK_DEV_MD=m
>> +CONFIG_BLK_DEV_DM=m
>> CONFIG_NETDEVICES=y
>> CONFIG_STMMAC_ETH=y
>> CONFIG_ICPLUS_PHY=y
>> -CONFIG_BRCMFMAC=y
>> +CONFIG_BRCMFMAC=m
>> # CONFIG_INPUT_KEYBOARD is not set
>> # CONFIG_INPUT_MOUSE is not set
>> # CONFIG_SERIO is not set
>> @@ -55,16 +58,25 @@ CONFIG_SERIAL_8250_NR_UARTS=2
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=2
>> CONFIG_SERIAL_8250_INGENIC=y
>> CONFIG_SERIAL_OF_PLATFORM=y
>> -# CONFIG_HW_RANDOM is not set
>> +CONFIG_SERIAL_SC16IS7XX=y
>> +# CONFIG_SERIAL_SC16IS7XX_I2C is not set
>> +CONFIG_SERIAL_SC16IS7XX_SPI=y
>> CONFIG_I2C=y
>> CONFIG_I2C_JZ4780=y
>> +CONFIG_SPI=y
>> +CONFIG_SPI_GPIO=y
>> CONFIG_GPIO_SYSFS=y
>> -CONFIG_SENSORS_ADS7828=y
>> +CONFIG_SENSORS_ADS7828=m
>> CONFIG_WATCHDOG=y
>> CONFIG_JZ4740_WDT=y
>> # CONFIG_VGA_CONSOLE is not set
>> # CONFIG_HID is not set
>> -# CONFIG_USB_SUPPORT is not set
>> +CONFIG_USB=y
>> +CONFIG_USB_STORAGE=y
>> +CONFIG_USB_DWC2=y
>> +CONFIG_USB_SERIAL=y
>> +CONFIG_USB_SERIAL_CH341=y
>> +CONFIG_USB_GADGET=y
>> CONFIG_MMC=y
>> CONFIG_MMC_JZ4740=y
>> CONFIG_NEW_LEDS=y
>> @@ -75,16 +87,22 @@ CONFIG_RTC_CLASS=y
>> CONFIG_RTC_DRV_JZ4740=y
>> CONFIG_DMADEVICES=y
>> CONFIG_DMA_JZ4780=y
>> +# CONFIG_INGENIC_TIMER is not set
>> +CONFIG_INGENIC_SYSOST=y
>> # CONFIG_IOMMU_SUPPORT is not set
>> +CONFIG_JZ4770_PHY=y
>> CONFIG_EXT4_FS=y
>> # CONFIG_DNOTIFY is not set
>> CONFIG_AUTOFS_FS=y
>> +CONFIG_VFAT_FS=y
>> +CONFIG_FAT_DEFAULT_UTF8=y
>> CONFIG_PROC_KCORE=y
>> # CONFIG_PROC_PAGE_MONITOR is not set
>> CONFIG_TMPFS=y
>> CONFIG_CONFIGFS_FS=y
>> CONFIG_NFS_FS=y
>> CONFIG_NLS=y
>> +CONFIG_NLS_CODEPAGE_437=y
>> CONFIG_NLS_CODEPAGE_936=y
>> CONFIG_NLS_CODEPAGE_950=y
>> CONFIG_NLS_ASCII=y
>> -- 
>> 2.11.0
>>
