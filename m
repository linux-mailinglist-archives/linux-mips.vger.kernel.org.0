Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5905F8E98
	for <lists+linux-mips@lfdr.de>; Sun,  9 Oct 2022 23:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiJIVAn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Oct 2022 17:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiJIVAR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Oct 2022 17:00:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C59267;
        Sun,  9 Oct 2022 13:55:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96AC960C99;
        Sun,  9 Oct 2022 20:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94C4C43146;
        Sun,  9 Oct 2022 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665348868;
        bh=7Biv/RB4g1yWRQ3Ir7P+DO9H5qF3EuPehLJSXWw6ecI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WBgSFn3rmpxVfQffIAtoZRD7ipqfAZSBtl/nGCxz/as7QOE8l/h17eDVesQ/JWCoT
         fIYTJFEhZxNTP9ChXYctI7zVMpp+iY2dY0qOoTzLVh3RAh6xreir+x5ZuGs01PTz1O
         +j35NHpdoXNJ/zC90pMWgLj0kGgnOaCx/lrmlc3QADU8T5QVPDAvz3YRBd/sarPlLn
         vseBOWqsqLx2xKwM0A0y+UhUhGNZqXqc/duMsvCa/p8lGp4atvTxqhmkVHp4uRIFgy
         a2xZnhY2p0N8l26JJ0I0i3C5f/siJ6etEy07++da3w78zMPPzMnzkNfz0Rs1sjmEFB
         dgCFVtH1hwa6A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 2/6] MIPS: BCM47XX: Cast memcmp() of function to (void *)
Date:   Sun,  9 Oct 2022 16:54:18 -0400
Message-Id: <20221009205423.1203538-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009205423.1203538-1-sashal@kernel.org>
References: <20221009205423.1203538-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 0dedcf6e3301836eb70cfa649052e7ce4fcd13ba ]

Clang is especially sensitive about argument type matching when using
__overloaded functions (like memcmp(), etc). Help it see that function
pointers are just "void *". Avoids this error:

arch/mips/bcm47xx/prom.c:89:8: error: no matching function for call to 'memcmp'
                   if (!memcmp(prom_init, prom_init + mem, 32))
                        ^~~~~~
include/linux/string.h:156:12: note: candidate function not viable: no known conversion from 'void (void)' to 'const void *' for 1st argument extern int memcmp(const void *,const void *,__kernel_size_t);

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202209080652.sz2d68e5-lkp@intel.com
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/bcm47xx/prom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 135a5407f015..d26d9a6f6ee7 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -85,7 +85,7 @@ static __init void prom_init_mem(void)
 			pr_debug("Assume 128MB RAM\n");
 			break;
 		}
-		if (!memcmp(prom_init, prom_init + mem, 32))
+		if (!memcmp((void *)prom_init, (void *)prom_init + mem, 32))
 			break;
 	}
 	lowmem = mem;
@@ -162,7 +162,7 @@ void __init bcm47xx_prom_highmem_init(void)
 
 	off = EXTVBASE + __pa(off);
 	for (extmem = 128 << 20; extmem < 512 << 20; extmem <<= 1) {
-		if (!memcmp(prom_init, (void *)(off + extmem), 16))
+		if (!memcmp((void *)prom_init, (void *)(off + extmem), 16))
 			break;
 	}
 	extmem -= lowmem;
-- 
2.35.1

