Return-Path: <linux-mips+bounces-6922-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE49EA5C7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166132868B3
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6378922618B;
	Tue, 10 Dec 2024 02:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yOaji1it"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21B1A01C6
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798511; cv=none; b=ugHLGyraU8IiUANajzckMKoRDRhX6cpw+LTfDoAvP1CZioTbalXIvbVHiDHp9CkNcn+JC+r0fOGfr7G7YWOxRIADfIGLCKPu03A2fYoy/TJo6AOAnJvJjvCPv9M5jsr997BQ9LLmvfa18O+ZKfOkXObxIAUrQtkzc3vysynAPF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798511; c=relaxed/simple;
	bh=9RIOLAOXaPXefMFvMfOe6ryVti+XUuUv8cR1Zh/uMto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ug6447PunnCtB7WGOXr9JiQ8Ispv+68G4j8nL8fcY4lIIPYqQe7OQyDqytXi/mjDD4zEkGM6PVZ8cOR3VGTYL4Km06xvzu/na1tIamfHp33efqPbBP6AsAk0ELdnUM2k1G4Q3ApIIzUA6FioCcjs6FOznL+kkDKatoiG8CIyDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yOaji1it; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef79403c5eso4849961a91.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798507; x=1734403307; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=yOaji1itr44uEj+QneRZs0Ar4MwMCEXknBDAcTKLRD4uVEx528nVpmiBj9nrMH29KO
         MKXDusgiyp2F4XyLvEKPPKlNSf4tECweCAgTMKXGAUjELgiInUj89Oww9nNEo2EnwA+n
         dKjGLPV5xS9LPJ3+dJFMj8trywTarO1IeQI42W/gHUgc3R7BZy4qGDWo7K0dvOk5GIcw
         nx7BMyNh4dygstZJUyItT/e9m5Ga4j8wW99WPHAs3RS2vu0R7NAViuUeCVR0Izuq9/P6
         6Y7hb1A6W9QFynYBwuYDeOljG4LdmWHZLc7oXJjEX41YiMmA2wvND9S8otSI32z1M8+z
         GyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798507; x=1734403307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=EZSQ4dC3LGauErZmkQ7Hd0VuyGQuQ6db5AbtTSv9b+YJWW7XKV0jt5aG5wrVoQlh8b
         ZEfuqtWq/C4t/0+lWaUbFSnJFMOGTS2WMz79npCrYa0ZJi5aOuW6mMQcUzIpNE9V51L4
         ZkWXq+2TWUJFQAURTp44WDwkRLnpM2RqclW3Ynuu27aMIVuWakJYXAm0ZPinBq6owxtR
         dkp30TU+L4oN/m2PiH0scPqUyOvcjlGh7JbMn+NqeJWERUkP6BZl3FdBpRnzejc2mtR6
         Axb1A7PjQ/8lyUjbDHPmtmmLdJynh3CSzbhSYccbYNFrqg/rPVpjkeEztk4Bl3vWmVsw
         n7tg==
X-Forwarded-Encrypted: i=1; AJvYcCWz6NOqzTlA6C8CNDZmw7ac0FCdYJ+tIfGgE2uJxf2cs4vkj/8zpFvlyWCGMrnw4PZeKdfDMCbAuMz2@vger.kernel.org
X-Gm-Message-State: AOJu0YxqPUrdMIUXT5yKYpOnIjxnODoVwgb85hJDT1bwR8VRXrc9l2Es
	U/4etEOrTukU2l1I8B3f4oaL75/JLeEdKyW8zasVBnLHMlUjLzsz7f7WXltTZLwlcCs6rlHRW3U
	pSCvHAnSZ8U3Z7/f18UX1pA==
X-Google-Smtp-Source: AGHT+IEki7Ie5yO93OnRXKQVvZe4Tx9Zhtxszko37jcevo7YJZw67tf4QTtrn4drQ39DwCB2Qw8B/AwA/g2PTJdBkw==
X-Received: from pjg15.prod.google.com ([2002:a17:90b:3f4f:b0:2e0:915d:d594])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2efcf136579mr4227892a91.3.1733798507341;
 Mon, 09 Dec 2024 18:41:47 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:15 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
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

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 47 +++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..a782696e98e0 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,10 +98,39 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long task_size = TASK_SIZE;
+	bool file_hugepage = false;
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp && is_file_hugepages(filp))
+		file_hugepage = true;
+
+	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
+		do_color_align = 1;
+
+	if (test_thread_flag(TIF_32BIT))
+		task_size = STACK_TOP32;
+
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return 0;
+
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
 	unsigned long task_size = TASK_SIZE;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -129,17 +158,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
 		do_color_align = 1;
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
-- 
2.47.0.338.g60cca15819-goog


