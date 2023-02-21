Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0005869E125
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 14:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbjBUNRL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 08:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbjBUNRK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 08:17:10 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FED429159
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 05:17:09 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id A92C03200920;
        Tue, 21 Feb 2023 08:17:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Feb 2023 08:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1676985428; x=1677071828; bh=xv
        FzM+qQXUbgstzOzrk84FAc1qa8gBSZ5nJV4Zouwqo=; b=IyWNRpOHbh+s8U4vxw
        +vNFNahth9Rt4zPEhdiihgefKsfhHhv2Gwq6S6bIy7zZmc8ed9FBT6GQD5qF1Px9
        ggxwBPh21lJ9rfGr6nzgn5mA6bCBnXedh1A7SuzW7JMpQYY/s5+6J/u9xileIC/S
        /lcMscuUJCKgOUsC/xyWzIWczl54VpqOMIkMJBulUQh1IDXDY+DYHZJ4zEKL/i6R
        g666d69NqkJKByPM3d7mzDM8ubm8pbzMvegiBDa810Q9XAkGOJpnpIUhuT198LlN
        AflbU7XRI1pslZHWLgVbFQKPFOkN9tR/B2uDIB4Hwnpo4SKlJVu5lC3TZLaQRw3e
        /wpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1676985428; x=1677071828; bh=xvFzM+qQXUbgs
        tzOzrk84FAc1qa8gBSZ5nJV4Zouwqo=; b=lx71abO67qaI6VdJ2Dnru1IBkemO+
        Uf08KToySjYQSiFfSLk8vcPtd8kfQPQzVBJNutCB0nEmZy/BjjOSgEpH6MSGX7iL
        +9NAtReYASBb+Aoqf2y4nLA6JSnVqQYlZDoUqE6Aw0aBBQ3sSVemv2XPKY+g6jk1
        vpEV5JVXwNXcoPdHxdCe58+E0+UUYMs2tY0QKHQ3T62HqwIbtnYr5559za+q44v5
        lqR5vLYh4WsT2l5atbboQZLBT1gNB2/o4Y93UXe3K1iTcLsMvDIru5rlYX7d+I62
        8AOU1leJgYgUq9TSTrEd6kmcNJsIO1vWGCcQGjnvCgU3II9ebTbVQbdUA==
X-ME-Sender: <xms:VMT0Y8TjoGAkjA6SqKD6aC4DH1tFtwHaO8US-nwx_Z03Z6IC7-wUuA>
    <xme:VMT0Y5wuyemiMr50uAgE1JPNcqUrCh6NlQ9nkE-K6Tfe0n87ul7zrySfuaw9rXn8a
    SnZMhqwfQPoYdIiMlU>
X-ME-Received: <xmr:VMT0Y51YuYEUjPXPAXckQgMjv0KYx9P-hsXOnpN5bAb_8pOOOsap0NGu5i6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:VMT0YwA1J90fkleBmy4qyXnpXf-kaxZrm1hE0GgwNoFwWAew335Y4Q>
    <xmx:VMT0Y1hVk3s6tB9hsDwdOhjxgf5iPI_G7LfZhfJUH5FOhM7HiQJcMg>
    <xmx:VMT0Y8oCb3qvr6HTxrAl-CSMi7NXdXuQ0aNQyDAZtXp6x1wILSibKA>
    <xmx:VMT0Y4u1girUWSPwhMhsrftRKG5YDdx6sR6N1YpWiCMVvOY49kMA2w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 08:17:07 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/5] MIPS: Loongson64: smp: Use nudge_writes instead of wbflush
Date:   Tue, 21 Feb 2023 13:16:55 +0000
Message-Id: <20230221131658.5381-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
References: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

wbflush here intends to let other cores see the results ASAP,
nudge_writes fits this purpose better.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index c268c6dd1ef1..e9d91da7fe24 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -42,13 +42,13 @@ static uint32_t core0_c0count[NR_CPUS];
 #define loongson3_ipi_write32(action, addr)	\
 	do {					\
 		writel(action, addr);		\
-		__wbflush();			\
+		nudge_writes();			\
 	} while (0)
 /* write a 64bit value to ipi register */
 #define loongson3_ipi_write64(action, addr)	\
 	do {					\
 		writeq(action, addr);		\
-		__wbflush();			\
+		nudge_writes();			\
 	} while (0)
 
 static u32 (*ipi_read_clear)(int cpu);
@@ -418,7 +418,7 @@ static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 		c0count = c0count ? c0count : 1;
 		for (i = 1; i < nr_cpu_ids; i++)
 			core0_c0count[i] = c0count;
-		__wbflush(); /* Let others see the result ASAP */
+		nudge_writes(); /* Let others see the result ASAP */
 	}
 
 	return IRQ_HANDLED;
-- 
2.37.1 (Apple Git-137.1)

