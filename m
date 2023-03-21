Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD306C2F6F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjCUKtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjCUKtJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:09 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2858E125A4
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:02 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id A220D3200C5D;
        Tue, 21 Mar 2023 06:48:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 06:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1679395739; x=1679482139; bh=Wa9XqqJF7m
        HfL/+1pD7rFqFP7r6yFt9oRA/0BTTDMog=; b=4LpMgYBlD9J4WP3MbBpdQdmZqr
        8Z1VvM+YJ7pcXSkf2gkU8uZyjOq4nNyBucaQrqBbbzoZ7X2ElZjgB8E1HmHISPn5
        42WGHE1E1v7gyNA5EXz5jm7j8sDdgVhxxSL90Y9ZhExo19o8Aac/SOV8n8phI4II
        Hiq4YUMy32Gihk99JzsHCJcSWOKD0SdvBpAob/RTvka/OAh+cUHnZR1Uc50BsjwR
        2Is27nE8/HS3JwsP+I01NLfqMXxW4yPUXA2m3tiZuYAUKRiO6BTICFDdUL3k1Hkn
        b8Tiz0gRcZQAXZi7wn2RIPAsd30j4WwOkyeNQOSL6+qarC9fPLV1ASe+31bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679395739; x=1679482139; bh=Wa9XqqJF7mHfL
        /+1pD7rFqFP7r6yFt9oRA/0BTTDMog=; b=mFUYQ4JYK9IlOu/vzJ/0skCy0D1C4
        uL0xyD7TLvGiibDFLYPPZeqYPWgF/7hCqIg/GXZSZT9HKOW8pomOlX/WLUZheIfD
        Y6MCpXXPgWom+cd0tfhogqOeC1tuvSBOLSIDQUwzbVX16FKh6klDolyH551cq5jI
        lQSoGJA5hZqZcBndepwZjO5pYAqfdHh+D4QjniFCfkKRMan/6fzFHmSYFSH8cMM0
        Ib0yOjzlDaNSpbtuUyPViu6K02K5vH+R0hAIPWksuzLYctt6/A8rTlt5WBWok90F
        bbOE1/jymtAY+Cj88Hde1cWC4wwljMZ6wDLY8PPcOdV4Lokt4v7rEp11w==
X-ME-Sender: <xms:mosZZMw2qBwVPiHH9b-OZPNzzMdONoLGkBcB0DsJ_8kykx5J34VLvg>
    <xme:mosZZAS54Aj2wFfIbmH4jNZsTLCGwMMZeh3jECQedCbYiKKkA5BVe1JUmqrV9JrCo
    9ka_SiY_bdyY1KeDis>
X-ME-Received: <xmr:mosZZOW2-KwnYVbpTJDdX8zA9tkaMeMehfW4G2kra8YJIhafctkk0AT0iCrhwXk1fOS3ZS4ha7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdeuteekleeuudfgueethe
    dtuddthfdtleffgefhieehfeeigedvtdeuveetiedunecuffhomhgrihhnpehkvghrnhgv
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:mosZZKgJN5AoIV2sZOGmBe-p_WXn7HmBDNYhN3nRI-AlIRMDvohgzw>
    <xmx:mosZZODQP62bZHjZdAbdZ0XfYfJlgqDtATVcu3JVltu8BHukdkO9hA>
    <xmx:mosZZLLLO2lAscth0xLQGdRnyXHiNA7zgoW2sHyrHKZ4Nk9lem-Piw>
    <xmx:m4sZZB-BTyK-7vl67WSVeY8d3mh-qQX4F9hHFP6piopyePKVAfa_eA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:48:57 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 00/12] MIPS Virt board support
Date:   Tue, 21 Mar 2023 10:48:40 +0000
Message-Id: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

Note that due to QEMU limitation, SMP support is currently broken for all
processors other than MIPS I6400/I6500. This is because QEMU is now treatiing
secundary CPUs as a VPE (MIPS Release 6 VP). I'm going to fix that after getting
virt board support merged in QEMU.

Thanks.

- Jiaxun
[1]: https://lore.kernel.org/qemu-devel/20230308000745.56394-1-philmd@linaro.org/

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
 arch/mips/mm/c-octeon.c                     |  5 +++
 arch/mips/mm/c-r4k.c                        | 14 --------
 arch/mips/mm/cache.c                        | 17 +++++++++
 17 files changed, 154 insertions(+), 73 deletions(-)
 create mode 100644 arch/mips/configs/generic/board-virt.config

-- 
2.37.1 (Apple Git-137.1)

