Return-Path: <linux-mips+bounces-6921-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 005319EA5B9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B2A188BA4F
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33E3226160;
	Tue, 10 Dec 2024 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W9r8ZX0n"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103951D8E06
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798508; cv=none; b=fJQjgH0ai8jleG+W/+4B/1h75CTST7cuTvmh6E1PYiPngVNxrLNtjxTYcCHCj9oYxrJd3EZqoK8hs5Jqf1flf4B03W20trlTP9SP57CD1FxWN1kNGBt52TPCRY+gr2s7qgqQ/XKlzSONT5n1uNcTOvx7djTesma2Qru3bn/EEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798508; c=relaxed/simple;
	bh=R0cSn9KJwbsX+V2mZ7ohQbGUKA5C8mxvYsyv7+LaANE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GIc0koaHbISvZsMB1fBH5HuolxfXPcDNStk3N4fF96VtLuZZyv79bwnUM3SVhTiW8rjopIdRBSA7L+k3ZzRgqyImCUszJ5NmA3s1Bb0m6bjMxwrfo8yT/EeAn4E9gGbm2KRbKN6qX/DdrAUUiIJqlAde7nrLJU7km9HybpN5SWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W9r8ZX0n; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso3514213a91.2
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798505; x=1734403305; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BAtlrJSVyRPOsQk5wSikGaGR3zqoYCpGFeQDDyhzvw=;
        b=W9r8ZX0n/1uvoulO9H5J2y3cMcWOvzkNtmuMCDGcRSadp4LhH1I3loOV1UOpyZDOud
         2tVP1opMDrjX7dx3PxYNG1893kRu7DgRNHR59u2gSSZPE9Dd4ck0ahr81PO27zNoicAp
         TQLFv2ve9IvBT4NiBqM1LpZN49gKWvt8LvLUH5qbhmV71H4Rhpy7IuOddQEOEfHl+fvQ
         R+DR8E+wohbn+WLC85IoGwksCbv8VH1dgn+7LP0BrW8QLMqEqv+F/fdQ2eMe68sBbtnh
         gO6kSvm4Cwc30G+Wtv+x9frUuXKVKwWZ8ZpFgrXD5cOq5WY5Qv6YtZ4NxpIV4vBsj0l6
         xHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798505; x=1734403305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BAtlrJSVyRPOsQk5wSikGaGR3zqoYCpGFeQDDyhzvw=;
        b=KYoLuaJYiQePxTginv45uTMcoUV6ZmtCW9t9z2qiiF67cybdXi9Z8gjk15MWAY37Ni
         7BXdUXLBZOHiZodYIa2JTRhyz8uvmeVIG0r1y62c7DplLjMnISQfgMyEvDoQlHSzh+By
         VWzQsWlgKx9sxk6pbL9be1R1nQ1sblHvCJtZjrC05he1LaDccE/oWOYTkFjFp83LaSL5
         vLQm1CW3wEA4LaUq+13H8pxrYY2EYfuBU2Vve2XM9JM08lQcYyb45wbZV1554zPWDTwv
         2PafBjeoS+e8LbpujhVqeC79+qL54NOI87S7Y9LyJgJPL3+LdrAuu5a3j9eBLqy0JBoD
         +G9g==
X-Forwarded-Encrypted: i=1; AJvYcCUa1DP3NLB6yvI7R7+sZrNPWy+3xKnbVe2rO3sS5jBJp3RHhG/Hz/b4cKDM4zW/gRgvNqiczev+m/u/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxms6SAD0dlYbWnO9Dw4P+SlbI2t3HRCoy2D7SQKrFKx2JhMjpa
	IfkN3VCAucWs+1PjmFvr8+TMGPAaLkJa1y2ZCmD96HEoOzFtIEaTizue+oVUQH/wsfvyaitaxNz
	jozQwgXIw6wn9Q5GOlTNXVA==
X-Google-Smtp-Source: AGHT+IG3H2VSitmLlBO6Re0RjQMAvCNU6wOeSZb7FxqqgQkEm7xuddsNJr2NEUZE8SQmtflSqHbUwj9vfGvySeSwAw==
X-Received: from pjbnr3.prod.google.com ([2002:a17:90b:2403:b0:2ef:6fb0:55fb])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a06:b0:2ee:9a82:5a93 with SMTP id 98e67ed59e1d1-2efcf138437mr4485348a91.14.1733798505429;
 Mon, 09 Dec 2024 18:41:45 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:14 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-13-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 12/17] mm: sparc32: Introduce arch_mmap_hint()
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

Introduce sparc32 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sparc/include/asm/pgtable_32.h |  1 +
 arch/sparc/kernel/sys_sparc_32.c    | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..95084c4d0b01 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -437,6 +437,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd)	((pgtable_t)__pmd_page(pmd))
 
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index fb31bc0c5b48..2d5065ee1a94 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,6 +40,19 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE - PAGE_SIZE)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_unmapped_area_info info = {};
@@ -61,11 +74,13 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	/* See asm-sparc/uaccess.h */
 	if (len > TASK_SIZE - PAGE_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
-	info.low_limit = addr;
+	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
 	if (!file_hugepage) {
 		info.align_mask = (flags & MAP_SHARED) ?
-- 
2.47.0.338.g60cca15819-goog


