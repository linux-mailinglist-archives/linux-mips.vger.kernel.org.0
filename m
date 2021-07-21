Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A1E3D06E0
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhGUCV0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:21:26 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:54379 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230338AbhGUCVY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:24 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 885D42B00505;
        Tue, 20 Jul 2021 23:02:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 20 Jul 2021 23:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=r3qhoAmAxV9Zf
        2wb/yIVFCBti1RuuU/Z06V8xV+UraI=; b=ANffn3fRWDlU8sjAcwDVB+FHXQC77
        aNhSy4VoSe76LYq/5WXnAJsdrG9NYXbqh4TCTGqmpFle6Qshz3JYr6O/dBwaXH5B
        vuJDuv2bBzgERx7nslnPeCRebOYO8sTyatqwq9y2zNBwup6gGf+LCYj3jsXYb16N
        7X1ew0/HlTlImgWPHUzidIDDF41kGMM0xDmm8c5OehqgRRR6emWHDhpFX20ytnxc
        9U8GiYmJ6VzISd60L6Wf/HItHj/iRqUJ+P/9IEMfe6X0d5QkYyp7kkL9gnNsqjgj
        fwp8UckxkgIcP7/cSoY8SPYQRtHCsAlYrbEw323POPg89Q65lf2KCrEJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=r3qhoAmAxV9Zf2wb/yIVFCBti1RuuU/Z06V8xV+UraI=; b=MdHxQzUQ
        7Hmqcjnb973KfLoWU+BpBCx+PVEa+/c5EIVLVvibpoFyVjcPpIs9w0HdaqSk8MJz
        OfhdZ1PdOraK7dLRvuzd1wG9NMZKMTQ1Q6cdxFhe+gDXykyFibFnhZTFG48iwu7R
        RvBRIzweMdFQrjPBOfF20L2cQ6d/qJrLHa1ouotNwn01wpqw9loLeQ4RvnwfaMZA
        HB99kS39eJVnrLamWoXBvy/afVyHVNNkoQADbHmLfItpZEps6kGnTub2ybw5MQNs
        QiweFuogE1FPxL7+g+cF/QComPJIyGVLn1uaaryYnKJ+3micG9jAwV7m+x0X9txZ
        N323uHVbODEu8A==
X-ME-Sender: <xms:J473YGOvZEzSaFucR4KJ3EMY1KQGQ8HroelabPf0r3FMAG7B_MskLQ>
    <xme:J473YE-7q8389mlc96xqsOsShGVUrpnRKhRKubKAdRS0jm7ibYhZnIkmn-rNYyG6C
    coayvPxjcQUauZedkM>
X-ME-Received: <xmr:J473YNQSnAKV1iVcOjR5s4SHKf1rT1bHT7CCSYIi-FCQhRR2epWjtioT7H4xoceAzwk5yIPv0l5p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnheplefghfdtjeeftdfhtdefud
    dtleevveehteetffdvuefgtdejffegkeeigfdufeelnecuffhomhgrihhnpehithhsrdhs
    sgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjih
    grgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:KI73YGvosc3ZgXgWP-qfamDThmSfvEU1YgAITP4rAskBUqIpiHm4vw>
    <xmx:KI73YOfbd7S4z0kETlY8Enb7DXxESUZZ1QfIQIWxhK9O4QO9g1Lw8w>
    <xmx:KI73YK3HdBIahzUSPp-6uY6tbTQEpy0p7Xt8wWX8rQPt6jha1hF34g>
    <xmx:KI73YPU1OZfWTgXHi9JBdg_PhRHTtBleyqGx86ij9iI2hmLagVFNOql8gic>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:01:55 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 1/9] MIPS: generic: Allow generating FIT image for Marduk board
Date:   Wed, 21 Jul 2021 11:01:26 +0800
Message-Id: <20210721030134.10562-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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

