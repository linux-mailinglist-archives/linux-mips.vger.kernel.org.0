Return-Path: <linux-mips+bounces-12818-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14266D0E2D3
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D94300B901
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A39316917;
	Sun, 11 Jan 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NN3lChfw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58B1A254E;
	Sun, 11 Jan 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768119729; cv=none; b=ItEOrhEsNJbYPfiIYjtz42a52jescRLSJD07ftsj6VIIPOMafR4IftnqH5nvXRK8vijaTwNL1akGc7XdTsw+5IYMYAZ4h2PXj1YLP1j3mlpwplNTOwOOXoL3rEfPHh3wwhQ3PQHwFa79C42MymSTc2wtv4XzJDiiaf/RblFiScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768119729; c=relaxed/simple;
	bh=sY65/RaZssilanqAkKMZORd+RGdNjje1eX8P0rlpw6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUxAdWmDaaCyD9LKFgeHO2cNqND5d8m5dkms7kvyotlLHB3c5rSsxmslCfgcPxfEQaQdaUdth7a+1F5kk/cj3A788GX7+CESzIpBl6u0cH1vrS179lUoFtY6tOqXN6xA7yQ+OEpzu6zvJ0rrpGX/qxwg8kg1l6qqGZ/68rvO6uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NN3lChfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A040C19423;
	Sun, 11 Jan 2026 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119729;
	bh=sY65/RaZssilanqAkKMZORd+RGdNjje1eX8P0rlpw6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NN3lChfwg5P6LBJKzoLfcvbBwFyTjkbv176l7MWDDNEKfmQNsV9FdXu1iTB1p18r+
	 Qv6MGq+z4lJwgINv6l/GKUiPw4NesyjwjpepHwiPwzlDjiMWa+i1USjl07fz2MRYop
	 Sc1LrWnu0Gc+BgNj4gzJRCHsWYSYmNHqJ3aaEPjVk5qnsYr4znc/0zqFTfi59zJAq/
	 ukCr7ZSzjxeYp7Kp6yUQVQxDk+q26sRhrXb+8OmAOZtQsY83a4N26iQ4g710XJtgiL
	 iBzYFgAYbnZnLVEHpBAgxrkx8ozQkpwEdocd+bhVIEyIcdzpSjZYT6uJOIy5GXGxNb
	 0PvoDd12p4x0g==
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
Subject: [PATCH v3 03/29] arm: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:37 +0200
Message-ID: <20260111082105.290734-4-rppt@kernel.org>
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
 arch/arm/mm/init.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 54bdca025c9f..bdcc3639681f 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -107,18 +107,23 @@ void __init setup_dma_zone(const struct machine_desc *mdesc)
 #endif
 }
 
-static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
-	unsigned long max_high)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
 {
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
-
 #ifdef CONFIG_ZONE_DMA
-	max_zone_pfn[ZONE_DMA] = min(arm_dma_pfn_limit, max_low);
+	max_zone_pfn[ZONE_DMA] = min(arm_dma_pfn_limit, max_low_pfn);
 #endif
-	max_zone_pfn[ZONE_NORMAL] = max_low;
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
-	max_zone_pfn[ZONE_HIGHMEM] = max_high;
+	max_zone_pfn[ZONE_HIGHMEM] = max_pfn;
 #endif
+}
+
+static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
+	unsigned long max_high)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
+
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


