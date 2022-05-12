Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328545247BF
	for <lists+linux-mips@lfdr.de>; Thu, 12 May 2022 10:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351358AbiELIR7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 May 2022 04:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiELIR6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 May 2022 04:17:58 -0400
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 65C195DBFD
        for <linux-mips@vger.kernel.org>; Thu, 12 May 2022 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YBd/w
        G8b/Mu/cYcrjhvscy6ZrR5XMrxBy7tqd2ot+Ok=; b=ZtHNI53AnHGIoL/+v3aCj
        042jEs66UDRvF0BInXicDZzmvNerm1uVqDso6LF2yNOvKvN+Rsj/AasdSSSEC4/F
        xrSkvAtTStuQp4yaKP4Z7Xm4ie4xoR87n/ICDDTQ9en1bLaKsTrh0+J/xEUmjL+v
        dTASYIDSWXNqNUP5r7yan8=
Received: from localhost.localdomain (unknown [116.128.244.169])
        by smtp4 (Coremail) with SMTP id HNxpCgBHZc2bwnxichdNCA--.17474S2;
        Thu, 12 May 2022 16:17:33 +0800 (CST)
From:   Yun Lu <luyun_611@163.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] mips: mm: fix compiler error when CONFIG_XPA=n
Date:   Thu, 12 May 2022 16:17:11 +0800
Message-Id: <20220512081711.2621309-1-luyun_611@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HNxpCgBHZc2bwnxichdNCA--.17474S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDXF4DurWrAw47Xw17trb_yoW8AFy8pr
        4xt3ykWw4DWrZ2939YkrZ5Xr45Jwn8G3yaqF4Yqry5tr9Ygas7Xr4ftF1vqr47XrW0kayI
        qFn7Xr15Z3WIyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuyIUUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pox130jbwriqqrwthudrp/1tbiPh3+zlxBsFicLAAAsW
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: luyun <luyun@kylinos.cn>

The below error is reported when CONFIG_XPA=n:

arch/mips/mm/init.c: In function "mem_init":
././include/linux/compiler_types.h:352:38: error: call to
"__compiletime_assert_289" declared with attribute error:
BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
...
arch/mips/mm/init.c:454:2: note: in expansion of macro "BUILD_BUG_ON"
  454 |  BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
      |  ^~~~~~~~~~~~

The macro _PFN_SHIFT is defined as (PAGE_SHIFT - 12 + _CACHE_SHIFT + 3)
when CONFIG_CPU_R3K_TLB=n, and _CACHE_SHIFT is conditionally defined with
CONFIG_XPA=y. Also _PFN_SHIFT is just equal to PAGE_SHIFT when
CONFIG_CPU_R3K_TLB=y, there is no need to judge on this condition.

So fix it by adding IS_ENABLED(CONFIG_XPA).

Fixes: 05d013a0366d ("MIPS: Detect bad _PFN_SHIFT values")
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Yun Lu <luyun@kylinos.cn>
---
 arch/mips/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 5a8002839550..f13cd2844fed 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -451,7 +451,8 @@ void __init mem_init(void)
 	 * When _PFN_SHIFT is greater than PAGE_SHIFT we won't have enough PTE
 	 * bits to hold a full 32b physical address on MIPS32 systems.
 	 */
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && IS_ENABLED(CONFIG_XPA) &&
+		     (_PFN_SHIFT > PAGE_SHIFT));
 
 #ifdef CONFIG_HIGHMEM
 	max_mapnr = highend_pfn ? highend_pfn : max_low_pfn;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

