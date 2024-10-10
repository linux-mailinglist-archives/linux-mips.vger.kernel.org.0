Return-Path: <linux-mips+bounces-5846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A6997E35
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59ED2868B9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64191BD020;
	Thu, 10 Oct 2024 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ndJGHPfL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MH2T81Ao"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0F1BBBC3;
	Thu, 10 Oct 2024 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543727; cv=none; b=WtrnbCZYsK7yPCPL9wcWEDaBCga9FLEqdC7PhXY3CpHgMMs7Xc3RQnDpxAwtYd45tcXJ/7lS/NOQzFTfD1MLxZaLf9j5iFzbPY59q5z/YYprm2iJNutnAlhX+zgVwIlmSHA2s1aWkeiqLFj7JrnQ/hWSZkkymv3PZh+h/lDOuwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543727; c=relaxed/simple;
	bh=WIPUW1+5c4OWUexEOYHAu/zDSui+TD1Rmwt6KNpKs/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJeVf91SJf7o0LnIA0iNBwxCN92GJqYqdMFB56FA5EgBnl3IzN3fhuYrEjYl5oViCV6HrTZQlQDkpVyXz8L6rUFG8TpaUWEI8bDj0NWtqKcnl8bAI+nvEtgpwWpNMhLg5OBN7DgACeG1xd+wBwfJtnOiN0WT8lCZorDcG3qRqww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ndJGHPfL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MH2T81Ao; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF1X3F6ARHGxF8oaxKdzOM4GysZzGmQKcnkswWuBTx0=;
	b=ndJGHPfLf2ExpAJ4MbxYj5J+P8wuFGPA7VYN9NrXrNAlUm/CGVxUrauYkG7TikMLhcJxcW
	iYwYdcNH5zfSrEBIy6lQMphOmnfJCE2iBKi76iPIHzw2lm67oIBLKMmGv4o6xsuENV3Myh
	ZMy30US0WZjW3qpAQMEbjjivpvqZ3CQcPPdqXQZq90KEIthe4wDpFw5ctRf6kBi/tz2cMk
	1RzXAnqR9sZVO/JiMKcJ/Qtv0ZKmrNnOsqgOQMvHaNQaERMQ0LRmxDFNnlG1ehHvcq5RqB
	di01YHTH1z+vMFEWL+Gj0vn08Yfy+H+PsfKAjPiZtv6I/8MsShEMUFQVU7F7Fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF1X3F6ARHGxF8oaxKdzOM4GysZzGmQKcnkswWuBTx0=;
	b=MH2T81AojO0jKuneSuCD3w8FdNX+OeGnOT9yCnWr3ROkgtmsAPXlTHrQQkIrlSnbh7IvlZ
	nzv+XX0BfnW2BKAQ==
Date: Thu, 10 Oct 2024 09:01:08 +0200
Subject: [PATCH 06/28] riscv: vdso: Use only one single vvar mapping
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-6-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=3820;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WIPUW1+5c4OWUexEOYHAu/zDSui+TD1Rmwt6KNpKs/A=;
 b=rP6ASr+p5qtSseOgybXaXYykoMDxYyz+tu1FXrx8Y3WZD4L2xbuIpAuT0PAHKcEkh9WZFigt/
 RdDK+Gfq3LhADBTLK1iLgcDK80l4VS/omBd9TTZ4wW4ybQLNN2a7Sud
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vvar mapping is the same for all processes. Use a single mapping to
simplify the logic and align it with the other architectures.

In addition this will enable the move of the vvar handling into generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/kernel/vdso.c | 52 ++++++++++++++++--------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 98315b98256df412d48479c0114b5a5b49a7b583..3ca3ae4277e187e790a8bf513a9e80d8b6290bb2 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -23,11 +23,6 @@ enum vvar_pages {
 	VVAR_NR_PAGES,
 };
 
-enum rv_vdso_map {
-	RV_VDSO_MAP_VVAR,
-	RV_VDSO_MAP_VDSO,
-};
-
 #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
 
 static union vdso_data_store vdso_data_store __page_aligned_data;
@@ -38,8 +33,6 @@ struct __vdso_info {
 	const char *vdso_code_start;
 	const char *vdso_code_end;
 	unsigned long vdso_pages;
-	/* Data Mapping */
-	struct vm_special_mapping *dm;
 	/* Code Mapping */
 	struct vm_special_mapping *cm;
 };
@@ -92,6 +85,8 @@ struct vdso_data *arch_get_vdso_data(void *vvar_page)
 	return (struct vdso_data *)(vvar_page);
 }
 
+static const struct vm_special_mapping rv_vvar_map;
+
 /*
  * The vvar mapping contains data for a specific time namespace, so when a task
  * changes namespace we must unmap its vvar data for the old namespace.
@@ -108,12 +103,8 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 	mmap_read_lock(mm);
 
 	for_each_vma(vmi, vma) {
-		if (vma_is_special_mapping(vma, vdso_info.dm))
-			zap_vma_pages(vma);
-#ifdef CONFIG_COMPAT
-		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
+		if (vma_is_special_mapping(vma, &rv_vvar_map))
 			zap_vma_pages(vma);
-#endif
 	}
 
 	mmap_read_unlock(mm);
@@ -155,43 +146,34 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
-static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
-	[RV_VDSO_MAP_VVAR] = {
-		.name   = "[vvar]",
-		.fault = vvar_fault,
-	},
-	[RV_VDSO_MAP_VDSO] = {
-		.name   = "[vdso]",
-		.mremap = vdso_mremap,
-	},
+static const struct vm_special_mapping rv_vvar_map = {
+	.name   = "[vvar]",
+	.fault = vvar_fault,
+};
+
+static struct vm_special_mapping rv_vdso_map __ro_after_init = {
+	.name   = "[vdso]",
+	.mremap = vdso_mremap,
 };
 
 static struct __vdso_info vdso_info __ro_after_init = {
 	.name = "vdso",
 	.vdso_code_start = vdso_start,
 	.vdso_code_end = vdso_end,
-	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
-	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
+	.cm = &rv_vdso_map,
 };
 
 #ifdef CONFIG_COMPAT
-static struct vm_special_mapping rv_compat_vdso_maps[] __ro_after_init = {
-	[RV_VDSO_MAP_VVAR] = {
-		.name   = "[vvar]",
-		.fault = vvar_fault,
-	},
-	[RV_VDSO_MAP_VDSO] = {
-		.name   = "[vdso]",
-		.mremap = vdso_mremap,
-	},
+static struct vm_special_mapping rv_compat_vdso_map __ro_after_init = {
+	.name   = "[vdso]",
+	.mremap = vdso_mremap,
 };
 
 static struct __vdso_info compat_vdso_info __ro_after_init = {
 	.name = "compat_vdso",
 	.vdso_code_start = compat_vdso_start,
 	.vdso_code_end = compat_vdso_end,
-	.dm = &rv_compat_vdso_maps[RV_VDSO_MAP_VVAR],
-	.cm = &rv_compat_vdso_maps[RV_VDSO_MAP_VDSO],
+	.cm = &rv_compat_vdso_map,
 };
 #endif
 
@@ -227,7 +209,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	}
 
 	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
-		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info->dm);
+		(VM_READ | VM_MAYREAD | VM_PFNMAP), &rv_vvar_map);
 	if (IS_ERR(ret))
 		goto up_fail;
 

-- 
2.47.0


