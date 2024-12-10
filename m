Return-Path: <linux-mips+bounces-6920-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9F9EA5B6
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C6E28530A
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6001DDC2F;
	Tue, 10 Dec 2024 02:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q/kuIXz6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9A1DDC0F
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798507; cv=none; b=sE0MlvZlGli7uq6DjBtUPlA54BUCZRijNtsKFSOY96jSvZqhAJ3qQgPf20Er8+EU8XO4U+PDDz8WTfO2cxYpPka7jHmfesePQFyNLZWa7l4iX269W9XV+DJVZ6Qh/Fq+ztM/YaB7O/e6zSDgtt5z9eBoYViGw0ZRI0+SmyY8Tcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798507; c=relaxed/simple;
	bh=ywTAJIfLhhOWC1guj1Sw9xqYCRfd/ndCzXCmqX8LzRA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q8jECKYgAJpvQ48Jeg7h1vMJ9kFqgMr8somjYakATwFP3xtTQtQoE5RR3Kbel5x8/HXNAuZfcVaCeIMqyZsK7XMLXld2SKGB/g5cPnJ7wMX/XjzqlRyCoF2CLhzdfrU5bkOl6g/Bl86nhW16dLm+nktQYii1JhTIHw+GJLEwi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q/kuIXz6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so2691202a91.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798503; x=1734403303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1aDg6t/gxrjVFwoXlm7hf8uYmo33EMje8zgxFnq8ex8=;
        b=q/kuIXz6293aqrSp2ZHIA6tGs68PDbfSyjTaZyhSOrR4t1wfDbv9oNBDv0detqA9ex
         rQE20GXsxesvyi+nMfvLpmYqVUpJBueYFPz1aUgVu5/RcbgqLXchEbJWHsi+P9Fjws+A
         whV96d3vye2We1p/Fuw91FdnJxqqofX8g/a/XuteNF07beHZxJTsNA3XYBFIlDW8RGJ9
         YQkFH8fL9SS6o0zVefn5rk7sYkE9vsvTZOowCpfs1GjUWda60k8N7wRsRCO0HUB3t99P
         l5Jkhe+ljs1fQqhp7+n3bQTgQ+ErQeL/GfKfJip6NZuSZV/dlwISH5EAJTTDmq5FH2QA
         ji1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798503; x=1734403303;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1aDg6t/gxrjVFwoXlm7hf8uYmo33EMje8zgxFnq8ex8=;
        b=i1Ez8IlLBZNCqJQjC50GkCCERRXPpHwsJVFY9gKWdU/CqbqBLOfd/UWdk1VNAPkhYh
         oqBAPHut96ZKjbzLIcLO1509fraIg0RC5qKTUVgy4J7bmTt+fVtRlqPGtSGv2hei1sjG
         zlQk05goapTaMln/b1er0jpbbGtbs1cXtZxdJYMLlJZlX+SmztiA67y1tTEJE8aWWzZJ
         1YZw/EpcEyHVOH7TiDJgetwsPBghgbXVv7SULPbEuSVpYjOMSV75NZedjKn9hAzLJ/m3
         xcknAFG87Q3ozZPO7DPQTBInDJZ7PmwpxyBxlFogP8uygh1FQQiHT4mzme2G5HvP+sMb
         Sssg==
X-Forwarded-Encrypted: i=1; AJvYcCXkWOnVOzl7LpUTlYtYocMmRd/gflMRYO2aDng2ZtTuUzWwiqrCyQYUb3WUbpE1ZVqSNVOJ9E+Hr3oh@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbVuXQBfXEbdrzusMYzj9ydhzxgw3sjuIupAW+yqTh1Qg9FRn
	jRicjvqbRx0Z4JtIO1Uc5nhZUsCL2LXyMqZVCx8ZbZeKn+fuZ1fH1m6NAJ4Us/8GyAAJ/7aV6MP
	ElNnnMzu8zuajSj8wJmFGwg==
X-Google-Smtp-Source: AGHT+IH7F6srMqCW64XkYJ4oxpvOqe9MgKa694plvhzavfksbdoDji5OgmDgGGH75PkB/XQatr5z5MeghIRL5RnGbg==
X-Received: from pjbqc18.prod.google.com ([2002:a17:90b:2892:b0:2ee:4826:cae3])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:50:b0:2ee:c797:e27f with SMTP id 98e67ed59e1d1-2ef6ab296e5mr20079147a91.36.1733798503563;
 Mon, 09 Dec 2024 18:41:43 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:13 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-12-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 11/17] mm: sh: Introduce arch_mmap_hint()
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

Introduce sh arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sh/include/asm/pgtable.h |  1 +
 arch/sh/mm/mmap.c             | 48 +++++++++++++++++++----------------
 2 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 729f5c6225fb..072dbe038808 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -149,5 +149,6 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 /* arch/sh/mm/mmap.c */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_SH_PGTABLE_H */
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index c442734d9b0c..5c96055dd5f5 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -51,6 +51,26 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
 	return base + off;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	unsigned long len, unsigned long pgoff, unsigned long flags,
 	vm_flags_t vm_flags)
@@ -77,17 +97,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (filp || (flags & MAP_SHARED))
 		do_colour_align = 1;
 
-	if (addr) {
-		if (do_colour_align)
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
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -126,17 +138,9 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		do_colour_align = 1;
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_colour_align)
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
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


