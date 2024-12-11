Return-Path: <linux-mips+bounces-6943-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF59EDB5E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 00:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3B11882B7D
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 23:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B4C1F63DD;
	Wed, 11 Dec 2024 23:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zh9/3tx6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02B1F4E4F
	for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 23:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959690; cv=none; b=NiIGpVUlf5fhYFrIZp+CAm+AybbuvEUFW/inQ6NuWdnmUo9GBSz+6GAEfgHbABTwcYutRWS8/XE2xAEuxbVrZ5el33oZeI8yezARK0ZBl1Gdm6Vl/mk2MEBTv1mjBy/lP0k8dpbI0veoSSNkAU4sh0XPk32RETz6yfjlfn8lSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959690; c=relaxed/simple;
	bh=yEE7Rr9UWrNi0Mgc9EzqgQ6AB6dGlFOT3/O0VBhmQmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZBNlmGZCRHnziyGIxnGXrLy7jwrUnO3YFbUWq4sM4e5PcqEVpiB31HVwM/FGjw7bhrnYiif0nzlQiiWOJl7nkuMbbRDXZisqyFF95xDPp4mXz8zvP7AJlj3I9LbLJkrp8UuavC4in8jkKcbAp9Yo22Qf882zwgPrxgiaV6m6y40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zh9/3tx6; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-728cd4fd607so26571b3a.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 15:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959687; x=1734564487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
        b=zh9/3tx6qxSxEgriTfA6WowuSH58ojYOnbHYF6HDH5eYi7S9sRJDAJu+7km5fTdnsN
         +6PawGCtYxr0fdIHPbXp4nSxhYctO+0KRXWHDmv+T7v3jqT0vTMmJB3vc0yuckSw0UyI
         yNSwogj5mgj+ybUQfVYso/eA9n/K4TNCXWhEpBJWBAkNbnl3mBBpWdftzLbb0Azo7NiE
         Y3T1Rzxo1FG/C8bzCcG/XXG/CEsGIkAZd+uJ4wnfTkZTvZXPi4v+3oSXgmtv8OqQrjSb
         jY2n9tnoddblux0iuZEmztMseVuR1m9qYSH5O7sE5M12WZMlmx8poDjXShE0fI8Jopa3
         qWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959687; x=1734564487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
        b=mmaaKvr98QV/DTorMTKPwapuTouL5rX3m6db4Wa0WMNI99Bijti9jk9BGkKOsAMLx9
         Kzap+wXHcMYQY9J7PQeR4jKS09AGepJBaemA7/vdor+cR3TChzngkA8za/tX9NV4tC5a
         QVlaYQUfz33UYzeyEx0MT/GZ3/nBNyaVzheSeyaPZFozjChE1HWk6P2Lk8ytuZ5bzZEl
         n/QEazjKMZQADSvOJSZxt7pcNyNEB0TxO6aO3Ee9LjyDSkpYsjvMD+JUBdp5eiq9mqwd
         1n9wTN1raVTe1rBy9c1HEBv4fH9/U2Gj9JhiOmfFDiaE8y5rVIEn5WoRHJMxtoZQ1AwF
         gazA==
X-Forwarded-Encrypted: i=1; AJvYcCU34yTh0QFEeo6UeKyv0Y+iLwC6+gpgPTzQfBR+V8GLf2yrD3kljJ3r4Zifi5nE39a6dyJWIpDCpIK9@vger.kernel.org
X-Gm-Message-State: AOJu0YxwnALaFGL4h4gGDcXui54e1C6a4hR71vf18AZDZN1k2tBPIZi0
	yScvIlCXbm56XbeMBQWslBmQJlDH+tC0SspNlsH3k81Uuly2FLijhrkaLbOP6YVHvrAEafBYCMY
	XJDc9lIYVCH1265AHD+5TiQ==
X-Google-Smtp-Source: AGHT+IE2HKYkuc89mtKU0bTUEVS1IdL7Se1Uvka0+Ku7HObHaGYamVyFYxuD0miLaBxiy9U265ART8wkxAXV/hrgFQ==
X-Received: from pgbct5.prod.google.com ([2002:a05:6a02:2105:b0:7fd:356a:ef35])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7288:b0:1e0:d848:9e83 with SMTP id adf61e73a8af0-1e1ceb1006dmr1536938637.25.1733959687513;
 Wed, 11 Dec 2024 15:28:07 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:43 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 05/16] mm: arc: Use generic_mmap_hint()
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

Introduce arc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/arc/include/asm/pgtable.h |  1 +
 arch/arc/mm/mmap.c             | 43 +++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 4cf45a99fd79..af3210ea4888 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -28,6 +28,7 @@ extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
 
 /* to cope with aliasing VIPT cache */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..df01d4d9964b 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -14,6 +14,26 @@
 
 #include <asm/cacheflush.h>
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We enforce the MAP_FIXED case.
+	 */
+	if (flags & MAP_FIXED) {
+		if (flags & MAP_SHARED &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * Ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.
@@ -27,30 +47,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
-	/*
-	 * We enforce the MAP_FIXED case.
-	 */
-	if (flags & MAP_FIXED) {
-		if (flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog


