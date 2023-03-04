Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556446AACE4
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjCDWPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjCDWPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:38 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D4912F31
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:36 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 722805C00FF;
        Sat,  4 Mar 2023 17:15:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 04 Mar 2023 17:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1677968134; x=1678054534; bh=u4BPnCtaIl
        Wz/RhB8CbRBImZ0ZBCxI4tRBCcO4BfT7c=; b=wRDh3AoC2lhq7BED+QMJat15IW
        pSy6KIAuXaCJNcbTGMNtW3NmVwQ/cczJYucIde/8lgekXEam3qUSY/ycnOZNzW4G
        bYcCfZHheVpaVbOPesQnEUGAM2auvsP4eQvCUk8gW2e0Svkaa2oHny8ecmhJiPYS
        jD429efcoQAgfQU2ZJW/9z2VVhVyaw9w5qMszp0NNA17rbpvffcNFNo2vjFOhOq9
        IFWZxyVKAa1q7brLnidJTeDkds+Vwu+nAwO3YQtiAKZGU9AOC0Ysq//o3XMfOfwt
        04+L3to3f3dN6OZsuzwuvnmNe4x6YUDHsEoqF0CbiMfnF7LqbyKQH86Kmx9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677968134; x=1678054534; bh=u4BPnCtaIlWz/
        RhB8CbRBImZ0ZBCxI4tRBCcO4BfT7c=; b=iY5rLx+HmqMZsFr5E448KKf189rBa
        nfSSKjxxlxFksy7zKKzOyn6fXHre/iAQb8mPJTcY3ibaVms0oJwy/HsJDaBh1GpB
        m/bfeTAUeeV8FXEPaam8AiGgAbwaIjuNUfdfPX8EVOUtmh3BxikBN5oR67o83nja
        iWPB65PTOCzUyNj9l0H2Mj9B8+KZVyZ4tU1jEJG0tvuJwu0/JAtvyYIJ34o1BtPH
        iFtpbEgpysC5QcVxTEWpEvTodribhbSfrw20o4o0+CGtF709rVhPBLJfX0heGjKO
        Pl2KIvbUWjavOZAi3yVkTsXDox7R1nNs2nlcTtJjEyQJkCZOCTT+kdzjQ==
X-ME-Sender: <xms:BsMDZKW0ezPVH1nteBKIKhV3liGYvjG7JPnLa-MeKO9rm9fSdFAtbQ>
    <xme:BsMDZGlECvYjMQQLK1SoFjMEwcl5IGKyJwHQLZr6hTfT0MYRDME9iC9jqINRzV3KG
    jRba9edSVvIxp2osKk>
X-ME-Received: <xmr:BsMDZObOARKTdbK1gPfezUARkHafuucP4htNdCSG_k9rI8SIJw9rqdIdxZRO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejje
    etffehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:BsMDZBUok7-ZtQ1AEov7iUSOFhC3T8zRRRXQB1ffpd1rb3rMSsy6lQ>
    <xmx:BsMDZEmzSi2iqsVpNeCj0g5Uy6MzgjNshyaji2lEQR5mmOMUgVEQZw>
    <xmx:BsMDZGeIFHzrbG8pbKUylhuzthQbqkZ2RZiMKz1AxtEK3NMgNwoG0Q>
    <xmx:BsMDZJyAUzm4_iwjt0cZpKBGUlxH4wECXAU85PTEvAzVF-EoTDlCnA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:33 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 00/12] MIPS Virt board support
Date:   Sat,  4 Mar 2023 22:15:12 +0000
Message-Id: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

This patchset adds support for the MIPS Virt board, which is based
on my QEMU patch [1].

It can work with all CPUs from MIPS Technologies, and also Loongson-2E,
Loongson-2F, Cavium Octeon, R4000.

Thanks to generic platform, there is nothing much to do for the platform
support, mostly decoupling CPU features with platform features, except for
last two patches.

I'm going to send PATCH v2 QEMU soon, and I will drop goldfish-pic based
variant I proposed in the initial QEMU patchset so the platform will purely
based on MIPS CPS (Coherent Processing System).

Note that due to QEMU limitation, SMP support is currently broken for all
processors other than MIPS I6400/I6500. This is because QEMU is now treatiing
secundary CPUs as a VPE (MIPS Release 6 VP). I'm going to fix that after getting
virt board support merged in QEMU.

Thanks.

- Jiaxun

Jiaxun Yang (12):
  MIPS: Move declaration of bcache ops to cache.c
  MIPS: smp-cps: Disable coherence setup for unsupported ISA
  MIPS: mips-cm: Check availability of config registers
  MIPS: Octeon: Opt-out 4k_cache feature
  MIPS: cpu-features: Enable octeon_cache by cpu_type
  MIPS: c-octeon: Provide alternative SMP cache flush function
  MIPS: Octeon: Allow CVMSEG to be disabled
  MIPS: Loongson: Move arch cflags to MIPS top level Makefile
  MIPS: Loongson: Don't select platform features with CPU
  MIPS: Octeon: Disable CVMSEG by default on other platforms
  MIPS: Add board config for virt board
  MIPS: generic: Enable all CPUs supported by virt board in Kconfig

 arch/mips/Kconfig                           |  6 ++--
 arch/mips/Makefile                          | 38 +++++++++++++++++++++
 arch/mips/cavium-octeon/Kconfig             |  3 +-
 arch/mips/configs/generic/board-virt.config | 38 +++++++++++++++++++++
 arch/mips/include/asm/cpu-features.h        | 21 ++++++++++--
 arch/mips/include/asm/processor.h           |  7 +++-
 arch/mips/kernel/asm-offsets.c              |  3 ++
 arch/mips/kernel/cps-vec.S                  |  5 +++
 arch/mips/kernel/cpu-probe.c                |  2 ++
 arch/mips/kernel/mips-cm.c                  |  9 +++--
 arch/mips/kernel/smp-cps.c                  |  5 +++
 arch/mips/loongson2ef/Kconfig               |  3 ++
 arch/mips/loongson2ef/Platform              | 35 -------------------
 arch/mips/loongson64/Platform               | 16 ---------
 arch/mips/mm/c-octeon.c                     |  8 ++++-
 arch/mips/mm/c-r4k.c                        | 14 --------
 arch/mips/mm/cache.c                        | 17 +++++++++
 17 files changed, 156 insertions(+), 74 deletions(-)
 create mode 100644 arch/mips/configs/generic/board-virt.config

-- 
2.34.1

