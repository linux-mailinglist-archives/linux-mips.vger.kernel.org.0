Return-Path: <linux-mips+bounces-499-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743A48031E7
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15F86B209EC
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A6222F10;
	Mon,  4 Dec 2023 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1/Iub+M"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DADB22EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1F4C433D9;
	Mon,  4 Dec 2023 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691074;
	bh=NYgjZuAn4gA//7iXGm7aNkqHSnPJFETs5an0l5cgV+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1/Iub+MSlZW1iDrUy4L08L+EbcoD1yjvG8Aph0zyPg39RTH0wo+qGKA3+K9OhOBW
	 4qjWG7pum7bPnoCzH/+iw0TXMVM8JC3NY7EgfYGFpu0N6iZD8W+ON5r6U3eMXk+ttc
	 f2ah04f35h4+jIZNTFFozoSlHDGNCjluewwpi7dkEl7GkJ2Iyaxoni5qsyh7bynyin
	 E8ihOWf0p3qyjW0K8RH13y0pjgO00NlfqKfHnSayvG8R/EoePpqxYIeXtGTTfpPKr+
	 IP8TSoGwNedaBIQFPyD2IkD2cvrz/M8pdc/QoKzFyIprRNu2EHuPgyfxGsd7TV1+SO
	 WSoUZOD2wg6XA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 18/20] mips: hide conditionally unused functions
Date: Mon,  4 Dec 2023 12:57:08 +0100
Message-Id: <20231204115710.2247097-19-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A couple of functions are defined unconditionally but have a
conditional declaration:

arch/mips/mm/tlb-r4k.c:461:12: error: no previous prototype for 'add_temporary_entry' [-Werror=missing-prototypes]
arch/mips/mm/pgtable-64.c:92:7: error: no previous prototype for 'mk_pmd' [-Werror=missing-prototypes]
arch/mips/mm/pgtable-64.c:101:6: error: no previous prototype for 'set_pmd_at' [-Werror=missing-prototypes]

Since there are no callers in these configurations, add the same #ifdef
checks around the definitions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/mm/pgtable-64.c | 2 ++
 arch/mips/mm/tlb-r4k.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/mm/pgtable-64.c b/arch/mips/mm/pgtable-64.c
index c76d21f7dffb..1e544827dea9 100644
--- a/arch/mips/mm/pgtable-64.c
+++ b/arch/mips/mm/pgtable-64.c
@@ -89,6 +89,7 @@ void pud_init(void *addr)
 }
 #endif
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 pmd_t mk_pmd(struct page *page, pgprot_t prot)
 {
 	pmd_t pmd;
@@ -103,6 +104,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 {
 	*pmdp = pmd;
 }
+#endif
 
 void __init pagetable_init(void)
 {
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 44411b20c7ec..7e2a0011a6fb 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -458,6 +458,7 @@ EXPORT_SYMBOL(has_transparent_hugepage);
 
 int temp_tlb_entry;
 
+#ifndef CONFIG_64BIT
 __init int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
 			       unsigned long entryhi, unsigned long pagemask)
 {
@@ -496,6 +497,7 @@ __init int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
 	local_irq_restore(flags);
 	return ret;
 }
+#endif
 
 static int ntlb;
 static int __init set_ntlb(char *str)
-- 
2.39.2


