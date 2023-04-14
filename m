Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1594E6E1DC4
	for <lists+linux-mips@lfdr.de>; Fri, 14 Apr 2023 10:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjDNIHd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Apr 2023 04:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjDNIHc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 04:07:32 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3116E8B
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 01:07:29 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 2E1AC5C00C7;
        Fri, 14 Apr 2023 04:07:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 14 Apr 2023 04:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1681459648; x=1681546048; bh=Z+5OVprnxv
        mJy54lJVl6CxDYP6IT5+FJyDN/trCBkx4=; b=0CkedSLtTI+vXsFUjtF6irf4oN
        GPTLOGD5UpLTvZC3N3zET3jFrylUfkUN/yKfBu7ZFFAMfXb6kNC9gyjvCQ1w+rrf
        /pSa2O8H+CF0n+SI+3zK1kz/8kUo5CnAE1/7NnF+543lUbMDLnnL9n46jeqNjrNH
        0YF4y4iit0j01uq8fX7xARzk+zu9drFMhm92zrYkBh4XtG+KbKHT2FsGOiJiiZ4E
        3DXl6XBRM4Cu6ar3M648z/Xw0Lmt5w0btfct0AaaBmUVHk5Ep8kPzI/W176qqAVd
        xG/c3fpk234X5bQiQ/B/bF8aqbbTv11lokUWHivjsfVG9TkzfsWeSrzSUJTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681459648; x=1681546048; bh=Z+5OVprnxvmJy
        54lJVl6CxDYP6IT5+FJyDN/trCBkx4=; b=Ycg8+FoImML3EQVI9oeDk34kkM8Gz
        d+Ogu4Bc8uquvdSCpNyEUTFepwtay0+eSAtUE1X7napbeLchaeIFGDGsIdiyiHPS
        a5AGn952tyFAaWQK6npqduJNveI7t0fJslCQ1bmX6nHwKVD40sUvlizWBTDa8osb
        1ApoFp1OFNcko0U7hvTmZ2GFRxmBe/Or3YH7Q4NRz1PpbWHlRynrsLQoajOKp8Dx
        27LNMrNkOoHcZRL5ci54npTtSRqDBKllTEXRyYdO+pjGC+ClKRDhivuxrFZUSUnK
        3Cm8OgBkmoelZYYDw+SFdPTOfSArxgY9g1Nsj7Z3jaAb/IpxBKqMsVQcg==
X-ME-Sender: <xms:vwk5ZPSZU2nbxPZHij6MeOFZ-g4-nSjIU8KOhFzjEps1Odw-2qzogA>
    <xme:vwk5ZAzhz8GXdN8TeNF76xY02wFA4jmNL1TSNvp-UFgOXVwKYSxgB0pD9kFf0Z33I
    CcCWWUjiE8B9KDZWAo>
X-ME-Received: <xmr:vwk5ZE3yIyCyCXDHA4U2kc0M6bb5UhCDE95_NIJwu7QXyqIeKp868A-gOjJf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejje
    etffehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:vwk5ZPDE3mTPWOu6KbbEnySnoZED1d_PRH0MTZnW7SY5D_kQmN1PHQ>
    <xmx:vwk5ZIg-TQF91fLswW9kRzJ1Sx-2gFJ9hVtE7kEeArSt1R9BQ76ujA>
    <xmx:vwk5ZDpsWAqJD4Py0yzB_g8hxNGRdN43vSoNJa9YxZid3-LXfHZHbg>
    <xmx:wAk5ZAdgmgxuAEXYiZLYUHDKerHg0AOuvI_8qQy3NmkBkUZ1f4En3Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:26 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/7] MIPS: LLVM toolchain support for more CPUs
Date:   Fri, 14 Apr 2023 09:06:54 +0100
Message-Id: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

This patchset is to add toolchain feature detection for most MIPS CPUs
by adding more toolchain feature detections and fixing -march CFLAGS.

Thanks
Jiaxun

Jiaxun Yang (7):
  MIPS: Move various toolchain ASE check to Kconfig
  MIPS: Add toolchain feature dependency for microMIPS smartMIPS
  MIPS: Detect toolchain support of workarounds in Kconfig
  MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
  MIPS: Remove cc-option checks for -march=octeon
  MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
  MIPS: Limit MIPS_MT_SMP support by ISA reversion

 arch/mips/Kconfig                | 68 ++++++++++++++++++++++++++++---
 arch/mips/Makefile               | 70 +++++++++++---------------------
 arch/mips/cavium-octeon/Kconfig  |  1 +
 arch/mips/crypto/crc32-mips.c    |  4 +-
 arch/mips/include/asm/asmmacro.h |  8 ++--
 arch/mips/include/asm/ginvt.h    |  2 +-
 arch/mips/include/asm/mipsregs.h | 10 ++---
 arch/mips/include/asm/msa.h      |  4 +-
 8 files changed, 101 insertions(+), 66 deletions(-)

-- 
2.39.2 (Apple Git-143)

