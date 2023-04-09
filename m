Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE296DBF86
	for <lists+linux-mips@lfdr.de>; Sun,  9 Apr 2023 12:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjDIKni (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Apr 2023 06:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDIKnh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Apr 2023 06:43:37 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B03549E9
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 03:43:36 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 400693200932;
        Sun,  9 Apr 2023 06:43:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 09 Apr 2023 06:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1681037014; x=
        1681123414; bh=JmQWrIyQdY491hqVROXAubhi7zhzH9g73KTJjIcXyOI=; b=q
        HfhUqe/0/gGc1NSpiTAwDcf8EMp8WgMDR8I0M7tYHjo7TM0BFQiFwsjgHROaOqrN
        qgvNKT17zn4jGKq1169bSMFhOdiRDggzQdpNFqO35QYVdXqcjjo9CH5SVuKsrAhk
        OTqoyCDG6Ii24hjlHV/eCCiNq07o20zkq4exNQ5295pl/ohjZXQit4xzx3xBB4+s
        +0pFYp3PFCGQKaqwK5K6hPxXbaIN5zhB7AG6RDH4H4e9eEFmg4kM4apGXungaAwB
        JPL2grCvNrTrrmDV0VRETFLazxHRCmbg4kuOHcCsmWvrFmYanJo3EsRLElk9Fh59
        /QuLoJ/1JzAgzLlE73VPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681037014; x=
        1681123414; bh=JmQWrIyQdY491hqVROXAubhi7zhzH9g73KTJjIcXyOI=; b=Y
        MfCayV1ZNlY8dcbEwvA5czqaCWsLvxkmYrQ+xcwipu7/ORsqQsVhSRYEh8EcTEN3
        5aMN+0wsvsKpbNsMYkwVR6GdLOU+cjIuEXWP5p/2oW8Aw24EXe9uJzO/+50jKIOp
        1GXuNhLJOqmajd7SavyOBLiqVOAyOuh20+OLQfnqalff7vwB+TpvIzUHA6fbQDNc
        lUfQcCHn4qa+Zb3L5gBcUXfet6rh7GMpFFleC2KcE3hAfpaiRwk5yX1awdsBUxee
        ZwYfp8WaPqAghW6T6gQEtppILftXHveRvT8BOQPP/0e2zSi1UyWoWVqTw+JIkihB
        ALqK9LUtkQ5zYVEWsXidQ==
X-ME-Sender: <xms:1pYyZGEl2WmYJX4L8nVGTIGhvnDCkur3wpxZJqN8-iRepB4O6-aC9A>
    <xme:1pYyZHUsbAQauZRHs2iAnxyYbsHvdlkQ7KTAZ9lk6ma0e3SWksO4E1PJyvLsqHlPg
    -kGNUu_Pf7T2wi1g6U>
X-ME-Received: <xmr:1pYyZAJkPHuiv4uyxyY7AxNwI2HdFBrEdPglNRtVnbaBERtYhzg9Xo401T2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdfffeehleekgeegff
    ejgeeijeekveeghfetudegkeegueefhfduudduhfeijeelnecuffhomhgrihhnpehsfihi
    thgthhdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1pYyZAHNS-1OZgZ6pP4pTKjteWtuPFDyYWi4sbHW0s_7K3bDzwUzyg>
    <xmx:1pYyZMXzpDpQ7QWw_2UnQXy2jwQ4aK5IS5F2L8SFO9cZ1Qq8ivBGrw>
    <xmx:1pYyZDNlwTs0ggJSaOBKvCX2JDeJr_EtbMpXqvgTsgd9csywtzQxaA>
    <xmx:1pYyZKwzQ9DsqNm6hih00g61aKxwxX5nwV9fYoX67WeGUpKDKNewMw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:33 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 7/8] MIPS: octeon_switch: Remove duplicated labels
Date:   Sun,  9 Apr 2023 11:43:08 +0100
Message-Id: <20230409104309.13887-8-jiaxun.yang@flygoat.com>
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

EXPORT macro already have labels defined by itself.
Remove duplicated labels outside to silent assembler warnings.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/octeon_switch.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/kernel/octeon_switch.S b/arch/mips/kernel/octeon_switch.S
index 896080b445c2..9b7c8ab6f08c 100644
--- a/arch/mips/kernel/octeon_switch.S
+++ b/arch/mips/kernel/octeon_switch.S
@@ -428,7 +428,6 @@ done_restore:
 	jr	ra
 	 nop
 	.space 30 * 4, 0
-octeon_mult_save_end:
 	EXPORT(octeon_mult_save_end)
 	END(octeon_mult_save)
 
@@ -448,7 +447,6 @@ octeon_mult_save_end:
 	sd	k0, PT_MPL+8(sp)      /* PT_MPL+8  has MPL1 */
 	jr	ra
 	 sd	k1, PT_MPL+16(sp)     /* PT_MPL+16 has MPL2 */
-octeon_mult_save2_end:
 	EXPORT(octeon_mult_save2_end)
 	END(octeon_mult_save2)
 
@@ -480,7 +478,6 @@ octeon_mult_save2_end:
 	sd	$10, PT_MPL+(4*8)(sp)	/* store MPL4 */
 	jr	ra
 	 sd	$11, PT_MPL+(5*8)(sp)	/* store MPL5 */
-octeon_mult_save3_end:
 	EXPORT(octeon_mult_save3_end)
 	END(octeon_mult_save3)
 	.set pop
@@ -498,7 +495,6 @@ octeon_mult_save3_end:
 	jr	ra
 	 nop
 	.space 30 * 4, 0
-octeon_mult_restore_end:
 	EXPORT(octeon_mult_restore_end)
 	END(octeon_mult_restore)
 
@@ -517,7 +513,6 @@ octeon_mult_restore_end:
 	mtp1	v0			/* P1 */
 	jr	ra
 	 mtp0	v1			/* P0 */
-octeon_mult_restore2_end:
 	EXPORT(octeon_mult_restore2_end)
 	END(octeon_mult_restore2)
 
@@ -548,7 +543,6 @@ octeon_mult_restore2_end:
 	.word	0x714b000b
 	/* mtp2	$10, $11		   restore P2 and P5 */
 
-octeon_mult_restore3_end:
 	EXPORT(octeon_mult_restore3_end)
 	END(octeon_mult_restore3)
 	.set pop
-- 
2.39.2 (Apple Git-143)

