Return-Path: <linux-mips+bounces-12676-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E8CEDCB8
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 08:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7150300ACDE
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 07:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6082D879B;
	Fri,  2 Jan 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esVw3TYK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22A2D8795;
	Fri,  2 Jan 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337354; cv=none; b=vCR9G48J8SDM+oqeLpYic1AGx7VlgrkgLxl5fwgi0clx5/LBS+gg+O7CXRC9uzSX9UvbfuqcKril7unu5E0wmFD3lWVWXyNZVziyVNcWcHf9Sf2pjMT1IcBx+hmL0SCkOM2mfIk7eggT81T0gDhjhy2KjhihurfepJnn+zLU8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337354; c=relaxed/simple;
	bh=BaQP+Uyb/5HYpSHuMHqe6vNV+NfiesFf3EGC4lY1beM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQmBG1zT6oKcPnQ8r/8DxYjnYRECybOpXPoDvXW6/g0xYXLSPCCWHz+l0k4RQCdUUpAwWbB9xJZoo+ki9Ojxg0vGFKjvo7yemn149QRperZ0f/DT0PtrzhgMw0rzNYXVL6iFrhXtLbO2pTi2skt5Ogc2aipnOBwuZ1DVfC/SI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esVw3TYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18663C116B1;
	Fri,  2 Jan 2026 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337354;
	bh=BaQP+Uyb/5HYpSHuMHqe6vNV+NfiesFf3EGC4lY1beM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=esVw3TYKANGcWz9BdswnN3jV33uwgwL8IHKDGMR/7IyAQVfT/CTl3CcsQ3ZKfTN4A
	 eIn2sNeDHdSd9GGZX7P1c+KErOINIYgmweOj+gHNg54in9HGd/rbahahPk8htVwrVV
	 RjGvwx9Jrnp+YFXOmHg5lpElgv220mnJ3usOyTqiTqTSgw7mKu3XYPy0FnI8mTHXfp
	 2exbx7Rwy0W9fA3Ily9xPCK0evD3T4GF+5RQAVhzRDZrNyKCbZkOLqkUuOBTO8lYms
	 qsZzC/6JNMarmUuc1XQYowUQZ9UFiH2ijv89KcrOjwMmVuUttw/ixViDIPYM1JGSTO
	 hqZyI8FRhz1bQ==
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
Subject: [PATCH v2 09/28] microblaze: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:45 +0200
Message-ID: <20260102070005.65328-10-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
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
 arch/microblaze/mm/init.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 31d475cdb1c5..54da60b81094 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -54,6 +54,16 @@ static void __init highmem_init(void)
 }
 #endif /* CONFIG_HIGHMEM */
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_DMA] = max_low_pfn;
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
+#else
+	max_zone_pfns[ZONE_DMA] = max_pfn;
+#endif
+}
+
 /*
  * paging_init() sets up the page tables - in fact we've already done this.
  */
@@ -71,13 +81,8 @@ static void __init paging_init(void)
 
 #ifdef CONFIG_HIGHMEM
 	highmem_init();
-
-	zones_size[ZONE_DMA] = max_low_pfn;
-	zones_size[ZONE_HIGHMEM] = max_pfn;
-#else
-	zones_size[ZONE_DMA] = max_pfn;
 #endif
-
+	arch_zone_limits_init(zones_size);
 	/* We don't have holes in memory map */
 	free_area_init(zones_size);
 }
-- 
2.51.0


