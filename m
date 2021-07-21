Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60FD63D0704
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhGUCW6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:22:58 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:60299 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231428AbhGUCVp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id C1FB62B004FC;
        Tue, 20 Jul 2021 23:02:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 20 Jul 2021 23:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=JP7wdmNFOkH8l
        L9Kd1NTkGq2wgQnz+eShdtgKZ4UvNY=; b=BFTunTblAEdjUGPqhSlP5t9FX2HRs
        u62W47k7fbQ8FD4NIuMV1yK2KhJYdcm9IAEoWzuPmcLBsKq7sP0yQPbBldj1sjy+
        zVyZVniuqUUfRD0HJ8wyfXA1K1pvZzEqlBxd8KywKDJuN/dgscFTlE/uY0bhi2U0
        EegoQZXrYB5p+n2Y2V3VvOQSckIxBadqQpH6v7i3V+faivdbCRaWObwFJAgmHiUI
        NBuaLAy7zplLyirhtsAqBM6QsEWFurKt/bGC9XTkuQXpSQNPBcDqZL4GLIkl2hea
        fgztX+WrxHNS+IZsCvbkUCRa8Kmhqm/ubH2MG5LSmvZYc0AM6DHTsDcbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=JP7wdmNFOkH8lL9Kd1NTkGq2wgQnz+eShdtgKZ4UvNY=; b=e6AUwaTr
        66Jb0v+7DTxdrjuFWtaymqrAaKzrgr8eANrwC16oJwOvPubl0yRSx4R4kDNHupDc
        xmgLkfqALFRC3NX2/B6alaZbfEOxmEIcrHGM2nzApUPvYRNPC/7lPD5hCfrYFcEN
        CCklf1TvNWacmnin+Vj8V2GveCBOn6jsK9BJJlBnST2+tx0TGkCFyEN3hRslIq58
        nND7UR1pGZ8Pm9Hyy4GxeCf1kiZNy1FKLpAe0Dlbzrweu0MB2EeL2gPeXRqvCe9W
        nl3cSM8nQS1jaXUAkGzHC7ifb7lzoiX/u0WGcOMAk7yENyhkF9RMHw4XtgvigaQc
        y79YwgcFIi/B9A==
X-ME-Sender: <xms:Oo73YJQUUwBqGRUi0scgw7IxUSk_K8tV2V6EckpPOhWgsw-RflOYIA>
    <xme:Oo73YCzXQmB5MIc3vZFT1Cf0bikXGPEIy0OXZE11tsJcHB5TUBZC0BYJtDmLt2css
    Pz-Npom2OodVZvmZFo>
X-ME-Received: <xmr:Oo73YO19t4WGkFVc_r3OVHolxA3G6dftW9a3qlLifZ4YO0RaAq4yJ_k1Xuizv8aWQEBWdKkpMfvH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:Oo73YBD4oqvf-IFItKLXI-EmKWHpmaboMQ40y9DCYTzvBFRkB5-VYA>
    <xmx:Oo73YCjDRUqaKBE1bNVbwFy7F9h91rwvjOVbYYfcu-3F8RQdvZhHYQ>
    <xmx:Oo73YFqk0GbwmsPTt6PY2UuoKQGjzwaeiQ1GHj_Be8SYdC8XO3_r7w>
    <xmx:Oo73YHZvw2UOpt7e8leIakrUBQXk44-C_I7xB8vBAENTCNc6olY4BRKKAeI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:02:14 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 4/9] clocksource/drivers/pistachio: Make it selectable for MIPS
Date:   Wed, 21 Jul 2021 11:01:29 +0800
Message-Id: <20210721030134.10562-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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

