Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FDE6D5BFC
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbjDDJeS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbjDDJeR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:17 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2861BEF
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:12 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E4F325C0189;
        Tue,  4 Apr 2023 05:34:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 05:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1680600851; x=1680687251; bh=QUw1THECmT
        +Ns65emIXVnx2eE35E6mAMoMFvHd04ljU=; b=LNIweCkN9pgfvZU5TfMK9ftXvU
        mcJFnmLk8woKdwXkqwxjoSQX7n+XhA+tPhkUNgBGV3YMbLnQfIYZ6J68y82vUenj
        YiQEclcNmvBUKAV5OLf81RjBgT7OsMG+VfmPypReAN99IqgbIgFG7VoDAImtjaqG
        U9IHSmdDiEmS0F8dPWw3RwFGzUazRLA+QRpn859O5vkuF5aU3eAREuKMp1VPFkl9
        YSWRr2r/kRu8xsOSTNVlHwm1WNCxji+H3yCETISuoQD4wN5//ZZUYk0TkDdLdRDU
        IMv8a72vBgsnLFTDDKs0+cylydphyv8LAurB57UzEDsNsHeKmuc4tgvKyIYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680600851; x=1680687251; bh=QUw1THECmT+Ns
        65emIXVnx2eE35E6mAMoMFvHd04ljU=; b=GgxsJ4iwAB77cIqpL7QmeqbHVzO+s
        0RVSWGhE8+m7h7ovdvZsykLrhXMjnSrNJWWd+8Lh8TJm0hS4Rdozt0L5P6zN0Flp
        EX+xI8g/mNAxMAe0uu018WdCYYgyafjT0Rxg4h6pMlvTTOmAgL3TRncbikkVp7YM
        Lf8DOutsEM4sHyr6Md5C3oVhQWsiXImS7GwbjxyYG0D52rdKh/eayZWjBtUT2A92
        LwGMxMW5OdgXmjnp+udjgJyrrE8K+WHVBrkK9acljijYoIi49kRSWXRVavM6OumC
        0XPKE7xzuCQdWMau+AHq4SaidJoZRvTG2SDBk41xWwZdsW9TEOK6GMgAg==
X-ME-Sender: <xms:E-8rZBpZcRntaYBouruLavL9T0HOPhS-UFXGyEN_lH9GkbWXE8J7Hg>
    <xme:E-8rZDpoPqPLjzd6l_SJ2RaHf12uXnNbeenyb2mtbZxNdNMTCU8gh0FQqB4UV0fak
    6CVUP9MuytgI3n5J1c>
X-ME-Received: <xmr:E-8rZOPUDuw3uLA95DDfzqgKo63UO2vewdewRf__0MzwwJiCcYLYCNxfe5tm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdeuteekleeuudfgueethe
    dtuddthfdtleffgefhieehfeeigedvtdeuveetiedunecuffhomhgrihhnpehkvghrnhgv
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:E-8rZM4CvDWUFCJ7DtbLe7QEQWjPWtVL5tT5XnpDmR31V5kXhEM8YQ>
    <xmx:E-8rZA4KvkHJDbZjX9IcRcgBmjRbnONfBxlqzE07jH9OH_SITze_cw>
    <xmx:E-8rZEh4waTAGYWe-0r-tdo-iTZWzYvJqnV9hGlwNb5YUKkTcBSTgg>
    <xmx:E-8rZL2eeU0ai9akkS89PvhTUfTkSAyqsq26Msb9CaidhmqNr5vrsw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:10 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 00/12] MIPS Virt board support
Date:   Tue,  4 Apr 2023 10:33:39 +0100
Message-Id: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 arch/mips/include/asm/cache.h               |  2 ++
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
 arch/mips/mm/cache.c                        | 19 +++++++++++
 18 files changed, 158 insertions(+), 73 deletions(-)
 create mode 100644 arch/mips/configs/generic/board-virt.config

-- 
2.39.2 (Apple Git-143)

