Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AED3D5497
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jul 2021 09:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhGZHH1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jul 2021 03:07:27 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:15999 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhGZHH0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jul 2021 03:07:26 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GYBlG4DtVzZsyD;
        Mon, 26 Jul 2021 15:44:26 +0800 (CST)
Received: from dggema764-chm.china.huawei.com (10.1.198.206) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 15:47:52 +0800
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 dggema764-chm.china.huawei.com (10.1.198.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 26 Jul 2021 15:47:51 +0800
From:   Zenghui Yu <yuzenghui@huawei.com>
To:     <akpm@linux-foundation.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
        <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux@armlinux.org.uk>, <tsbogend@alpha.franken.de>,
        <James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
        <hpa@zytor.com>, <wanghaibin.wang@huawei.com>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] configs: Remove the obsolete CONFIG_INPUT_POLLDEV
Date:   Mon, 26 Jul 2021 15:47:41 +0800
Message-ID: <20210726074741.1062-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema764-chm.china.huawei.com (10.1.198.206)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This CONFIG option was removed in commit 278b13ce3a89 ("Input: remove
input_polled_dev implementation") so there's no point to keep it in
defconfigs any longer.

Get rid of the leftover for all arches.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 arch/arm/configs/dove_defconfig             | 1 -
 arch/arm/configs/pxa_defconfig              | 1 -
 arch/mips/configs/lemote2f_defconfig        | 1 -
 arch/mips/configs/pic32mzda_defconfig       | 1 -
 arch/mips/configs/rt305x_defconfig          | 1 -
 arch/mips/configs/xway_defconfig            | 1 -
 arch/parisc/configs/generic-32bit_defconfig | 1 -
 arch/x86/configs/i386_defconfig             | 1 -
 arch/x86/configs/x86_64_defconfig           | 1 -
 9 files changed, 9 deletions(-)

diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index b935162a8bba..33074fdab2ea 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -56,7 +56,6 @@ CONFIG_ATA=y
 CONFIG_SATA_MV=y
 CONFIG_NETDEVICES=y
 CONFIG_MV643XX_ETH=y
-CONFIG_INPUT_POLLDEV=y
 # CONFIG_INPUT_MOUSEDEV is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 363f1b1b08e3..58f4834289e6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -284,7 +284,6 @@ CONFIG_RT2800USB=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_INPUT_FF_MEMLESS=m
-CONFIG_INPUT_POLLDEV=y
 CONFIG_INPUT_MATRIXKMAP=y
 CONFIG_INPUT_MOUSEDEV=m
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index aaf9d5e0aa2c..791894c4d8fb 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -116,7 +116,6 @@ CONFIG_8139TOO=y
 CONFIG_R8169=y
 CONFIG_USB_USBNET=m
 CONFIG_USB_NET_CDC_EEM=m
-CONFIG_INPUT_POLLDEV=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_MOUSE_PS2_ALPS is not set
 # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
diff --git a/arch/mips/configs/pic32mzda_defconfig b/arch/mips/configs/pic32mzda_defconfig
index 63fe2da1b37f..fd567247adc7 100644
--- a/arch/mips/configs/pic32mzda_defconfig
+++ b/arch/mips/configs/pic32mzda_defconfig
@@ -34,7 +34,6 @@ CONFIG_SCSI_CONSTANTS=y
 CONFIG_SCSI_SCAN_ASYNC=y
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_INPUT_LEDS=m
-CONFIG_INPUT_POLLDEV=y
 CONFIG_INPUT_MOUSEDEV=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_EVBUG=m
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index fec5851c164b..eb359db15dba 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -90,7 +90,6 @@ CONFIG_PPPOE=m
 CONFIG_PPP_ASYNC=m
 CONFIG_ISDN=y
 CONFIG_INPUT=m
-CONFIG_INPUT_POLLDEV=m
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_MISC=y
diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
index 9abbc0debc2a..eeb689f715cb 100644
--- a/arch/mips/configs/xway_defconfig
+++ b/arch/mips/configs/xway_defconfig
@@ -96,7 +96,6 @@ CONFIG_PPPOE=m
 CONFIG_PPP_ASYNC=m
 CONFIG_ISDN=y
 CONFIG_INPUT=m
-CONFIG_INPUT_POLLDEV=m
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_MISC=y
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 7611d48c599e..dd14e3131325 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -111,7 +111,6 @@ CONFIG_PPP_BSDCOMP=m
 CONFIG_PPP_DEFLATE=m
 CONFIG_PPPOE=m
 # CONFIG_WLAN is not set
-CONFIG_INPUT_POLLDEV=y
 CONFIG_KEYBOARD_HIL_OLD=m
 CONFIG_KEYBOARD_HIL=m
 CONFIG_MOUSE_SERIAL=y
diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index 9c9c4a888b1d..e81885384f60 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -156,7 +156,6 @@ CONFIG_FORCEDETH=y
 CONFIG_8139TOO=y
 # CONFIG_8139TOO_PIO is not set
 CONFIG_R8169=y
-CONFIG_INPUT_POLLDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TABLET=y
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index b60bd2d86034..e8a7a0af2bda 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -148,7 +148,6 @@ CONFIG_SKY2=y
 CONFIG_FORCEDETH=y
 CONFIG_8139TOO=y
 CONFIG_R8169=y
-CONFIG_INPUT_POLLDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TABLET=y
-- 
2.19.1

