Return-Path: <linux-mips+bounces-12824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA5D0E459
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33CA23019B5A
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0A431812C;
	Sun, 11 Jan 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxotzz0k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087F31771B;
	Sun, 11 Jan 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768119820; cv=none; b=PnznZ8HspZch7rGC9sT+HdnY/hC3ZR43QHrnCTKXKppvPZbFwe/onaS3SoAAAUEra4qEuBFGdFvNSC3XtoSl30U1aFM6F7lllvITLWX6U9FIMLbo0tAfPidb/Lyl+lKuv2R8FOEj+9LMIIyIVULhyVWp1ukvqPiGx7u1aBdBZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768119820; c=relaxed/simple;
	bh=qGV3crV7vYfN1DCsmhF37VWmOXuApg3MmNmGXJVotqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hysRfwDMTVXirb1mLmXqCLpGuh91pQvPl23KvpMuzpgh0UA8qFhm3fcN+OPUMIucUMLNlM99kDWZmRrY6SUGrTuNwzdsBcnaDapKDHO37OkdvzXJHQzFRVtrxVpw8BVeJKaM7Q0qjktycJp5Ivk90kVr6HdV8hYKw0iD/w8HD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxotzz0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A52C4CEF7;
	Sun, 11 Jan 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119819;
	bh=qGV3crV7vYfN1DCsmhF37VWmOXuApg3MmNmGXJVotqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxotzz0k2KwCNp5gWh6cgEcUYH8E0BhaEKKXTdT2pUdivBywvI4T+qXqHxIZASCzv
	 1gDvHJBccnnzMaLHh7DBlSuaqDoWKk743xL7Oou07E6HNfZWS0zPTWLM4rs5OOguuo
	 GUAoxRtqYBs/qxZg0L3WKkhSzJKWvFzo7bwsjWtl2FO4jLNuQVwJYrxBJFZgt1ghP2
	 0kdmI1lYTpCBQUUqGWKOjqYFpVyhQUuN851OKnj8uy6V7dRr5kMl9pPSzvbRlL8i0d
	 I2u0gSIfQN5q/tcK4hqFkCMxPsVumAIFJF5vuk9i0Tc/89H6zAhA9SuDwA9yercaDb
	 vOxbNKYOZaN5w==
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
Subject: [PATCH v3 09/29] m68k: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:43 +0200
Message-ID: <20260111082105.290734-10-rppt@kernel.org>
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

Move calculations of zone limits to a dedicated arch_zone_limits_init()
function.

Later MM core will use this function as an architecture specific callback
during nodes and zones initialization and thus there won't be a need to
call free_area_init() from every architecture.

Since all variants of m68k add all memory to ZONE_DMA, it is possible to
use unified implementation for arch_zone_limits_init() that sets the end
of ZONE_DMA to memblock_end_of_DRAM().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/m68k/mm/init.c     | 7 ++++++-
 arch/m68k/mm/mcfmmu.c   | 2 +-
 arch/m68k/mm/motorola.c | 2 +-
 arch/m68k/mm/sun3mmu.c  | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 488411af1b3f..6b1d9d2434b5 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -40,6 +40,11 @@
 void *empty_zero_page;
 EXPORT_SYMBOL(empty_zero_page);
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_DMA] = PFN_DOWN(memblock_end_of_DRAM());
+}
+
 #ifdef CONFIG_MMU
 
 int m68k_virt_to_node_shift;
@@ -69,7 +74,7 @@ void __init paging_init(void)
 	high_memory = (void *) end_mem;
 
 	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
-	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 19a75029036c..24a6f7bbd1ce 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -73,7 +73,7 @@ void __init paging_init(void)
 	}
 
 	current->mm = NULL;
-	max_zone_pfn[ZONE_DMA] = PFN_DOWN(_ramend);
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 62283bc2ed79..d6ccd23caf61 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -517,6 +517,6 @@ void __init paging_init(void)
 		if (node_present_pages(i))
 			node_set_state(i, N_NORMAL_MEMORY);
 
-	max_zone_pfn[ZONE_DMA] = memblock_end_of_DRAM();
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index 1ecf6bdd08bf..fdd69cc4240c 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -82,7 +82,7 @@ void __init paging_init(void)
 	current->mm = NULL;
 
 	/* memory sizing is a hack stolen from motorola.c..  hope it works for us */
-	max_zone_pfn[ZONE_DMA] = ((unsigned long)high_memory) >> PAGE_SHIFT;
+	arch_zone_limits_init(max_zone_pfn);
 
 	/* I really wish I knew why the following change made things better...  -- Sam */
 	free_area_init(max_zone_pfn);
-- 
2.51.0


