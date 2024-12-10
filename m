Return-Path: <linux-mips+bounces-6915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A879EA585
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96D811694F7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4158B1D7994;
	Tue, 10 Dec 2024 02:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XEyyBpSy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EA1A3020
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798498; cv=none; b=TCup32oCc1TM2BFotGeVgpA1wzxNE9lCzft9+wD4JdPPVUnXo/AZBU4me6U/+vz5OF/MM088svAEd3XUT8APuNodsz7n/9J7cHuK6RlBGhiWxG3LJ2uY44J89WPXdWiV74FEioc473IS5rFJcnAbz7W5lWioISWZ0tU+vs8cCAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798498; c=relaxed/simple;
	bh=AS+vZpJpCSDy0bq9wgoCdVRRzUEUY/Kb0H8feia1C7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NrPc+lJV+MwYBjgDpHVUKlfZ8sZTcM6CLjmGRf/0wtx4I5SOJukCRzvN0yrSkJ8AfVG4FO78ZGm9IvLoT1L4S1wmLbwxdaOWy+xySPcEaBhLoY1yypEJfbObwMmF/1cWdgLA6xpi92NphCXXOn7/rfQ/dwhI6Pbj1oqxw4TMm/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XEyyBpSy; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-5f2b05e037dso1562980eaf.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798494; x=1734403294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
        b=XEyyBpSyUqYUUE3KrenB4BevDH3I8nRVBVVU5u3rHKnJOtPrPs2jmbcoVcfNY2FQxp
         9SBd5YpFXGZGLSxE736vanXSurno8933Ls4CBIpBmKlj0kyxq7v8GigoRHwiB7kHjJhW
         GGprp50TPTIKo+00wiMbzShBcVk6u6QiV9leo3P7jy5B4vv3mraRn9ej6bAa9wJ0ngNa
         21ioHSDgMAETK1QZkJ8AJM8VwCIMW9qJkU31GOC0YqLV4sz4Wm8AsfMF+1vTvzLrq1VP
         wi2nbKi/ambLx/1jrdpDJvtdBBCWP6z9i//zgKhqzRslUlbEi5ai9yRldNoCEo2/xY8i
         xtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798494; x=1734403294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
        b=CzPPw9znQysvrmoyoUd1IdwHcD/EfgWc1/x96b3ueC+mRfuRs7pOeoZB+EzBFVBgLM
         sCB30A3HezWK4CuPBlvtBxn1pvUp00G1fLAIiePYWO5muxDqnKR772MDK6wBwTommmOB
         qJdbolLSIw+918P19OR/zr6WJFKA9bhBx7UyB6b3A6tS6JPpDTMDFi+nDRv74ao1ZktD
         5Dc1SePyAu3X5Iy58iEHbtag2b1mkgySGFVfnh26fX/jK78Uc9TPCMPlygNPs9Hoqhkn
         hH6TBCi6SA1SZ+4UAKTZVwyx9cQhKGd8ipBQJzj1vdxH1Tbp5glakCjfw7gjWhpslicz
         krCA==
X-Forwarded-Encrypted: i=1; AJvYcCVnRNdLhteiP4GTCeobK7gwa+1BTcEL92CfozIY2xm0J0Q9vLsp7mW6NpsJQpZagF8V48E646jZxf9/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+8RsTgwU8mo47C7rApVynYD8nFRctn4Owm0xlJunipSUFTPXJ
	DgpBn07FxByLuHtKrMeRNVW5RTIEc2pIku3KZOyXy1T9E81ez1Te4wMOmIiygEwwjpXWJ/ydTFy
	o6AxHaiIlbN1JhRdCUnrydg==
X-Google-Smtp-Source: AGHT+IGrVCmYvgbRZyJY6d84f+llUxgBN0sslSfR3tN174qad1011sAwn0+s/lhjeAWOT5E3i4gR4UE5Ru9TVnP2PA==
X-Received: from oabfu21.prod.google.com ([2002:a05:6870:5d95:b0:29d:c6f7:1bb2])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:5a9c:b0:29f:f4af:dc34 with SMTP id 586e51a60fabf-29ff4b0889emr667703fac.7.1733798494636;
 Mon, 09 Dec 2024 18:41:34 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:08 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-7-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 06/17] mm: csky: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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

Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
 arch/csky/abiv1/mmap.c                 | 38 ++++++++++++++++++--------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
index ae7a2f76dd42..c346a9fcb522 100644
--- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
+++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
@@ -51,5 +51,6 @@
 					((offset) << 10)})
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_CSKY_PGTABLE_BITS_H */
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 1047865e82a9..184921a73856 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -13,6 +13,29 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_align = 0;
+
+	if (!addr)
+		return 0;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = filp || (flags & MAP_SHARED);
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
@@ -27,7 +50,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	int do_align = 0;
 	struct vm_unmapped_area_info info = {
 		.length = len,
@@ -55,17 +77,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
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
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	return vm_unmapped_area(&info);
-- 
2.47.0.338.g60cca15819-goog


