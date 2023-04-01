Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C825D6D2E81
	for <lists+linux-mips@lfdr.de>; Sat,  1 Apr 2023 08:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjDAGHt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Apr 2023 02:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjDAGHs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Apr 2023 02:07:48 -0400
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8349D53A
        for <linux-mips@vger.kernel.org>; Fri, 31 Mar 2023 23:07:44 -0700 (PDT)
X-UUID: 64492e07f4c643bfa02a8e76a44a4090-20230401
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:99fcc1c8-4807-4de6-8d56-0efd602804ce,IP:10,
        URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
        TION:release,TS:15
X-CID-INFO: VERSION:1.1.22,REQID:99fcc1c8-4807-4de6-8d56-0efd602804ce,IP:10,UR
        L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
        ON:release,TS:15
X-CID-META: VersionHash:120426c,CLOUDID:eaab06b5-beed-4dfc-bd9c-e1b22fa6ccc4,B
        ulkID:230401140733YMUNP681,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
        nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
        :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 64492e07f4c643bfa02a8e76a44a4090-20230401
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
        (envelope-from <lienze@kylinos.cn>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 113631839; Sat, 01 Apr 2023 14:07:31 +0800
From:   Enze Li <lienze@kylinos.cn>
To:     tsbogend@alpha.franken.de
Cc:     rppt@kernel.org, akpm@linux-foundation.org, nathan@kernel.org,
        linux-mips@vger.kernel.org, enze.li@gmx.com, lienze@kylinos.cn
Subject: [PATCH] MIPS: tlbex: undefine pr_define macro when appropriate
Date:   Sat,  1 Apr 2023 14:10:25 +0800
Message-Id: <20230401061025.3556622-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pr_define macro is used only within the output_pgtable_bits_defines
function, and it hasn't been used anywhere else so far.  Therefore, it
should be undefined when appropriate.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/mips/mm/tlbex.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 80e05ee98d62..510a7e316eb6 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -255,6 +255,8 @@ static void output_pgtable_bits_defines(void)
 	pr_define("_PAGE_DIRTY_SHIFT %d\n", _PAGE_DIRTY_SHIFT);
 	pr_define("_PFN_SHIFT %d\n", _PFN_SHIFT);
 	pr_debug("\n");
+
+#undef pr_define
 }
 
 static inline void dump_handler(const char *symbol, const void *start, const void *end)

base-commit: 7b50567bdcad8925ca1e075feb7171c12015afd1
-- 
2.39.2

