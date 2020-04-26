Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748741B9227
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 19:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgDZRlM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 13:41:12 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59984 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgDZRlM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 13:41:12 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 3EFD320497;
        Sun, 26 Apr 2020 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587922872; bh=CFOqPhCNifZKIhPop2Z/lA4KDKrcXNJ4tww+sR6tyHI=;
        h=From:To:Cc:Subject:Date:From;
        b=itNedcZm96N+XAGkLKBAbE9PYTNjOgkB74X6QCk0HwYQULEQ96oFQTUiEHO0hKxDM
         nwAzj9j9Y24JWZ9i10XlfwyY/LkPCDRT6P6HLVIDyD7VHrzS4gjT8m7HVi5rg0eXJe
         40TxrUeMwtHpZiZhF9zmeb8GzcAEUTkM+bcH8l7tKuyHaR3ZX0NLpEIE+k05flZUwT
         wRACBWPXd/aOGEnGgPOfX9vpGo3PvDqNrW2c4OyW4eXSm129FfmlkK18e8iekLhOwb
         RLIndEhHY0l5d+vtiLTsDtjhSqwTorLfur8z/inhF754BZeZp/D09ybFxAmfpbReQi
         ZFAjknFXvS/og==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     akpm@linux-foundation.org
Cc:     sunguoyun@loongson.cn, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mips/mm: Guard SOFT_DIRTY bit with config option
Date:   Mon, 27 Apr 2020 01:40:55 +0800
Message-Id: <20200426174058.1181837-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After guarding SOFT_DIRTY with config option, it won't occupy
precious page table bit on systems that didn't enable SOFT_DIRTY.

It can prevent page btis overflow on MIPS32R2 systems with RIXI
enabled.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/pgtable-bits.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index d43fb6f8af14..e26dc41a8a68 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -55,7 +55,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
 	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 };
 
 /*
@@ -85,7 +87,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
 	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 };
 
 #elif defined(CONFIG_CPU_R3K_TLB)
@@ -101,7 +105,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
 	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 
 	/* Used by TLB hardware (placed in EntryLo) */
 	_PAGE_GLOBAL_SHIFT = 8,
@@ -128,7 +134,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
 	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 	/* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_CPU_HAS_RIXI)
 	_PAGE_NO_EXEC_SHIFT,
@@ -155,7 +163,11 @@ enum pgtable_bits {
 #else
 # define _PAGE_SPECIAL		0
 #endif
-#define _PAGE_SOFT_DIRTY	(1 << _PAGE_SOFT_DIRTY_SHIFT)
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
+# define _PAGE_SOFT_DIRTY	(1 << _PAGE_SOFT_DIRTY_SHIFT)
+#else
+# define _PAGE_SOFT_DIRTY	0
+#endif
 
 /* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_XPA)
-- 
2.26.0.rc2

