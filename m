Return-Path: <linux-mips+bounces-12837-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5614D0E486
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20B8230090E6
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E470C318B86;
	Sun, 11 Jan 2026 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHSEbt3X"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E724A07C;
	Sun, 11 Jan 2026 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768120016; cv=none; b=RX8GfzrWPZjV/S7Y2TkfY0coLUQqxrpGcb6h3QCDRzD+rZsNs6/kbu6jJSL9kxsR18q6lMUnfs//r8XTEfZ84Wer8oL/kzaafc/nVfXuQO5XIjHHqNR5/o3+k9l4VuthVJU7w54juVtQSqOMhGWlkRavzn3oP1Hc7itSeRSVXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768120016; c=relaxed/simple;
	bh=RfrVgNIj9rxp9R6SGMWNq/5X+PJ8wzbzZyqbje0LIeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAWSQcN7AOzZpRUoR9HzkkfND10j/9F9unOu0nLL1HO6bo8o4IzhYTFour/jYuEoBFBAkLaZqijqL3TyUVd8B3WyFOxx0/Y8iYA4jjAiGksEt4D+xgOeouuI/dxNJVLOFTSiHs7HVjTHOWqSczRHaHg8PHx5sEiAKCvIfVWYsv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHSEbt3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7397C4CEF7;
	Sun, 11 Jan 2026 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768120016;
	bh=RfrVgNIj9rxp9R6SGMWNq/5X+PJ8wzbzZyqbje0LIeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tHSEbt3XxwesdgJT2Z++WyePhEbkb+nyGlySy70wfQIT+pflbmIM+GlvXBDyguftQ
	 2Ys50/4b35j+sjd/5kOOfnQe9IRS62imFv43uLXTkPi7zlQWDQJhP0rM0GConiSwLT
	 YAJe8G4i0PUEqA9Vhb1A/zxzlCac1EGJ3SkmyzE2q3wvxKzgQrYsEr/jdyruVb22A0
	 3FaETYR9/LhyCiHKAf2u2gJBT5CTbGbIpUbNnnC3z+VpljRwtitYbbzQu5H2ZQySmf
	 k5iK+NQSGRChTUOxlwP8dr8FwmdRY2QLpmlxVejSsecyS6O0WhjimFYRzzvIKoB0dz
	 r7d4tanYl4nFQ==
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
Subject: [PATCH v3 22/29] xtensa: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:56 +0200
Message-ID: <20260111082105.290734-23-rppt@kernel.org>
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
---
 arch/xtensa/mm/init.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index cc52733a0649..60299f359a3c 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -116,15 +116,19 @@ static void __init print_vm_layout(void)
 		(unsigned long)(__bss_stop - __bss_start) >> 10);
 }
 
-void __init zones_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
-	/* All pages are DMA-able, so we put them all in the DMA zone. */
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = {
-		[ZONE_NORMAL] = max_low_pfn,
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
-		[ZONE_HIGHMEM] = max_pfn,
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
 #endif
-	};
+}
+
+void __init zones_init(void)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
+
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 	print_vm_layout();
 }
-- 
2.51.0


