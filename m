Return-Path: <linux-mips+bounces-12817-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C84D0E28C
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA1CD3004ECC
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F6028852E;
	Sun, 11 Jan 2026 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdukbAEx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C59C1E1A3D;
	Sun, 11 Jan 2026 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768119714; cv=none; b=gCxWN/Uj7s2gA0rC6v84nVI7reX6yeHM/aLAQHe/HN/MkiHELgRL8aO6kw55W/dXUCQn4yNEmnDEKEA+Ln05jB0ArBEmIhsbBJJ/k4pRp4c03t++ViAuV6vkGUnXe5oaFm2tKUZmcsXWgwTbIiAYuj4uES4HDmOxjQgCEj92WYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768119714; c=relaxed/simple;
	bh=8QBv9t8LGsuSX+POQQCKwB4fxaLECpliYPuyEC7/9g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AShA8eV4qKJNxVImidOzXyoRzotRao05BVsgror70zXAhA1f7nYgOGts0GOerSVeflpMMuWIYNKtnt/z8k2GkwRqR2Hstc3rTM3FWkQiqE3W/IrkWhn1cVjIkV6uj9rKDKhikOy2/mCy2zDxKcmX1eCvHNYJjoH4PQDiz3DlOc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdukbAEx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C598C4CEF7;
	Sun, 11 Jan 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119714;
	bh=8QBv9t8LGsuSX+POQQCKwB4fxaLECpliYPuyEC7/9g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdukbAExezEnhPD7Fz3wOiEU/vc0M64uJEir3HYWzx4ftF18Ax4Kx16THz6QJsu7G
	 E7jlAsKeMb+AkrIybQ34sKwp4Ag9HkaBJWByLQtL3mH+3Os/7fMJxySVZHiRW4xVe5
	 k3QE5dTNYYB+M/SfE0t1/i0VxmYp0VwLJkLcAkEp1g9/uWrRVlpTzL0cbkcs5a3pLw
	 UwuXLA0sVTL9DaDVBg4Sl2xRgUWXVFQ5KYtJQkT0kDc+lIR7wua8QQPkpV0/Pwyplx
	 WYfk3IAtXbovl1JeV9CqcFYijlKtF6ZPmguYMVbTa+3iCmyCADI4Ifhnu7KIA4NkzI
	 ybbHzamQouxpQ==
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
Subject: [PATCH v3 02/29] arc: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:36 +0200
Message-ID: <20260111082105.290734-3-rppt@kernel.org>
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

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/mm/init.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index a73cc94f806e..ff7974d38011 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -75,6 +75,25 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		base, TO_MB(size), !in_use ? "Not used":"");
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
+{
+	/*----------------- node/zones setup --------------------------*/
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
+
+#ifdef CONFIG_HIGHMEM
+	/*
+	 * max_high_pfn should be ok here for both HIGHMEM and HIGHMEM+PAE.
+	 * For HIGHMEM without PAE max_high_pfn should be less than
+	 * min_low_pfn to guarantee that these two regions don't overlap.
+	 * For PAE case highmem is greater than lowmem, so it is natural
+	 * to use max_high_pfn.
+	 *
+	 * In both cases, holes should be handled by pfn_valid().
+	 */
+	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
+#endif
+}
+
 /*
  * First memory setup routine called from setup_arch()
  * 1. setup swapper's mm @init_mm
@@ -122,9 +141,6 @@ void __init setup_arch_memory(void)
 
 	memblock_dump_all();
 
-	/*----------------- node/zones setup --------------------------*/
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
 #ifdef CONFIG_HIGHMEM
 	/*
 	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
@@ -139,21 +155,11 @@ void __init setup_arch_memory(void)
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	/*
-	 * max_high_pfn should be ok here for both HIGHMEM and HIGHMEM+PAE.
-	 * For HIGHMEM without PAE max_high_pfn should be less than
-	 * min_low_pfn to guarantee that these two regions don't overlap.
-	 * For PAE case highmem is greater than lowmem, so it is natural
-	 * to use max_high_pfn.
-	 *
-	 * In both cases, holes should be handled by pfn_valid().
-	 */
-	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
-
 	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
 	kmap_init();
 #endif /* CONFIG_HIGHMEM */
 
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


