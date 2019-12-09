Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE115116D78
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 14:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfLINBQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 08:01:16 -0500
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:51685 "EHLO
        out28-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727746AbfLINBP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 08:01:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07893191|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0390381-0.0034777-0.957484;DS=CONTINUE|ham_alarm|0.00877232-0.000346047-0.990882;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03303;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.GDcmOki_1575896441;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GDcmOki_1575896441)
          by smtp.aliyun-inc.com(10.147.41.138);
          Mon, 09 Dec 2019 21:01:03 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, ebiederm@xmission.com, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v7 6/6] MIPS: CU1000: Add devicetree & config with PDMA/MSC/RTC/WDT/NET enabled.
Date:   Mon,  9 Dec 2019 21:00:38 +0800
Message-Id: <1575896438-9562-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the CU1000 Neo devicetree and defconfig with PDMA, MMC, RTC, WDT
and NET enabled.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v7:
    New patch, merge[06/12],[08/12],[10/12],[12/12] in v6.

 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 47 +++++++++++++++++++++++++++++++
 arch/mips/configs/cu1000-neo_defconfig    | 17 +++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index 6f1a7e9..b0733da 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -43,10 +43,57 @@
 	status = "okay";
 };
 
+&mac {
+	phy-mode = "rmii";
+	phy-handle = <&lan8720a>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_mac>;
+
+	snps,reset-gpio = <&gpc 23 GPIO_ACTIVE_LOW>; /* PC23 */
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 30000>;
+
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+
+	lan8720a: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.c0f0", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&msc0 {
+	bus-width = <8>;
+	max-frequency = <50000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_msc0>;
+
+	non-removable;
+
+	status = "okay";
+};
+
 &pinctrl {
 	pins_uart2: uart2 {
 		function = "uart2";
 		groups = "uart2-data-d";
 		bias-disable;
 	};
+
+	pins_mac: mac {
+		function = "mac";
+		groups = "mac";
+		bias-disable;
+	};
+
+	pins_msc0: msc0 {
+		function = "mmc0";
+		groups = "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
+		bias-disable;
+	};
 };
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 4fafe92..9f988ed 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -16,8 +16,6 @@ CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="arch/mips/boot/ramdisk.cpio.gz"
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL_SYSCALL=y
 CONFIG_KALLSYMS_ALL=y
@@ -35,11 +33,17 @@ CONFIG_HZ_100=y
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
 CONFIG_CMA_AREAS=7
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_SMSC_PHY=y
 # CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -55,17 +59,26 @@ CONFIG_SERIAL_8250_INGENIC=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_GPIO_SYSFS=y
+CONFIG_WATCHDOG=y
+CONFIG_JZ4740_WDT=y
 # CONFIG_HWMON is not set
 # CONFIG_LCD_CLASS_DEVICE is not set
 # CONFIG_BACKLIGHT_CLASS_DEVICE is not set
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_JZ4740=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_JZ4740=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_NVMEM=y
 CONFIG_NVMEM_SYSFS=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
+CONFIG_AUTOFS_FS=y
 CONFIG_PROC_KCORE=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_TMPFS=y
-- 
2.7.4

