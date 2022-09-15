Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722CF5B9BC6
	for <lists+linux-mips@lfdr.de>; Thu, 15 Sep 2022 15:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiIONWJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Sep 2022 09:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiIONWE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Sep 2022 09:22:04 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6075688DE1
        for <linux-mips@vger.kernel.org>; Thu, 15 Sep 2022 06:22:03 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSySP6QdzzmVPy;
        Thu, 15 Sep 2022 21:18:13 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 21:22:00 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <tsbogend@alpha.franken.de>, <jiaxun.yang@flygoat.com>,
        <paulburton@kernel.org>, <hch@lst.de>, <konrad.wilk@oracle.com>,
        <david.daney@cavium.com>, <ralf@linux-mips.org>,
        <ddaney@caviumnetworks.com>, <florian@openwrt.org>,
        <cuigaosheng1@huawei.com>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH 7/7] MIPS: AR7: remove orphan declarations from arch/mips/include/asm/mach-ar7/ar7.h
Date:   Thu, 15 Sep 2022 21:21:57 +0800
Message-ID: <20220915132157.2132509-8-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915132157.2132509-1-cuigaosheng1@huawei.com>
References: <20220915132157.2132509-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All uses of ar7_cpu_clock, ar7_bus_clock and ar7_dsp_clock were
removed by commit 780019ddf02f ("MIPS: AR7: Implement clock API"),
so remove the orphan declarations, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/mach-ar7/ar7.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ar7/ar7.h b/arch/mips/include/asm/mach-ar7/ar7.h
index cbe75ade3277..1e8621a6afa3 100644
--- a/arch/mips/include/asm/mach-ar7/ar7.h
+++ b/arch/mips/include/asm/mach-ar7/ar7.h
@@ -104,8 +104,6 @@ struct plat_dsl_data {
 	int reset_bit_sar;
 };
 
-extern int ar7_cpu_clock, ar7_bus_clock, ar7_dsp_clock;
-
 static inline int ar7_is_titan(void)
 {
 	return (readl((void *)KSEG1ADDR(AR7_REGS_GPIO + 0x24)) & 0xffff) ==
-- 
2.25.1

