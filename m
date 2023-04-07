Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6ED6DAB7F
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 12:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240613AbjDGK1e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 06:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbjDGK1d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 06:27:33 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6BA7282
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 03:27:28 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 1F0E85C0261;
        Fri,  7 Apr 2023 06:27:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 07 Apr 2023 06:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1680863245; x=1680949645; bh=AfVLHftNx0
        iyU8xT81WX9UZaiJ2fgfUdmHD7Dv0+laQ=; b=yYnSoy7LuUK1bN7rf2Mk2vlTq5
        idYobEuTqlYsRuKIuMBEKT004vAWcLDsAYd6YvLH8qwjG6/v18nr5ipQH6Acr9o6
        h7J+ICcjhzP9Hn6jPxcLvBHZd97QDF3CXS0iKqU0sMJidMj/wJ9x+h1hSuAe/qWF
        elYuxWKS1WyFOWQfq05W5xTi4edszukNtDRYSsKVZcF/NHWLf0b296xIfAph8nTK
        ht7/eQmAM2lXO7e9EjAVbekB2p/ReHSSL6AW8ZwHrtK5CRLFpX7woEaeKNpT5h4U
        zLRdagLPXnU3DFH97/DhpsZWjtRXYESVenfiK6vIR6LMT0iRIbbgpARN2skA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680863245; x=1680949645; bh=AfVLHftNx0iyU
        8xT81WX9UZaiJ2fgfUdmHD7Dv0+laQ=; b=GxdZGCEFymm4jaGPkelVW7vfNDcO4
        I5E8IbcjZCDZS9RoarxDaoSyYuBGCK6cLTsKwOjGpwLL5u+oM1obbTD6sIRGAhaD
        F4HeLowxB3qWCX1+4DpyoyiUUWu2P7b4NJnH7wKu7HTHDqxe2eIcgZ9G0XHsu/X9
        EMSLadeyFM9FI3X1KspjwOTH3e2UhmimUYiW/TtNy76DBgJADu8PHfw/g0fGq5K+
        0bMMKisI0IrmOE97pmiiL/9Odcn0EEFubnisbrXHO/AVqq/YYiaclP6h81p+lwY8
        j1iEjrw02eRYPIWVrmYKgbOiRBGTYSIbtSghK12DIqAzHq+hYjzJs2L2w==
X-ME-Sender: <xms:DPAvZC8-rteJ68KkzZi9VPUafnUBEdbmvCQcUnVoJSX_Vgh_DC-GQA>
    <xme:DPAvZCvQWL6yz1BXjIWpzmrriXwx1Bv2VehfzulrM_AKwEkTJweZY-3ufJ2bwRjVK
    5kce3VsmBztcolzmy8>
X-ME-Received: <xmr:DPAvZICc2_8wv-mmfqOVXNk3Hj8tKAMFK00CH_l-VMMIZdMYJUfseJw6IxdR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:DPAvZKcOAMoClJIWesCz6Izs-CfLCMHFrsTHerBkUw9PYxIqOXeKwQ>
    <xmx:DPAvZHMLaJ87ytJ7HOadAaELUxtxbj4V4BrL6f4DDrEfFU39h54YGg>
    <xmx:DPAvZEnOgCKnfczxGoqgT4hpt0lnKFUh-pWsIvYlggVYc-rZgsvY7Q>
    <xmx:DfAvZMpjM3zmJw4AoR7I-oYCMdO7XS2enj_f8hJ_djp9OCUs_Gx_dA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 06:27:23 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/5] MIPS: LLVM toolchain support for more CPUs
Date:   Fri,  7 Apr 2023 11:27:16 +0100
Message-Id: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
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

This patchset is to add toolchain feature detection for most MIPS CPUs
by adding more toolchain feature detections and fixing -march CFLAGS.

Thanks
Jiaxun

Jiaxun Yang (5):
  MIPS: Move various toolchain ASE check to Kconfig
  MIPS: Add toolchain feature dependency for microMIPS smartMIPS
  MIPS: Detect toolchain support of workarounds in Kconfig
  MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
  MIPS: Fallback CPU -march CFLAG to ISA level if unsupported

 arch/mips/Kconfig                | 66 +++++++++++++++++++++++++++++---
 arch/mips/Makefile               | 65 +++++++++++--------------------
 arch/mips/cavium-octeon/Kconfig  |  1 +
 arch/mips/crypto/crc32-mips.c    |  4 +-
 arch/mips/include/asm/asmmacro.h |  8 ++--
 arch/mips/include/asm/ginvt.h    |  2 +-
 arch/mips/include/asm/mipsregs.h | 10 ++---
 arch/mips/include/asm/msa.h      |  4 +-
 8 files changed, 98 insertions(+), 62 deletions(-)

-- 
2.39.2 (Apple Git-143)

