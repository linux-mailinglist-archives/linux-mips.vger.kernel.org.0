Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92E25B9BC4
	for <lists+linux-mips@lfdr.de>; Thu, 15 Sep 2022 15:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiIONWH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Sep 2022 09:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiIONWD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Sep 2022 09:22:03 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32DF86B59
        for <linux-mips@vger.kernel.org>; Thu, 15 Sep 2022 06:22:01 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSySN1wthzmVM9;
        Thu, 15 Sep 2022 21:18:12 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 21:21:58 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <tsbogend@alpha.franken.de>, <jiaxun.yang@flygoat.com>,
        <paulburton@kernel.org>, <hch@lst.de>, <konrad.wilk@oracle.com>,
        <david.daney@cavium.com>, <ralf@linux-mips.org>,
        <ddaney@caviumnetworks.com>, <florian@openwrt.org>,
        <cuigaosheng1@huawei.com>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH 3/7] MIPS: Octeon: remove orphan cvmx_fpa_setup_pool() declaration
Date:   Thu, 15 Sep 2022 21:21:53 +0800
Message-ID: <20220915132157.2132509-4-cuigaosheng1@huawei.com>
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

All uses of cvmx_fpa_setup_pool() were removed by
commit a03822ea5df6 ("MIPS: OCTEON: Remove some unused files."),
so remove the orphan declaration, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/octeon/cvmx-fpa.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-fpa.h b/arch/mips/include/asm/octeon/cvmx-fpa.h
index 29ae63606ab4..f6dfcca97f19 100644
--- a/arch/mips/include/asm/octeon/cvmx-fpa.h
+++ b/arch/mips/include/asm/octeon/cvmx-fpa.h
@@ -263,26 +263,6 @@ static inline void cvmx_fpa_free(void *ptr, uint64_t pool,
 	cvmx_write_io(newptr.u64, num_cache_lines);
 }
 
-/**
- * Setup a FPA pool to control a new block of memory.
- * This can only be called once per pool. Make sure proper
- * locking enforces this.
- *
- * @pool:	Pool to initialize
- *		     0 <= pool < 8
- * @name:	Constant character string to name this pool.
- *		     String is not copied.
- * @buffer:	Pointer to the block of memory to use. This must be
- *		     accessible by all processors and external hardware.
- * @block_size: Size for each block controlled by the FPA
- * @num_blocks: Number of blocks
- *
- * Returns 0 on Success,
- *	   -1 on failure
- */
-extern int cvmx_fpa_setup_pool(uint64_t pool, const char *name, void *buffer,
-			       uint64_t block_size, uint64_t num_blocks);
-
 /**
  * Shutdown a Memory pool and validate that it had all of
  * the buffers originally placed in it. This should only be
-- 
2.25.1

