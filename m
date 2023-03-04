Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7486AACEA
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjCDWPn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCDWPm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:42 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955CA15561
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:41 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 1149E5C00F4;
        Sat,  4 Mar 2023 17:15:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 04 Mar 2023 17:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968141; x=
        1678054541; bh=HNkAfdxffXQLdeoL0w3dAD1nPfxPtiCA6XUALlUExAc=; b=L
        8JsdJVVfULtx+2YKGzqLPFT5ZASib6MzTuXjVmLbWu6rGAAD4xE8/dn6SLXSIVHG
        XP3SCLVznAGk71P7Y1SXuGqtL2LcJPb7Q8Sfm7FOg39v31+PwsubNeF5qdRdiyJP
        mXuDPR9tbmH5DsOk4XfwiKveINR85my3KHwhiFZze8m+9ryGO65KgVoZ0IMzZtti
        ynshgxa8rJI7cBEkRINZb0/6MBYJdKssn/W7kLo1iGZqboC9iXzBlRGKH406xZ3q
        gG5vkE6zCtI6GHreXSWfPS5dkSDGGvxytQ1sr8z8ZsUkCIhm67FPerT1xvcD6+lQ
        5ckFA4jrZNQ6MbnhAcrsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968141; x=
        1678054541; bh=HNkAfdxffXQLdeoL0w3dAD1nPfxPtiCA6XUALlUExAc=; b=I
        0hWqnD0sv8sg9GFPDGosJU6P2N34SQWaUCOHsnmRy7a3ITcmXmWWA1lb3tOz+Hr3
        gUBUAQamA/SZkmwC2Nfxkd2AzlqM2LxvLVPjgFcOzwGjIBGsQmgGuWXi84tgZzy8
        Yf/oYIdevgK71P8EbBHfS8MHmXVYcUxlgvOwmGbzVO/CprCszz8EZLuF5mtVbmmD
        J8fZZJwVmF1ud+NGOyqR2wVCBiIMDaIENHBI/KYAQh9eNRZc3eNgAjR47S/uSdgL
        DioVwS0RWJzFWxeWJhS3xqr8zV7IymkVZoOTxMQxySEPDTwKcW1F6Y3ZMa/u1Wux
        Ur4MSy0zn8TloUO8sXbjQ==
X-ME-Sender: <xms:DMMDZKiDp7PfV4BCo8OMeiD40NeuQw8hQliV4UZOm6AsdDlAhbSIEw>
    <xme:DMMDZLAaclX741_8krXXWPt51J0hW589nKlT4r4S_BjIhv8HJjNVbLSF11E1lV5rL
    kVJaCybE7XUXsYpf0o>
X-ME-Received: <xmr:DMMDZCHVLxfNsbbyHoZObk7xTXuYV01oQqi7kar-pCL8CdmQxPK3Mc6n1rSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:DMMDZDTRKDZHteUh7lyleHgW_vtEj9rg3YEhNvzEDMBOucp9Vkolwg>
    <xmx:DMMDZHyPieva0mBxwt6rfioxE7MoPIvucSk9ubkPkgUCmfFtECUDtA>
    <xmx:DMMDZB4csi8Xyf-k1jd8HmJNHNgzXtl2ghAxndLWhuG6LqkIyK1mAA>
    <xmx:DcMDZC-QkErJ2UnFhf5h7FoS_TpbQQ3gASh6ivLAbezawnhg8Clxxg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:40 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 06/12] MIPS: c-octeon: Provide alternative SMP cache flush function
Date:   Sat,  4 Mar 2023 22:15:18 +0000
Message-Id: <20230304221524.47160-7-jiaxun.yang@flygoat.com>
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

Curretly c-octeon relies on octeon's own smp function to flush
I-Cache. However this function is not available on generic platform.

Just use smp_call_function_many on generic platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/mm/c-octeon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index c7ed589de882..61db09e5044c 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -83,8 +83,14 @@ static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 	else
 		mask = *cpu_online_mask;
 	cpumask_clear_cpu(cpu, &mask);
-	for_each_cpu(cpu, &mask)
+#ifdef CONFIG_CAVIUM_OCTEON_SOC
+	for_each_cpu(cpu, &mask) {
 		octeon_send_ipi_single(cpu, SMP_ICACHE_FLUSH);
+	}
+#else
+	smp_call_function_many(&mask, (smp_call_func_t)octeon_local_flush_icache,
+			       NULL, 1);
+#endif
 
 	preempt_enable();
 #endif
-- 
2.34.1

