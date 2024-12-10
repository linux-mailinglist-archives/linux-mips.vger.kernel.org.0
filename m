Return-Path: <linux-mips+bounces-6918-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34459EA5AB
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E116285172
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C255D1D86E6;
	Tue, 10 Dec 2024 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YYVmAjUs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8EA1D61AF
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798503; cv=none; b=tQcQVJz+lB5VyhEBMzQHG5RzpKSi4QMhqv/e/+lE5z7jkIq/SlS614/ipXUOKXBXJf7J77SZmoHH4pGrwcv+DFNuwBtwX9dkRfhPEEhEOBrmZWfBSJC/I3ZNj/5yc2GA7ZSH3TfkOeNS342F8Zkz2J/UcJT3aFvamka4jkIS6Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798503; c=relaxed/simple;
	bh=x11yuXmbCrxJN/SKml0faPrNTPCGHi95EhyjJ7yh0IM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GbDPr6txcmbYq/+23pUq6IuLOvEm7knXpQ0ceRq+E0X8OjZrUmHBJj6OVbMRzRnhFy7aJO04iM9aaPSoB1MrB5JdL9KC/pbnuLTOazam+sTtxRtEvTFuw2rHxOXGErR0DScOogm7Me3MCCbSAZ3x+lMuEu8D21qe3GjhfFbxDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YYVmAjUs; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efc3292021so1880891a91.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798500; x=1734403300; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf1Z0F5Ql7IvXQrLTKqKwAEdrn6ngNUpJrr6RniRFlg=;
        b=YYVmAjUs8L1yx9NlOhEkusVmufrUvriKy27uOHFEOzBkjDmD2jlnTS9iOegg3iPw64
         NxKZqR+Fh0ZgokRTZZLSuJ2BZLsMxwVRfO15WvDRtVr5iHw78eZ4XhLCtSRpxCLQC78s
         Vb72Er+lSW45tt3p0Uuop+K5WBcRq66O8cFymSFRxhOdoRenB1cwijMSiWtHRx2np5Ft
         RvTub8cuoqttmV+UrkxgCoZ/RLCRIUDWsFqjxkc9YUt1XArHD9urWBHPw8U6qyYeiGZf
         iKE97r+4q+LOwMP/seib8PY7UPE7jPnYmvrKK/9b7rTde7f7pqshfvbk33ZVzXMjKIpI
         3ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798500; x=1734403300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf1Z0F5Ql7IvXQrLTKqKwAEdrn6ngNUpJrr6RniRFlg=;
        b=rBEu8mKqe6i0mkJ/1VlQ7EhB8ty+JIGixioBVtS8tFGA4pyKEd10JK4WKEVTDUbfGp
         ait/8Fv3ithMJ3bS8leFI2TnNM6e0ng78vFd7GRlfY3b4UpOD7O6VieKIJ1DJCPeIAXN
         sT9rMEecT/T/fy8JON9u3Cs5E7IwWa+yLn6ymx4MBuCV9/UPZW00Tg1QWwy7D0t+TIk8
         fubsq3nmiD9nId+M1O8aBT33d/TK+XebpNFnaosfkcq26VrXibPk5fPftStYNSUwnbEQ
         Rpy5N6hI8qiXiXwTW63wXws2N/WlEosEYmN7wvFENXlbGjw9qRy/e3hke2ee/hL0NtZA
         +l/g==
X-Forwarded-Encrypted: i=1; AJvYcCXHR3xvzWA1/E31k8mbaJTWlSaT7AnuO06yG2d38rxGBC+8uEgxsm78xtjemBJUZwiwvo9z1Lo/WN7u@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFe979AHqiw0mN0qIrogRmC/DJY5/GVmt+ocAy4B015bOrkBv
	qAmiTmekvR5s08eA+DFpVzLAEImXC0TThYeKCTQGs4OGnuDSaDTQYk6JbcOPfMHu+2qntoNgYGx
	BHNit10sf/lPhQTMfKZg37A==
X-Google-Smtp-Source: AGHT+IHck+gUbecP/UklvDvIRj3mcbH15c15qNgDIstF76hslPLb9WiX1BCJU02h3ccJwRMDSBhkm2vIDcdP4/ivvw==
X-Received: from pjbpa5.prod.google.com ([2002:a17:90b:2645:b0:2ea:aa56:49c])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cc6:b0:2ee:8a5d:d520 with SMTP id 98e67ed59e1d1-2efcf29a264mr3977311a91.23.1733798500058;
 Mon, 09 Dec 2024 18:41:40 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:11 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-10-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 09/17] mm: parisc: Introduce arch_align_mmap_hint()
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

Introduce parisc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/parisc/include/asm/pgtable.h |  1 +
 arch/parisc/kernel/sys_parisc.c   | 37 ++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index babf65751e81..73987357c78e 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -505,6 +505,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f852fe274abe..8ab05b29c505 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -96,12 +96,32 @@ unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
 
 enum mmap_allocation_direction {UP, DOWN};
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long filp_pgoff = GET_FILP_PGOFF(filp);
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	unsigned long addr, unsigned long len, unsigned long pgoff,
 	unsigned long flags, enum mmap_allocation_direction dir)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	unsigned long filp_pgoff;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {
@@ -128,18 +148,9 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma_prev(mm, addr, &prev);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(filp_pgoff, pgoff);
-- 
2.47.0.338.g60cca15819-goog


