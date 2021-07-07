Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2B63BE15F
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhGGDTP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:15 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55939 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230170AbhGGDTN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:13 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 01B40580452;
        Tue,  6 Jul 2021 23:16:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 06 Jul 2021 23:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=GDs/JfNH4KsVD
        SUz8zkXViG0OizllYpknHVtjbEEgAA=; b=K4L6JwUlouPS/dn8F2J0nuHF7fvKi
        rUULNpn+pgqVxt2QRO8odG8Rzo1H3lMsQy1C7E7C/u6ix8Mg7jYawGHdI8Iz2/bq
        5GtWK8InO8bzFKUFJjjd7fRkctq64+2Hea5WzCRyREH5Ab+tJUNNLu8kvirMv1k8
        JW61Iw5bT/iX5FXXfznbrWP6kxqu1cWrKCSnS2sQyYj90EUXhISqTtSnaYqCVfvD
        KLE2i1QKE5+GnXWfzwWBs+GXGurdjVTO6FUygXKWqwWyc8E6ca9SkHG+4x+9Jhtx
        fRiM5vGYb04XgNLXD+4NO+qYrFEn4w2rIUrq6DKj6HEE/lg9rucBvLuZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GDs/JfNH4KsVDSUz8zkXViG0OizllYpknHVtjbEEgAA=; b=JD9ZKW/2
        xVzfSp+j5NmttP3gJW6QxM03+5P3uWjGaLDkNQCOPJPlpDeoDQUPhcfr4Tj58Ug/
        VVKjIyCnSd//+SGhkV75V6GkXR8XqqeKynQ2G+NVDSbl4Yi9WO9eJCQOO7WmmtmN
        MB4dfCXv8nzPNTAXOJ2ScCRzSSxtLdhWVNdRJ9eKQ3uwMkrFAMcCr1Yq4J86rNpk
        MRHLYAQQls/uLI9WI7B6ilPMFtQlUAtiiMslyG5rTbM5ButYJdBhpGEglckFCggJ
        1ylx6YOPD+BPmuHfm5Ddo9wXzUFskaUkMgycsUSA6HERuqRe9u3wzwevjnQesius
        CATqcztEMNVdiQ==
X-ME-Sender: <xms:kBzlYL6-9OLVIm_LXUb7rl_NjXq4lN1Qrsr6PGH4Im6NIYZHsEd9AA>
    <xme:kBzlYA4HsmgP9yck1KL8dFbXpK0Sgdasfz4U2Dr5v9NIW_bGQREBHPXYhTQj991O0
    L_DvXdQfDtnGlBbZow>
X-ME-Received: <xmr:kBzlYCftayKVlRl1OwFi40-ZshBPlwZPqoW1PxoaM7Zb5PjXYW00cQHMaqp-NUwOSPNUBcYwvviCPIYckg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:kBzlYMJv3FVf1gZOWUMv6w9Qydtjh6f1C5kGk8E_rpeI2_EimLMbyQ>
    <xmx:kBzlYPKlXxo-NaS4aGq4w-uYd6TNaFJsvk90cEHaxXcKZrvPsq-r3A>
    <xmx:kBzlYFywz4GEMmWIxc8JRaSup6mdeZIsD32InLSV35SfvTqKnk6bYQ>
    <xmx:kBzlYMCYo_OdhZRcGb8nvZcC4HofW9APZiXm67817lel5Rv6B9BH2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:28 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 3/9] clk: pistachio: Make it selectable for generic MIPS kernel
Date:   Wed,  7 Jul 2021 11:15:46 +0800
Message-Id: <20210707031552.20166-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We're moving pistachio to generic MIPS kernel. The clk driver
should be avilable to the generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Depend on MIPS || COMPILE_TEST
---
 drivers/clk/Kconfig           | 1 +
 drivers/clk/Makefile          | 2 +-
 drivers/clk/pistachio/Kconfig | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/pistachio/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e80918be8e9c..18d31b654d02 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -389,6 +389,7 @@ source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mstar/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
+source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/ralink/Kconfig"
 source "drivers/clk/renesas/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 5f06879d7fe9..7339a9eabeb4 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -97,7 +97,7 @@ obj-y					+= mstar/
 obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
-obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
+obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
diff --git a/drivers/clk/pistachio/Kconfig b/drivers/clk/pistachio/Kconfig
new file mode 100644
index 000000000000..d00f7b4a25fc
--- /dev/null
+++ b/drivers/clk/pistachio/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config COMMON_CLK_PISTACHIO
+	bool "Support for IMG Pistachio SoC clock controllers"
+	depends on MIPS || COMPILE_TEST
+	help
+	  Support for the IMG Pistachio SoC clock controller.
+	  Say Y if you want to include clock support.
-- 
2.32.0

