Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9B86D5C03
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234236AbjDDJeY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjDDJeX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:23 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1114DBB
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:22 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 7CC335C01C2;
        Tue,  4 Apr 2023 05:34:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 05:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600861; x=
        1680687261; bh=3+wyLywyOximyKaBb3367h+Y1CpT4JhqciGpBaKTr4g=; b=J
        CJ2gBUcAaR1Tk57pQ2U0qv5xHbXaFdAk91yXaZbpVNqdCp1eY3dpdbsVUO4+OHKx
        M0epPfet+t9h4XTvO2wPpL9kIVawNfzbisG7dJDAt3Qa8nKoUk/zxzo1JoXP0O4z
        nBWy0kpoJBWgpFG8utXpHnO5yas3ZXbiFz1xCYTMXiGZvOYq3ySjmeJjstV9KeMj
        kZIOIK3iKCaBAbdWzqmOxnXQoJVHGee4BomXuJpHI9IyWn0q3hrDYpDje0nBogmM
        jDnPMdD8uGt1/sgZaemU8tv6WbJ3HKDcQq3nyNdrsnSahofiRBwa73aVtESiZqaB
        E6dsl2Hxmxv5kDwongcFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600861; x=
        1680687261; bh=3+wyLywyOximyKaBb3367h+Y1CpT4JhqciGpBaKTr4g=; b=R
        +LoFJCOFl3RYd83J9dksiS7q83kj7XsmQ+1qUPtuBCTIqxSGoA2UJx8vFi8pN4ta
        yCzk2j11V4K6cDVr7hBPFfvNKOlihw319voxc2EIr6txL8bGBw6XhoYlzqiT+mcd
        HhrHnpFDuVan5mj3La5dZeSKJ+5f0M5AupoaJXoCH8+LvDGmAxv1CzCUJfN2hjjd
        IWNeT0dpEN9ctwbwGDBOAq47KuxNY4CrjTq1BGJvbcVGs5O4N5Gts9xf0eYLEbRP
        YUywM1/kxPxooRet4tNXIzAzRE5m8g/y9Ui0UIaBJ9yt4UY0xrWLcvmhsBzapGii
        usDV/LFL8jxhYKS+D4erw==
X-ME-Sender: <xms:He8rZCdc9l8dFcAQP9no3BNqBtW44JngUSDjFApJ0QvQyEyflCnfbg>
    <xme:He8rZMNimkAXatnxinSUH6uw6a_f9hsKhEQNsqXLAwSqUk6k_XTgPNpmD2wfgtjZj
    WOgQJ2sVvynFwuH7VE>
X-ME-Received: <xmr:He8rZDiXm1N9ANj_lxf0RXi5sArRAeMpBcLwm5KXurG4jXWw2RDRWNa4lc-P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:He8rZP8en5_dVoDXlmEFrtLUydVzOeXEAuNTg2Vl_ubywB0a_iCc4g>
    <xmx:He8rZOsQ8d3DaM2PKz5o7Tffz4CrJUiLEKYrcZ2XGaJVoa-hIZwEGQ>
    <xmx:He8rZGHyYfigWdGDYXMlVKqErWVJzlkj2IxQIQWgCPvqWBx3f_ONPg>
    <xmx:He8rZALh55cD_FDw7vZogKJFsf76fQz-JOuANp8Vs1i2J2HxT_p33w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:20 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 07/12] MIPS: Octeon: Allow CVMSEG to be disabled
Date:   Tue,  4 Apr 2023 10:33:46 +0100
Message-Id: <20230404093351.4233-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
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

Don't include cvmseg states into thread_status when
CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE is not defined or 0.

Fix compile for kernel without this feature.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/processor.h | 7 ++++++-
 arch/mips/kernel/asm-offsets.c    | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 3fde1ff72bd1..ae2cd37a38f0 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -202,11 +202,13 @@ struct octeon_cop2_state {
 #define COP2_INIT						\
 	.cp2			= {0,},
 
+#if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
+	CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 struct octeon_cvmseg_state {
 	unsigned long cvmseg[CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE]
 			    [cpu_dcache_line_size() / sizeof(unsigned long)];
 };
-
+#endif
 #else
 #define COP2_INIT
 #endif
@@ -263,7 +265,10 @@ struct thread_struct {
 	unsigned long trap_nr;
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 	struct octeon_cop2_state cp2 __attribute__ ((__aligned__(128)));
+#if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
+	CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 	struct octeon_cvmseg_state cvmseg __attribute__ ((__aligned__(128)));
+#endif
 #endif
 	struct mips_abi *abi;
 };
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index c4501897b870..40fd4051bb3d 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -306,7 +306,10 @@ void output_octeon_cop2_state_defines(void)
 	OFFSET(OCTEON_CP2_HSH_IVW,	octeon_cop2_state, cop2_hsh_ivw);
 	OFFSET(OCTEON_CP2_SHA3,		octeon_cop2_state, cop2_sha3);
 	OFFSET(THREAD_CP2,	task_struct, thread.cp2);
+#if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
+    CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 	OFFSET(THREAD_CVMSEG,	task_struct, thread.cvmseg.cvmseg);
+#endif
 	BLANK();
 }
 #endif
-- 
2.39.2 (Apple Git-143)

