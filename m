Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02B969E123
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 14:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbjBUNRH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 08:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbjBUNRG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 08:17:06 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D6429409
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 05:17:05 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 7F4D03200927;
        Tue, 21 Feb 2023 08:17:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 21 Feb 2023 08:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1676985424; x=1677071824; bh=mckKPbOIXOOxhLDaV7zmVBa/5
        /tNR5jVCDFIrPI1AqU=; b=eFMFNXuQ/lmpRAFTXFjNnze1Juctc8cX5kDYE+fJe
        fLvF7nk1eos9GN+a4g9PCiVIWUMjX3wSZqteZPXHjAEEJWDdxnMEaroNHRt2pDTE
        7Ek0mlBzcwNCxdhAi+KyjSQP/3EoJFy9Zpm+zaS4M6FVw3DOUCyMM59Tz7XEcIbC
        5K1VBDM5nbOVNfJJsHOIyLPUg0UBRa1uR+Lylyc7aGZBmlh3sNs4nMOrsRsKqmCL
        PfPDEaXgdL741hf3VxY8skLv21FCZpQQZAQ8HTNFSAub5UGIY7tNRbQEGl9ccwc3
        +aCgPSvjFxa8YSS/1FBFTkWxPf6AtmWu7Z067ogr6t48w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1676985424; x=1677071824; bh=mckKPbOIXOOxhLDaV7zmVBa/5/tNR5jVCDF
        IrPI1AqU=; b=tbua2EyagNZvC/UMnT7D+IHrgFzvDqwiftH6y3QO7wz0tiIZoLy
        sd16l65+Zl5mApjBQ36Vke6e6oXaCc2wqjLK06ZhJfxTbBw9jiaM5jBsbUXoKvh7
        DhMAqlGa44Wm27LZgCdrcsCVoxdT4y2DbNzXe0ctytroOUi2VwioAqRfEEnynpwG
        XyyXNxpMDVK+si7ISyJFaUiMUZajlwqCYeRir8MF7u6BcxJ7pgghuCZxcVbgETPC
        N34WMlIc0sw4vrBHJk3/XxalnceVV8S6k1z6eBc6zTb/zJcyaDBo6WGwbhbV+q5x
        DtVxmHWdSDil+FKH7z3FBdznKIcPRcH5ifQ==
X-ME-Sender: <xms:T8T0Y925YeM_AY7wqhJoVdCkTfd1ylMmeHYZyZLPQJESY2qrcHC9YA>
    <xme:T8T0Y0HNSuNLIpqj-AzzY9w5YG7frXlCR6hNonbfh-171ykf0mNjCh1zwmXKjovcI
    rpPeKyuq1nX2s3M9Ok>
X-ME-Received: <xmr:T8T0Y94ijojKHXdjJznzCHex7S90SyP1A7YMcP7zTezgTiVzezRChZcFyUfh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:T8T0Y624Y8U-1Q---1oEhMwg2koUIsh-1PO31uFoJ9GTUem80MfN7Q>
    <xmx:T8T0YwHUICXXk9o4gOh-Txtx-U0nrtXpC3a6juN_y5Ja_Vn_yGwaVA>
    <xmx:T8T0Y7_GRR0F-05UrU4kc5-QzX7pKdnfx8RcoWjgg9fAeghEXYcBqw>
    <xmx:UMT0Y1QA2CzO-ISKqKwd9_QwQTEiGV-Z5ggIvle80EPuPQ209ZRXjg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 08:17:02 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/5] MIPS: Loongson64: Clear chaos in barriers
Date:   Tue, 21 Feb 2023 13:16:53 +0000
Message-Id: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Jiaxun Yang (5):
  MIPS: Loongson64: Prefix ipi register address pointers with __iomem
  MIPS: Loongson64: smp: Use nudge_writes instead of wbflush
  MIPS: Loongson64: smp: Correct nudge_writes usage
  MIPS: Loongson64: Remove CPU_HAS_WB
  MIPS: Loongson64: Opt-out war_io_reorder_wmb

 arch/mips/Kconfig            |  1 -
 arch/mips/include/asm/io.h   |  2 +-
 arch/mips/loongson64/setup.c | 15 -----------
 arch/mips/loongson64/smp.c   | 50 +++++++++++++-----------------------
 4 files changed, 19 insertions(+), 49 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

