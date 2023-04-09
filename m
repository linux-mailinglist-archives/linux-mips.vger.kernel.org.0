Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBD36DBF85
	for <lists+linux-mips@lfdr.de>; Sun,  9 Apr 2023 12:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjDIKnf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Apr 2023 06:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDIKne (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Apr 2023 06:43:34 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0C249E9
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 03:43:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id EF4FB32002E2;
        Sun,  9 Apr 2023 06:43:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 09 Apr 2023 06:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1681037012; x=
        1681123412; bh=nTO6Ylpmk7/Iff7I5htSerd/uHZn47TmohbEAcaDuVI=; b=3
        GovYa+2y2T7xdcM7goHkVP86cSEwbAh8sj89C86Xd+7KRDHo5AzPNMm5ymwR0wEs
        tnuUGucNE3btGxSrwXwzuga1+FEuSy0LcObLcGJKG2l83HtNVG9x0ATWRgch8MKU
        YZavrbfgEW1rKVU2/IwVA5IbSW3qND8BvVzDDYZ6bD+rx5eWjpbPR3I8CLSoj02z
        fcmkCha9BuY5p98VX2qHYi0vPApOL2lfadOg2OwcBch/CF4LduAl2zoWkyqRq95p
        wcQhUtol8zEk43bcr/6bpFrrbZfWf6FRm2kNUMe3+4AwwON+JWsRFbrBArDoQrGe
        yr002HqK3npjXIcZF5fBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681037012; x=
        1681123412; bh=nTO6Ylpmk7/Iff7I5htSerd/uHZn47TmohbEAcaDuVI=; b=h
        Vi8AGc4iZ0J2zHdOpVHj6V/ozUqTrZLCvUt0N6mdxLUXB6SWueiRanNwRx2drdew
        +QVFYDqxNvKFr6YQ5b/5p2G+1y9Tm94EesPynxqqEjRtTNJzFXfcwuZFQeTicyb1
        orFMQ1zQxDj7J9pcRAx9a5kibbYklqBlYkUMAjI2ERso9zInq9YrHGnVJ5P7k8FQ
        Y4IaAG9hbPMU25SfUNDzjN1CIzveFtgIviEGYDgoP5fpZtQGRsQiPF3NMpbjzUok
        ZJA9/5m47CYA+qNJYfYlDC+fYiSzKh3d3Evcqd1OulVKjDqI3DlIRDpDrILAB26T
        DmrH3B3N62o4WCyVApzEA==
X-ME-Sender: <xms:1JYyZAzRVibB8HNg-TLI9tNre4Zo95WZe5VrsiWIb4kwwfLo1C5PuA>
    <xme:1JYyZETmzbkux8ln_A2KwErveF0x2SXTtlCrlL5bkazk4gGey6ndzHZWf8xwE1Cfc
    8DtuQ0ZSJPL4d23CJ4>
X-ME-Received: <xmr:1JYyZCV7nE9RNwlrNqnNz0eLSQyKOY4HrdHbHFiySW05B1WJPRKZ6TmRMPSO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:1JYyZOgYQ13b59Scotiz6fhz0p3rAGNoBmdh-7MYy_h-NMGmHdrfaQ>
    <xmx:1JYyZCDPFWCaQqV9HHV1bzr9SmiNscFcmbPoOUjH1cttI8CgHzwDLA>
    <xmx:1JYyZPKMxrN3DfwdFWQGNUKnjX_S1ilcNSVysW9cTfyvdgRLYDZrcg>
    <xmx:1JYyZF8RHEG0jpDVNrR-EB0RvQFfIG2NbvJsTUqlqq3gU9JNAQOTvw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:31 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/8] MIPS: c-r4k: Use cache_op function for rm7k_erratum31
Date:   Sun,  9 Apr 2023 11:43:07 +0100
Message-Id: <20230409104309.13887-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLVM assembler is not happy with offset that may overflow immediate field.
Use cache_op function instead of inline assembly to fix build error:

arch/mips/mm/c-r4k.c:922:23: error: instruction requires a CPU feature not
currently enabled
                        "cache\t%1, 0(%0)\n\t"

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/mm/c-r4k.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 420440cc40b1..89603d033180 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -915,25 +915,20 @@ static inline void rm7k_erratum31(void)
 	write_c0_taghi(0);
 
 	for (addr = INDEX_BASE; addr <= INDEX_BASE + 4096; addr += ic_lsize) {
-		__asm__ __volatile__ (
-			".set push\n\t"
-			".set noreorder\n\t"
-			".set "MIPS_ISA_LEVEL"\n\t"
-			"cache\t%1, 0(%0)\n\t"
-			"cache\t%1, 0x1000(%0)\n\t"
-			"cache\t%1, 0x2000(%0)\n\t"
-			"cache\t%1, 0x3000(%0)\n\t"
-			"cache\t%2, 0(%0)\n\t"
-			"cache\t%2, 0x1000(%0)\n\t"
-			"cache\t%2, 0x2000(%0)\n\t"
-			"cache\t%2, 0x3000(%0)\n\t"
-			"cache\t%1, 0(%0)\n\t"
-			"cache\t%1, 0x1000(%0)\n\t"
-			"cache\t%1, 0x2000(%0)\n\t"
-			"cache\t%1, 0x3000(%0)\n\t"
-			".set pop\n"
-			:
-			: "r" (addr), "i" (Index_Store_Tag_I), "i" (Fill_I));
+		cache_op(Index_Store_Tag_I, addr);
+		cache_op(Index_Store_Tag_I, addr + 0x1000);
+		cache_op(Index_Store_Tag_I, addr + 0x2000);
+		cache_op(Index_Store_Tag_I, addr + 0x3000);
+
+		cache_op(Fill_I, addr);
+		cache_op(Fill_I, addr + 0x1000);
+		cache_op(Fill_I, addr + 0x2000);
+		cache_op(Fill_I, addr + 0x3000);
+
+		cache_op(Index_Store_Tag_I, addr);
+		cache_op(Index_Store_Tag_I, addr + 0x1000);
+		cache_op(Index_Store_Tag_I, addr + 0x2000);
+		cache_op(Index_Store_Tag_I, addr + 0x3000);
 	}
 }
 
-- 
2.39.2 (Apple Git-143)

