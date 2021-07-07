Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12ACB3BE164
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhGGDTS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:18 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38713 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230188AbhGGDTR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 733BC580452;
        Tue,  6 Jul 2021 23:16:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 06 Jul 2021 23:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=GAnaSXIS2U9Oo
        L6n9RdfOWXq51u5AS/yAPKDVJYSO1k=; b=YWCYGqoXde8aF0FysqBsC/AxjC53L
        QeSuHmHbLkihFjb4STKoKQeBR35WWIpFIw9KqOaegjRf5Z9qMRjbHBEeEjHBihlC
        NltK9c5fucPXNx9fRoDdZnqAjd4OhHF3enxd8FIYuZOaReJcE/ZmGKItDyPz2LmW
        GIFdiGRAjlCtLT/6XU/ikeCOb0S9iqufakqjOIO9eIpMDvlZYuaEBHqpPoAOUBqt
        qrw1AhSjKhkLajuXjCFT6kOGmOPY7vJaLX5drBCX3LP78Lc9BD6Vn4kNLwoeHadg
        BPJZyFLf0PIsom1kxEHF5KXdXfD501IHDwjX3OkGxTelEy4Q+ojAPOI4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GAnaSXIS2U9OoL6n9RdfOWXq51u5AS/yAPKDVJYSO1k=; b=prudk+vU
        1uSwtnFw/+12NhoXcLk5P5erSqz/Z1w8jR8fYQMqeZnCBYlrHn3AuYvdfyj51Ydh
        K2w2nKJWuGft03zF06iNCeSDI9ixuiMV4adgts8bkB1PM5e5WDCHi4dLLL9QndsY
        nJePFKbRFS6PwUh7FgLg8I8o6PiJDxQccI/ZLX0Wy4CZLInHiFZ/vNMu0hvsAdhz
        55jfqKwDfTB7U67Mw5hY3gdkee2aheLOrtv5zwIPRfDC7digDwmann1jmRIjSCxW
        P6n/oYxnOhrgFIsr05w7Yxt5QuV+ucCUWka2KGph6lNn6MiUKl1PIWC5D2GTRi7D
        Hnk4u/Ii+tUIEA==
X-ME-Sender: <xms:lRzlYMKUb5KWl5S5Xh7X5cZU4AfSeLnouZl6TpnGSrbmdSiciWllJA>
    <xme:lRzlYMK-9j8UVyWF-FfSARjj3XUZWCmc_T2v9DxDgwH4L6fGBld_ncTzK7LshHrZJ
    oIpSqtji-ulAN4PIFY>
X-ME-Received: <xmr:lRzlYMvcqfl8M9GQlpBSNlYlM6Vry860Gmfg_ufum_7rjhb3fHNvnthEToN9U9zL7tgyCAWcHxJ0V11kUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:lRzlYJbQuMMoFvLEq01SVFJlDJpfqcCvmPukUn-kEHckxobqtMmQrw>
    <xmx:lRzlYDZYo_uRqsD8oqzaieRys6cTTVOqqyIg7K4dbV4zO57KdpJsoA>
    <xmx:lRzlYFCve4w77BvIdG_XgB3qC0EhZVU-Sh3GwCzwVZc_ITlIakDrzw>
    <xmx:lRzlYARkCPTrpU1B7ISpjKU_XBPykJePEeZlSMI57O3n5fd4jajP8A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:33 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 4/9] clocksource/drivers/pistachio: Make it seletable for MIPS
Date:   Wed,  7 Jul 2021 11:15:47 +0800
Message-Id: <20210707031552.20166-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kenrel.

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

