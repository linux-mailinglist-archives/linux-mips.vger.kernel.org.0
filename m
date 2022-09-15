Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E335B9BC1
	for <lists+linux-mips@lfdr.de>; Thu, 15 Sep 2022 15:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiIONWG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Sep 2022 09:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiIONWD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Sep 2022 09:22:03 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3B58605C
        for <linux-mips@vger.kernel.org>; Thu, 15 Sep 2022 06:22:01 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSySM60tVzmV9J;
        Thu, 15 Sep 2022 21:18:11 +0800 (CST)
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
Subject: [PATCH 2/7] MIPS: Octeon: remove orphan octeon_swiotlb declaration
Date:   Thu, 15 Sep 2022 21:21:52 +0800
Message-ID: <20220915132157.2132509-3-cuigaosheng1@huawei.com>
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

All uses of octeon_swiotlb were removed by
commit f39f8d0eb081 ("MIPS/octeon: use swiotlb_init instead
of open coding it"), so remove the orphan declaration, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/octeon/pci-octeon.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/octeon/pci-octeon.h b/arch/mips/include/asm/octeon/pci-octeon.h
index b12d9a3fbfb6..2f46f6c6e3d0 100644
--- a/arch/mips/include/asm/octeon/pci-octeon.h
+++ b/arch/mips/include/asm/octeon/pci-octeon.h
@@ -64,6 +64,4 @@ enum octeon_dma_bar_type {
 extern enum octeon_dma_bar_type octeon_dma_bar_type;
 
 void octeon_pci_dma_init(void);
-extern char *octeon_swiotlb;
-
 #endif
-- 
2.25.1

