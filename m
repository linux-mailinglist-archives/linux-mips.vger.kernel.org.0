Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040336DB67D
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 00:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjDGWfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 18:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDGWfr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:35:47 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B2CB761
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 15:35:43 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 41FD05C00F8;
        Fri,  7 Apr 2023 18:35:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 07 Apr 2023 18:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1680906943; x=1680993343; bh=4bfOYomIO+
        aLvqJ/dHaNgJJhxq1MjqQwdB2Lfkg97Sw=; b=zZ86Cp8LCvVAmssQFD83tv9JmT
        R+m+hNoqX4w89RW3eeGZZfU+rIKL1Ry5zzVYg6al2JDjR3AaA7RKDfCB52PC68/d
        Ng/RynC86r9/AjQPFZQHDKotwXulZ9yunbF/TwSA6ftpxdjQUhXIvibIIEGiChUZ
        lh9rrGVyhS4mCwAReFqVDp4OOGTSX8yGEFdPRTlRKlGTSgnZUwZamICRFzoKOk41
        NZEbw9LjX0c+6qn4W+rhD0Ze/PV3UaijM1L+9J58V3LIN7s17Hs5Y0bVzOqbcIHQ
        2lO8CMITNYDu+init9O/tK6UQeFt+iJnuk918eC/TAC+a6MVTr7O75gIapmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680906943; x=1680993343; bh=4bfOYomIO+aLv
        qJ/dHaNgJJhxq1MjqQwdB2Lfkg97Sw=; b=bszZ2+rrCWxpYALaOP4bCN4FPG9rt
        VrusLLRji/uyqrzYR9HFY0Yw6pI30982D6nqv7NERl4GHiUvAEbWpcTWR6qfEXBs
        HHbFGKlrxVg85qDuL9cansmqsAVy0Kv9mAVBCepF8qxGF4hERclgXGGuYafhscAO
        RBr6tQPruZOAYrA7qU60INcmQ9LfJnREUXlg1SsxTJVaCCzVL8o9UqIrlaw33l5f
        77f3uxVEFOqdGHvsKm4KRLUrH8umCHoizflkdWbFMOvgrT8gkky6YwNLBwpidFNb
        jil6RCmd9S3VNKyIAj3rJsoHet6GZ34mQlj7u2qm67BI1ILccyv5jWqWw==
X-ME-Sender: <xms:v5owZAS_uIG7zR2hVPn6FbWCXaiQYOvfGi045M0bxwPWJLfrfenicw>
    <xme:v5owZNwI7Q7AQvrMUd_I6_6X-T8idp9LmNAdjRY5hKWGhqbwhrm7hTnZydW2kFqzy
    EYw0etfGRy2KSrtyrI>
X-ME-Received: <xmr:v5owZN3FEjsyHYpd5lt6XLeA8lM1Bp66F0lyiLR2OiaoO6vLvJ2WYNXF8b_C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejiedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:v5owZEA5YleP96cM9sawtwW3bWxQCA8Cbyxw6dnMVcmPunmXwwc5sw>
    <xmx:v5owZJikhfe_n7SjTb6tsDcBko3IA53GCQrsI7wMunSmvAC7MLPuvQ>
    <xmx:v5owZApBzoIMvm2m3FWdzqNH3C8bIfZ8gazRRxgOs9BQxk3kLzTQvA>
    <xmx:v5owZMusN9hoJkkn4y1W5wacfNTSXlkj0pxxAnyyYbrnpryysQ1FCA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 18:35:42 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
Date:   Fri,  7 Apr 2023 23:35:32 +0100
Message-Id: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS MT ASE is only available on ISA between Release 1 and Release 5.
Add ISA level dependency to Kconfig to fix build.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 5e399a5ac3b3..ecc7a755fae6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2194,7 +2194,8 @@ config CPU_R4K_CACHE_TLB
 config MIPS_MT_SMP
 	bool "MIPS MT SMP support (1 TC on each available VPE)"
 	default y
-	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICROMIPS
+	depends on TARGET_ISA_REV > 0 && TARGET_ISA_REV < 6
+	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
 	select SYNC_R4K
-- 
2.39.2 (Apple Git-143)

