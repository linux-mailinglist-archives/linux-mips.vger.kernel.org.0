Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE816AACF0
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjCDWPu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjCDWPt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:49 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C66E1ACD6
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:48 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A7F915C00AD;
        Sat,  4 Mar 2023 17:15:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 04 Mar 2023 17:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968147; x=
        1678054547; bh=YAu1/qlx37xuX26VH7NcnTQfwdpQul+z5p/k8GJJKM4=; b=s
        0J9F/KT6qdoeJGU9j9B5SiHqk9O0lRV2rnIPdw8GLtB8rc9qROQ0JM3kUkIAoDp4
        zzUH4jxJKZLMWY08tgtBGcY6r7xu+mLTQR6tTfj6jp/F1IOMXuYu2eG8uvle3i0/
        i2jMhnlBse9FMYYtfEKAygZCAEv6qEQqBHroX3W8dMyg4y/bQON0xnQOAOAHeN7t
        F9SOO1FrGl0++C7XAMD0bLLXupe3ZAhKTLne6K0rsUVYNYtUm0NuSNqSa1RbYazm
        02tYW1ubLjDZ9hMG/T9oKsdYfp2z6nZJIWg6EqJ/OwWnKhW2y6CpF4EYtx2rJ3xY
        omKezaNM63ZIDu6UVr+EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968147; x=
        1678054547; bh=YAu1/qlx37xuX26VH7NcnTQfwdpQul+z5p/k8GJJKM4=; b=h
        sJyvQ8V6uM6dbztnm7oE9a4iHI+hZjuVB8fnylA32Xmf9U5A2T5lqHg0mhScd8HS
        IVZQmG9kn3T5BIcruwu/OwVpVIi7UWTA4Fs5GrgpTyhIsxYQTwcGMgndmsRuYkuf
        dlTyC+fmscDVkeFEJXnD2yF6sA7LIvGKG5Sou0sAw5NEFrRWl+zxeSEibQIwBtX9
        WNJSpp7LtGZrqE8hx4qyWZZ/udcPDc2bp42Q11BGFvA3uFuvszBnItYMwKooYV9x
        oDAE4lvCQCfEDybMy2IuEn/d5rgAtCQXPuEqTf0djTh+ciRR1nXQbU/20ec+o7uo
        DCuPQMPABrhBh8AZrh09w==
X-ME-Sender: <xms:E8MDZPdhjl-gx1hW9pIUWI9zHQLYcNOxzCTUEGXhXUxfYn80WBHXiw>
    <xme:E8MDZFO8TWUsNQYRKA4JfYwSN8fa68z_HvnhRkHAGCXsr3-L1JVOHRt7xyLL1eua0
    z8gHIk-YQwmbbTyCC0>
X-ME-Received: <xmr:E8MDZIgZMIfoEO_ODm-hX71Lufk938TfRikUxV0DuMYQXbFsHJHYoqWtsw_L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:E8MDZA97roQuP0W6fakfldsfsMldFhbciz-NnLu0Aw1OT2NpbYvfFg>
    <xmx:E8MDZLuj8fBdf4wU87_sJL9FBXbcI1YGx7uKa63kla1iYzi0A4NT9A>
    <xmx:E8MDZPFUR0ucndDlX1FHECdshcbSrxgMJa4OXa2LaNucmVg7Da_0mA>
    <xmx:E8MDZE5Nqa_2Z2wT-xlDMlkGQjmxMFIsEpEo8WkIwyJ65cxwx0ENkQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:46 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 12/12] MIPS: generic: Enable all CPUs supported by virt board in Kconfig
Date:   Sat,  4 Mar 2023 22:15:24 +0000
Message-Id: <20230304221524.47160-13-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
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
2.34.1

