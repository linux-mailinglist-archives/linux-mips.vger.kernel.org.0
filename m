Return-Path: <linux-mips+bounces-12670-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8ECEDBCC
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 08:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E05301DB9C
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 07:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A482D1925;
	Fri,  2 Jan 2026 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFZ7SBqL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551D1C84D7;
	Fri,  2 Jan 2026 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337267; cv=none; b=mIhMyhFxkJfXDFsrDk2skBpJId9Vb+KxfCgnTbNbwTBLxoL65JreCj493rq6dyWmEmynrwC/jzjLKd+wdcAZ8q0c+oSz+yIyfR0nBfcx1Qy/d/RuQC7X+En9dQv8EVkp9c5A3lvVlOkRMHwlSFV8AKrEM1Xi5WDDFsmMH4349So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337267; c=relaxed/simple;
	bh=sY65/RaZssilanqAkKMZORd+RGdNjje1eX8P0rlpw6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAb7BAjcKPLHYucnhFOvUngWb3gS/lo9vAF1dc3oqr5VcKXhToTwS59bFI+iNNSHEtFtZ+/OrJGR05Q67EleeAID4e2oYWUQ3LePJrHt6NkI6352KVSYdg9MlETfmQlJKETI6btIbzeuFHyJXdm0VaqMtrZX1nnglqhtf24urF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFZ7SBqL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEB7C116D0;
	Fri,  2 Jan 2026 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337267;
	bh=sY65/RaZssilanqAkKMZORd+RGdNjje1eX8P0rlpw6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FFZ7SBqLRszGA55Y0dcTAeVUAFfhPI1J/Zu+nhszyk401f32Bb6bWLRKqrB+W2AKm
	 N38QT5+aUkSxN75WEW+blTrdKEOqeUiAH0BX1iOcat59Cv/SoweGwGsDzNvWrsSMlc
	 3QSzDoZKQleHv/14oFELN4CDb8KsNap/u7uUJ7UeoPHZ3CgPa49XZbUQPGXWMVadAQ
	 iGDYvbAw7yh54e+JFc4Kkqc0pB207lzVasPVl3cUpS+igbsvBxYsRn7xuxZTZdnkDI
	 isfveZxYymcuq0kzbQxRSK8ezAytSigXlJWJalxOdK1KDDwocwk/lYGd7pPWjjMlNX
	 rJZb3YeomLfgQ==
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
Subject: [PATCH v2 03/28] arm: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:39 +0200
Message-ID: <20260102070005.65328-4-rppt@kernel.org>
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


