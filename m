Return-Path: <linux-mips+bounces-5860-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E619997EF5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88C91B22B30
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFB41C57AE;
	Thu, 10 Oct 2024 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dfHNwzfZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5fz5F7pM"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674021C4614;
	Thu, 10 Oct 2024 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543738; cv=none; b=gJqJCIQ+kwqqBA0UxepVOiHeyMh23s91asQ1+VFJ3lvSHgZhr9Y7uCmg1PpB+Gctaa/UpLrzFuW3YYIvoJDTdXbfSej8ppG3EvwAa1/qYmj44W8OlMYJQzfko37YqbeKNXv9U+S80+d85nqkHcK2VHtmiPUCkvG9wEMWXvsT9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543738; c=relaxed/simple;
	bh=gRRvvI2oPh5V+5P/IYqOWVTmWkjso7fYWZITtUxqLu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VphuVtgQy0dXJQkNfzT8Ox/2oNnH8whQO0uHAOy1o2IcT5jZg4WAVy4VsfZABQomA06V5P3zc+vcGhGz86kb8JlGHw28Oqza5ri0w0U8GIlkza3lNtUlmIck/6vl0MX/RsC/6/uIlTEpd1bt000ezIYAT6dq7MkeC5X4qpSKXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dfHNwzfZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5fz5F7pM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWpGJ7o3KR18vyRXXjR3vGxmLkWj8u/b/KDyTEtJJbs=;
	b=dfHNwzfZ9JdhRvnurfX56AVhsl6psHnQOPilMFSL0kyU9OH4xTWILi0TGamUkwKLewI7Cz
	aroQ25NQg0cNitoRSA9yMsuNR50NkkudAH9dLaaGk93LwfrYxad5vvyo1Co+MjKuBmImTf
	/RblM6V6o6K+7CZPcGnogioPIiPy6HQWZ70ZPbBhgzyD8LjDNr7LpXr7vLwkk3aHnhhu11
	jWZlCMqvGN9bSGwryK7IAsP7NmnYbcWFJuQnHzhThK5cnkIfEPuR+STyuL3iQdUNaektuJ
	8uon6v9UbEHuqe176ow42JQPo0VHV3VcP3GBWW6RO2jIh8Atc0ePI+eIuS0vKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWpGJ7o3KR18vyRXXjR3vGxmLkWj8u/b/KDyTEtJJbs=;
	b=5fz5F7pM0oJGQ2repBmoGu5Et5n9RmU7+VMIQwDyVocQ8WGPfoaEBM4hbBgPx/HQwaA9MS
	BZ3Pw1plmNqWt4Dg==
Date: Thu, 10 Oct 2024 09:01:22 +0200
Subject: [PATCH 20/28] x86: vdso: Split virtual clock pages into dedicated
 mapping
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-20-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=6276;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gRRvvI2oPh5V+5P/IYqOWVTmWkjso7fYWZITtUxqLu4=;
 b=f8/3sd1F7F8VHknpoqW4rDH5kLmels2RFR4dwHUdGUQ0nhHRGUe42fu0DBpdlwvK/1tjtdCMm
 fuyhhqK+hTLBqKzu4MPaxL7EKDpohZJ4Q0rMjMYl8weMUegFAAgxK4G
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic vdso data storage can not handle the special pvclock and
hvclock pages. Split them into their own mapping, so the other vdso
storage can be migrated to the generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 10 +++--
 arch/x86/entry/vdso/vma.c             | 70 ++++++++++++++++++++++++++---------
 arch/x86/include/asm/vdso/vsyscall.h  |  5 +++
 3 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index 9e602c0615243f8667498ac245c2aaf1b35dcd16..872947c1004c35c006f7508eac7dff251c286aeb 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -17,14 +17,16 @@ SECTIONS
 	 * segment.
 	 */
 
-	vvar_start = . - 4 * PAGE_SIZE;
+	vvar_start = . - __VVAR_PAGES * PAGE_SIZE;
 	vvar_page  = vvar_start;
 
 	vdso_rng_data = vvar_page + __VDSO_RND_DATA_OFFSET;
 
-	pvclock_page = vvar_start + PAGE_SIZE;
-	hvclock_page = vvar_start + 2 * PAGE_SIZE;
-	timens_page  = vvar_start + 3 * PAGE_SIZE;
+	timens_page  = vvar_start + PAGE_SIZE;
+
+	vclock_pages = vvar_start + VDSO_NR_VCLOCK_PAGES * PAGE_SIZE;
+	pvclock_page = vclock_pages + VDSO_PAGE_PVCLOCK_OFFSET * PAGE_SIZE;
+	hvclock_page = vclock_pages + VDSO_PAGE_HVCLOCK_OFFSET * PAGE_SIZE;
 
 	. = SIZEOF_HEADERS;
 
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 5731dc35d1d2c0b81c37adf133fc6fa35c41cba1..7e5921adeed0004cba04d59caff280c082ab392e 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -24,6 +24,7 @@
 #include <asm/page.h>
 #include <asm/desc.h>
 #include <asm/cpufeature.h>
+#include <asm/vdso/vsyscall.h>
 #include <clocksource/hyperv_timer.h>
 
 struct vdso_data *arch_get_vdso_data(void *vvar_page)
@@ -175,19 +176,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 		}
 
 		return vmf_insert_pfn(vma, vmf->address, pfn);
-	} else if (sym_offset == image->sym_pvclock_page) {
-		struct pvclock_vsyscall_time_info *pvti =
-			pvclock_get_pvti_cpu0_va();
-		if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK)) {
-			return vmf_insert_pfn_prot(vma, vmf->address,
-					__pa(pvti) >> PAGE_SHIFT,
-					pgprot_decrypted(vma->vm_page_prot));
-		}
-	} else if (sym_offset == image->sym_hvclock_page) {
-		pfn = hv_get_tsc_pfn();
 
-		if (pfn && vclock_was_used(VDSO_CLOCKMODE_HVCLOCK))
-			return vmf_insert_pfn(vma, vmf->address, pfn);
 	} else if (sym_offset == image->sym_timens_page) {
 		struct page *timens_page = find_timens_vvar_page(vma);
 
@@ -201,6 +190,33 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return VM_FAULT_SIGBUS;
 }
 
+static vm_fault_t vvar_vclock_fault(const struct vm_special_mapping *sm,
+				    struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	switch (vmf->pgoff) {
+#ifdef CONFIG_PARAVIRT_CLOCK
+	case VDSO_PAGE_PVCLOCK_OFFSET:
+		struct pvclock_vsyscall_time_info *pvti =
+			pvclock_get_pvti_cpu0_va();
+		if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
+			return vmf_insert_pfn_prot(vma, vmf->address,
+					__pa(pvti) >> PAGE_SHIFT,
+					pgprot_decrypted(vma->vm_page_prot));
+		break;
+#endif /* CONFIG_PARAVIRT_CLOCK */
+#ifdef CONFIG_HYPERV_TIMER
+	case VDSO_PAGE_HVCLOCK_OFFSET:
+		unsigned long pfn = hv_get_tsc_pfn();
+
+		if (pfn && vclock_was_used(VDSO_CLOCKMODE_HVCLOCK))
+			return vmf_insert_pfn(vma, vmf->address, pfn);
+		break;
+#endif /* CONFIG_HYPERV_TIMER */
+	}
+
+	return VM_FAULT_SIGBUS;
+}
+
 static const struct vm_special_mapping vdso_mapping = {
 	.name = "[vdso]",
 	.fault = vdso_fault,
@@ -210,6 +226,10 @@ static const struct vm_special_mapping vvar_mapping = {
 	.name = "[vvar]",
 	.fault = vvar_fault,
 };
+static const struct vm_special_mapping vvar_vclock_mapping = {
+	.name = "[vvar_vclock]",
+	.fault = vvar_vclock_fault,
+};
 
 /*
  * Add vdso and vvar mappings to current process.
@@ -252,7 +272,7 @@ static int map_vdso(const struct vdso_image *image, unsigned long addr)
 
 	vma = _install_special_mapping(mm,
 				       addr,
-				       -image->sym_vvar_start,
+				       (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE,
 				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
 				       VM_PFNMAP,
 				       &vvar_mapping);
@@ -260,11 +280,26 @@ static int map_vdso(const struct vdso_image *image, unsigned long addr)
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		do_munmap(mm, text_start, image->size, NULL);
-	} else {
-		current->mm->context.vdso = (void __user *)text_start;
-		current->mm->context.vdso_image = image;
+		goto up_fail;
 	}
 
+	vma = _install_special_mapping(mm,
+				       addr + (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE,
+				       VDSO_NR_VCLOCK_PAGES * PAGE_SIZE,
+				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
+				       VM_PFNMAP,
+				       &vvar_vclock_mapping);
+
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		do_munmap(mm, text_start, image->size, NULL);
+		do_munmap(mm, addr, image->size, NULL);
+		goto up_fail;
+	}
+
+	current->mm->context.vdso = (void __user *)text_start;
+	current->mm->context.vdso_image = image;
+
 up_fail:
 	mmap_write_unlock(mm);
 	return ret;
@@ -286,7 +321,8 @@ int map_vdso_once(const struct vdso_image *image, unsigned long addr)
 	 */
 	for_each_vma(vmi, vma) {
 		if (vma_is_special_mapping(vma, &vdso_mapping) ||
-				vma_is_special_mapping(vma, &vvar_mapping)) {
+				vma_is_special_mapping(vma, &vvar_mapping) ||
+				vma_is_special_mapping(vma, &vvar_vclock_mapping)) {
 			mmap_write_unlock(mm);
 			return -EEXIST;
 		}
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 6e210e05f9f323e3e9ceca8a04d5f21fb6d04781..0fcaaa421c5ae87939b040d9f325327cc3e5ceea 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -3,6 +3,11 @@
 #define __ASM_VDSO_VSYSCALL_H
 
 #define __VDSO_RND_DATA_OFFSET  640
+#define __VVAR_PAGES	4
+
+#define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_PAGE_PVCLOCK_OFFSET	0
+#define VDSO_PAGE_HVCLOCK_OFFSET	1
 
 #ifndef __ASSEMBLY__
 

-- 
2.47.0


