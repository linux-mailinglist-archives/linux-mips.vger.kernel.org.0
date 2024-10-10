Return-Path: <linux-mips+bounces-5844-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03D997E2F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC991F26F48
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D067A1BCA05;
	Thu, 10 Oct 2024 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2CGf23BN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z9xjFebF"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1B1BBBE4;
	Thu, 10 Oct 2024 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543726; cv=none; b=F4yHHhxNHjSzhIq63db64G4gJEoZy5RlSYu6wrBy0ki5CVRX0jlU4j9+YYjxzwITLgw84LHTvg+4czmks9Lf+/59TZIoSMIxXOTipFEtHpkQvx+vMt7uA56MdIVJDlj3Im3wYkAV3ztrbDqNhCs8LcsD460pE9wATCWzIXOba7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543726; c=relaxed/simple;
	bh=McuT3PV1z+ecfTcY5HznjYmkDmDvB3DrnPQkMu1bvMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Udavj/wWNzhwEjsmGTzT5iKYLQg32xymzgJ5W4vbpajIYDk0mnCOUmcW8TL8I/ZeGyZ4NT0peopSgiu8fYXZEx51peQEkHXkf3GwiNlBG4XIqCQz764xj8DFzuJcg5bXdybLSWQOwpGD6dSM4XPhapnkpPyhGcgI1bs5amDe/Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2CGf23BN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z9xjFebF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	b=2CGf23BNvNFJdIFtfq3Jk7/bwzZ4aXhFvROegxY4fJJB36JDgsE18kNRaEijAmAMiiCxmK
	eQvvxWbFtcAoiF2W79lRCOWS/6gFWvYTdFK7/B0zM2FdBe5sgcB/LiFcVKtqv1I+2KLRSq
	YU1Ol9Ym5KOHu2KpT6LMJaMD9tJdboqeJHHFuwcaD05pduHfSev2O7lZlopnOy1U1jBMv4
	F2vi0iTsyxYCmyYIyfSE0RLDcxovPSRlv3LYTm4WQVa7BZWlJhKFw8fuEos0QCLIKVVSep
	40MQvIMSD8f9DRglCCxM8/fF3GBXnDFMeJVVaXUCDPe6/PrdMhyArPYYDfwL/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	b=Z9xjFebFq2wfzwBV8oNyZ7m9J6Vsv2tFDo5RIG12I9R0zXEV+CJoDgq3VmUVNZQN+ywIKU
	ybEirSZPnsr9N7Aw==
Date: Thu, 10 Oct 2024 09:01:07 +0200
Subject: [PATCH 05/28] arm64: vdso: Use only one single vvar mapping
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=4025;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=McuT3PV1z+ecfTcY5HznjYmkDmDvB3DrnPQkMu1bvMM=;
 b=lZJKERtZbQL8jCMjE0FDHFg02zHvm1+oaQxV6iWrFxmfZKjIyt33vLy/dsbu8/SUCokzNZyxf
 rg00Lj1uac8CKkC68fjs8SBGsbKJKyxu8DOV7hWm7we2hjW88ahCdmi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vvar mapping is the same for all processes. Use a single mapping to
simplify the logic and align it with the other architectures.

In addition this will enable the move of the vvar handling into generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso.c | 43 +++++++++++++------------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 706c9c3a7a50a4574e77da296e9c83e1e2a9f5ab..2d7f8502953bbcf5c9d32f970d92fed71894b5a9 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -39,8 +39,6 @@ struct vdso_abi_info {
 	const char *vdso_code_start;
 	const char *vdso_code_end;
 	unsigned long vdso_pages;
-	/* Data Mapping */
-	struct vm_special_mapping *dm;
 	/* Code Mapping */
 	struct vm_special_mapping *cm;
 };
@@ -113,6 +111,8 @@ struct vdso_data *arch_get_vdso_data(void *vvar_page)
 	return (struct vdso_data *)(vvar_page);
 }
 
+static const struct vm_special_mapping vvar_map;
+
 /*
  * The vvar mapping contains data for a specific time namespace, so when a task
  * changes namespace we must unmap its vvar data for the old namespace.
@@ -129,12 +129,8 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 	mmap_read_lock(mm);
 
 	for_each_vma(vmi, vma) {
-		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA64].dm))
-			zap_vma_pages(vma);
-#ifdef CONFIG_COMPAT_VDSO
-		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA32].dm))
+		if (vma_is_special_mapping(vma, &vvar_map))
 			zap_vma_pages(vma);
-#endif
 	}
 
 	mmap_read_unlock(mm);
@@ -176,6 +172,11 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
+static const struct vm_special_mapping vvar_map = {
+	.name   = "[vvar]",
+	.fault = vvar_fault,
+};
+
 static int __setup_additional_pages(enum vdso_abi abi,
 				    struct mm_struct *mm,
 				    struct linux_binprm *bprm,
@@ -199,7 +200,7 @@ static int __setup_additional_pages(enum vdso_abi abi,
 
 	ret = _install_special_mapping(mm, vdso_base, VVAR_NR_PAGES * PAGE_SIZE,
 				       VM_READ|VM_MAYREAD|VM_PFNMAP,
-				       vdso_info[abi].dm);
+				       &vvar_map);
 	if (IS_ERR(ret))
 		goto up_fail;
 
@@ -229,7 +230,6 @@ static int __setup_additional_pages(enum vdso_abi abi,
 enum aarch32_map {
 	AA32_MAP_VECTORS, /* kuser helpers */
 	AA32_MAP_SIGPAGE,
-	AA32_MAP_VVAR,
 	AA32_MAP_VDSO,
 };
 
@@ -254,10 +254,6 @@ static struct vm_special_mapping aarch32_vdso_maps[] = {
 		.pages	= &aarch32_sig_page,
 		.mremap	= aarch32_sigpage_mremap,
 	},
-	[AA32_MAP_VVAR] = {
-		.name = "[vvar]",
-		.fault = vvar_fault,
-	},
 	[AA32_MAP_VDSO] = {
 		.name = "[vdso]",
 		.mremap = vdso_mremap,
@@ -307,7 +303,6 @@ static int __init __aarch32_alloc_vdso_pages(void)
 	if (!IS_ENABLED(CONFIG_COMPAT_VDSO))
 		return 0;
 
-	vdso_info[VDSO_ABI_AA32].dm = &aarch32_vdso_maps[AA32_MAP_VVAR];
 	vdso_info[VDSO_ABI_AA32].cm = &aarch32_vdso_maps[AA32_MAP_VDSO];
 
 	return __vdso_init(VDSO_ABI_AA32);
@@ -402,26 +397,14 @@ int aarch32_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 }
 #endif /* CONFIG_COMPAT */
 
-enum aarch64_map {
-	AA64_MAP_VVAR,
-	AA64_MAP_VDSO,
-};
-
-static struct vm_special_mapping aarch64_vdso_maps[] __ro_after_init = {
-	[AA64_MAP_VVAR] = {
-		.name	= "[vvar]",
-		.fault = vvar_fault,
-	},
-	[AA64_MAP_VDSO] = {
-		.name	= "[vdso]",
-		.mremap = vdso_mremap,
-	},
+static struct vm_special_mapping aarch64_vdso_map __ro_after_init = {
+	.name	= "[vdso]",
+	.mremap = vdso_mremap,
 };
 
 static int __init vdso_init(void)
 {
-	vdso_info[VDSO_ABI_AA64].dm = &aarch64_vdso_maps[AA64_MAP_VVAR];
-	vdso_info[VDSO_ABI_AA64].cm = &aarch64_vdso_maps[AA64_MAP_VDSO];
+	vdso_info[VDSO_ABI_AA64].cm = &aarch64_vdso_map;
 
 	return __vdso_init(VDSO_ABI_AA64);
 }

-- 
2.47.0


