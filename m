Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6DB6C2F7A
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCUKt3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjCUKt1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:27 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1371352E
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:13 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id D1A103200A02;
        Tue, 21 Mar 2023 06:49:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 21 Mar 2023 06:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395752; x=
        1679482152; bh=DzRue2E6UzyySo1j7cr7teOjJhrLZIwt1Z4PUQyyJjY=; b=y
        qcwtUoKiLFYiUM4e1Cx5n3MuvZZ19MD6dzYBAoSE6sTB/UuQyjwlkTizzExHb4MJ
        cdPt7ysxthAKamu7W36R4JpqQPANM5njd4TSfGxsCodaTb4J4HhJqDhAJFh8B7VT
        hvSh2erAVlWZIhLUSkzjQG2UJsKx8y2/bM2/65p56RI7MPCdi7YOmwE6j/J4ebdI
        Kh7iGwvMZdlV3KTP5RVVZJGPsEtbYxnd11CnD0I29tMxujD9KAJn1Va/z+Jb5lmU
        nnRNxxGf3zICiHASzzpMNjgm8wO7rP8HMZnH1mozyXjwmOgfuuSwS2JCo6X+38OU
        //2xayyY7/0hKleNG382g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395752; x=
        1679482152; bh=DzRue2E6UzyySo1j7cr7teOjJhrLZIwt1Z4PUQyyJjY=; b=r
        rd1LHbCz2ghMsGuZhuq2uvA5nVmNBWUWwEoy13juBFVvWCCcuHncQHLs8NbVkdQh
        ktIv4ruqzKMVlQgG5QP1m1W7sHpcRykU1ljbLtPq8q8e21MSywAHjSKEhTcuUzjZ
        SWrBgz7MkkdzIYGTFsVQqXrmcvCRBvk6nnUQqmpKsSp35DjVJNL4UlihfY898t7N
        02xt0cqR7ugZKgVCJYSaDifJsKDOLUw420G/OUJZnDpq90ZEaplTanHbwHMLUIwm
        xKPp/oY9zAFj/gZ9oiXvRuhexTdZkB0b/AtJo92vjb55SjQLH+Sp4rqaNnroHAW6
        GI9e6R9VVCQop+9PEoVbg==
X-ME-Sender: <xms:qIsZZEfx9R090YpU55t0DTG1JAR1UQCOM_wv-ZPMq6B3SxT6uHBTpg>
    <xme:qIsZZGOh5__HSIqWWxEDSgIltRJ7F2GsHFkMATCwNU80Y4HfACQSc51-9oKSvUzmu
    DK0YT3ouDWd1t0xAyA>
X-ME-Received: <xmr:qIsZZFgBQ6kpGaHC_C2xWGfQaID0LlLeQcMbV2rj4a25xQGMRGK3kr1TIX-0s73_qQz0MDrRRuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:qIsZZJ8OwBasfwmMD2RiKvzXdrWl6UGiTr_FBmbCSM5c5ecN8YaBDw>
    <xmx:qIsZZAvYwNVHpO_t2zaLXtsR8xNlDQZs5vQyQRlusWZZxzhByjCLxw>
    <xmx:qIsZZAF7QHoCEEMbfk7QAS28w3f7Kt196X50XnTJk-t215QATeBKzQ>
    <xmx:qIsZZCIxLTrCJHplHvdqP7NAuhVjrSNEnW1OzUC_eHf5QgbF2Wy7Og>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:11 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 06/12] MIPS: c-octeon: Provide alternative SMP cache flush function
Date:   Tue, 21 Mar 2023 10:48:46 +0000
Message-Id: <20230321104852.25284-7-jiaxun.yang@flygoat.com>
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

Curretly c-octeon relies on octeon's own smp function to flush
I-Cache. However this function is not available on generic platform.

Just use smp_call_function_many on generic platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Style fix
---
 arch/mips/mm/c-octeon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index c7ed589de882..b7393b61cfa7 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -83,8 +83,13 @@ static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 	else
 		mask = *cpu_online_mask;
 	cpumask_clear_cpu(cpu, &mask);
+#ifdef CONFIG_CAVIUM_OCTEON_SOC
 	for_each_cpu(cpu, &mask)
 		octeon_send_ipi_single(cpu, SMP_ICACHE_FLUSH);
+#else
+	smp_call_function_many(&mask, (smp_call_func_t)octeon_local_flush_icache,
+			       NULL, 1);
+#endif
 
 	preempt_enable();
 #endif
-- 
2.37.1 (Apple Git-137.1)

