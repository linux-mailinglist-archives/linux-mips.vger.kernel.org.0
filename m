Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E33A340CD
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2019 09:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfFDHzB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jun 2019 03:55:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:51432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbfFDHzB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Jun 2019 03:55:01 -0400
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEA782423F;
        Tue,  4 Jun 2019 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559634899;
        bh=0KM1rBCastwj/RS+GyOJwWZQq+QU3vlZvq+pVxQiPRc=;
        h=From:To:Cc:Subject:Date:From;
        b=Vm7WxtI/DNuQ9k9LouRjg+DAur/qNnVfb0Q6lfZjkNgr/IeeJCiOStV7fEDz+BVDA
         Z6kcTcYQ1fygXl14j/daWcDqkKzXjQjzGSQsIDLp5F0qwAofNFIHqJemY1RxNi/OL2
         mXIUVV80mDxPDOEQhNwiYpCHy66UyOrzkd/X2Sck=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MIPS: configs: Remove useless UEVENT_HELPER_PATH
Date:   Tue,  4 Jun 2019 09:54:51 +0200
Message-Id: <1559634891-20075-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the CONFIG_UEVENT_HELPER_PATH because:
1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
   CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
   made default to 'n',
2. It is not recommended (help message: "This should not be used today
   [...] creates a high system load") and was kept only for ancient
   userland,
3. Certain userland specifically requests it to be disabled (systemd
   README: "Legacy hotplug slows down the system and confuses udev").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/mips/configs/ar7_defconfig             | 1 -
 arch/mips/configs/ath25_defconfig           | 1 -
 arch/mips/configs/ath79_defconfig           | 1 -
 arch/mips/configs/bcm63xx_defconfig         | 1 -
 arch/mips/configs/bigsur_defconfig          | 1 -
 arch/mips/configs/bmips_be_defconfig        | 1 -
 arch/mips/configs/bmips_stb_defconfig       | 1 -
 arch/mips/configs/cavium_octeon_defconfig   | 1 -
 arch/mips/configs/ci20_defconfig            | 1 -
 arch/mips/configs/cobalt_defconfig          | 1 -
 arch/mips/configs/fuloong2e_defconfig       | 1 -
 arch/mips/configs/ip27_defconfig            | 1 -
 arch/mips/configs/ip32_defconfig            | 1 -
 arch/mips/configs/lemote2f_defconfig        | 1 -
 arch/mips/configs/loongson1b_defconfig      | 1 -
 arch/mips/configs/loongson1c_defconfig      | 1 -
 arch/mips/configs/loongson3_defconfig       | 1 -
 arch/mips/configs/malta_defconfig           | 1 -
 arch/mips/configs/malta_kvm_defconfig       | 1 -
 arch/mips/configs/malta_kvm_guest_defconfig | 1 -
 arch/mips/configs/maltaup_xpa_defconfig     | 1 -
 arch/mips/configs/mips_paravirt_defconfig   | 1 -
 arch/mips/configs/omega2p_defconfig         | 1 -
 arch/mips/configs/pnx8335_stb225_defconfig  | 1 -
 arch/mips/configs/qi_lb60_defconfig         | 1 -
 arch/mips/configs/rb532_defconfig           | 1 -
 arch/mips/configs/rt305x_defconfig          | 1 -
 arch/mips/configs/sb1250_swarm_defconfig    | 1 -
 arch/mips/configs/tb0219_defconfig          | 1 -
 arch/mips/configs/tb0226_defconfig          | 1 -
 arch/mips/configs/tb0287_defconfig          | 1 -
 arch/mips/configs/vocore2_defconfig         | 1 -
 arch/mips/configs/xway_defconfig            | 1 -
 33 files changed, 33 deletions(-)

diff --git a/arch/mips/configs/ar7_defconfig b/arch/mips/configs/ar7_defconfig
index c83fdf649327..cef2754bd408 100644
--- a/arch/mips/configs/ar7_defconfig
+++ b/arch/mips/configs/ar7_defconfig
@@ -71,7 +71,6 @@ CONFIG_NET_ACT_POLICE=y
 CONFIG_HAMRADIO=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index 5dd6b1939e9c..c35add2fd716 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -37,7 +37,6 @@ CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_DEBUGFS=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-2
diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
index 6f981af67826..4ffc59cab436 100644
--- a/arch/mips/configs/ath79_defconfig
+++ b/arch/mips/configs/ath79_defconfig
@@ -37,7 +37,6 @@ CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_DEBUGFS=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-2
diff --git a/arch/mips/configs/bcm63xx_defconfig b/arch/mips/configs/bcm63xx_defconfig
index d22fe62adad3..54e2f9a659fb 100644
--- a/arch/mips/configs/bcm63xx_defconfig
+++ b/arch/mips/configs/bcm63xx_defconfig
@@ -34,7 +34,6 @@ CONFIG_INET=y
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
 CONFIG_MAC80211=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_MTD=y
diff --git a/arch/mips/configs/bigsur_defconfig b/arch/mips/configs/bigsur_defconfig
index 597bc0aa2653..66566026409d 100644
--- a/arch/mips/configs/bigsur_defconfig
+++ b/arch/mips/configs/bigsur_defconfig
@@ -99,7 +99,6 @@ CONFIG_BPQETHER=m
 CONFIG_BAYCOM_SER_FDX=m
 CONFIG_BAYCOM_SER_HDX=m
 CONFIG_YAM=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_FW_LOADER=m
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_CRYPTOLOOP=m
diff --git a/arch/mips/configs/bmips_be_defconfig b/arch/mips/configs/bmips_be_defconfig
index 8a91f0101134..f669a40e085b 100644
--- a/arch/mips/configs/bmips_be_defconfig
+++ b/arch/mips/configs/bmips_be_defconfig
@@ -26,7 +26,6 @@ CONFIG_INET=y
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
 CONFIG_MAC80211=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index 39adcca46bb0..a0b775893dba 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -35,7 +35,6 @@ CONFIG_INET=y
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
 CONFIG_MAC80211=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index d7abb648b8a0..b6695367aa33 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -42,7 +42,6 @@ CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_SYN_COOKIES=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 50bebce28500..cb4aa23a2bf4 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -44,7 +44,6 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
diff --git a/arch/mips/configs/cobalt_defconfig b/arch/mips/configs/cobalt_defconfig
index 20c62841827f..c6a652ad34f7 100644
--- a/arch/mips/configs/cobalt_defconfig
+++ b/arch/mips/configs/cobalt_defconfig
@@ -14,7 +14,6 @@ CONFIG_NET_KEY=y
 CONFIG_NET_KEY_MIGRATE=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_JEDECPROBE=y
 CONFIG_MTD_CFI_AMDSTD=y
diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index 8bcb61a6ec15..7a7af706e898 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -83,7 +83,6 @@ CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
 CONFIG_PHONET=m
 CONFIG_NET_9P=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_FW_LOADER=m
 CONFIG_MTD=m
 CONFIG_MTD_BLOCK=m
diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 54db5dedf776..82d942a6026e 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -91,7 +91,6 @@ CONFIG_NET_ACT_SKBEDIT=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_CDROM_PKTCDVD=m
diff --git a/arch/mips/configs/ip32_defconfig b/arch/mips/configs/ip32_defconfig
index 8f6d8af2e3c0..572cab91670c 100644
--- a/arch/mips/configs/ip32_defconfig
+++ b/arch/mips/configs/ip32_defconfig
@@ -42,7 +42,6 @@ CONFIG_INET6_ESP=m
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_NETWORK_SECMARK=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_CRYPTOLOOP=m
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index 2d4cb03dfa03..d44f1469cf64 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -77,7 +77,6 @@ CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_RFKILL_INPUT=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/mips/configs/loongson1b_defconfig b/arch/mips/configs/loongson1b_defconfig
index 3d390a7494d6..25e70423e17d 100644
--- a/arch/mips/configs/loongson1b_defconfig
+++ b/arch/mips/configs/loongson1b_defconfig
@@ -34,7 +34,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
diff --git a/arch/mips/configs/loongson1c_defconfig b/arch/mips/configs/loongson1c_defconfig
index 247d56e94c0a..3a158d4d2fab 100644
--- a/arch/mips/configs/loongson1c_defconfig
+++ b/arch/mips/configs/loongson1c_defconfig
@@ -35,7 +35,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 1322adb705c8..90ee0084d786 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -97,7 +97,6 @@ CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 CONFIG_RFKILL=m
 CONFIG_RFKILL_INPUT=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 0ee5e677662e..c9c4145c6fc0 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -215,7 +215,6 @@ CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_MESH=y
 CONFIG_RFKILL=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_CONNECTOR=m
 CONFIG_MTD=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 041bffac043b..841f19adaec7 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -220,7 +220,6 @@ CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_MESH=y
 CONFIG_RFKILL=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_CONNECTOR=m
 CONFIG_MTD=y
diff --git a/arch/mips/configs/malta_kvm_guest_defconfig b/arch/mips/configs/malta_kvm_guest_defconfig
index 511065e62182..764ba62f7a5c 100644
--- a/arch/mips/configs/malta_kvm_guest_defconfig
+++ b/arch/mips/configs/malta_kvm_guest_defconfig
@@ -217,7 +217,6 @@ CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_MESH=y
 CONFIG_RFKILL=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_CONNECTOR=m
 CONFIG_MTD=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 6c026db96ff9..de5bb1c9aeb8 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -217,7 +217,6 @@ CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_MESH=y
 CONFIG_RFKILL=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CONNECTOR=m
diff --git a/arch/mips/configs/mips_paravirt_defconfig b/arch/mips/configs/mips_paravirt_defconfig
index 8dc5d96a08de..5599cde97030 100644
--- a/arch/mips/configs/mips_paravirt_defconfig
+++ b/arch/mips/configs/mips_paravirt_defconfig
@@ -39,7 +39,6 @@ CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 # CONFIG_FW_LOADER is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
diff --git a/arch/mips/configs/omega2p_defconfig b/arch/mips/configs/omega2p_defconfig
index 0649b8f06b7c..a39426e57e91 100644
--- a/arch/mips/configs/omega2p_defconfig
+++ b/arch/mips/configs/omega2p_defconfig
@@ -42,7 +42,6 @@ CONFIG_INET=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
diff --git a/arch/mips/configs/pnx8335_stb225_defconfig b/arch/mips/configs/pnx8335_stb225_defconfig
index aa0b169800e0..738ba3b1374b 100644
--- a/arch/mips/configs/pnx8335_stb225_defconfig
+++ b/arch/mips/configs/pnx8335_stb225_defconfig
@@ -25,7 +25,6 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_INET_AH=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 199c7a7bf692..208da8a55f48 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -41,7 +41,6 @@ CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_WESTWOOD=y
 # CONFIG_TCP_CONG_HTCP is not set
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_RAW_NAND=y
diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
index 50632a3103dd..97d96117e11a 100644
--- a/arch/mips/configs/rb532_defconfig
+++ b/arch/mips/configs/rb532_defconfig
@@ -105,7 +105,6 @@ CONFIG_NET_ACT_IPT=m
 CONFIG_NET_ACT_PEDIT=m
 CONFIG_NET_CLS_IND=y
 CONFIG_HAMRADIO=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_BLOCK2MTD=y
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index 0392e38010e6..110948bc6b39 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -69,7 +69,6 @@ CONFIG_BRIDGE=y
 CONFIG_VLAN_8021Q=y
 CONFIG_NET_SCHED=y
 CONFIG_HAMRADIO=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/mips/configs/sb1250_swarm_defconfig b/arch/mips/configs/sb1250_swarm_defconfig
index ad8981666ee4..6883ea4477d4 100644
--- a/arch/mips/configs/sb1250_swarm_defconfig
+++ b/arch/mips/configs/sb1250_swarm_defconfig
@@ -43,7 +43,6 @@ CONFIG_NETWORK_SECMARK=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_FW_LOADER=m
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/mips/configs/tb0219_defconfig b/arch/mips/configs/tb0219_defconfig
index f0a11a72307e..6547f84750b5 100644
--- a/arch/mips/configs/tb0219_defconfig
+++ b/arch/mips/configs/tb0219_defconfig
@@ -28,7 +28,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/mips/configs/tb0226_defconfig b/arch/mips/configs/tb0226_defconfig
index 025e45656359..7e099f7c2286 100644
--- a/arch/mips/configs/tb0226_defconfig
+++ b/arch/mips/configs/tb0226_defconfig
@@ -26,7 +26,6 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/mips/configs/tb0287_defconfig b/arch/mips/configs/tb0287_defconfig
index 68490248e3f1..0d881dd862c0 100644
--- a/arch/mips/configs/tb0287_defconfig
+++ b/arch/mips/configs/tb0287_defconfig
@@ -30,7 +30,6 @@ CONFIG_TCP_CONG_BIC=y
 CONFIG_TCP_CONG_CUBIC=m
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/mips/configs/vocore2_defconfig b/arch/mips/configs/vocore2_defconfig
index ded3dce911d5..523b944fd527 100644
--- a/arch/mips/configs/vocore2_defconfig
+++ b/arch/mips/configs/vocore2_defconfig
@@ -42,7 +42,6 @@ CONFIG_INET=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
index 203db83c3ee9..49b5ea6eff62 100644
--- a/arch/mips/configs/xway_defconfig
+++ b/arch/mips/configs/xway_defconfig
@@ -71,7 +71,6 @@ CONFIG_BRIDGE=y
 CONFIG_VLAN_8021Q=y
 CONFIG_NET_SCHED=y
 CONFIG_HAMRADIO=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
-- 
2.7.4

