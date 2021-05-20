Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A06938A8E2
	for <lists+linux-mips@lfdr.de>; Thu, 20 May 2021 12:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237927AbhETKzL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 06:55:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4699 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238505AbhETKwI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 06:52:08 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fm5zy5Gp2z16Q6F;
        Thu, 20 May 2021 18:47:58 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 18:50:45 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 18:50:45 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Huang Pei <huangpei@loongson.cn>, <linux-mips@vger.kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH] mips: kill pte_sw_mkyoung
Date:   Thu, 20 May 2021 19:00:43 +0800
Message-ID: <20210520110043.149003-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Kill unused pte_sw_mkyoung after
commit f685a533a7fa ("MIPS: make userspace mapping young by default").

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/mips/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 804889b70965..ad56fb8f4428 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -406,8 +406,6 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
-#define pte_sw_mkyoung	pte_mkyoung
-
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE; }
 
-- 
2.26.2

