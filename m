Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0BD8E056
	for <lists+linux-mips@lfdr.de>; Thu, 15 Aug 2019 00:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbfHNWHq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 18:07:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38954 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfHNWHp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Aug 2019 18:07:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so182002pfn.6;
        Wed, 14 Aug 2019 15:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fm+XMGdKo1qLDwMEPJoOd+67atBUmC1hzfZly9LEwV0=;
        b=sgPCxVPDpH9l2X4SPUlx10kZFVi9IyEGQZCYZYSp7q2+1HYZUvT2BP02kXdHCDxuQe
         ovLGoEDRejVtZkJFak27XXUav3OaPEikhGNchX4l2i6fwcPxTxbG+IuniEBAnuJs1Wnn
         vE3XrY4NLX8lQ0cXESW4Dhc9SO9SwnUyFax0vMAwqj1rzBIWXFt0FeSvTdRUc4l3NpvN
         jX3+ZqLSgrLGCWOssPanOkD0fstz6U6ag9S/JUBDg1jCWNYg1kaWU8QYMgT+SvMMzzb2
         dX82zkunQSsga8PbpkqwG1h5iYhdx/yxUvNXdd7H192iWYxzh/ZNrGhBHqmcDohBWF4H
         +wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fm+XMGdKo1qLDwMEPJoOd+67atBUmC1hzfZly9LEwV0=;
        b=liKKYHuldK7U5oJrugKPIGoNpHUf9SXW8xpPViEky0MmtONe2HXUfxK43LVbLMrubT
         kfF8QMyI9sCzAYkpWpeGFBqsBtKgjyRgELoSOoIO1RwNrcR8Q8CBo4Fof5L8OfkczG+U
         SuHSYCsfo7+RF/ocuvXdgrlaVfPw0UJ7itrZZKDvDfHxfhEkL4VHRDccRg7jQW5N0+yc
         8NRNfxdCH8Ug0DEB3KG/JEGCCWV3ja5kiDGNAk/5IU3HaaelszpsHwlb/afysX9un07r
         BIYCQRDGuQv28DTJlb25OAj9gJ77xXTmMlh55wjl5kvMo5z7hMKThNrK+sxFBiTKhBDX
         1cyg==
X-Gm-Message-State: APjAAAW9VrpmRKQLfUiWPPLfUf0dWSRO7OT4LvF1uC67qZXZdzeCtywG
        c9eF9CXoRxaV+s8rQLYSUkk=
X-Google-Smtp-Source: APXvYqxEANCpUtYQ+5OhPEAzs37rqT2wBBhN570Sw5KrEeNXbOBWwWt7Xo763dhxGWxso/PvNN7UjA==
X-Received: by 2002:a17:90a:eb05:: with SMTP id j5mr87119pjz.102.1565820464819;
        Wed, 14 Aug 2019 15:07:44 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id i9sm659836pgo.46.2019.08.14.15.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 15:07:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Christoph Hellwig <hch@lst.de>, Rob Clark <robdclark@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 2/6] mips: export arch_sync_dma_for_*()
Date:   Wed, 14 Aug 2019 14:59:57 -0700
Message-Id: <20190814220011.26934-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/mm/flush.c          |  2 ++
 arch/mips/mm/dma-noncoherent.c |  2 ++
 drivers/gpu/drm/drm_cache.c    | 20 +++++++++++++++++---
 include/drm/drm_cache.h        |  4 ++++
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
index dc19300309d2..f0eb6320c979 100644
--- a/arch/arm64/mm/flush.c
+++ b/arch/arm64/mm/flush.c
@@ -93,3 +93,5 @@ void arch_invalidate_pmem(void *addr, size_t size)
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
 #endif
+
+EXPORT_SYMBOL_GPL(__flush_dcache_area);
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index ed56c6fa7be2..bd5debe1b423 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -131,6 +131,7 @@ void arch_sync_dma_for_device(struct device *dev, phys_addr_t paddr,
 {
 	dma_sync_phys(paddr, size, dir);
 }
+EXPORT_SYMBOL_GPL(arch_sync_dma_for_device);
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
 void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
@@ -139,6 +140,7 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
 	if (cpu_needs_post_dma_flush(dev))
 		dma_sync_phys(paddr, size, dir);
 }
+EXPORT_SYMBOL_GPL(arch_sync_dma_for_cpu);
 #endif
 
 void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 3bd76e918b5d..90105c637797 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -69,6 +69,14 @@ static void drm_cache_flush_clflush(struct page *pages[],
 }
 #endif
 
+#if defined(__powerpc__)
+static void __flush_dcache_area(void *addr, size_t len)
+{
+	flush_dcache_range((unsigned long)addr,
+			   (unsigned long)addr + PAGE_SIZE);
+}
+#endif
+
 /**
  * drm_clflush_pages - Flush dcache lines of a set of pages.
  * @pages: List of pages to be flushed.
@@ -90,7 +98,7 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
 
-#elif defined(__powerpc__)
+#elif defined(__powerpc__) || defined(CONFIG_ARM64)
 	unsigned long i;
 	for (i = 0; i < num_pages; i++) {
 		struct page *page = pages[i];
@@ -100,8 +108,7 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
 			continue;
 
 		page_virtual = kmap_atomic(page);
-		flush_dcache_range((unsigned long)page_virtual,
-				   (unsigned long)page_virtual + PAGE_SIZE);
+		__flush_dcache_area(page_virtual, PAGE_SIZE);
 		kunmap_atomic(page_virtual);
 	}
 #else
@@ -135,6 +142,13 @@ drm_clflush_sg(struct sg_table *st)
 
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
+#elif defined(CONFIG_ARM64)
+	struct sg_page_iter sg_iter;
+
+	for_each_sg_page(st->sgl, &sg_iter, st->nents, 0) {
+		struct page *p = sg_page_iter_page(&sg_iter);
+		drm_clflush_pages(&p, 1);
+	}
 #else
 	pr_err("Architecture has no drm_cache.c support\n");
 	WARN_ON_ONCE(1);
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index 987ff16b9420..f94e7bd3eca4 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -40,6 +40,10 @@ void drm_clflush_sg(struct sg_table *st);
 void drm_clflush_virt_range(void *addr, unsigned long length);
 bool drm_need_swiotlb(int dma_bits);
 
+#if defined(CONFIG_X86) || defined(__powerpc__) || defined(CONFIG_ARM64)
+#define HAS_DRM_CACHE 1
+#endif
+
 
 static inline bool drm_arch_can_wc_memory(void)
 {
-- 
2.21.0

