Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A333B51F6
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhF0E7S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:18 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45147 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231133AbhF0E7S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 61EB35807B3;
        Sun, 27 Jun 2021 00:56:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 27 Jun 2021 00:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=r3qhoAmAxV9Zf
        2wb/yIVFCBti1RuuU/Z06V8xV+UraI=; b=R3ITGxo84R4OVJhFPBZnUCik9Zk9/
        DUq2Ija/HlLtOZFfvOOOqB5BLOUfRWpyA42h3A66BVkSZfDK1URs5GcaUbF8sPY/
        0ppEFqUtWEjKnIG1O1lyvLM7Mt5Iiq97LJNX9ytU1ng8475QcBNKLIX5l+RUUZKL
        6NATjxhJ8O/MHimlBwOnlzfthvylJpPCmydfFWSSxHDMDTqMxA2o+VAlt+eeEPyM
        tCcsjZ+UDuJXrQH0zH8AWMwKxFO2LK0GJDQg0hLwTyiSvc2z5IblEC84QM0pS+X0
        FObBSKmQEPzjTgYxZ9Ez7HFZJcHheGotNbI2Ue7mu5XFjun4aXthGdfVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=r3qhoAmAxV9Zf2wb/yIVFCBti1RuuU/Z06V8xV+UraI=; b=bm9LSyj9
        YOyVIDdLODXPskWcn1i1/ajdrco+dSEioCFxsHNa/8yNc9y1l5rA4S0M6P1tONdF
        nY827uiRaa/MmoqdkSgP3BMxvhqdN5HSpGX4fDfDJaCyb6fQy0p+ZKkB/WxEEfEg
        +W4UE2skk5YAY5PNu2cKthVcFehUR6u8+fCNmsJHglgQYwfHypHfqDUOcsj/4uK6
        IlVxCfm4yLtYpZfwMY/6j594VRswqchfiljOdEMA1kHqmVngb9OEpxTNzFCdtk4P
        GFWk1aFF2AQlh9/d1bQegjgdxNF9VtyCtdzD50INiXyLsZ1NqTzIBPYPm5JhC7gO
        PxKzAYaLi/ajGw==
X-ME-Sender: <xms:FgXYYN5eW7dOuj94emlhz4ByoCPXRhKXEUxJFgcNnV7_mdg6jFK_rw>
    <xme:FgXYYK70wGlYZpO7Y67a_lwFSQ3dp57Im2jGGiu4swnzM2J_a2W-lXBp5NCzr5anp
    ii9KIQVp6j8GVXexuA>
X-ME-Received: <xmr:FgXYYEfaxM6rsisAE3yN4qi6rhIideMUarUQ4C1nkrd4ls1ahkc8tg2uagXXzubj0rAUH2WHG6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeelgffhtdejfedthfdtfe
    dutdelveevheetteffvdeugfdtjeffgeekiefgudefleenucffohhmrghinhepihhtshdr
    shgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjh
    hirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:FgXYYGImRPbjtO31IOd7bOTXaoHurRwOxLEnq1dhCxjftzBjemqUWQ>
    <xmx:FgXYYBIoHLC1JUzwQznofgYrCEjr3_K6Fay4QeYK0iFXpDdcH2b5DQ>
    <xmx:FgXYYPzXe1VQRIh8F3i7UKUPTf9eEqRQkO0E-Llgy-yNXTpVEnxv3A>
    <xmx:FgXYYODiBGhCgoqgSRKpRxcSbIq8VI6aNqi81rmQLSnJ72kPANx_nQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:56:49 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/9] MIPS: generic: Allow generating FIT image for Marduk board
Date:   Sun, 27 Jun 2021 12:56:23 +0800
Message-Id: <20210627045631.2882-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Marduk is based on IMG pistachio SoC. The platform is using
MIPS UHI booting protocol and does have a proper devicetree
implement, thus it could be a part of generic kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/Makefile          |  1 +
 arch/mips/boot/dts/img/Makefile      |  2 ++
 arch/mips/generic/Kconfig            |  6 ++++++
 arch/mips/generic/Platform           |  1 +
 arch/mips/generic/board-marduk.its.S | 22 ++++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 arch/mips/generic/board-marduk.its.S

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 60bd7d2a9ad8..188301164d9e 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -2,6 +2,7 @@
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
 subdir-$(CONFIG_MACH_PISTACHIO)		+= img
+subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
 subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
 subdir-$(CONFIG_LANTIQ)			+= lantiq
diff --git a/arch/mips/boot/dts/img/Makefile b/arch/mips/boot/dts/img/Makefile
index 441a3c16efb0..24f6bbeadd48 100644
--- a/arch/mips/boot/dts/img/Makefile
+++ b/arch/mips/boot/dts/img/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= boston.dtb
 
+dtb-$(CONFIG_FIT_IMAGE_FDT_MARDUK)	+= pistachio_marduk.dtb
+
 dtb-$(CONFIG_MACH_PISTACHIO)	+= pistachio_marduk.dtb
 obj-$(CONFIG_MACH_PISTACHIO)	+= pistachio_marduk.dtb.o
diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 657dd93c5e76..7dc5b3821cc6 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -58,6 +58,12 @@ config FIT_IMAGE_FDT_BOSTON
 	  enable this if you wish to boot on a MIPS Boston board, as it is
 	  expected by the bootloader.
 
+config FIT_IMAGE_FDT_MARDUK
+	bool "Include FDT for IMG Pistachio Marduk (CI40) boards"
+	help
+	  Enable this to include the FDT for the IMG Pistachio Marduk (CI40)
+	  from Imagination Technologies in the FIT kernel image.
+
 config FIT_IMAGE_FDT_NI169445
 	bool "Include FDT for NI 169445"
 	help
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index b871af16b5b6..e1abc113b409 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -24,3 +24,4 @@ its-$(CONFIG_FIT_IMAGE_FDT_LUTON)	+= board-luton.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_JAGUAR2)	+= board-jaguar2.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_SERVAL)	+= board-serval.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= board-xilfpga.its.S
+its-$(CONFIG_FIT_IMAGE_FDT_MARDUK)	+= board-marduk.its.S
diff --git a/arch/mips/generic/board-marduk.its.S b/arch/mips/generic/board-marduk.its.S
new file mode 100644
index 000000000000..4f633794db90
--- /dev/null
+++ b/arch/mips/generic/board-marduk.its.S
@@ -0,0 +1,22 @@
+/ {
+	images {
+		fdt-marduk {
+			description = "img,pistachio-marduk Device Tree";
+			data = /incbin/("boot/dts/img/pistachio_marduk.dtb");
+			type = "flat_dt";
+			arch = "mips";
+			compression = "none";
+			hash {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-marduk {
+			description = "Marduk Linux kernel";
+			kernel = "kernel";
+			fdt = "fdt-marduk";
+		};
+	};
+};
-- 
2.32.0

