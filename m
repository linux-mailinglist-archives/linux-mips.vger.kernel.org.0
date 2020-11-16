Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF572B4EA2
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 18:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730836AbgKPRzz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 12:55:55 -0500
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:47874 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387494AbgKPRzz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Nov 2020 12:55:55 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08091198|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.13833-0.00180808-0.859862;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=18;RT=18;SR=0;TI=SMTPD_---.IxVP79y_1605549334;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IxVP79y_1605549334)
          by smtp.aliyun-inc.com(10.147.41.121);
          Tue, 17 Nov 2020 01:55:49 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ak@linux.intel.com, krzk@kernel.org,
        ebiederm@xmission.com, hns@goldelico.com, paulburton@kernel.org,
        nixiaoming@huawei.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v2 2/2] MIPS: Ingenic: Refresh defconfig for Ingenic SoCs based boards.
Date:   Tue, 17 Nov 2020 01:55:08 +0800
Message-Id: <20201116175508.51943-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201116175508.51943-1-zhouyanjie@wanyeetech.com>
References: <20201116175508.51943-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Refresh defconfig of CI20 to support OTG and RNG.
2.Refresh defconfig of CU1000-Neo to support OTG/RNG/OST/SC16IS752.
3.Refresh defconfig of CU1830-Neo to support OTG/DTRNG/OST/SC16IS752.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Tested by: H. Nikolaus Schaller <hns@goldelico.com> # CI20/jz4780
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Select CONFIG_JZ4780_EFUSE as default.

 arch/mips/configs/ci20_defconfig       | 15 +++++++++++++--
 arch/mips/configs/cu1000-neo_defconfig | 28 +++++++++++++++++++++++-----
 arch/mips/configs/cu1830-neo_defconfig | 32 +++++++++++++++++++++++++-------
 3 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 052c5ad0f2b1..ab7ebb066834 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -49,6 +49,8 @@ CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_JZ4780=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_FASTMAP=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
@@ -77,7 +79,6 @@ CONFIG_SERIAL_8250_NR_UARTS=5
 CONFIG_SERIAL_8250_RUNTIME_UARTS=5
 CONFIG_SERIAL_8250_INGENIC=y
 CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_JZ4780=y
 CONFIG_SPI=y
@@ -99,7 +100,12 @@ CONFIG_IR_GPIO_TX=m
 CONFIG_MEDIA_SUPPORT=m
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
-# CONFIG_USB_SUPPORT is not set
+CONFIG_USB=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CH341=y
+CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
 CONFIG_NEW_LEDS=y
@@ -131,8 +137,13 @@ CONFIG_MEMORY=y
 CONFIG_JZ4780_NEMC=y
 CONFIG_PWM=y
 CONFIG_PWM_JZ4740=m
+CONFIG_JZ4780_EFUSE=y
+CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
+CONFIG_AUTOFS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
 CONFIG_PROC_KCORE=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_TMPFS=y
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 55d0690a3ffe..9d75f5b77d5d 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -25,6 +25,7 @@ CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
 # CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+CONFIG_MODULES=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
@@ -32,15 +33,17 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_CFG80211=y
+CONFIG_CFG80211=m
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_STMMAC_ETH=y
 CONFIG_SMSC_PHY=y
-CONFIG_BRCMFMAC=y
+CONFIG_BRCMFMAC=m
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
@@ -52,16 +55,25 @@ CONFIG_SERIAL_8250_NR_UARTS=3
 CONFIG_SERIAL_8250_RUNTIME_UARTS=3
 CONFIG_SERIAL_8250_INGENIC=y
 CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
+CONFIG_SERIAL_SC16IS7XX=y
+# CONFIG_SERIAL_SC16IS7XX_I2C is not set
+CONFIG_SERIAL_SC16IS7XX_SPI=y
 CONFIG_I2C=y
 CONFIG_I2C_JZ4780=y
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
-CONFIG_SENSORS_ADS7828=y
+CONFIG_SENSORS_ADS7828=m
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
-# CONFIG_USB_SUPPORT is not set
+CONFIG_USB=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CH341=y
+CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
 CONFIG_NEW_LEDS=y
@@ -72,16 +84,22 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
+# CONFIG_INGENIC_TIMER is not set
+CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
+CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
 CONFIG_PROC_KCORE=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_CODEPAGE_950=y
 CONFIG_NLS_ASCII=y
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index e7064851a47a..29decd0003c6 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -25,6 +25,7 @@ CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
 # CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+CONFIG_MODULES=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
@@ -32,18 +33,20 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_CFG80211=y
+CONFIG_CFG80211=m
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_BLK_DEV_DM=y
+CONFIG_BLK_DEV_MD=m
+CONFIG_BLK_DEV_DM=m
 CONFIG_NETDEVICES=y
 CONFIG_STMMAC_ETH=y
 CONFIG_ICPLUS_PHY=y
-CONFIG_BRCMFMAC=y
+CONFIG_BRCMFMAC=m
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
@@ -55,16 +58,25 @@ CONFIG_SERIAL_8250_NR_UARTS=2
 CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_INGENIC=y
 CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
+CONFIG_SERIAL_SC16IS7XX=y
+# CONFIG_SERIAL_SC16IS7XX_I2C is not set
+CONFIG_SERIAL_SC16IS7XX_SPI=y
 CONFIG_I2C=y
 CONFIG_I2C_JZ4780=y
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
-CONFIG_SENSORS_ADS7828=y
+CONFIG_SENSORS_ADS7828=m
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
-# CONFIG_USB_SUPPORT is not set
+CONFIG_USB=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CH341=y
+CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
 CONFIG_NEW_LEDS=y
@@ -75,16 +87,22 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
+# CONFIG_INGENIC_TIMER is not set
+CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
+CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
 CONFIG_PROC_KCORE=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_CODEPAGE_950=y
 CONFIG_NLS_ASCII=y
-- 
2.11.0

