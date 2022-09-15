Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C115B9BC2
	for <lists+linux-mips@lfdr.de>; Thu, 15 Sep 2022 15:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiIONWH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Sep 2022 09:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiIONWD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Sep 2022 09:22:03 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA6380B6D
        for <linux-mips@vger.kernel.org>; Thu, 15 Sep 2022 06:22:01 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSySN4KQfzmVMr;
        Thu, 15 Sep 2022 21:18:12 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 21:21:59 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <tsbogend@alpha.franken.de>, <jiaxun.yang@flygoat.com>,
        <paulburton@kernel.org>, <hch@lst.de>, <konrad.wilk@oracle.com>,
        <david.daney@cavium.com>, <ralf@linux-mips.org>,
        <ddaney@caviumnetworks.com>, <florian@openwrt.org>,
        <cuigaosheng1@huawei.com>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH 4/7] MIPS: Octeon: remove orphan octeon_hal_setup_reserved32() declaration
Date:   Thu, 15 Sep 2022 21:21:54 +0800
Message-ID: <20220915132157.2132509-5-cuigaosheng1@huawei.com>
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

All uses of octeon_hal_setup_reserved32() were removed by
commit 1ef2887030db ("MIPS: Octeon: Remove vestiges of
CONFIG_CAVIUM_RESERVE32_USE_WIRED_TLB"), so remove the
orphan declaration, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/octeon/octeon.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 7e714aefc76d..5c1d726c702f 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -43,7 +43,6 @@ extern int octeon_get_southbridge_interrupt(void);
 extern int octeon_get_boot_coremask(void);
 extern int octeon_get_boot_num_arguments(void);
 extern const char *octeon_get_boot_argument(int arg);
-extern void octeon_hal_setup_reserved32(void);
 extern void octeon_user_io_init(void);
 
 extern void octeon_init_cvmcount(void);
-- 
2.25.1

