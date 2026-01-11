Return-Path: <linux-mips+bounces-12840-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B0D0E62A
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69063305D9A3
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B68B318130;
	Sun, 11 Jan 2026 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cucgyfK5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627F61E1A3D;
	Sun, 11 Jan 2026 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768120062; cv=none; b=Nf3i5NFGKjgmV7NJuvMWo3y1VVkCGCPnbdGTsXoPse+2dl5pBtEostvbcBbogwDUGO/OzHCioiPaOJw1Tdhgr4WzTDN/KN6T0NJ1aAbSlUG597LfV9AVsIWlLQY6tDOw1ySQHKu1A9NT7jMVxinVqTVjqJGwR+U+++q/6eUBi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768120062; c=relaxed/simple;
	bh=zd5p0i2OlJkjqXnS1oV6Bjn1onLoj8/4tNSvugcI3Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTJrHIIGhJYcrDwPkVkF0AspJ7oBKIn07JwkMzizFgvDTnq9fJP9SjMTRj7gGCeyhXYS6shSBDlz15NgGEJwHbvGgCQeB178xV2lTeznbfB5nRsMZAAHyA1wCQjrD52Fu8FnUPLUiJLmOSRcd8QsHu9JdfUtWTWklEiSjmbfuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cucgyfK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B0AC4CEF7;
	Sun, 11 Jan 2026 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768120062;
	bh=zd5p0i2OlJkjqXnS1oV6Bjn1onLoj8/4tNSvugcI3Wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cucgyfK549u/HKU9sXOhtGyxmUzXaeQo6OcfMmBauoICa2ALqFD4CHcgssCffdtz0
	 jNR5GmojmKPSKMXaxzTVfIKcpg4AhT3GBI9gKFSlU99+ajBqkW87jen695O6x8QgyW
	 qqFORooblG61KNiQrUz0ViZwhnArOqE+rUf8POn7T1L4C49wdI+cVoEUkJVPyN1phL
	 DB6aLqdi3kVV0WLbCcSIvN7kGg9TuKq12+ybRyVObguRL0q+vGXwqyNaQkOT629PZh
	 4zn7LMoAz8MYeLMbgJf6kw8eNAuufEeYwPLbjRlaWuHnzdOzixI9umBE0hkN04bQGL
	 GyVogLrYtnLyQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 25/29] mips: drop paging_init()
Date: Sun, 11 Jan 2026 10:20:59 +0200
Message-ID: <20260111082105.290734-26-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

All three variants of paging_init() on MIPS are wrappers for
pagetable_init().

Instead of having three identical wrappers, call pagetable_init() directly
from setup_arch() and remove the unnecessary paging_init() functions.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/include/asm/pgalloc.h  | 2 --
 arch/mips/include/asm/pgtable.h  | 2 +-
 arch/mips/kernel/setup.c         | 4 ++--
 arch/mips/loongson64/numa.c      | 5 -----
 arch/mips/mm/init.c              | 5 -----
 arch/mips/sgi-ip27/ip27-memory.c | 5 -----
 6 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 7a04381efa0b..6efd4a58bf10 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -101,6 +101,4 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 
 #endif /* __PAGETABLE_PUD_FOLDED */
 
-extern void pagetable_init(void);
-
 #endif /* _ASM_PGALLOC_H */
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 9c06a612d33a..fa7b935f947c 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -56,7 +56,7 @@ extern unsigned long zero_page_mask;
 	(virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)) & zero_page_mask))))
 #define __HAVE_COLOR_ZERO_PAGE
 
-extern void paging_init(void);
+extern void pagetable_init(void);
 
 /*
  * Conversion functions: convert a page and protection to a page entry,
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index d36d89d01fa4..7622aad0f0b3 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -614,7 +614,7 @@ static void __init bootcmdline_init(void)
  * kernel but generic memory management system is still entirely uninitialized.
  *
  *  o bootmem_init()
- *  o paging_init()
+ *  o pagetable_init()
  *  o dma_contiguous_reserve()
  *
  * At this stage the bootmem allocator is ready to use.
@@ -778,7 +778,7 @@ void __init setup_arch(char **cmdline_p)
 	prefill_possible_map();
 
 	cpu_cache_init();
-	paging_init();
+	pagetable_init();
 
 	memblock_dump_all();
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 2cd95020df08..16ffb32cca50 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -160,11 +160,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 }
 
-void __init paging_init(void)
-{
-	pagetable_init();
-}
-
 /* All PCI device belongs to logical Node-0 */
 int pcibus_to_node(struct pci_bus *bus)
 {
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index c479c42141c3..cd04200d0573 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -415,11 +415,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 #endif
 }
 
-void __init paging_init(void)
-{
-	pagetable_init();
-}
-
 #ifdef CONFIG_64BIT
 static struct kcore_list kcore_kseg0;
 #endif
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 082651facf4f..4317f5ae1fd1 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -410,8 +410,3 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 }
-
-void __init paging_init(void)
-{
-	pagetable_init();
-}
-- 
2.51.0


