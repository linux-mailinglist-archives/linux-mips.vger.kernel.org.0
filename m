Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EC73D31AC
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhGWBpu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:45:50 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38769 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233308AbhGWBpq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:45:46 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id AB3D65808BF;
        Thu, 22 Jul 2021 22:26:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 22 Jul 2021 22:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=GDs/JfNH4KsVD
        SUz8zkXViG0OizllYpknHVtjbEEgAA=; b=Kr+InkXUKZdJ916Poj6gB6jHkRKBV
        F1EYWHM4KUJxlO2C1twPaFZ6k+3AneXL1SnAlb9wMkh7l2v0gDFrdMdUBx/HCyyx
        Rfy6ng9h3ig6JgkXDVYqStMI4hUob+TeOEB+deUiceIX3dqTnpwQoqofY0IcnfBH
        IDwf/BxjkUMz4LWeHYFc7gC/mAEu6wVmiKmYwZp/wwRJ1QvcgLiGkKdCJAr4Gm+4
        QPBcnBlopVV0pGMa2NgU+z7K+5G/X25SriVSsqXKZk1QMfiE0oCunKQF0lNiZDb6
        aVa5yWylqb2XW8HFlhGhtiTdHHzXorj0qwEiUHRYxmgDWkBcYke2bjVBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GDs/JfNH4KsVDSUz8zkXViG0OizllYpknHVtjbEEgAA=; b=PT5mhDuF
        c2wWzcQ3jcECQs1sns9qwiA+atQamoOI2RKYjsW4lkACyTA8nfqUXPK0rgkRiJ33
        oxPygByKgXKNQuwvaN3sawvja1orHpuSAvZnXkFCd+Gk37oFBr75wumPrIhcFdQb
        gFF9+7inLj5754Nfy0Tr+8ihy2o2Cbep4heK3ASZv5ew8jAugVkn7lvKlU5NyGUw
        Ljow8S8dFH5KEDNGSk5RgBU92RRvCFmhQ40emcXC9vE8PNpkOAENvRjfw+bnWzyE
        Th4a8G5eahQIoA8YV3qXYSEwez6jZFoh18GfQJQMsRqmfzw90fnv5jm1pKjPaYHH
        wMncsHv/jToAbw==
X-ME-Sender: <xms:yij6YBvqFBklcT521djTYoh9kCUKR4k5YGjM3GgI8g2GZJNoYHDR6w>
    <xme:yij6YKcLFvu5aQbIjDTCJxmQ8BKPoZ-0kmkzvJardh8fc75C291V5qvPe0vSuwQrk
    SHBXEHH5Juo5hzCPHY>
X-ME-Received: <xmr:yij6YExYLz5MGJE8Xu3_YYygK3nUEZwTzUX9KxzL_qjgHcnMUFUu9mIgwwu8nWeeL-JWqVYWoRET>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:yij6YINMcJZRjhp-Txb60-LaK23m0IIfsq3fg30DxYeAd6G3lFtDpA>
    <xmx:yij6YB8KllG6Zmf_8Xll_8WLh2BW6Nd6xvnw88wEIa7Ud3emxVQ-gg>
    <xmx:yij6YIXFdEGRUwDUCZqyt0V4zPRPBC2n_vr1WGVvMuw1ZesBpRzhmQ>
    <xmx:zCj6YC1in6k1v35NRXaoqmKtEyskQ2KXufGOhof_23UDX7pP8AF0hw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:14 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 3/9] clk: pistachio: Make it selectable for generic MIPS kernel
Date:   Fri, 23 Jul 2021 10:25:37 +0800
Message-Id: <20210723022543.4095-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
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

