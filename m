Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9E9A2E92
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbfH3EfY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:35:24 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:43897 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726480AbfH3EfY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:35:24 -0400
Received: from mxback4g.mail.yandex.net (mxback4g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:165])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 168BB6681213;
        Fri, 30 Aug 2019 07:35:20 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback4g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id WKrtwAmmS7-ZJi4Ix3V;
        Fri, 30 Aug 2019 07:35:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139720;
        bh=56yIpBaPTcDpv+2CSHxhnG2/tslm4Nn5nP6/+R6e3HA=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=HzETLpJBlOHA5npFmzCnlY0iLOyLFv41EjIztmbuupLVIKYv2dNOy1FfjSm11aqDO
         68q0ysN4z1LE9ZJpGgeXlMgJWhM2+QSSRBEqro+WdaN81E6uWQ/zMbM4jTwLSWOK9y
         btv2ZzeIKCbeZE5HbZdVDpl15pBxYFy9Cys4e4EQ=
Authentication-Results: mxback4g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-ZADGa7Ue;
        Fri, 30 Aug 2019 07:35:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 16/18] MIPS: Loongson: Regenerate defconfigs
Date:   Fri, 30 Aug 2019 12:32:30 +0800
Message-Id: <20190830043232.20191-11-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We've touched kconfig a lot in previous patches.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/fuloong2e_defconfig |  8 +++-----
 arch/mips/configs/lemote2f_defconfig  |  8 ++------
 arch/mips/configs/loongson3_defconfig | 12 ++++--------
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index 7a7af706e898..ae8a904ef812 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -15,8 +15,7 @@ CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
-CONFIG_MACH_LOONGSON64=y
-CONFIG_PCI=y
+CONFIG_MACH_LOONGSON2EF=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 # CONFIG_SUSPEND is not set
@@ -36,8 +35,6 @@ CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_NET_IPIP=m
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
@@ -83,6 +80,7 @@ CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
 CONFIG_PHONET=m
 CONFIG_NET_9P=m
+CONFIG_PCI=y
 CONFIG_FW_LOADER=m
 CONFIG_MTD=m
 CONFIG_MTD_BLOCK=m
@@ -142,6 +140,7 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C=m
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_VIAPRO=m
+CONFIG_GPIOLIB=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_RADEON=y
@@ -217,7 +216,6 @@ CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_AUTHENC=m
-CONFIG_CRYPTO_GCM=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index d44f1469cf64..0cbe1240314d 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -12,11 +12,10 @@ CONFIG_LOG_BUF_SHIFT=15
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
-CONFIG_MACH_LOONGSON64=y
+CONFIG_MACH_LOONGSON2EF=y
 CONFIG_LEMOTE_MACH2F=y
 CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
-CONFIG_PCI=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_HIBERNATION=y
@@ -26,7 +25,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_BLK_DEV_INTEGRITY=y
-CONFIG_IOSCHED_DEADLINE=m
 CONFIG_BINFMT_MISC=m
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -44,9 +42,6 @@ CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_SYN_COOKIES=y
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
 CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_BIC=y
 CONFIG_DEFAULT_BIC=y
@@ -77,6 +72,7 @@ CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_RFKILL_INPUT=y
+CONFIG_PCI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 90ee0084d786..66fb44b4d845 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -24,15 +24,9 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_SYSCTL_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_MACH_LOONGSON64=y
-CONFIG_LOONGSON_MACH3X=y
 CONFIG_SMP=y
 CONFIG_HZ_256=y
 CONFIG_KEXEC=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-# CONFIG_PCIEAER is not set
-CONFIG_PCIEASPM_PERFORMANCE=y
-CONFIG_HOTPLUG_PCI=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_MODULES=y
@@ -41,8 +35,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_IOSCHED_DEADLINE=m
-CONFIG_CFQ_GROUP_IOSCHED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_KSM=y
 CONFIG_NET=y
@@ -97,6 +89,10 @@ CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 CONFIG_RFKILL=m
 CONFIG_RFKILL_INPUT=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_PCIEASPM_PERFORMANCE=y
+CONFIG_HOTPLUG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=m
-- 
2.22.0

