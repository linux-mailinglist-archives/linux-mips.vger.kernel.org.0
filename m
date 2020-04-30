Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA7C1C0842
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 22:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgD3Uix (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 16:38:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:61499 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgD3Uiw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 16:38:52 -0400
IronPort-SDR: GdOtnLS3LmW0bZlIAvto6VUY4h5Xf68PSrrmIaOUjsq4TLlH/vXK07fMHC+n+BJ+LnP6Qkjqmy
 a76tpAdnlMtw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 13:38:51 -0700
IronPort-SDR: hB//QQpet3fOdmuPqRAhuKh6hnLMIfJNg3bTy5qhPJCt9/QRNs8zhIzkpzjhDWblDqxeVXndxO
 EriWtSJ5oOZA==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; 
   d="scan'208";a="294637095"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 13:38:50 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: [PATCH V1 02/10] arch/xtensa: Move kmap build bug out of the way
Date:   Thu, 30 Apr 2020 13:38:37 -0700
Message-Id: <20200430203845.582900-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

Move the kmap() build bug to kmap_init() to facilitate patches to lift
kmap() to the core.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/xtensa/include/asm/highmem.h | 5 -----
 arch/xtensa/mm/highmem.c          | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 413848cc1e56..a9587c85be85 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -68,11 +68,6 @@ void kunmap_high(struct page *page);
 
 static inline void *kmap(struct page *page)
 {
-	/* Check if this memory layout is broken because PKMAP overlaps
-	 * page table.
-	 */
-	BUILD_BUG_ON(PKMAP_BASE <
-		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);
 	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 184ceadccc1a..711641c4d214 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -88,6 +88,11 @@ void __init kmap_init(void)
 {
 	unsigned long kmap_vstart;
 
+	/* Check if this memory layout is broken because PKMAP overlaps
+	 * page table.
+	 */
+	BUILD_BUG_ON(PKMAP_BASE <
+		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);
 	/* cache the first kmap pte */
 	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
 	kmap_pte = kmap_get_fixmap_pte(kmap_vstart);
-- 
2.25.1

