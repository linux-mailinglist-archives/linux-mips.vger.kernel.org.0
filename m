Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17444EF0D4
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 16:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347574AbiDAOhY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 10:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348297AbiDAOdy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 10:33:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C021EF5FA;
        Fri,  1 Apr 2022 07:31:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8717FB82500;
        Fri,  1 Apr 2022 14:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210FAC2BBE4;
        Fri,  1 Apr 2022 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648823505;
        bh=Cd4woDbGU4a/oXWtqVnq8tGqZFrCP9Dc50bC46alTX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qghwz2T9U/XHDm73+4BKFGf+vn7wtOKihBoh9cAYkNnej+bFdKezSE3al9wJ9N2vA
         cSTph/q5YP+MM4pBz9HYiSWuGM++Tq90yY2WAQ4Z73sW9f9FmeX5taOnZOeQNvogrB
         fKEswsYgWZ0gr2UC5fEToWYzRl8f6nAe5EL33j1o2/U6+7j/6WSMsCz9VfLkNfZRPy
         i4tSn0liGtJPmKO5lGyudQMHU/5BXvhOyRj0qwL8Hmgeq+4tdEzdjs/Usso5MAHPY4
         LZhXXFcyWg2np2NyG4kGjHeceJcJOaDt2ZGd/qxrvBxX3Iv9c5DIJ7/6WzpIvpZnfA
         zrWnuP4jWn5+A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, david@redhat.com,
        f.fainelli@gmail.com, ebiederm@xmission.com,
        liam.howlett@oracle.com, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 121/149] MIPS: fix fortify panic when copying asm exception handlers
Date:   Fri,  1 Apr 2022 10:25:08 -0400
Message-Id: <20220401142536.1948161-121-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Lobakin <alobakin@pm.me>

[ Upstream commit d17b66417308996e7e64b270a3c7f3c1fbd4cfc8 ]

With KCFLAGS="-O3", I was able to trigger a fortify-source
memcpy() overflow panic on set_vi_srs_handler().
Although O3 level is not supported in the mainline, under some
conditions that may've happened with any optimization settings,
it's just a matter of inlining luck. The panic itself is correct,
more precisely, 50/50 false-positive and not at the same time.
From the one side, no real overflow happens. Exception handler
defined in asm just gets copied to some reserved places in the
memory.
But the reason behind is that C code refers to that exception
handler declares it as `char`, i.e. something of 1 byte length.
It's obvious that the asm function itself is way more than 1 byte,
so fortify logics thought we are going to past the symbol declared.
The standard way to refer to asm symbols from C code which is not
supposed to be called from C is to declare them as
`extern const u8[]`. This is fully correct from any point of view,
as any code itself is just a bunch of bytes (including 0 as it is
for syms like _stext/_etext/etc.), and the exact size is not known
at the moment of compilation.
Adjust the type of the except_vec_vi_*() and related variables.
Make set_handler() take `const` as a second argument to avoid
cast-away warnings and give a little more room for optimization.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/setup.h |  2 +-
 arch/mips/kernel/traps.c      | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index bb36a400203d..8c56b862fd9c 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -16,7 +16,7 @@ static inline void setup_8250_early_printk_port(unsigned long base,
 	unsigned int reg_shift, unsigned int timeout) {}
 #endif
 
-extern void set_handler(unsigned long offset, void *addr, unsigned long len);
+void set_handler(unsigned long offset, const void *addr, unsigned long len);
 extern void set_uncached_handler(unsigned long offset, void *addr, unsigned long len);
 
 typedef void (*vi_handler_t)(void);
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index a486486b2355..246c6a6b0261 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2091,19 +2091,19 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 		 * If no shadow set is selected then use the default handler
 		 * that does normal register saving and standard interrupt exit
 		 */
-		extern char except_vec_vi, except_vec_vi_lui;
-		extern char except_vec_vi_ori, except_vec_vi_end;
-		extern char rollback_except_vec_vi;
-		char *vec_start = using_rollback_handler() ?
-			&rollback_except_vec_vi : &except_vec_vi;
+		extern const u8 except_vec_vi[], except_vec_vi_lui[];
+		extern const u8 except_vec_vi_ori[], except_vec_vi_end[];
+		extern const u8 rollback_except_vec_vi[];
+		const u8 *vec_start = using_rollback_handler() ?
+				      rollback_except_vec_vi : except_vec_vi;
 #if defined(CONFIG_CPU_MICROMIPS) || defined(CONFIG_CPU_BIG_ENDIAN)
-		const int lui_offset = &except_vec_vi_lui - vec_start + 2;
-		const int ori_offset = &except_vec_vi_ori - vec_start + 2;
+		const int lui_offset = except_vec_vi_lui - vec_start + 2;
+		const int ori_offset = except_vec_vi_ori - vec_start + 2;
 #else
-		const int lui_offset = &except_vec_vi_lui - vec_start;
-		const int ori_offset = &except_vec_vi_ori - vec_start;
+		const int lui_offset = except_vec_vi_lui - vec_start;
+		const int ori_offset = except_vec_vi_ori - vec_start;
 #endif
-		const int handler_len = &except_vec_vi_end - vec_start;
+		const int handler_len = except_vec_vi_end - vec_start;
 
 		if (handler_len > VECTORSPACING) {
 			/*
@@ -2311,7 +2311,7 @@ void per_cpu_trap_init(bool is_boot_cpu)
 }
 
 /* Install CPU exception handler */
-void set_handler(unsigned long offset, void *addr, unsigned long size)
+void set_handler(unsigned long offset, const void *addr, unsigned long size)
 {
 #ifdef CONFIG_CPU_MICROMIPS
 	memcpy((void *)(ebase + offset), ((unsigned char *)addr - 1), size);
-- 
2.34.1

