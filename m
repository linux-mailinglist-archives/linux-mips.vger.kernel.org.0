Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5943D06F8
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhGUCWL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:22:11 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:32791 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231394AbhGUCVi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:38 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id CAD892B00505;
        Tue, 20 Jul 2021 23:02:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 20 Jul 2021 23:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=GDs/JfNH4KsVD
        SUz8zkXViG0OizllYpknHVtjbEEgAA=; b=rixyaawfcIJhjLBzuGTZYe9NTZ+HE
        Dmp/Eu47mF9abPzBncbyBu6XPWl++i5qHZ6d8izs6OK9m7TC39k32mcoMRFUs+x8
        0OVokVOxGgQltLtz4Fgm4p4DORW6MyL0jMb8v6OqI6Ycc39CxPbP+pysya3SnZT+
        5xoecNah+JqHUnEzIcK2T4CxIcLalK8oNYv3vU7bzP9RhRG90PWxnOeGd+xyY3Xa
        Q0m4kd07rD9CfTAqPREALhzg0ANsbJAAngvJmqXsqjEDO0nah51QfP2IR1d+eqOJ
        Cf/Xa4aIh0Z4H/tyk3EQ2COE0wthoBDf/IF46UbvaOWmLSIXzPlvkFpvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GDs/JfNH4KsVDSUz8zkXViG0OizllYpknHVtjbEEgAA=; b=d3M3lYBl
        FRaD+DbFUmStFLfjfQQqFEzBnCED63G9DGKYXiVXzokygc4035XuNDR5ISsLr+Uv
        DwjpCGhgW0KrROszJ/+pjqpRrS7q2cfFOuezrFoC8Elko3a/Cc9yxGJ9TOuOFiBW
        Ul1ZxxJxNJXoJQc4UHUqESsblKsAnUWUveF+NJh9v4S0arUtl9do0JvGeao9hIBj
        bIBwQn6FajzRz/o93bN1m10BD4U8i1MqK3PW1FTKr0iumJL8lf/Z+eWz2hgmKrf0
        IfwNJFFRC2N7FW0GWGywl/vuVwIjvddKV1VN0H+nfH3+zTbSnxElxyFtvuzS/7Ed
        V6rFxe2bjMiQLw==
X-ME-Sender: <xms:NI73YA276IokicYfqxYAgZh00Z6LdeUfH9lvxnnJ4zADGDQnBYkAsg>
    <xme:NI73YLFuFzur_vxDW4xE5HVv46rz4rwSNU5xpO0TBZkuVcDvEi3vlxVwGz8ZTmW3I
    tUK7nbKbrk7Z1-nVMI>
X-ME-Received: <xmr:NI73YI5_-bbHNujC7TAAsFKkx7nTA1jbVCJoqzHWI3OCyDvOU0zfLddXH4wWYZnm3Etz7Q42XAe->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:NI73YJ1PoBA-eReD_zGqXKY8LmenX6VmiWJOns6dcgYnnuNqw31ZbQ>
    <xmx:NI73YDG4yOL4HGC5YrN1eq9fmrbCZiTqYEy3Sqn6UJ-G7AXDJWGjZQ>
    <xmx:NI73YC8PBbFoZzphNnUhh6ejPAUP_cejmlYUnYmY_dbBx6hxHHZg1w>
    <xmx:NI73YL-4AY36HCdFxtQEcMmbx-LLA890cF77aHt4lGyNKcY3g4aeSiFbBzo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:02:08 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 3/9] clk: pistachio: Make it selectable for generic MIPS kernel
Date:   Wed, 21 Jul 2021 11:01:28 +0800
Message-Id: <20210721030134.10562-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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

