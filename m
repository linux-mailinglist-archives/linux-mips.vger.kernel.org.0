Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9242DC0CA
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 14:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgLPNJP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 08:09:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9532 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPNJP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Dec 2020 08:09:15 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CwwQy5sBnzhrNX;
        Wed, 16 Dec 2020 21:07:54 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:08:22 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <tsbogend@alpha.franken.de>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] mips: kernel: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:08:51 +0800
Message-ID: <20201216130851.14142-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 arch/mips/kernel/cevt-txx9.c | 2 +-
 arch/mips/kernel/vpe-mt.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/cevt-txx9.c b/arch/mips/kernel/cevt-txx9.c
index 5709469c21ff..d761ead2e7fe 100644
--- a/arch/mips/kernel/cevt-txx9.c
+++ b/arch/mips/kernel/cevt-txx9.c
@@ -193,7 +193,7 @@ void __init txx9_clockevent_init(unsigned long baseaddr, int irq,
 	cd->min_delta_ns = clockevent_delta2ns(0xf, cd);
 	cd->min_delta_ticks = 0xf;
 	cd->irq = irq;
-	cd->cpumask = cpumask_of(0),
+	cd->cpumask = cpumask_of(0);
 	clockevents_register_device(cd);
 	if (request_irq(irq, txx9tmr_interrupt, IRQF_PERCPU | IRQF_TIMER,
 			"txx9tmr", &txx9_clock_event_device))
diff --git a/arch/mips/kernel/vpe-mt.c b/arch/mips/kernel/vpe-mt.c
index 2e003b11a098..bad6b0891b2b 100644
--- a/arch/mips/kernel/vpe-mt.c
+++ b/arch/mips/kernel/vpe-mt.c
@@ -365,8 +365,8 @@ int __init vpe_module_init(void)
 	}
 
 	device_initialize(&vpe_device);
-	vpe_device.class	= &vpe_class,
-	vpe_device.parent	= NULL,
+	vpe_device.class	= &vpe_class;
+	vpe_device.parent	= NULL;
 	dev_set_name(&vpe_device, "vpe1");
 	vpe_device.devt = MKDEV(major, VPE_MODULE_MINOR);
 	err = device_add(&vpe_device);
-- 
2.22.0

