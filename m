Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70D83B5202
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhF0E7a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:30 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53025 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231196AbhF0E72 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E9B875807B0;
        Sun, 27 Jun 2021 00:57:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 27 Jun 2021 00:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=WgFoz70/Esrgj
        fDgiLzMNjhpqDNBbnZfKwv0f/HH9vU=; b=CqmkzLwBpcGGo2fDUBiKfvwpvu96o
        9CLRBEbuEKKZ5hJu6+ZC7zeob49SunB4v38XwGp4dTIutp9uup6jDqcNUSjmQQ3P
        lsgQh32HOQaRuzWHTmTihaQXni956bV4CPjO3lJpKuK+cxQreUetIsoimB19+EZY
        FOhOimYWYWi2NKl5WRLklPDqOaMeDtNrEgw2PsMFSyWfWREjCaGMPmWE9NqJgOqw
        4GdezyYYd5GXXNm+zei1tVa3zdK3+DBCiUtBZjKM8FX6S1b6jBHUeJ1OstD8H4wg
        aduixdU9mey1sj/l3jn/WuxPMj+zYufUnnVL0iJy0GuN1jUppTIgz/Wyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=WgFoz70/EsrgjfDgiLzMNjhpqDNBbnZfKwv0f/HH9vU=; b=LRr1HPy6
        gMh9pYStIuoVjFpL1R1hfRGI4qQHNjjr3dKdVjYZp0jHwu0HCjtJyl3ZTtXCxOZt
        q0JtAcAlhmVy1WemCn9YR3fr1t2VwNAxUJHinKHdv6a+ahjrRNrudCKdYf9ks0II
        /Awm+2TiNW3KYUJ9QRtKwz6wM9FF0G8D8T4PLCoYSxi5Rb42YDiYGMU3hMK5CeGi
        SaWdGP1n3yD1xw+OjOeBJtTv3JIZmBEBc7t49RWIz15JHQm4JSsRYp1fR66bts1K
        pEjlqfxvU+SIx4Sx9/Ea/XT2MSR8BzdBIzEemyyoz17zRaPenleDWzMcaMqJMcmg
        TkDRk8X86Etg1Q==
X-ME-Sender: <xms:IAXYYGzUJpWO6VdQkq-IwFHh3k16p-upRf26qxKOhvDuq8QcKmHTUA>
    <xme:IAXYYCSW5yfFXDcO65h6kFtdxzN8qtD4FMS_oaeYSHN6R_MmkU5VGppWfTzDXGRnL
    75QSGwaRKADvgg7kgc>
X-ME-Received: <xmr:IAXYYIWdD6eI4UIMmhpu1FmZlzOHXOIlD0yDrDHNhc-89Hq4a2NpQCCyzyX_zPl4UVehCuKlhFI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:IAXYYMj7qvpMw58D0dYkw38Fsy_qTXl4ylIj3tu7hgEu4TLrcOIhLA>
    <xmx:IAXYYICopiFnLm_WzvL5SQszDPo4iNgwnO6JjCyGBMeMNqAEyEexgw>
    <xmx:IAXYYNJaP-Z3Z_yFtpzP5Ii-Tl0KVe405If95xMQjb-Rln8dPDhytw>
    <xmx:IAXYYM5aCMM5yIUdTeEO7zXfZifuXplzv-HETw45XaR_7CQKu3K7pg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:57:00 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/9] clk: pistachio: Make it selectable for generic MIPS kernel
Date:   Sun, 27 Jun 2021 12:56:25 +0800
Message-Id: <20210627045631.2882-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We're moving pistachio to generic MIPS kernel. The clk driver
should be avilable to the generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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
index 000000000000..efb7a7f45259
--- /dev/null
+++ b/drivers/clk/pistachio/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config COMMON_CLK_PISTACHIO
+	bool "Support for IMG Pistachio SoC clock controllers"
+	depends on MIPS
+	help
+	  Support for the IMG Pistachio SoC clock controller.
+	  Say Y if you want to include clock support.
\ No newline at end of file
-- 
2.32.0

