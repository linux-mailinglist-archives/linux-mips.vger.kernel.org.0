Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D47E69E126
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 14:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbjBUNRO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 08:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbjBUNRN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 08:17:13 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332B029179
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 05:17:12 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 784F03200927;
        Tue, 21 Feb 2023 08:17:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Feb 2023 08:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1676985431; x=1677071831; bh=so
        IEw043qbh3VHCqLZk6b0OectivLIKNL02ynxkpo1U=; b=jEqiEms4ov0begsrb0
        AG13v/orcZPNs+ZqF+tchGm1y38kDsuvbKXGGoNDGURKmCudmCh4JjKdAhxmr4kM
        1927WJyiGJdSssmIvLYBp81GOlWcrGh9M3+sZHWSoLKAQ8bIkI8JlES+Y8QI4Eoe
        ssRn4Tq5YVNbZ/PeU/eqFuWHk+66samH/Al0gPhQ9vLYYFHyP+8f2iCt1RAQhfts
        slB5IPUIwBpmXW5p/x1i9Zd2+8/melrKHViwF2SnRpsnYuHLfGmMy7swJkVSrAj5
        KJVi9zV5DIMnCYODd2dYW2x8+loUKgSeG9jHiWTFRliLVDDWVGQDJ+n3j4RbkKgp
        y7QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1676985431; x=1677071831; bh=soIEw043qbh3V
        HCqLZk6b0OectivLIKNL02ynxkpo1U=; b=CvGwQ5rwTZijw6bX54Er19aSzJYgC
        1aCmifJVLdVKvt4BgSqJu4WAIURxNgbmDgHqA6Sa8zEFpszsTSZF/3ldeddhDzpn
        Noy+JY/guDuQFxOXYV2/CiBkW7hIMECiVcKtQssmLMBNS9wFUeOOzV4oe9vnhPy/
        XY7Th23BFdpjiQkrCUawyRcnUnKud4mRuFxPiPg6aua5kD02cV79fMt4zBpkXFLd
        pj5LTPIN0cleQyZzZQM4xB7RHdK0Yy3yGVQ7yxHE8Bm6F+/8cv29PNI10ElmLunZ
        BhEUcn7rSIyNsNIJsNKCMreFggCw/zMCldHdRCkOrE8nUHBfladw6Hapw==
X-ME-Sender: <xms:VsT0Yw_LwpHdTeS_6tErrGPsS-2gMSXH44OINgje6OOy8jOHDj7Vgw>
    <xme:VsT0Y4sLKo5JFgFiYh8GmKLgmve0hgV6TJMSuVNElzYj3lLPww-Ib16QP9pFoUWIQ
    LDRnrepzx1aYXhXwTs>
X-ME-Received: <xmr:VsT0Y2AkynPiQ2wbQgNge9pmIy3xYJSPMugzzFEJb-pL3gdtFLxEbJLF7uLL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:VsT0YwcpI_eFp_gvDcjIzoh3Gkl296wzfW6_kbISCESCHAFjpHobEw>
    <xmx:VsT0Y1OGjPHW0DGM_mgJT0btLbY9_hmNEDZWaUnlqoiz6ShwTsnHmA>
    <xmx:VsT0Y6lf7mj8u6b55gOGnfzCIw90uCn-0ah-Lt7sWoHeMw97WZF0Ug>
    <xmx:V8T0Y-bqVB6QN1nxpXGGQ4Vh4bTK-BIZ6ssDTD1dW2ALbsuYDdmcOQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 08:17:09 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/5] MIPS: Loongson64: smp: Correct nudge_writes usage
Date:   Tue, 21 Feb 2023 13:16:56 +0000
Message-Id: <20230221131658.5381-4-jiaxun.yang@flygoat.com>
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

Previously every write to SMP regisers are followed by nudge_writes,
this incures a huge performance penalty because nudge_writes involves
SYNC, which will be globalized on chip.

Only set off nudge_writes when we really want other cores to see the
result ASAP. Also replace read/write functions to relaxed version because
we don't need extra barriers to protect against DMA.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/smp.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e9d91da7fe24..90c783981197 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -34,23 +34,6 @@ static void __iomem *ipi_en0_regs[16];
 static void __iomem *ipi_mailbox_buf[16];
 static uint32_t core0_c0count[NR_CPUS];
 
-/* read a 32bit value from ipi register */
-#define loongson3_ipi_read32(addr) readl(addr)
-/* read a 64bit value from ipi register */
-#define loongson3_ipi_read64(addr) readq(addr)
-/* write a 32bit value to ipi register */
-#define loongson3_ipi_write32(action, addr)	\
-	do {					\
-		writel(action, addr);		\
-		nudge_writes();			\
-	} while (0)
-/* write a 64bit value to ipi register */
-#define loongson3_ipi_write64(action, addr)	\
-	do {					\
-		writeq(action, addr);		\
-		nudge_writes();			\
-	} while (0)
-
 static u32 (*ipi_read_clear)(int cpu);
 static void (*ipi_write_action)(int cpu, u32 action);
 static void (*ipi_write_enable)(int cpu);
@@ -136,26 +119,28 @@ static u32 legacy_ipi_read_clear(int cpu)
 	u32 action;
 
 	/* Load the ipi register to figure out what we're supposed to do */
-	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
+	action = readl_relaxed(ipi_status0_regs[cpu_logical_map(cpu)]);
 	/* Clear the ipi register to clear the interrupt */
-	loongson3_ipi_write32(action, ipi_clear0_regs[cpu_logical_map(cpu)]);
+	writel_relaxed(action, ipi_clear0_regs[cpu_logical_map(cpu)]);
+	nudge_writes();
 
 	return action;
 }
 
 static void legacy_ipi_write_action(int cpu, u32 action)
 {
-	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu]);
+	writel_relaxed((u32)action, ipi_set0_regs[cpu]);
+	nudge_writes();
 }
 
 static void legacy_ipi_write_enable(int cpu)
 {
-	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
+	writel_relaxed(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
 }
 
 static void legacy_ipi_clear_buf(int cpu)
 {
-	loongson3_ipi_write64(0, ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+	writeq_relaxed(0, ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
 }
 
 static void legacy_ipi_write_buf(int cpu, struct task_struct *idle)
@@ -171,14 +156,15 @@ static void legacy_ipi_write_buf(int cpu, struct task_struct *idle)
 	pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
 			cpu, startargs[0], startargs[1], startargs[2]);
 
-	loongson3_ipi_write64(startargs[3],
+	writeq_relaxed(startargs[3],
 			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
-	loongson3_ipi_write64(startargs[2],
+	writeq_relaxed(startargs[2],
 			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
-	loongson3_ipi_write64(startargs[1],
+	writeq_relaxed(startargs[1],
 			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
-	loongson3_ipi_write64(startargs[0],
+	writeq_relaxed(startargs[0],
 			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+	nudge_writes();
 }
 
 static void csr_ipi_probe(void)
-- 
2.37.1 (Apple Git-137.1)

