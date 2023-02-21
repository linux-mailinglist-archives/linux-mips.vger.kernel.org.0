Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDAC69E127
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 14:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbjBUNRQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 08:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbjBUNRP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 08:17:15 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4814429179
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 05:17:14 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 8FE613200920;
        Tue, 21 Feb 2023 08:17:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Feb 2023 08:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1676985433; x=1677071833; bh=mo
        1bJEa7CJebImT2SNtjRH/cOmsKYWugneFAx1k4vQE=; b=Y8hyt/wC0hy8XAT6oh
        QgWv76V95pui0sVCJjIpVraKXS3mGaIMxQ8hgaADlgx04TQBRfKYVyWm17tJBOvR
        R8kZMu9NZlk/PzzaVymOQ2OMI1yUiYAmCHxU8Q+C37bT8mXLrQ/RtFfsnLxUOs9D
        GzrEdE3G+wTwz7zNki1zSJ5DywV53SX9TZXl528Q+kRAGafo9Df9EuMrja4DcnGH
        x5JFTg7DY1AV9RKoiMf17bHauCwutlzhAgf1EWqRJ5J/6ipAx2d7NZmQttOLnWtK
        u+qZlVvqzeFSjfBnVzQacERw5/oo9NL1+WmXPhs46I0WxPwqhdwyuByzL0xurAk+
        SVzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1676985433; x=1677071833; bh=mo1bJEa7CJebI
        mT2SNtjRH/cOmsKYWugneFAx1k4vQE=; b=lS9kwT0uiZs/Ok0He65BGTIezivGb
        A6adeIZSZ0U44OTk+m8g/AZ+zKz8SdfQWWsJt44kFQk5Cma/DThr2P2Kf8DhdivU
        7SeFicK+oGGgBEV3Xvs9Yrdn56e5+VjuBENGgn5FLH+QXa7lBtD8TfASDwB0DR/i
        I9aULX6kfuPm6pNvjscPY9N0MEpe1cL8mMU30iLsJ9IT/Wa2bmexQ9p+gs3X32Ji
        cVlJujOr6SyTx/yZQT3xUVtqjctalZgfuEV6YIry6lHHQa1SbvzgOuNjcA8NMTXH
        Qmt0iTWumnw+k1gojWp4nCWojARdinBZKAwZdZ+2qbOdqx60a8pcwV5BA==
X-ME-Sender: <xms:WcT0Y_JwnJaxYflkeMh3iVSbok6gqAOCkOhOXNuxPsQw_CQa8R6mMw>
    <xme:WcT0YzKfI_EKKzPJTuUlxRrsNULTst8SPbnQTLuAGPjIx9C7D-oupxkPec68U8Xl6
    UEuQhHcAmUo7JUohaY>
X-ME-Received: <xmr:WcT0Y3sMqsJE6RyHawxXdZFAM_qxz9OHuo1wuZSOs5ZIRPDa_9m4sYlmw0K5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:WcT0Y4Y-5Rl7hRjb0DYjGqlPq3qDdBMThBaSqJSCfPH11u4yA5eBmg>
    <xmx:WcT0Y2bHkxC1r2tTqAXUEiwKBtMIlhWn83gXh2hqfnsPRxOw0XDwxg>
    <xmx:WcT0Y8AmAJuwnzBELcYJCiNOtDVPPcVLamg36oqvvrXaOtZGicCP_Q>
    <xmx:WcT0Y1kbbtTJBD0kGFYaM_99_P-b_apWhXxyZHCfdzjbHO-9410nTQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 08:17:12 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/5] MIPS: Loongson64: Remove CPU_HAS_WB
Date:   Tue, 21 Feb 2023 13:16:57 +0000
Message-Id: <20230221131658.5381-5-jiaxun.yang@flygoat.com>
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

Q: Do we have really have write buffer
A: Yes, on newer Loongson processors there is a "store fill buffer"
   that will collect *cached* writes, on all Loongson processors
   AXI crossbar will buffer all writes.

Q: Then why do we want to remove CPU_HAS_WB?
A: Because CPU_HAS_WB introduces wbflush, which intends to flush
   all write reuqests to mmio device. We won't be affected by store
   fill buffer because it won't buffer uncached writes. And a regular
   memory barrier is sufficient to flush crossbar write buffer.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig            |  1 -
 arch/mips/loongson64/setup.c | 15 ---------------
 2 files changed, 16 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 04a9a3889d75..04b09b82cb76 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -489,7 +489,6 @@ config MACH_LOONGSON64
 	select BOARD_SCACHE
 	select CSRC_R4K
 	select CEVT_R4K
-	select CPU_HAS_WB
 	select FORCE_PCI
 	select ISA
 	select I8259
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 3cd11c2b308b..257038e18779 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -6,7 +6,6 @@
 #include <linux/export.h>
 #include <linux/init.h>
 
-#include <asm/wbflush.h>
 #include <asm/bootinfo.h>
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>
@@ -17,20 +16,6 @@
 
 void *loongson_fdt_blob;
 
-static void wbflush_loongson(void)
-{
-	asm(".set\tpush\n\t"
-	    ".set\tnoreorder\n\t"
-	    ".set mips3\n\t"
-	    "sync\n\t"
-	    "nop\n\t"
-	    ".set\tpop\n\t"
-	    ".set mips0\n\t");
-}
-
-void (*__wbflush)(void) = wbflush_loongson;
-EXPORT_SYMBOL(__wbflush);
-
 void __init plat_mem_setup(void)
 {
 	if (loongson_fdt_blob)
-- 
2.37.1 (Apple Git-137.1)

