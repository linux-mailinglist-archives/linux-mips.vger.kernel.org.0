Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612513BE16E
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhGGDT1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:27 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35055 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230099AbhGGDT0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id DB65B580452;
        Tue,  6 Jul 2021 23:16:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Jul 2021 23:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=E+Q3jJXoaXwDI
        JPG6GplM8tmB+spkJC75M4I54KAlkE=; b=Pp1GjGE9deTlAQ9T+zsaKLr+NArE0
        a8w89XskEEnidVA7MezVkpaUGDpXjzilwo7dzXZtTHt9GdI373NIS1Ng74vE1mP/
        mW5h8WAWhMtSStGBEk1zx5nazYDbRzrgDExoYqUbDrS2gEDmoP6LFTzRqhpy3bV9
        LgYbwNeUlHCS8c+x/Rq8AXDSIQuoltaJUsnZiJPO21gUAq3pjhWCNKWQ3euK/8UR
        yiAP7bkTcpPEdEYXh3zBfzmnJUrxWhutyBy7lLBDSADH0BDyrTI4YMsGduEF4lzn
        c9JkzSWc/CA3d+1LD4i9ujDgRYS7qKB0KvD8qFefU3J5L+MZyhWLhF6Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=E+Q3jJXoaXwDIJPG6GplM8tmB+spkJC75M4I54KAlkE=; b=LMLTeR4E
        RauNG7DoUaUETspSK6U+0x9hji+anbLdpjqdzZ2M5EsjT8dBMdJKQzpQF1cgkKdt
        6CBwmlIzbj3zeFuBQU30loUqINFXkxG6vgsQJ0GHXWk9V9GhTg8YB+aL4GiOeCAp
        ndBKt9JtqrMj0ClEhHtsB6T+ZWAGq6+up8+mfPHowrOlIRomThRIOAtVMfM1Hgcj
        WIR4F3dSJvvXEhWtrHIrgCF3oeM8BR343XNRwaiq1qFz/GBVDHLo2ne9LOKNJEoi
        5UEHpj+cgG9YqRjcXJ6LmboYi/O/xxHZNMTNS9rY6MRcqhvxJD5rcANea/HyY9Su
        gddapOq1JpRq7w==
X-ME-Sender: <xms:nhzlYGugFMU-WbhC0NQvNxOIN2Adj1E1Jh0WPRMAEGDzkzj80RiBdQ>
    <xme:nhzlYLeLgmYBXG-4kFPbp5V73yGMXidsDwEaURKzZUC0Yhnvu2ZsxXwen3Gl6avH8
    pNR5IkMdl8JGbntAKk>
X-ME-Received: <xmr:nhzlYBw_MGU3XRD1viC__e9GpUM2welksrCYxvIkduqGxa4RyN-rdCOZ9WIcft2FRce15jBmL7zqV_pvRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    udenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:nhzlYBNz8Sg5sOfDeJby6DeNBP6WVblOCVe7WA-PQjhOlYNBT4-3Ng>
    <xmx:nhzlYG_V-CehhufkYHVxKMlV_kEmIqnTaPjdzaa8TxOafCa8v7dH7Q>
    <xmx:nhzlYJU27xnqZSAvbEkcNwMmdQXu7LnzvaoCas3iJmFEXgUZVkvH8w>
    <xmx:nhzlYH2hi_5MMfxNse6FHZMQnHMlCUvsJjGZWJmusRGLv-kWXa3tew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:42 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 6/9] pinctrl: pistachio: Make it as a option
Date:   Wed,  7 Jul 2021 11:15:49 +0800
Message-Id: <20210707031552.20166-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/pinctrl/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..a189f1b3da5c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -248,12 +248,15 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_PISTACHIO
-	def_bool y if MACH_PISTACHIO
+	bool "IMG Pistachio SoC pinctrl driver"
+	depends on MIPS || COMPILE_TEST
 	depends on GPIOLIB
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
+    help
+	  This support pinctrl and gpio driver for IMG Pistachio SoC.
 
 config PINCTRL_ST
 	bool
-- 
2.32.0

