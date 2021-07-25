Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3D83D4E88
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 18:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhGYPWf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jul 2021 11:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhGYPWd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jul 2021 11:22:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DAEC061757;
        Sun, 25 Jul 2021 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=QzFZiFA76Dj+mfAsU9w7hQaBbifRrxBFiEHzw9Wl6uU=; b=TTcWU3RfKo8rtmygJL3lMEso7F
        wsZsTJxcJmEUNjXR2VTOD9XUoixfN+cpT7OSqGNBf9nD4ssNq3Z6/v+uA+mypY7RFqr9sH364Bc9M
        5DMrTH50Ztb+CTl3JmhUGgISn/JBDstF8/M9/YR5+hJ37qk6u2f8WqEtQm03yQKkol1nssE9WqLJa
        cdK+6FpOXL06jbNVqulSBZWA0g0RpHFVT/zCIWdH2jJimh8eeGB8q4US+yYn7Oba9ivOIllHjTe+O
        MmHcDbbJvtcoJzuPuCB2tdHgvH1X2B3y1tXeqEn9bvk4ALLdr3G9llNIoNPxrrQ+E7+NBXxVN0kt1
        Dyi5AYcQ==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m7gaj-008oIU-Sz; Sun, 25 Jul 2021 16:03:01 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] mips: clean up kernel-doc in mm/c-octeon.c
Date:   Sun, 25 Jul 2021 09:02:58 -0700
Message-Id: <20210725160258.28950-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210725160258.28950-1-rdunlap@infradead.org>
References: <20210725160258.28950-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clean up kernel-doc warnings in arch/mips/mm/c-octeon.c.

   arch/mips/mm/c-octeon.c:34: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Octeon automatically flushes the dcache on tlb changes, so
   arch/mips/mm/c-octeon.c:65: warning: expecting prototype for Flush caches as necessary for all cores affected by a(). Prototype was for octeon_flush_icache_all_cores() instead
   arch/mips/mm/c-octeon.c:99: warning: expecting prototype for Called to flush the icache on all cores(). Prototype was for octeon_flush_icache_all() instead
   arch/mips/mm/c-octeon.c:111: warning: expecting prototype for Called to flush all memory associated with a memory(). Prototype was for octeon_flush_cache_mm() instead
   arch/mips/mm/c-octeon.c:124: warning: Function parameter or member 'start' not described in 'octeon_flush_icache_range'
   arch/mips/mm/c-octeon.c:124: warning: Function parameter or member 'end' not described in 'octeon_flush_icache_range'
   arch/mips/mm/c-octeon.c:124: warning: expecting prototype for Flush a range of kernel addresses out of the icache(). Prototype was for octeon_flush_icache_range() instead
   arch/mips/mm/c-octeon.c:138: warning: expecting prototype for Flush a range out of a vma(). Prototype was for octeon_flush_cache_range() instead
   arch/mips/mm/c-octeon.c:153: warning: expecting prototype for Flush a specific page of a vma(). Prototype was for octeon_flush_cache_page() instead
   arch/mips/mm/c-octeon.c:164: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Probe Octeon's caches
   arch/mips/mm/c-octeon.c:264: warning: expecting prototype for Setup the Octeon cache flush routines(). Prototype was for octeon_cache_init() instead
   arch/mips/mm/c-octeon.c:349: warning: expecting prototype for Called when the the exception is not recoverable(). Prototype was for cache_parity_error_octeon_non_recoverable() instead


Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/mm/c-octeon.c |   29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

--- linux-next-20210723.orig/arch/mips/mm/c-octeon.c
+++ linux-next-20210723/arch/mips/mm/c-octeon.c
@@ -30,7 +30,7 @@
 unsigned long long cache_err_dcache[NR_CPUS];
 EXPORT_SYMBOL_GPL(cache_err_dcache);
 
-/**
+/*
  * Octeon automatically flushes the dcache on tlb changes, so
  * from Linux's viewpoint it acts much like a physically
  * tagged cache. No flushing is needed
@@ -56,8 +56,8 @@ static void local_octeon_flush_icache_ra
 }
 
 /**
- * Flush caches as necessary for all cores affected by a
- * vma. If no vma is supplied, all cores are flushed.
+ * octeon_flush_icache_all_cores -  Flush caches as necessary for all cores
+ * affected by a vma. If no vma is supplied, all cores are flushed.
  *
  * @vma:    VMA to flush or NULL to flush all icaches.
  */
@@ -92,7 +92,7 @@ static void octeon_flush_icache_all_core
 }
 
 
-/**
+/*
  * Called to flush the icache on all cores
  */
 static void octeon_flush_icache_all(void)
@@ -102,8 +102,7 @@ static void octeon_flush_icache_all(void
 
 
 /**
- * Called to flush all memory associated with a memory
- * context.
+ * octeon_flush_cache_mm - flush all memory associated with a memory context.
  *
  * @mm:	    Memory context to flush
  */
@@ -116,7 +115,7 @@ static void octeon_flush_cache_mm(struct
 }
 
 
-/**
+/*
  * Flush a range of kernel addresses out of the icache
  *
  */
@@ -127,11 +126,11 @@ static void octeon_flush_icache_range(un
 
 
 /**
- * Flush a range out of a vma
+ * octeon_flush_cache_range - Flush a range out of a vma
  *
  * @vma:    VMA to flush
- * @start:
- * @end:
+ * @start:  beginning address for flush
+ * @end:    ending address for flush
  */
 static void octeon_flush_cache_range(struct vm_area_struct *vma,
 				     unsigned long start, unsigned long end)
@@ -142,11 +141,11 @@ static void octeon_flush_cache_range(str
 
 
 /**
- * Flush a specific page of a vma
+ * octeon_flush_cache_page - Flush a specific page of a vma
  *
  * @vma:    VMA to flush page for
  * @page:   Page to flush
- * @pfn:
+ * @pfn:    Page frame number
  */
 static void octeon_flush_cache_page(struct vm_area_struct *vma,
 				    unsigned long page, unsigned long pfn)
@@ -160,7 +159,7 @@ static void octeon_flush_kernel_vmap_ran
 	BUG();
 }
 
-/**
+/*
  * Probe Octeon's caches
  *
  */
@@ -256,7 +255,7 @@ static void  octeon_cache_error_setup(vo
 	set_handler(0x100, &except_vec2_octeon, 0x80);
 }
 
-/**
+/*
  * Setup the Octeon cache flush routines
  *
  */
@@ -341,7 +340,7 @@ asmlinkage void cache_parity_error_octeo
 	co_cache_error_call_notifiers(0);
 }
 
-/**
+/*
  * Called when the the exception is not recoverable
  */
 
