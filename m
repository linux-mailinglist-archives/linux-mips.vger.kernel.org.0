Return-Path: <linux-mips+bounces-6923-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B559EA5CE
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1630718835D7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0702227566;
	Tue, 10 Dec 2024 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y85zQoAU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B8A22616F
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798512; cv=none; b=rWAUh+hOhYCzPYAClXzsfLx4JkReciFOnurVOfaZ589sOECbkb5PHs0BnR6jPf7nTd0TtXM6MK/O9xBRo0dSFV/rmZ+2x8MN3sRVI0iA8IHE0Qn+poaxgcVJrDE49ZGlmi0h7ibaMf20BkpCTBlpzMab8bDhPdc9cftjIJfweYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798512; c=relaxed/simple;
	bh=wKDyQX4GslZ76yIZ1mKeSISq1rhLsm9KK83vMGn6pEA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJj4xrVdFH+nFpd8llp7CdplvGNEoGadAzADyItosRAT0bonuj2CsFRjQtIrSuoJe32k3SjDO1FY5rrFj9NISP1DZbvizPLbm1uTlBk2WfYTncnI9CP2BFYGYPSEnQlxs2EO9OwBXqHDck7HHqTMYOyYdBjIX7/Wrueurqtjwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y85zQoAU; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so6425752a91.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798509; x=1734403309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=y85zQoAUIiox1InJnAKvMMfsbJt0aOZsDp4y+2tQwdffUfBLVUJl8PksbvLPteB2k9
         jcKhGKN0kkO2XAYb8e0QlgpNNff2kCXeBDLwa9za5ft+3jLOo6CYCMunP/jQ7nA3jvyV
         /iT4YXpkXtHdkB39svjFy+boNxe2ypHh0f3EfoGuV0jpLJ4pxTCwZg9LM7ibn9lHAEli
         PDwQApFZimNKVnHAQ8KIi3iZgxXbd4pYlmrdxPCQEsJ+qwxF4OQZyOk3O/qtpTQMJrOr
         P+jvpBZox40v3TkUaoIPdH1VJ9G6yZIRDz4cfzSRnhp7SaVRwvGLsHS83/goi3t7HJQK
         Q3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798509; x=1734403309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=D8kwli2Qm83qUZ7sCj+WRneKZKP1FevgY2mn6+0Rmg98YBvDqRw07vQY6slZveoLYu
         E0gd4rBeHWqNfIdxx6HUwqI7Ema8qKXW/nGc2sxH3Xv2aI22g8FWSlQuF6igjoTZ6LFW
         b+W/uDB6bBY8NNvmxzGKf1AfQv7w/7m88ynHRobr8djxT4PHOwwzzJnJotDn4myAlbED
         31PBfAMQRR+h3T5erMnOUJBJVpEJ9mFDhQDrSDZYSGt7tJ5h7D2M4hq/xc6wG3Ki1PFJ
         wVtvoVFW2u5/C29lRz9ExhjfoErTSNQOCd0ihQCY3kAkIbCpBxcUNDNPVbg/Y8DaoZLW
         oSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMwk7csgOc4ZIZdMaPKORt8UbciKDMppfPOJep5ZmQq2iTxMOstaur1MEJg5QXlwEy95Qc1eOHssOg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NR7M52ZBFmFYm8QlWzmPPBCQQ2ArhrHSAaSBk+nahPM+IvPV
	bdw/QLbBiPvhzdWXrPHFpH/wDFDKKRWMILs16fKR/yqierqPxH3SLAUxmuzpBua3ELevHUWz3Bc
	u2OtyKXVyzYCLp/Tq3uPsFw==
X-Google-Smtp-Source: AGHT+IEWnrN6kZ7CMoj0XPEY5LyEzTzu31G9SE2ukZ22eBNhBZBZVrxzEpEONDIVdXz8wv9Xu2tYcLSnTTgrFqyRgw==
X-Received: from pjbsq5.prod.google.com ([2002:a17:90b:5305:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2544:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2ef6a6c11b1mr19145935a91.22.1733798508962;
 Mon, 09 Dec 2024 18:41:48 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:16 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 14/17] mm: xtensa: Introduce arch_mmap_hint()
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

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/xtensa/include/asm/pgtable.h |  1 +
 arch/xtensa/kernel/syscall.c      | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1647a7cc3fbf..31b7da0805ec 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -425,5 +425,6 @@ void update_mmu_tlb_range(struct vm_area_struct *vma,
  * SHM area cache aliasing for userland.
  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _XTENSA_PGTABLE_H */
diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..353cce1ac9f1 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,6 +54,24 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE)
+		return 0;
+
+	if (flags & MAP_SHARED)
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
@@ -73,8 +91,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 	if (len > TASK_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
 
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
-- 
2.47.0.338.g60cca15819-goog


