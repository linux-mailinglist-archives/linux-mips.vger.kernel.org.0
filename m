Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039E6393D88
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 09:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbhE1HOs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 May 2021 03:14:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2511 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbhE1HOq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 May 2021 03:14:46 -0400
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FrwnJ3dS8zYqPY;
        Fri, 28 May 2021 15:10:28 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 15:13:08 +0800
Received: from huawei.com (10.67.174.117) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 28 May
 2021 15:13:08 +0800
From:   Ruiqi Gong <gongruiqi1@huawei.com>
To:     <gongruiqi1@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Wang Weiyang <wangweiyang2@huawei.com>,
        <linux-mips@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] MIPS: pm-cps: Make '__pcpu_scope_cps_cpu_state' static
Date:   Fri, 28 May 2021 15:04:37 +0800
Message-ID: <20210528070437.5780-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.117]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mark the per-CPU definition of cps_cpu_state as static to fix the following
sparse tool complain:

arch/mips/kernel/pm-cps.c:66:1: warning:
 symbol '__pcpu_scope_cps_cpu_state' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ruiqi Gong <gongruiqi1@huawei.com>
---
 arch/mips/kernel/pm-cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 9bf60d7d44d3..32e8f0673e06 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -63,7 +63,7 @@ static DEFINE_PER_CPU_ALIGNED(cpumask_t, online_coupled);
 static DEFINE_PER_CPU_ALIGNED(atomic_t, pm_barrier);
 
 /* Saved CPU state across the CPS_PM_POWER_GATED state */
-DEFINE_PER_CPU_ALIGNED(struct mips_static_suspend_state, cps_cpu_state);
+static DEFINE_PER_CPU_ALIGNED(struct mips_static_suspend_state, cps_cpu_state);
 
 /* A somewhat arbitrary number of labels & relocs for uasm */
 static struct uasm_label labels[32];

