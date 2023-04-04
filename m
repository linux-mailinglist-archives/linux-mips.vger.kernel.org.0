Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF546D5C02
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbjDDJeX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbjDDJeV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:21 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF57FBB
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 26E1C5C01E9;
        Tue,  4 Apr 2023 05:34:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 05:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600860; x=
        1680687260; bh=/mRn2KURJBYeJb4uQfWZKNUeYcBVYBGjo1aIvi0/uVQ=; b=v
        rUttSY/1fWP3f7u22DesujdsrBm3/gROyfamU5bwoEmgVsEeV8o3YzXRdUhGfJKZ
        zaluzbhuqhHBI56j2CVzDQ6rOX3yqwcd812Nqu5J4OJs1cZ2dt9okiakcIANB4tJ
        SPcgGBkyziwd/7B8CwJ9vHNBfqBDlPj9wugt36vEVDOam9KeN4Tv1Qi+C8sBdhfL
        5UfiASdw5GCUH3+i/x+A4MY9ibIimN1SK3xK0aO1s/JwJhjt0yWE9NVZAqcdMh3n
        iqB6ZbWAt+BouV+Zzq/5GQnIeRjMOWPPq7m5E+FIfjKsp0oblwbJd6LcJREtKuIm
        xdn4AHW3TIMSkSbz2u4Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600860; x=
        1680687260; bh=/mRn2KURJBYeJb4uQfWZKNUeYcBVYBGjo1aIvi0/uVQ=; b=i
        F3McSWxs0MFDSpxzNxyXflSOlQpjofXlemu5qZdpCpJLON/lCNClbei0mkRH0Onu
        kKazsvghkJkHYeCD4pnU+HkTYA8Ii48OWodcx6ikIfdkC5V5SG/eBNqWj4s9I/Bg
        fCbNRR7m+/8nDFeCQvPF/Bval29Ssr4pm87D2Cag2kxQiIOgg5QvWI5hikbV2Ot0
        eqcctyz3ISfDLFUiDcQvjl0s3j+aW+bEgnFUuSKIRlTBvoSJvgaf7lTcYb9cyuAI
        yt5pTno8c1TIfUOF6jQmsgMeJqx/reAsjmvOPaT1OeDUf1/HKjUnTJJSoIpiVkW4
        3UkS7g0iLRkPZxNLbW4Sw==
X-ME-Sender: <xms:HO8rZK9ORlWRtyVdjRwZtfQEB3ug_PrfakXuY-hac6585TNbZeReWA>
    <xme:HO8rZKvW6gxHd9SAt1LVNGg--ZWxrjvKFjfP8Cbuiq37DslO3GBHj41JZySYJNDbl
    zOh9-IW4QdT-Uvmtww>
X-ME-Received: <xmr:HO8rZABh36PG8ip-xeYvfWPXKmIRULplIuHMn3qADhwQ1Y4twB2jCmSmNUUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:HO8rZCe5JSg3r26LY7Ko0tH9ZhZYRqKWLpzcqZ3Ru8lYfsWb8zPHfA>
    <xmx:HO8rZPOjoLr2cDfi6gu-FU8MoPvUPPyf2QOtK4qE3G6pMeFiMbGGDA>
    <xmx:HO8rZMm8nCh3YMEufiXUHfEPGYfqh1mXLK76IcOef5Tf1BCiUYNe4A>
    <xmx:HO8rZEoAlOz5iUOiLcatGcFbM3OWtOtSXWWHbkmOjiV0TCGw6ssqcg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:19 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 06/12] MIPS: c-octeon: Provide alternative SMP cache flush function
Date:   Tue,  4 Apr 2023 10:33:45 +0100
Message-Id: <20230404093351.4233-7-jiaxun.yang@flygoat.com>
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

Currently c-octeon relies on octeon's own smp function to flush
I-Cache. However this function is not available on generic platform.

Just use smp_call_function_many on generic platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Style fix
v3: Fix typo in commit message
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
2.39.2 (Apple Git-143)

