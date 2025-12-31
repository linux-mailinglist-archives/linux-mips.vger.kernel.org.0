Return-Path: <linux-mips+bounces-12654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74506CEBD45
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 11:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB7E730559E8
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 10:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4F83203B5;
	Wed, 31 Dec 2025 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn8DAoue"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D63203B0;
	Wed, 31 Dec 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178630; cv=none; b=DNLgelyittRCJAaZucWLs9F6tAMg6YIXd2tjoH19OswD00nW92T02raXmYBzFZVw6c0vMpM7qzk4YVWEUf0yJhnojuYXARkSny3UcBjTIMnuhtyCUNnicCymb+QvWl/8fEbzrVBN1SN1RXax+ua73EVs0bqrFIxc9E3THPMdsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178630; c=relaxed/simple;
	bh=Md5yS/VxEgsDtseFUiUdjBGwg71pDr/MrKSVCAcacM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpF7UsRBOStpYFb0zWKXrd0MR58CFgzzsYsrw9qrqAhw7syIksiOAWSvY2opkzgIH4EH2/fNYAkhzLOS4E7ASdxNuDATDRbh2dIatZttMsS+UYPM6JdveOhDogPLSzFtqTF1V1nJV1z5OyesBrneDfop4NKkgcd8b+nylzQUSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn8DAoue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF07C113D0;
	Wed, 31 Dec 2025 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767178627;
	bh=Md5yS/VxEgsDtseFUiUdjBGwg71pDr/MrKSVCAcacM4=;
	h=From:To:Cc:Subject:Date:From;
	b=kn8DAouex1gbnLOc/2JeogKfAy+YJMlixd9i4X0NdW1V1EKL9tsFSSbVBkp6r6ytS
	 XLYk9J0tVZ6HXH3qdy/V/gm7NDXgehDYZwTBFKwDKuDNwxh/EfePwil12YVbH+itN0
	 Li5neF9ODRvdhDmMmhkHO06LEWd8/d+n6knh7g1f6Zuivd4uD7TM+MWyzriCKMuAF8
	 sMK5MECbz3RfpruLY9l902Kf6ne8FzdrG47/s5gDeZTgEd0aV9leLEJOHZf8lb/RR7
	 O+UBGfY0pAoM1IKj2T3htNvgK+yMhA2X6oqleYSh3JPVIjCStO9zJY6G/kh30q34Ms
	 6SYZazAr5ZTRw==
From: Mike Rapoport <rppt@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Mike Rapoport <rppt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	hauke@hauke-m.de,
	jelonek.jonas@gmail.com,
	markus.stockhausen@gmx.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] mips: fix HIGHMEM initialization
Date: Wed, 31 Dec 2025 12:57:01 +0200
Message-ID: <20251231105701.519711-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Commit 6faea3422e3b ("arch, mm: streamline HIGHMEM freeing") overzealously
removed mem_init_free_highmem() function that beside freeing high memory
pages checked for CPU support for high memory as a prerequisite.

Partially restore mem_init_free_highmem() with a new highmem_init() name
and make it discard high memory in case there is no CPU support for it.

Reported-by: markus.stockhausen@gmx.de
Fixes: 6faea3422e3b ("arch, mm: streamline HIGHMEM freeing")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/mm/init.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index a673d3d68254..8986048f9b11 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -425,6 +425,28 @@ void __init paging_init(void)
 static struct kcore_list kcore_kseg0;
 #endif
 
+static inline void __init highmem_init(void)
+{
+#ifdef CONFIG_HIGHMEM
+	unsigned long tmp;
+
+	/*
+	 * If CPU cannot support HIGHMEM discard the memory above highstart_pfn
+	 */
+	if (cpu_has_dc_aliases) {
+		memblock_remove(PFN_PHYS(highstart_pfn), -1);
+		return;
+	}
+
+	for (tmp = highstart_pfn; tmp < highend_pfn; tmp++) {
+		struct page *page = pfn_to_page(tmp);
+
+		if (!memblock_is_memory(PFN_PHYS(tmp)))
+			SetPageReserved(page);
+	}
+#endif
+}
+
 void __init arch_mm_preinit(void)
 {
 	/*
@@ -435,6 +457,7 @@ void __init arch_mm_preinit(void)
 
 	maar_init();
 	setup_zero_pages();	/* Setup zeroed pages.  */
+	highmem_init();
 
 #ifdef CONFIG_64BIT
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
-- 
2.51.0


