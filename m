Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57CF61120EC
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2019 02:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfLDBL1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Dec 2019 20:11:27 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:47860 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbfLDBL0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Dec 2019 20:11:26 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 327F0256F3BED4D30C70;
        Wed,  4 Dec 2019 09:11:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Dec 2019 09:11:14 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <jiaxun.yang@flygoat.com>, <ralf@linux-mips.org>,
        <paulburton@kernel.org>, <jhogan@kernel.org>,
        <gregkh@linuxfoundation.org>, <tglx@linutronix.de>,
        <maowenan@huawei.com>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] MIPS: Loongson2ef: drop pointless static qualifier in loongson_suspend_enter()
Date:   Wed, 4 Dec 2019 09:08:51 +0800
Message-ID: <20191204010851.160284-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is no need to have the 'T *v' variable static
since new value always be assigned before use it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 arch/mips/loongson2ef/common/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson2ef/common/pm.c b/arch/mips/loongson2ef/common/pm.c
index 11f4cfd581fb..bcb7ae9777cf 100644
--- a/arch/mips/loongson2ef/common/pm.c
+++ b/arch/mips/loongson2ef/common/pm.c
@@ -91,7 +91,7 @@ static inline void stop_perf_counters(void)
 
 static void loongson_suspend_enter(void)
 {
-	static unsigned int cached_cpu_freq;
+	unsigned int cached_cpu_freq;
 
 	/* setup wakeup events via enabling the IRQs */
 	setup_wakeup_events();
-- 
2.20.1

