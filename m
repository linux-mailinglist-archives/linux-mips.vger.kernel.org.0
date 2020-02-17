Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DDE16185A
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 17:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgBQQ4m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 11:56:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:45078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbgBQQ4m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Feb 2020 11:56:42 -0500
Received: from localhost.localdomain (unknown [194.230.155.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FFAF20725;
        Mon, 17 Feb 2020 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581958601;
        bh=Edvx6KbF8UjElss9iYmaIvA5mtFtMhntgr5ab8Lgl/g=;
        h=From:To:Cc:Subject:Date:From;
        b=ubA0du5n7XqckDVKPrx7Qs0rSXq/UUmcCp2JKGCl94grdLcYnBovlzl8TDo2OKbqG
         3KUiYJSkRAi48djgR1lqqqTuhXc7ey4fbEEbRmVanG3Sg2A8szJI9APB+9rM4JAJ9i
         OoZjr23gp8ovaUWEpjCbo96KbShIe1kACeUmMBg8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] MIPS: configs: Cleanup old Kconfig options
Date:   Mon, 17 Feb 2020 17:56:34 +0100
Message-Id: <20200217165634.5362-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_MTD_NAND_IDS is gone and not needed (part of CONFIG_MTD_NAND)
since commit f16bd7ca0457 ("mtd: nand: Kill the MTD_NAND_IDS Kconfig
option").

CONFIG_IOSCHED_DEADLINE, CONFIG_IOSCHED_CFQ and CONFIG_DEFAULT_NOOP are
gone since commit f382fb0bcef4 ("block: remove legacy IO schedulers").

The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
now enabled by default (along with MQ_IOSCHED_KYBER).

The BFQ_GROUP_IOSCHED is the only multiqueue scheduler which comes with
group scheduling so select it in configs previously choosing
CFQ_GROUP_IOSCHED.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

Changes since v1:
1. Add Philippe's review.
---
 arch/mips/configs/ar7_defconfig                 | 1 -
 arch/mips/configs/ath25_defconfig               | 1 -
 arch/mips/configs/ath79_defconfig               | 1 -
 arch/mips/configs/bcm63xx_defconfig             | 2 --
 arch/mips/configs/bmips_be_defconfig            | 2 --
 arch/mips/configs/bmips_stb_defconfig           | 2 --
 arch/mips/configs/db1xxx_defconfig              | 1 -
 arch/mips/configs/generic/board-ni169445.config | 1 -
 arch/mips/configs/lasat_defconfig               | 2 --
 arch/mips/configs/lemote2f_defconfig            | 2 +-
 arch/mips/configs/loongson3_defconfig           | 5 +++--
 arch/mips/configs/msp71xx_defconfig             | 2 --
 arch/mips/configs/pnx8335_stb225_defconfig      | 2 --
 arch/mips/configs/rb532_defconfig               | 1 -
 arch/mips/configs/rt305x_defconfig              | 1 -
 arch/mips/configs/xway_defconfig                | 1 -
 16 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/arch/mips/configs/ar7_defconfig b/arch/mips/configs/ar7_defconfig
index cef2754bd408..cf9c6329b807 100644
--- a/arch/mips/configs/ar7_defconfig
+++ b/arch/mips/configs/ar7_defconfig
@@ -21,7 +21,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BSD_DISKLABEL=y
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index c35add2fd716..7143441f5476 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -22,7 +22,6 @@ CONFIG_HZ_100=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
index 4ffc59cab436..3d14d67dc746 100644
--- a/arch/mips/configs/ath79_defconfig
+++ b/arch/mips/configs/ath79_defconfig
@@ -23,7 +23,6 @@ CONFIG_PCI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/mips/configs/bcm63xx_defconfig b/arch/mips/configs/bcm63xx_defconfig
index 54e2f9a659fb..861f680184b9 100644
--- a/arch/mips/configs/bcm63xx_defconfig
+++ b/arch/mips/configs/bcm63xx_defconfig
@@ -21,8 +21,6 @@ CONFIG_PCI=y
 CONFIG_PCCARD=y
 CONFIG_PCMCIA_BCM63XX=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
diff --git a/arch/mips/configs/bmips_be_defconfig b/arch/mips/configs/bmips_be_defconfig
index f669a40e085b..032bb51defe8 100644
--- a/arch/mips/configs/bmips_be_defconfig
+++ b/arch/mips/configs/bmips_be_defconfig
@@ -12,8 +12,6 @@ CONFIG_NR_CPUS=4
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index a0b775893dba..625bd2d7e685 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -21,8 +21,6 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_BMIPS_CPUFREQ=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
index bc9b6ae046b2..e6f3e8e3da39 100644
--- a/arch/mips/configs/db1xxx_defconfig
+++ b/arch/mips/configs/db1xxx_defconfig
@@ -28,7 +28,6 @@ CONFIG_PCMCIA_ALCHEMY_DEVBOARD=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_BLK_DEV_BSGLIB=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_DEFAULT_NOOP=y
 CONFIG_CMA=y
 CONFIG_CMA_DEBUG=y
 CONFIG_NET=y
diff --git a/arch/mips/configs/generic/board-ni169445.config b/arch/mips/configs/generic/board-ni169445.config
index 1ed0d3e8715e..fc3580e4e6bc 100644
--- a/arch/mips/configs/generic/board-ni169445.config
+++ b/arch/mips/configs/generic/board-ni169445.config
@@ -19,7 +19,6 @@ CONFIG_MTD_NAND_ECC_SW_HAMMING=y
 CONFIG_MTD_NAND_ECC_SW_BCH=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPIO=y
-CONFIG_MTD_NAND_IDS=y
 
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_BLOCK=y
diff --git a/arch/mips/configs/lasat_defconfig b/arch/mips/configs/lasat_defconfig
index c66ca3785655..00cf461db971 100644
--- a/arch/mips/configs/lasat_defconfig
+++ b/arch/mips/configs/lasat_defconfig
@@ -16,8 +16,6 @@ CONFIG_HZ_1000=y
 # CONFIG_SECCOMP is not set
 CONFIG_PCI=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index f9f93427c9bd..8254d7d1396f 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -26,7 +26,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_BLK_DEV_INTEGRITY=y
-CONFIG_IOSCHED_DEADLINE=m
+CONFIG_MQ_IOSCHED_DEADLINE=m
 CONFIG_BINFMT_MISC=m
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 360c6b2d397a..51675f5000d6 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -38,8 +38,9 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_IOSCHED_DEADLINE=m
-CONFIG_CFQ_GROUP_IOSCHED=y
+CONFIG_MQ_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_BFQ=y
+CONFIG_BFQ_GROUP_IOSCHED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_KSM=y
 CONFIG_NET=y
diff --git a/arch/mips/configs/msp71xx_defconfig b/arch/mips/configs/msp71xx_defconfig
index 0fdc03fda12e..6ad1a2381226 100644
--- a/arch/mips/configs/msp71xx_defconfig
+++ b/arch/mips/configs/msp71xx_defconfig
@@ -14,8 +14,6 @@ CONFIG_PCI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_UNIX=y
 CONFIG_XFRM_USER=y
diff --git a/arch/mips/configs/pnx8335_stb225_defconfig b/arch/mips/configs/pnx8335_stb225_defconfig
index 738ba3b1374b..d06db6b87959 100644
--- a/arch/mips/configs/pnx8335_stb225_defconfig
+++ b/arch/mips/configs/pnx8335_stb225_defconfig
@@ -14,8 +14,6 @@ CONFIG_HZ_128=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
index 5b947183852b..252d472387aa 100644
--- a/arch/mips/configs/rb532_defconfig
+++ b/arch/mips/configs/rb532_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_MAC_PARTITION=y
 CONFIG_BSD_DISKLABEL=y
-# CONFIG_IOSCHED_CFQ is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index 110948bc6b39..8c2ead53007a 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -21,7 +21,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_COREDUMP is not set
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
index 49b5ea6eff62..9abbc0debc2a 100644
--- a/arch/mips/configs/xway_defconfig
+++ b/arch/mips/configs/xway_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_COREDUMP is not set
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
-- 
2.17.1

