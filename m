Return-Path: <linux-mips+bounces-5335-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853596C4CA
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 19:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3551F26239
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 17:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6611E1320;
	Wed,  4 Sep 2024 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1QsO8bB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA11E00B6;
	Wed,  4 Sep 2024 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469449; cv=none; b=M8x8rZfCyO2NM3D+6Bjos+GkqNO0ACjEp3GixdWvncdnmNw9sEYqeeaSBUh7nCvuG381VfKq4u06Vas9cEsHazMNpzJD6s/PH1v0J2TclR9DVl3xAl/ZddX13yNZhCNrDEJaXdfFeCnMDKI2Kwo+LRppO6XT35XZ+qzq18SegGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469449; c=relaxed/simple;
	bh=68K3QvD0tkKZDAR0UpFpD5XCk8KfcxipD1vhxu8hMF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qX0KOXwK+RBRzH5d2QKIrajVSaXAFYJ/SD9RrxEG+memDIlr+V28bTX8cs+/VSe0Tu6MixcLgMPjGCX7QA/e0TXDG8QnsCQHaG/iOqKZb4Ia8ISZrSJHvm2ozdRU9qaoQyLy2Fei9gevqqFD/jtntl98YwUmxBgo0UPo98xKn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1QsO8bB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1404DC4CEC6;
	Wed,  4 Sep 2024 17:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469448;
	bh=68K3QvD0tkKZDAR0UpFpD5XCk8KfcxipD1vhxu8hMF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F1QsO8bBJsx0AmPMFiW+aZLLp30OJ6WLUYtazU9cKiD6dYSxRrM5367mxKhnrYiYR
	 85yB8fFfMOjKTBpSlO8MxTRyv/+24AMKHEZNs759hHseiBj/tQt8LtzNo3gCqV7zJC
	 uQh2rfX5CP6fSwpG+0wWFMriyE1+Q3TPMGbaKlm0vf/W8yTi6YtQEtz57I1nH30eGI
	 uk1925ANdluBVwDdwvc2Uf445CgIHw/GtnY5jubFmpPqI82baUpZ0luZINbPivJThF
	 /Qam2M175ofqQE8+/UGiTVrujbpbV7dCEBmi8Bo0pRE+eOwh3Yh5xEtK4CuLi+kg5V
	 YjDq5wP3d56DQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Sep 2024 17:58:00 +0100
Subject: [PATCH v2 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-2-a46b8b6dc0ed@kernel.org>
References: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
In-Reply-To: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=4205; i=broonie@kernel.org;
 h=from:subject:message-id; bh=68K3QvD0tkKZDAR0UpFpD5XCk8KfcxipD1vhxu8hMF4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLomVTv4ECj2BO6KAA82Rg2LfwONZpcDKcZ/rOe
 Hb8SxguJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS6AAKCRAk1otyXVSH0NQyB/
 9kxVcf9SZZ8gEenXIUM2v+Sc6WxUmySDKe8lr2m+hILlbK4d90FD7dZLYCCDeqEkNNrGh6dxpDiVEV
 hgDmQdrZolUYW4Y/p0jjVeCPzreQXwXMZ8W7N1D5N/l3wwkb+vqQ2RrrMKJvOtbhi0bp2xlKOK1YUk
 Xa2D8ExFcS60FeUbuVMhU7VgyzPwDG2vup548nR3kM6HbkaB9mUGdYgfOtvd53NRTyvp0fcvcw/+v1
 p7p/kh7y4x1kYmGXa2Fhb2LKN3b8Jefvr2v8QIwR+T8VtgPWj4GQAuO+p7ai3SjpR3X5Rsd6NwJmYS
 YFA9nPiuXiHzme8MHUHh0LCDrrUpLW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In preparation for using vm_flags to ensure guard pages for shadow stacks
supply them as an argument to generic_get_unmapped_area(). The only user
outside of the core code is the PowerPC book3s64 implementation which is
trivially wrapping the generic implementation in the radix_enabled() case.

No functional changes.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/powerpc/mm/book3s64/slice.c |  4 ++--
 include/linux/sched/mm.h         |  4 ++--
 mm/mmap.c                        | 10 ++++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index ada6bf896ef8..87307d0fc3b8 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -641,7 +641,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 				     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
-		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
 
 	return slice_get_unmapped_area(addr, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 0);
@@ -655,7 +655,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 					     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
-		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
+		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
 
 	return slice_get_unmapped_area(addr0, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 1);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index c4d34abc45d4..07bb8d4181d7 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -204,11 +204,11 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags);
+			  unsigned long flags, vm_flags_t vm_flags);
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags);
+				  unsigned long flags, vm_flags_t vm_flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
 					 struct rlimit *rlim_stack) {}
diff --git a/mm/mmap.c b/mm/mmap.c
index 7528146f886f..b06ba847c96e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1789,7 +1789,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags)
+			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
@@ -1823,7 +1823,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
-	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
+					 vm_flags);
 }
 #endif
 
@@ -1834,7 +1835,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags)
+				  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
@@ -1887,7 +1888,8 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			       unsigned long len, unsigned long pgoff,
 			       unsigned long flags, vm_flags_t vm_flags)
 {
-	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
+	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
+						 vm_flags);
 }
 #endif
 

-- 
2.39.2


