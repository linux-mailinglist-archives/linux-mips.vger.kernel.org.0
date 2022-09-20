Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 563575BE6B4
	for <lists+linux-mips@lfdr.de>; Tue, 20 Sep 2022 15:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiITNHQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Sep 2022 09:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiITNHP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Sep 2022 09:07:15 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDFC15A2D
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 06:07:14 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MX1tt3tPbzmVX8;
        Tue, 20 Sep 2022 21:03:18 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 21:07:12 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <tsbogend@alpha.franken.de>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <cuigaosheng1@huawei.com>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH 2/2] MIPS: IRQ: remove orphan allocate_irqno() declaration
Date:   Tue, 20 Sep 2022 21:07:11 +0800
Message-ID: <20220920130711.1107018-3-cuigaosheng1@huawei.com>
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

All uses of allocate_irqno() have been removed by
commit 69a07a41d908 ("MIPS: SGI-IP27: rework HUB interrupts"),
so remove the orphan declaration.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/irq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index 57561e0e6e8d..2f47f56fca82 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -63,7 +63,6 @@ extern void do_domain_IRQ(struct irq_domain *domain, unsigned int irq);
 extern void arch_init_irq(void);
 extern void spurious_interrupt(void);
 
-extern int allocate_irqno(void);
 extern void alloc_legacy_irqno(void);
 extern void free_irqno(unsigned int irq);
 
-- 
2.25.1

