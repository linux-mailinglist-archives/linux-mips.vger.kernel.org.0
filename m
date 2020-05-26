Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956991B8CB8
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 07:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgDZFyh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 01:54:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:57441 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgDZFyY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 01:54:24 -0400
IronPort-SDR: VzlFhdTEuODkHES7tfpAmc32rgPV+BZoxxhmEoRh4UDEESOCIqyPZo5lnA3C7j5WNjjPtmYdzz
 8fGjRrMxHLXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 22:54:23 -0700
IronPort-SDR: OkT3JFTLADkNjn3UowLHjtWAG/8+lfmHPe7Y3tdnmzHkWlptAPlMqa7rHtAf79YOBGXzoBP6cc
 KBC96wVpnPDQ==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; 
   d="scan'208";a="458418423"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 22:54:22 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Subject: [PATCH 3/5] arch/kunmap: Remove duplicate kunmap implementations
Date:   Sat, 25 Apr 2020 22:54:04 -0700
Message-Id: <20200426055406.134198-4-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200426055406.134198-1-ira.weiny@intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

All architectures do exactly the same thing for kunmap(); remove all the
duplicate definitions and lift the call to the core.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/include/asm/highmem.h        |  9 ---------
 arch/arm/include/asm/highmem.h        |  1 -
 arch/arm/mm/highmem.c                 |  9 ---------
 arch/csky/include/asm/highmem.h       |  1 -
 arch/csky/mm/highmem.c                |  9 ---------
 arch/microblaze/include/asm/highmem.h |  8 --------
 arch/mips/include/asm/highmem.h       |  1 -
 arch/mips/mm/highmem.c                |  9 ---------
 arch/nds32/include/asm/highmem.h      |  1 -
 arch/nds32/mm/highmem.c               | 10 ----------
 arch/powerpc/include/asm/highmem.h    |  8 --------
 arch/sparc/include/asm/highmem.h      |  8 --------
 arch/x86/include/asm/highmem.h        |  2 --
 arch/x86/mm/highmem_32.c              |  9 ---------
 arch/xtensa/include/asm/highmem.h     |  8 --------
 include/linux/highmem.h               |  8 ++++++++
 16 files changed, 8 insertions(+), 93 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 96eb67c86961..c03a911c9f21 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -41,15 +41,6 @@ static inline void flush_cache_kmaps(void)
 	flush_cache_all();
 }
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
-
 #endif
 
 #endif
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index c917522541de..829e3b969819 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -62,7 +62,6 @@ static inline void *kmap_high_get(struct page *page)
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index e8ba37c36590..c700b32350ee 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -31,15 +31,6 @@ static inline pte_t get_fixmap_pte(unsigned long vaddr)
 	return *ptep;
 }
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index 4caeff143748..a0e7c43731a0 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -34,7 +34,6 @@ extern void kunmap_high(struct page *page);
 
 #define ARCH_HAS_KMAP
 extern void *kmap(struct page *page);
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 5fb0bd855444..69b1931986ae 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -22,15 +22,6 @@ void *kmap(struct page *page)
 }
 EXPORT_SYMBOL(kmap);
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 8c5bfd228bd8..1cbd52a0e39b 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -55,14 +55,6 @@ extern void kunmap_high(struct page *page);
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 static inline void *kmap_atomic(struct page *page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index c30bbb88fcfe..af9a66300628 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -50,7 +50,6 @@ extern void kunmap_high(struct page *page);
 
 #define ARCH_HAS_KMAP
 extern void *kmap(struct page *page);
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 3867dbe9ef32..c3c9fe962f0f 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -21,15 +21,6 @@ void *kmap(struct page *page)
 }
 EXPORT_SYMBOL(kmap);
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 /*
  * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
  * no global lock is needed and because the kmap code must perform a global TLB
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index b13654a79069..e455e2624247 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -53,7 +53,6 @@ extern void kmap_init(void);
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index d0cde53b84ae..f9348bec0ecb 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -10,16 +10,6 @@
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
-EXPORT_SYMBOL(kunmap);
-
 void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index f14e4feef6d5..08e02a4f3a8f 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -63,14 +63,6 @@ extern void kunmap_high(struct page *page);
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 static inline void *kmap_atomic(struct page *page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 2ff1192047f7..b3ee234b2a8f 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -52,14 +52,6 @@ void kmap_init(void) __init;
 
 void kunmap_high(struct page *page);
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
 
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index c916a28a9738..102cdcde74cb 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -60,8 +60,6 @@ extern unsigned long highstart_pfn, highend_pfn;
 
 extern void kunmap_high(struct page *page);
 
-void kunmap(struct page *page);
-
 void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 12591a81b85c..c4ebfd0ae401 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -4,15 +4,6 @@
 #include <linux/swap.h> /* for totalram_pages */
 #include <linux/memblock.h>
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 /*
  * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
  * no global lock is needed and because the kmap code must perform a global TLB
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index fac4f48bde6c..ae9e0ffbdb80 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -75,14 +75,6 @@ static inline void *kmap(struct page *page)
 	return kmap_generic(page);
 }
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 static inline void flush_cache_kmaps(void)
 {
 	flush_cache_all();
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 2f7f710b7e7d..1a3b7690c78c 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -52,6 +52,14 @@ static inline void *kmap(struct page *page)
 }
 #endif
 
+static inline void kunmap(struct page *page)
+{
+	might_sleep();
+	if (!PageHighMem(page))
+		return;
+	kunmap_high(page);
+}
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1

