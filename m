Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FE63D31B1
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbhGWBpy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:45:54 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:43075 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233324AbhGWBpw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:45:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id A0DE75808BF;
        Thu, 22 Jul 2021 22:26:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Jul 2021 22:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=JP7wdmNFOkH8l
        L9Kd1NTkGq2wgQnz+eShdtgKZ4UvNY=; b=Ki3BueC2LPKfVT8X6Gvobl0IAxmHn
        Fc+Yx111wcX1bgFXBL8HSlRmxsWdiYalmpM/iU90cxv9KebSMIeRxDPGyYk4YsS3
        peCudLfOZt8uy5uPYfGMszDmcHrNnq38VKG8Ff17akLJtdEOV5L0kzSOCS5KOU+A
        LTenvv8a2tIIeX+K/PXXXmg6quQRP5ij3Aq5k8EYx/GttL8N7S1613d9jhVYWwpU
        PlvWF8TciMpNlswdt7gvO6rwL8Xdd+Wkgw4NydqirLN3XRaEMV5vsdNXgribifBh
        pGZhRqx+Uijx76JCWakMKw50jVX7hXctGV/sFCvm8wvgtVK1R3TlEZX3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=JP7wdmNFOkH8lL9Kd1NTkGq2wgQnz+eShdtgKZ4UvNY=; b=FenKtzNa
        zSHXSxcxlZ7GdDyySB7Au00pObZojK4GxdvtST1TYFcsejn0JNS3NuWcceaeYAmn
        vTwoSDXKICssSJHWXfjDx5tKErwABWDPrpcUsIQ6ntEP7ARD8oXnz2q2UHfDQ1v4
        nWgL0GB/3FGASdIwl0fW3lfTceOnrIY+sgzuLjrwX5k7dveTUaU+7LcNQ+Pedngd
        tLhZRmqwg7P08g/vn/5aZs+bpk8xEhj0TWkyr1xOI1cHjG+s9EeeasL+Ef4UGwsz
        4cRU+ZgT3A4swijRr6NJW6DYEmyUQ7MWYNsf0/7aKSbqc7LTCgQgiDa4iGovlTB9
        9M502DBoJezTQA==
X-ME-Sender: <xms:0Sj6YAfeT-IiZm0kxeRu_fTiucQvuPlznvAyvfoOChX5eBlwEHtz_g>
    <xme:0Sj6YCPv5SVhe-huO9sP6Mdr2_5T0NbUVfcQ6P3Bwq0szj53NcMKLTfkQGAOg5NJX
    _tKPaKsLDqxWMDyI-U>
X-ME-Received: <xmr:0Sj6YBicZH3NzBCHi_Ai3P0ZQmKl9cTJYskLCweUOGP22zLU6dFw_6ilcCQjAVkRfksxAShalMhJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    udenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:0Sj6YF9yF8Pd8JOdhSqxvTvW9ffJM2F_PQoy2uHYumkxRIMzbBEbyw>
    <xmx:0Sj6YMvQlC-dPsMLjDd11HanGDbjIT46vI9MkdHQIlFUECHwWQgnmA>
    <xmx:0Sj6YMHk_fu45PDw6jdsoj2w5A4cO-L6bDgs740lSoCW-CsDOenD-Q>
    <xmx:0Sj6YNkrzYqGgEsAv70ZLWvG8DLea1RGTBsdnz92TToaemweIewWmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:21 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 4/9] clocksource/drivers/pistachio: Make it selectable for MIPS
Date:   Fri, 23 Jul 2021 10:25:38 +0800
Message-Id: <20210723022543.4095-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/clocksource/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 39aa21d01e05..58ad7af8c673 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -234,8 +234,9 @@ config CLKSRC_LPC32XX
 	  Support for the LPC32XX clocksource.
 
 config CLKSRC_PISTACHIO
-	bool "Clocksource for Pistachio SoC" if COMPILE_TEST
+	bool "Clocksource for Pistachio SoC"
 	depends on HAS_IOMEM
+	depends on MIPS || COMPILE_TEST
 	select TIMER_OF
 	help
 	  Enables the clocksource for the Pistachio SoC.
-- 
2.32.0

