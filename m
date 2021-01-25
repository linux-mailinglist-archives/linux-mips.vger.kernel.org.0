Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3554E303625
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 07:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbhAZGBh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 01:01:37 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2872 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbhAYJWf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 04:22:35 -0500
Received: from dggeme766-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DPPTG6L8nz5GGP;
        Mon, 25 Jan 2021 17:19:46 +0800 (CST)
Received: from huawei.com (10.175.113.32) by dggeme766-chm.china.huawei.com
 (10.3.19.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Mon, 25
 Jan 2021 17:21:15 +0800
From:   Chengyang Fan <cy.fan@huawei.com>
To:     <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <joe@perches.com>
Subject: [PATCH] MIPS: asm: spram: remove unneeded semicolon
Date:   Mon, 25 Jan 2021 17:48:25 +0800
Message-ID: <20210125094825.1718501-1-cy.fan@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggeme766-chm.china.huawei.com (10.3.19.112)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove a superfluous semicolon after function definition.

Signed-off-by: Chengyang Fan <cy.fan@huawei.com>
---
 arch/mips/include/asm/spram.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/spram.h b/arch/mips/include/asm/spram.h
index 63cb90fd4148..373f2a5d495d 100644
--- a/arch/mips/include/asm/spram.h
+++ b/arch/mips/include/asm/spram.h
@@ -5,7 +5,7 @@
 #if defined(CONFIG_MIPS_SPRAM)
 extern __init void spram_config(void);
 #else
-static inline void spram_config(void) { };
+static inline void spram_config(void) { }
 #endif /* CONFIG_MIPS_SPRAM */
 
 #endif /* _MIPS_SPRAM_H */
-- 
2.25.1

