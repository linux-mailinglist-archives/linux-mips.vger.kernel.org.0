Return-Path: <linux-mips+bounces-6941-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0059EDB43
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 00:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D96928338F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 23:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4541F2C5B;
	Wed, 11 Dec 2024 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rXGBv9SZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533221F3D31
	for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 23:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959687; cv=none; b=rX/6tKCf1t32dnecWqzgq3ArFSH7vDPALSxvv/OjK6FdLbL7oRfo1s9ggC6aCjARqSC0vXYkOgbVss+ibwgwKSsZPZHqJNPRe2Z0JFCXdha8IEN+XTEbrLCXeTCm2NnBN/wX4jNMIfaM2/vM75/DZDVdEo2QRdRoYf5GgaOxp68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959687; c=relaxed/simple;
	bh=NnTieUYeUvmhWo3xd+MtJWfu2roMqPBYkKqsqJw1fGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e5cCov1VaA4CTrwE0GUSwK3uoZE3MCZAhuPnO1qN4ndYy3POImqh6QbX6+H2V/4bSU/9Dyvj5ErTLC9fETy99AJUTgG8u/7x5pfXgemLZhZ00GUtfc5SKUL6751xZ0E9ms/HFkxCWa6yEFcP94wAf7nbEGibxY08HH47i7Y7uio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rXGBv9SZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ea69eeb659so36264a12.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 15:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959684; x=1734564484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+2SZZ0hfvfE1wB/PVG8ptvYr9aJVJPmVtSy9l3KX7E=;
        b=rXGBv9SZtapIGtfe24AN94v/kOZFAoioIsO+8kvkc3RjHbXhCGvB4r502qBZEGs8r+
         5qKznIpTDG+zYZ1FPXFah0BpiNdyilokgPAXSy0Gn17IWZtygXZdlk4Rw6s7KTY6/EI3
         A0mmmIWdW4s8LE3Xb+WjUprYoC/BYtixOoxEOcytDYUb2Xd8IUbtshsZy/UyKphUZdMH
         ubRGjopdQxAh1ivaUSTMC4b1RUYAK546SkBOeDME53SEJeMu3cVo+AhsebzmafCU6RwY
         DwPbyrmZBD5tZPM+zoSRt8s1C2nzUiWlQLpiRi0jRFFU5H4G9BJozFUvntC3nUbgLS1S
         WtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959684; x=1734564484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+2SZZ0hfvfE1wB/PVG8ptvYr9aJVJPmVtSy9l3KX7E=;
        b=ny/eg1KHt+J+kIM5uLjcJCyDLmBbwAIHZyHi5rN25q4wyv4bl88EgnKQLBRy/eHZSS
         LcKP1tAjPEPFHPAxBmbO6v4Lygiev3r7mSLhuQtuRdD07IS55DBJ/qTfW3FFp5R6Yu7g
         6E5zfmwDnVaDVj5ESWgvnrIFBlcDy8eaJCFxygPNrycs4K0JpmAvj6EKqNOdB8DjJxHc
         2uDYpP5+Sk0NlsmsffdYoIP0xlhVnApzFbl9gtS5pIgLiTIGtVu3PIm7Lm8tMTAUIx5V
         VkposAbCDyInTZqH2xU2rqqonwThaKqZr9GJ7cKoXEaZ/zAwBV7oVX+uxxYItAA8SpuT
         /WLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGwlC5I509+HYfLlczRa0nc8XJJFs/5kKeT1nMSTFMzwXuEfo2jTkC2m5CDRpQTblt8z1QXJjMz+Y2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5mYJvFPMmNwbHcjy/qnm8j+hLW+Ucb4P3BS92j3S9Y6I2rF9z
	R7MSHMbPB/+rhRKLXUt/LPDonbt6v8qiqfycwNPAHwjIpPXqOBReRFrRuf7SFdAml0dAT4tiHW1
	nf9ZwyPWP7+8dLPcggt/HaQ==
X-Google-Smtp-Source: AGHT+IE/Z/5jS7mczW6P1buMx2K0ifA2tKb3E5Z4r/r+p5Ssl9msAfOzZLWtpmRsmVcD4OTpdOSyZZHLgcfY4EVEyg==
X-Received: from pfxa22.prod.google.com ([2002:a05:6a00:1d16:b0:725:db2d:370e])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:43ac:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e1ceb34d58mr1526584637.24.1733959683818;
 Wed, 11 Dec 2024 15:28:03 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:41 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-4-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 03/16] mm: arm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce arm arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/arm/include/asm/pgtable.h |   1 +
 arch/arm/mm/mmap.c             | 107 ++++++++++++++-------------------
 2 files changed, 46 insertions(+), 62 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..1433b3ff4caa 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -330,6 +330,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index 3dbb383c26d5..15e7e4348af7 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -17,6 +17,41 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	bool aliasing = cache_is_vipt_aliasing();
+	bool do_align;
+
+	/* requested length too big for entire address space */
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We enforce the MAP_FIXED case.
+	 */
+	if (flags & MAP_FIXED) {
+		if (aliasing && flags & MAP_SHARED &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = aliasing && (filp || (flags & MAP_SHARED));
+
+	if (do_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * We need to ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.  We need to ensure that
@@ -32,42 +67,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_align = 0;
-	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
+	bool aliasing = cache_is_vipt_aliasing();
+	bool do_align;
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	if (aliasing)
-		do_align = filp || (flags & MAP_SHARED);
-
-	/*
-	 * We enforce the MAP_FIXED case.
-	 */
-	if (flags & MAP_FIXED) {
-		if (aliasing && flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
 
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_align = aliasing && (filp || (flags & MAP_SHARED));
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -82,42 +90,17 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		        const unsigned long len, const unsigned long pgoff,
 		        const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	int do_align = 0;
-	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
+	bool aliasing = cache_is_vipt_aliasing();
+	bool do_align;
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	if (aliasing)
-		do_align = filp || (flags & MAP_SHARED);
-
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED) {
-		if (aliasing && flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
 
-	/* requesting a specific address */
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_align = aliasing && (filp || (flags & MAP_SHARED));
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


