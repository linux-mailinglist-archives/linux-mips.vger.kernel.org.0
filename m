Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF456C2F82
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjCUKuF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjCUKtl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:41 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020981991
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:26 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id D6FC63200C5C;
        Tue, 21 Mar 2023 06:49:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 06:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395765; x=
        1679482165; bh=Sb4jsHlaQCYItYoBUEr7TaMKOC5OYkGYt/uxG9hD3bE=; b=T
        kWYeZT17abL3Dce3Bp4dKk1XnRgB8pjJKlQRN20IiUzf7z3lM1UYvNg5j2NdiGkl
        MKJvZJQKNamEkX4DafXH4rofqYEPRycvYQzV6LcIINANAVjacWvBkfkryYz8iuqh
        3+d1TwjYsE7M7DqL+GwCkLOik09vKAmxvjirk1+XVYFpytZtW53VZACcXhRPdLMS
        tnLHZhhoXkar3SD29cp0BHWAMUFM/Xa4YWB9/c9xZQdgXjIJWqK8pPh+j4cIpP9I
        r7MycckEABxOLTquS/pg3nsRKhGkNocF3IFmG89UT5RY7RNGOMnyH7o/xesWvE18
        KNY/KleOP4oMLxoipi9Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395765; x=
        1679482165; bh=Sb4jsHlaQCYItYoBUEr7TaMKOC5OYkGYt/uxG9hD3bE=; b=b
        IMwiGFBslaDYbMGxQsHYxsteUoKFArpWOQN23Ud3zPaC/4kvR0BbXTqCnLvzIY40
        eM69zMKLd8tcXLIXw0coDXTeV//tEihlBFG5L5VFbVcAzcZMU82qIjkkO4kor5it
        WDQzwYwxkjBVIA7o1sIt0DmxG2HM5TU1TrLvjJh1c97QAu9KHzR9Cv9uB5GxpcWi
        XFHHtVRb/PrUC//gJIejMVHv1VJ7xHn4AbLHemVN4t90oTgSef9kv0VDyVJfbvlb
        MAk572rUbrPUn23ekI4U+aufQoiiVyP+UT/WtmeSqjeIdlSHS6Lzc+xJBlDXldMf
        jETEQ3NZHnM3L4HIj8DwA==
X-ME-Sender: <xms:tYsZZM-rM1LzK27lIKBKtOTasUMQu605eldsj5r2-YYHpn2QU1Gusg>
    <xme:tYsZZEs9JpksgfvtTed1U0hXjaYNdHtPAxqKy439LtE1V5Gq-fx0zPd31FY8q_qtN
    OcNtm-Dwv6PQUDsqag>
X-ME-Received: <xmr:tYsZZCDT3RKz7-m19QflHS-dMhEiIOIzvUGttx4XA-XGzWwYuGy0hfETsCVcRQvijoN3PIIDJP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:tYsZZMcQhfpyWwzBrFrz8R9H_UKfCbqYi8utOiSACopFdYu0pJof4g>
    <xmx:tYsZZBOzcn33cNb3q1uJ_hk10C81E1pP55ASvRAdKw3CkBaSZgOzzA>
    <xmx:tYsZZGntI4eNFJ1dbhfrrODVFoyAUl-PcWMgTSfcWKm8gAf0bD-fhw>
    <xmx:tYsZZGrYAd--XL4hLthCuJAzDo1G4dJRO1vCd1rll3jvjrTTZgJaAw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:24 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 12/12] MIPS: generic: Enable all CPUs supported by virt board in Kconfig
Date:   Tue, 21 Mar 2023 10:48:52 +0000
Message-Id: <20230321104852.25284-13-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
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

Enable extra CPUs that may be supported by virt board, including
R4x00 (R4000 in QEMU), Cavium Octeon (Octeon68XX in QEMU), loongson2e,
loongson2f.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 940ade1c9449..53160d49387c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -155,12 +155,16 @@ config MIPS_GENERIC_KERNEL
 	select PCI_DRIVERS_GENERIC
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
+	select SYS_HAS_CPU_CAVIUM_OCTEON
+	select SYS_HAS_CPU_LOONGSON2E
+	select SYS_HAS_CPU_LOONGSON2F
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS32_R6
 	select SYS_HAS_CPU_MIPS64_R1
 	select SYS_HAS_CPU_MIPS64_R2
 	select SYS_HAS_CPU_MIPS64_R6
+	select SYS_HAS_CPU_R4X00
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
-- 
2.37.1 (Apple Git-137.1)

