Return-Path: <linux-mips+bounces-12821-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA36D0E2EB
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F26430060D9
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6CD316905;
	Sun, 11 Jan 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWkYgxC6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87923176EB;
	Sun, 11 Jan 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768119774; cv=none; b=iwK7T4PPEp/ydWBCho78px81fksm4wzT3Eh0R+SADLmSQ3b2LS/g3cjfTcBl8EgOq7HblDsh2SglI0ZuAdL0BVzR166lhdgsoxGoeoF0lnDfmqyXbIciQwavQZc6u6UqzUSDlG5HH92vPkzPtHyptEhK13CxJ2oe439Z+hbWuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768119774; c=relaxed/simple;
	bh=beem9LtRR1HHqRgL6PattJCY9S8i8ATD31bTRr88sn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP8A0Wtueu04KB2QpGuCx0DeMql+mwb7FZW6u2GvvapfiWPouns3u6c/iVc/OcZIw4sPI81NE5wsY8425kiuuIMWUYfeHpld5XhMqjuBiBipDnXTwSBPnRnkiPtVwjT1gnKUP8skSmzJ4oo3WVQjJnqOv1acBmpkron0iq1cUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWkYgxC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94FBC4CEF7;
	Sun, 11 Jan 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119774;
	bh=beem9LtRR1HHqRgL6PattJCY9S8i8ATD31bTRr88sn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWkYgxC6u+l0vrWaonlzQlH5gQLB1FcuycynoPybUPeo4dvv7xXva14K52XEy7LMX
	 8fRn6/84WfNTIrDoAmNlHQTW/sq2Pp0UvtLIoxegKGm5e5j8XBH8kTWEyosbpzPu1q
	 GoRhJ+7+SZo6hD8Y3ZBI3LqbG2tt3rcBtbKpr2ZF2pWHt5tS0xJP8cvo6mcyroAa1S
	 0OeHyObWAKeISSESoLTXFOmsvQ3g1bLJpnbo/n+CQ28Ki4o90ppc7XGkpZP80EOCDf
	 Ve35dstEOEfIY1ywzAqMno+GXmIRLZeaDmLNIieGH2xbLUHJ4iNHvRWZ34zWnwrMFy
	 N9SXP8FFel3AQ==
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
Subject: [PATCH v3 06/29] csky: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:40 +0200
Message-ID: <20260111082105.290734-7-rppt@kernel.org>
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
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/kernel/setup.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index e0d6ca86ea8c..8968815d93e6 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -51,6 +51,14 @@ static void __init setup_initrd(void)
 }
 #endif
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
+#endif
+}
+
 static void __init csky_memblock_init(void)
 {
 	unsigned long lowmem_size = PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
@@ -83,12 +91,9 @@ static void __init csky_memblock_init(void)
 	setup_initrd();
 #endif
 
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
 	mmu_init(min_low_pfn, max_low_pfn);
 
 #ifdef CONFIG_HIGHMEM
-	max_zone_pfn[ZONE_HIGHMEM] = max_pfn;
 
 	highstart_pfn = max_low_pfn;
 	highend_pfn   = max_pfn;
@@ -97,6 +102,7 @@ static void __init csky_memblock_init(void)
 
 	dma_contiguous_reserve(0);
 
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


