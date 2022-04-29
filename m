Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0320514266
	for <lists+linux-mips@lfdr.de>; Fri, 29 Apr 2022 08:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbiD2Ggd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Apr 2022 02:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbiD2Ggc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Apr 2022 02:36:32 -0400
X-Greylist: delayed 910 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Apr 2022 23:33:14 PDT
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3006678FFE
        for <linux-mips@vger.kernel.org>; Thu, 28 Apr 2022 23:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=N63Wa
        UF/z+f0x0OSXARFhHoPSL0cX+1y/c6d+dk7oVY=; b=l7T2UaImFHo83JjZHN4yb
        5cPRgAt72lC5SFRTx90k8CCGzVpduAT2nLT9asTlBHQe3lIwFoUNT+vfyYyu70xn
        uN5pBhQdgdzFagS0HjcscH9RxsP6Z3Ohfx6xtr5WjjFYzlcTYBNGU4nZWmEWQotD
        6SZgkX1fB+ZtQbYGIId2q4=
Received: from localhost.localdomain (unknown [116.128.244.169])
        by smtp3 (Coremail) with SMTP id G9xpCgCnz58Pg2tiBlPtDg--.23438S2;
        Fri, 29 Apr 2022 14:17:52 +0800 (CST)
From:   Yun Lu <luyun_611@163.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] mips: mm: fix compiler error when CONFIG_XPA=n
Date:   Fri, 29 Apr 2022 14:17:31 +0800
Message-Id: <20220429061731.36291-1-luyun_611@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="Add_By_Label_Mail_Nextpart_001"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgCnz58Pg2tiBlPtDg--.23438S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1rurW5trWxAw18Gr1Utrb_yoW5Gryrpr
        47Gw1UGrWDXrZY93y0yryrXr15Gw1kG3yavF4qqrWayFWFqF97JrnxtF1vgr13XF40ka4x
        tFnrJF1Yk3WIy37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIsj8UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pox130jbwriqqrwthudrp/xtbBORDxzl-PM6YpKgAAsQ
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_TVD_MIME_NO_HEADERS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Add_By_Label_Mail_Nextpart_001
Content-Type: text/plain;
Content-Transfer-Encoding: 8bit


From: luyun <luyun@kylinos.cn>

The below error is reported when CONFIG_XPA=n:

arch/mips/mm/init.c: In function ‘mem_init’:
././include/linux/compiler_types.h:352:38: error: call to ‘__compiletime_assert_289’ declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
  352 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                      ^
././include/linux/compiler_types.h:333:4: note: in definition of macro ‘__compiletime_assert’
  333 |    prefix ## suffix();    \
      |    ^~~~~~
././include/linux/compiler_types.h:352:2: note: in expansion of macro ‘_compiletime_assert’
  352 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/mips/mm/init.c:454:2: note: in expansion of macro ‘BUILD_BUG_ON’
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


--Add_By_Label_Mail_Nextpart_001

Content-type: Text/plain

No virus found
		Checked by Hillstone Network AntiVirus

--Add_By_Label_Mail_Nextpart_001--

