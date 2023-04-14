Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7566E1DC9
	for <lists+linux-mips@lfdr.de>; Fri, 14 Apr 2023 10:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjDNIHk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Apr 2023 04:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjDNIHj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 04:07:39 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9616E9D
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 01:07:35 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 093D65C0172;
        Fri, 14 Apr 2023 04:07:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 14 Apr 2023 04:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1681459655; x=
        1681546055; bh=vBPZuMVAKbL6qls5KSFy0mpPtSOAQXcRdBIYmEAzyBM=; b=x
        Gz8RfgiJ158i3NA+EzriQz66CpgW+NzhoBPogXZAxKfa7OJJn7tEvXiko00B3xW1
        AnYMxr59BGRWqxoFV7Ahgq0RbSYYFxBp1wxG9nYPm8WR1XZ3BsQwvKT6WCqA/s6E
        YfpGDdJrfYZlAw1ogSejWUNc9k8lK4bIIEk4NF9u+JqhpJwPWLIdj3bSxTZvQUQZ
        oDeaWkf12+J9N+aeNW4XRS21l357YBTbMVd6ElpSpXKWSfwl/13XCTGDxpqYZDUx
        N6ObQQWD83WleomqwrokfW5TwX7sVW/eZaJvAcFS8yHio4QIi7mOnqTUerRqXgQC
        YdfaNRc3UZNQfQ4JKeg7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681459655; x=
        1681546055; bh=vBPZuMVAKbL6qls5KSFy0mpPtSOAQXcRdBIYmEAzyBM=; b=W
        1fsW2ank7A8oogm4TXWOwzlgIWRSuDEeEjiMcwwuUgTSPcE2XivGOA6Yv8GYXF5q
        +Shr0JcNmJy2ocSNJY/vnpYE31OfJlEq+yuYdqEIeKE/U6gvMU9kpUFbdO2jSeZL
        9qbMrx3ZBwIIoZS7yZUpcFNa4oKG6A7GdlfunkL/78DOVFt6pFDOESP5+27gIEuL
        lEpo0X/1hsII1GdVgCsP7Bo3IQEtWFrJARkryimOBcQ2qgxUXZEJEeLBd+Gk26ei
        1Io+29nsozNQus8I7FO9DPdRH/uVdquUfjbrhKr0I7CoN6c/dQk9hToQZ6dBr5DP
        xKsq5fx14MGcwchS8RPLQ==
X-ME-Sender: <xms:xgk5ZL1sffvuMUHJMxuRdM51JbzjzQVJEiaejmh8N5KlOqbCwhB2Rw>
    <xme:xgk5ZKE2SzBG99O7Af5fZmrK0D2inzvGU9znnPVQ9tvLVxB_vDKAssMGMx1zLNaAP
    OJn4KfMzg8z8QoOxJw>
X-ME-Received: <xmr:xgk5ZL5A5xRLq7o2s5BJ3VdbAiBjbdzbfyp-gd4HNOCPHIeCvC2Saxd3TNle>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:xgk5ZA2xrGKti8-GVWSwLTKutNjSVMLt38FV0lCC_CHckTBUvcYZwA>
    <xmx:xgk5ZOHU2ORliSJ_yJqr5U5G_L5rSqnwbw8HHyKCV1FiKBrk462loA>
    <xmx:xgk5ZB9m5x3QpVh1Sqp6jHcpDBpyQVNUDfjfWfl5oa1Sk2lnAplaIw>
    <xmx:xwk5ZKgzcHa71AQip8J1gLr1D1JgrAEUXlsvOQe60G7dWDDxitXuWA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:33 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 5/7] MIPS: Remove cc-option checks for -march=octeon
Date:   Fri, 14 Apr 2023 09:06:59 +0100
Message-Id: <20230414080701.15503-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Nowadays our minimal supported GCC/Clang all support -march=octeon.
Remove cc-option checks to simplify code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 344fe5f00f7b..af3d17ec35d3 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -174,10 +174,7 @@ cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mdmx)
 cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mips3d)
 cflags-$(CONFIG_CPU_R10000)	+= $(call cc-option,-march=r10000,-march=r8000) \
 			-Wa,--trap
-cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += $(call cc-option,-march=octeon) -Wa,--trap
-ifeq (,$(findstring march=octeon, $(cflags-$(CONFIG_CPU_CAVIUM_OCTEON))))
-cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += -Wa,-march=octeon
-endif
+cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += -march=octeon -Wa,--trap
 cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
 cflags-$(CONFIG_CPU_BMIPS)	+= -march=mips32 -Wa,-mips32 -Wa,--trap
 
-- 
2.39.2 (Apple Git-143)

