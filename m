Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8245BE6B5
	for <lists+linux-mips@lfdr.de>; Tue, 20 Sep 2022 15:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiITNHR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Sep 2022 09:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbiITNHP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Sep 2022 09:07:15 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEAEE08D
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 06:07:14 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MX1tf3n2rzlW7Q;
        Tue, 20 Sep 2022 21:03:06 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 21:07:12 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <tsbogend@alpha.franken.de>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <cuigaosheng1@huawei.com>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH 1/2] MIPS: remove orphan sb1250_time_init() declaration
Date:   Tue, 20 Sep 2022 21:07:10 +0800
Message-ID: <20220920130711.1107018-2-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920130711.1107018-1-cuigaosheng1@huawei.com>
References: <20220920130711.1107018-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All uses of sb1250_time_init() have been removed by
commit d527eef5b7f1 ("[MIPS] Sibyte: Finish conversion to modern
time APIs."), so remove the orphan declaration.

The comments about sb1250_time_init() is useless in arch_init_irq(),
so remove these comments.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/sibyte/sb1250.h | 1 -
 arch/mips/sibyte/sb1250/irq.c         | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/arch/mips/include/asm/sibyte/sb1250.h b/arch/mips/include/asm/sibyte/sb1250.h
index dbde5f93f0dd..495b31925ed7 100644
--- a/arch/mips/include/asm/sibyte/sb1250.h
+++ b/arch/mips/include/asm/sibyte/sb1250.h
@@ -32,7 +32,6 @@ extern unsigned int soc_type;
 extern unsigned int periph_rev;
 extern unsigned int zbbus_mhz;
 
-extern void sb1250_time_init(void);
 extern void sb1250_mask_irq(int cpu, int irq);
 extern void sb1250_unmask_irq(int cpu, int irq);
 
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 86f49c48fc34..2f08ad267a11 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -262,12 +262,6 @@ void __init arch_init_irq(void)
 	__raw_writeq(tmp, IOADDR(A_IMR_REGISTER(0, R_IMR_INTERRUPT_MASK)));
 	__raw_writeq(tmp, IOADDR(A_IMR_REGISTER(1, R_IMR_INTERRUPT_MASK)));
 
-	/*
-	 * Note that the timer interrupts are also mapped, but this is
-	 * done in sb1250_time_init().	Also, the profiling driver
-	 * does its own management of IP7.
-	 */
-
 	/* Enable necessary IPs, disable the rest */
 	change_c0_status(ST0_IM, imask);
 }
-- 
2.25.1

