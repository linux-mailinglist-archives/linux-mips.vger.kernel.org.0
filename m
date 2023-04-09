Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1576DBF80
	for <lists+linux-mips@lfdr.de>; Sun,  9 Apr 2023 12:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjDIKn0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Apr 2023 06:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIKnY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Apr 2023 06:43:24 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD5E4482
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 03:43:22 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6AD8C32002E2;
        Sun,  9 Apr 2023 06:43:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 09 Apr 2023 06:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:message-id:mime-version:reply-to
        :sender:subject:subject:to:to; s=fm3; t=1681036998; x=
        1681123398; bh=PMqqr88crw3e/FBcE7+PtWmriJr6ml+310l16WR9uDE=; b=i
        Z3KCVOjG+6AMBqh2mTaAlcS3cDX0XctKWAToVpDWNbYMagKFzMug/0NN2SawGif+
        tTGc9NABwR9pDtFwMkn0WNdtasxXF+cp7Ws+oDzaoIli5CbxmgOg9XwPUX0Bc1x3
        Q+ZbixBq+b9KZj/ifF2cxiCX+zGv65P6OtjyDfE9PV73o7/d7s6Ljzc+NVfBf9C/
        lNgdyDP7/+8B5TBWLFiJRo6+dWzKu97i/iS/B/j2qjKQgehDDtckz4Nv0bC6DbOt
        womIdtjpdCYSm19auh59aMfcy9k8RoQtbsBETIyE1xShVAE7Z+QHcYwKi31Lyegf
        LRKw1qK7NzEooO5AQ+FRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:message-id:mime-version:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; t=1681036998; x=1681123398; bh=P
        Mqqr88crw3e/FBcE7+PtWmriJr6ml+310l16WR9uDE=; b=ddKVvuBsfpXM522As
        SnTSKgfCALda0Wrz/vGjNOzUbrN+oG0L7Xr8bqmMwXwF0PcLNiZV/gLdQ/14b+5H
        2aTWVLt51/DaI5dJHAcFZ2g9iSYKkh1dRUz7EloE+cZv47TuNqV0pjbo9GFPDWGv
        z4nwW+woZh/CzbVljnGJmyF1fqFHscTk1d72noMLWRHg2MZ7s5SbAI6G14/vt8G+
        0yVQd+o1I1HKSJQ8RcActweeJgEoiRWPOb1IjU8NHcZXOQOWUXCuilvX1vYWnAN4
        hsHTH9DNR1bchOfLkeb6o+6Uxh32oZ4e5kYgmwY2vS+I6tcQuPZ2oh+26HzBg7W5
        ojcjg==
X-ME-Sender: <xms:xZYyZGoZgA3kLgLCEMmZRxsBPwb48YCizUuVVnzNt1TVIDGpiJ1USw>
    <xme:xZYyZEoqDnj6fnSKv4OxthVRy-uQpf7dzzPafpM5m48UPLX_z6on0VQgqMZIlOYUm
    pvICbXsbW2DNxHVpL4>
X-ME-Received: <xmr:xZYyZLPVnvfN0wzdHdNVFAP3bXtL4XiQjMM7eCMgVD8D_k8AnMqh050bYqU6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejueekkedvfeekudfhhe
    eliedugefgffduveeviedvffeiueekiefhtdekueeuudenucffohhmrghinhepkhgvrhhn
    vghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgt
    ohhm
X-ME-Proxy: <xmx:xZYyZF47h6ILlrvxM2fh9WPJt2ktgeOxAvE0L3jCYYUhA4kHWew27w>
    <xmx:xZYyZF5_1i1bF3rmfLitbAIx6CZmcmTThyArcJ4DNQ_HDtIM90JIrQ>
    <xmx:xZYyZFhLUarNNGut_uxr6gn1EKfznFGzevPWrxfTLS1mfzAKtYtUjQ>
    <xmx:xpYyZI3GMjKjonfVXzOPVLfql_oQfFgQnwlHQhkd6W7nTj4RwRH0YA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:16 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/7] MIPS: LLVM build fixes
Date:   Sun,  9 Apr 2023 11:43:01 +0100
Message-Id: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi all,

This series fixes some build errors when building with LLVM.
Some of them was discorved by inspecting the tree.

Tested with LLVM + LLVM_IAS={0, 1} and GCC against:

allnoconfig, allmodconfig, 32r2_defconfig, 32r2el_defconfig, 64r2_defconfig,
64r2el_defconfig, micro32r2el_defconfig, 32r6el_defconfig, 64r6el_defconfig,
loongson3_defconfig, lemote2f_defconfig, ip22_defconfig, cavium_octeon_defconfig,
malta_defconfig

With other patchsets [1] [2] [3] I sent before, on my CI [4], with tree [5].

allmodconfig is still failing but it's not related to MIPS.

[1]: https://patchwork.kernel.org/project/linux-mips/patch/20230407102721.14814-2-jiaxun.yang@flygoat.com/
[2]: https://patchwork.kernel.org/project/linux-mips/patch/20230408115936.6631-1-jiaxun.yang@flygoat.com/
[3]: https://patchwork.kernel.org/project/linux-mips/patch/20230407102721.14814-2-jiaxun.yang@flygoat.com/
[4]: https://github.com/FlyGoat/kernel-action-ci/actions/runs/4649898964/jobs/8228560848
[5]: https://github.com/FlyGoat/kernel-action-ci/tree/71d3f53e9c44cebf62cfa4ed7ec3b0ce6452555f

Thanks
Jiaxun

Jiaxun Yang (8):
  MIPS: Replace assembly isa level directives with macros
  MIPS: Set ISA level for MSA control reg helpers
  MIPS: loongson2ef: Add missing break in cs5536_isa
  MIPS: asmmacro: Restore fp macro after undef
  MIPS: mipsregs: Parse fp and sp register by name in parse_r
  MIPS: c-r4k: Use cache_op function for rm7k_erratum31
  MIPS: octeon_switch: Remove duplicated labels
  MIPS: Implement microMIPS MT ASE helpers

 arch/mips/alchemy/common/sleeper.S            |   6 +-
 arch/mips/include/asm/asmmacro.h              |  57 ++--
 arch/mips/include/asm/futex.h                 |   8 +-
 arch/mips/include/asm/hazards.h               |   2 +-
 arch/mips/include/asm/io.h                    |   4 +-
 arch/mips/include/asm/mipsmtregs.h            | 256 +++++++++++-------
 arch/mips/include/asm/mipsregs.h              |  63 +++--
 arch/mips/include/asm/msa.h                   |   2 +
 arch/mips/include/asm/stackframe.h            |   2 +-
 arch/mips/kernel/bmips_vec.S                  |   4 +-
 arch/mips/kernel/csrc-r4k.c                   |   2 +-
 arch/mips/kernel/genex.S                      |   8 +-
 arch/mips/kernel/idle.c                       |   6 +-
 arch/mips/kernel/octeon_switch.S              |   6 -
 arch/mips/kernel/r4k_fpu.S                    |   4 +-
 arch/mips/kernel/syscall.c                    |   2 +-
 arch/mips/lantiq/clk.c                        |   2 +-
 arch/mips/lib/csum_partial.S                  |   5 +-
 .../loongson2ef/common/cs5536/cs5536_isa.c    |   2 +-
 arch/mips/mm/c-r4k.c                          |  33 +--
 arch/mips/mm/cex-oct.S                        |   2 +-
 arch/mips/mm/sc-ip22.c                        |   6 +-
 22 files changed, 277 insertions(+), 205 deletions(-)

-- 
2.39.2 (Apple Git-143)

