Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F6C1C0829
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 22:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgD3UjT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 16:39:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:53072 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgD3Ui7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 16:38:59 -0400
IronPort-SDR: U0pCJS19Z1uD5B5LzfuK5nM3tTgLAptQL40qwK3n90ZyV8Sk9tkhuyrkYpeOBuT8GGp76QHtUz
 IOy9WDzIAKNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 13:38:57 -0700
IronPort-SDR: C4RA7+N+Z0t2/pJbTFIWDU06VS9ozwC1Zx/UO2JjJBFPB7fq6xNHtmETl3nkUIRZMaPPJI6cCx
 oD4RjRyPVceA==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; 
   d="scan'208";a="261902829"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 13:38:56 -0700
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
Subject: [PATCH V1 10/10] drm: Remove drm specific kmap_atomic code
Date:   Thu, 30 Apr 2020 13:38:45 -0700
Message-Id: <20200430203845.582900-11-ira.weiny@intel.com>
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

kmap_atomic_prot() is now exported by all architectures.  Use this
function rather than open coding a driver specific kmap_atomic.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c    | 56 ++--------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 16 ++++----
 include/drm/ttm/ttm_bo_api.h         |  4 --
 3 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 52d2b71f1588..f09b096ba4fd 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -257,54 +257,6 @@ static int ttm_copy_io_page(void *dst, void *src, unsigned long page)
 	return 0;
 }
 
-#ifdef CONFIG_X86
-#define __ttm_kmap_atomic_prot(__page, __prot) kmap_atomic_prot(__page, __prot)
-#define __ttm_kunmap_atomic(__addr) kunmap_atomic(__addr)
-#else
-#define __ttm_kmap_atomic_prot(__page, __prot) vmap(&__page, 1, 0,  __prot)
-#define __ttm_kunmap_atomic(__addr) vunmap(__addr)
-#endif
-
-
-/**
- * ttm_kmap_atomic_prot - Efficient kernel map of a single page with
- * specified page protection.
- *
- * @page: The page to map.
- * @prot: The page protection.
- *
- * This function maps a TTM page using the kmap_atomic api if available,
- * otherwise falls back to vmap. The user must make sure that the
- * specified page does not have an aliased mapping with a different caching
- * policy unless the architecture explicitly allows it. Also mapping and
- * unmapping using this api must be correctly nested. Unmapping should
- * occur in the reverse order of mapping.
- */
-void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	if (pgprot_val(prot) == pgprot_val(PAGE_KERNEL))
-		return kmap_atomic(page);
-	else
-		return __ttm_kmap_atomic_prot(page, prot);
-}
-EXPORT_SYMBOL(ttm_kmap_atomic_prot);
-
-/**
- * ttm_kunmap_atomic_prot - Unmap a page that was mapped using
- * ttm_kmap_atomic_prot.
- *
- * @addr: The virtual address from the map.
- * @prot: The page protection.
- */
-void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot)
-{
-	if (pgprot_val(prot) == pgprot_val(PAGE_KERNEL))
-		kunmap_atomic(addr);
-	else
-		__ttm_kunmap_atomic(addr);
-}
-EXPORT_SYMBOL(ttm_kunmap_atomic_prot);
-
 static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
 				unsigned long page,
 				pgprot_t prot)
@@ -316,13 +268,13 @@ static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
 		return -ENOMEM;
 
 	src = (void *)((unsigned long)src + (page << PAGE_SHIFT));
-	dst = ttm_kmap_atomic_prot(d, prot);
+	dst = kmap_atomic_prot(d, prot);
 	if (!dst)
 		return -ENOMEM;
 
 	memcpy_fromio(dst, src, PAGE_SIZE);
 
-	ttm_kunmap_atomic_prot(dst, prot);
+	kunmap_atomic(dst);
 
 	return 0;
 }
@@ -338,13 +290,13 @@ static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
 		return -ENOMEM;
 
 	dst = (void *)((unsigned long)dst + (page << PAGE_SHIFT));
-	src = ttm_kmap_atomic_prot(s, prot);
+	src = kmap_atomic_prot(s, prot);
 	if (!src)
 		return -ENOMEM;
 
 	memcpy_toio(dst, src, PAGE_SIZE);
 
-	ttm_kunmap_atomic_prot(src, prot);
+	kunmap_atomic(src);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index bb46ca0c458f..94d456a1d1a9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -374,12 +374,12 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
 		copy_size = min_t(u32, copy_size, PAGE_SIZE - src_page_offset);
 
 		if (unmap_src) {
-			ttm_kunmap_atomic_prot(d->src_addr, d->src_prot);
+			kunmap_atomic(d->src_addr);
 			d->src_addr = NULL;
 		}
 
 		if (unmap_dst) {
-			ttm_kunmap_atomic_prot(d->dst_addr, d->dst_prot);
+			kunmap_atomic(d->dst_addr);
 			d->dst_addr = NULL;
 		}
 
@@ -388,8 +388,8 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
 				return -EINVAL;
 
 			d->dst_addr =
-				ttm_kmap_atomic_prot(d->dst_pages[dst_page],
-						     d->dst_prot);
+				kmap_atomic_prot(d->dst_pages[dst_page],
+						 d->dst_prot);
 			if (!d->dst_addr)
 				return -ENOMEM;
 
@@ -401,8 +401,8 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
 				return -EINVAL;
 
 			d->src_addr =
-				ttm_kmap_atomic_prot(d->src_pages[src_page],
-						     d->src_prot);
+				kmap_atomic_prot(d->src_pages[src_page],
+						 d->src_prot);
 			if (!d->src_addr)
 				return -ENOMEM;
 
@@ -499,9 +499,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 	}
 out:
 	if (d.src_addr)
-		ttm_kunmap_atomic_prot(d.src_addr, d.src_prot);
+		kunmap_atomic(d.src_addr);
 	if (d.dst_addr)
-		ttm_kunmap_atomic_prot(d.dst_addr, d.dst_prot);
+		kunmap_atomic(d.dst_addr);
 
 	return ret;
 }
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 0a9d042e075a..de1ccdcd5703 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -668,10 +668,6 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
 int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
 		struct ttm_bo_device *bdev);
 
-void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot);
-
-void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot);
-
 /**
  * ttm_bo_io
  *
-- 
2.25.1

