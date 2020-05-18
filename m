Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5741D8783
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 20:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgERSsr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 14:48:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:27176 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728954AbgERSsq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 14:48:46 -0400
IronPort-SDR: hH7GOhgOu/8BxW1LJsBrficmOhzK65UIieCBFQq8/WeTR/38m4PUk1i759mDO26+cxJc+FNrh7
 bMcC2yUF2vlA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 11:48:45 -0700
IronPort-SDR: A0dNOJcp3XVBRer+3SvVGXusda3bUk5OmiTTHwwN4BXAPX4zWgYa/kiDwvCtGSiDC+7pgbW2fC
 b75hGkYrg3kw==
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="253140387"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 11:48:45 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Ira Weiny <ira.weiny@intel.com>,
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
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable pagefault/preempt twice
Date:   Mon, 18 May 2020 11:48:43 -0700
Message-Id: <20200518184843.3029640-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-8-ira.weiny@intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

The kunmap_atomic clean up failed to remove one set of pagefault/preempt
enables when vaddr is not in the fixmap.

Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/microblaze/mm/highmem.c | 5 +----
 arch/mips/mm/highmem.c       | 5 +----
 arch/powerpc/mm/highmem.c    | 5 +----
 arch/sparc/mm/highmem.c      | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index ee8a422b2b76..92e0890416c9 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -57,11 +57,8 @@ void kunmap_atomic_high(void *kvaddr)
 	int type;
 	unsigned int idx;
 
-	if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < __fix_to_virt(FIX_KMAP_END))
 		return;
-	}
 
 	type = kmap_atomic_idx();
 
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 37e244cdb14e..8e8726992720 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -41,11 +41,8 @@ void kunmap_atomic_high(void *kvaddr)
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 	int type __maybe_unused;
 
-	if (vaddr < FIXADDR_START) { // FIXME
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < FIXADDR_START)
 		return;
-	}
 
 	type = kmap_atomic_idx();
 #ifdef CONFIG_DEBUG_HIGHMEM
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 35071c2913f1..624b4438aff9 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -44,11 +44,8 @@ void kunmap_atomic_high(void *kvaddr)
 {
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 
-	if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < __fix_to_virt(FIX_KMAP_END))
 		return;
-	}
 
 	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM)) {
 		int type = kmap_atomic_idx();
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d237d902f9c3..6ff6e2a9f9b3 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -86,11 +86,8 @@ void kunmap_atomic_high(void *kvaddr)
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 	int type;
 
-	if (vaddr < FIXADDR_START) { // FIXME
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < FIXADDR_START)
 		return;
-	}
 
 	type = kmap_atomic_idx();
 
-- 
2.25.1

