Return-Path: <linux-mips+bounces-5842-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03026997E21
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B317228687C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02361BBBF7;
	Thu, 10 Oct 2024 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C8zvqEjo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W7xf0VzJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4531B983E;
	Thu, 10 Oct 2024 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543724; cv=none; b=EpMt0qQAGF6xJsT7YLYfCaTcy7o4Gx6aX4LVy9yp9W9R5WwGc1/BPv6LqsNHDowvUTdWUMVfZFL3dWyvuuwucGjLQCvVyVuqLSRfn3fFLK7QyzKqkDDIei6ekCtUM6UbI9sUFL+chOH/HrXRw5eDqpSoeUEFYrimjKmhNlrxmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543724; c=relaxed/simple;
	bh=uTttyYxVmC9yRNmwzxocSlf0ZjyD8nT16PDerFELjlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBsUv7Kc6KiHyPp6iV2lfEOYM4GxZutbb6yM6j3sfNsq6K+9N0HPvggqi1neAyTmVjsfCcjn7X5VIh6lr584wfHQmRstNXgKhrxOP23U7zxB+QYq+vu7oJDW2e8HfDl2fALLG/AOU72slkhtjweRVHcG8y1uLm6dwxOV+AzgG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C8zvqEjo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W7xf0VzJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	b=C8zvqEjo7kb3/oHoz3hb2Om0uiUtYkl55IA9xwWdquAqygCrWODizYf4D6Rw7jAt2zVOuw
	n7OdnQnUgrc5pfjJNzC8YT11DgZ9fsFPnsueJ9GqEwL6Uv3bPMrgzEMM3rMIHS3Eh+NaO1
	ZEvhWra78hEda0HGQg1WZpdvR2Rw7ZGbVaWHYkFpAne47VwHgM7hKauWlVU7QH/0ke03uk
	eAC9PGrgijetGH32veinriyNtlvyjUprCUzGdLAb+F1DETCn4G0iL/b+IIcvg09SEIeVnP
	3SKWPVlgZzjTuXN2WypHhNvHFMn2f7io0CQaEph0qAZpR7XpDnLXrw/lcof30g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	b=W7xf0VzJWJPfLuV3guK71mDn+icBDuyZaH32+yBjMmN1PYalZOV/xzGWjl0tLIzAZUBcGH
	IdmG4ZQGtWVr/cAA==
Date: Thu, 10 Oct 2024 09:01:04 +0200
Subject: [PATCH 02/28] csky/vdso: Remove arch_vma_name()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-2-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=956;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=uTttyYxVmC9yRNmwzxocSlf0ZjyD8nT16PDerFELjlM=;
 b=WCeLreUXzlZ5+MKodzNN22RGiDxtcpRTA/LR4S/eEW4/gG78TAak0Hv5qP+iXIr4pQIw1CbRC
 NsfVsXwXTuzBlj98CEUA7UytkjzUZXv0jKFFlmkIBdO3GkDqiFYYz81
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All callers of arch_vma_name() also get the name via vm_ops, which for
these VMAs will use the name from 'struct vma_special_mapping'.
Therefore the custom implementation is unnecessary and can be removed in
favor of the default implementation from kernel/signal.c.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/csky/kernel/vdso.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/csky/kernel/vdso.c b/arch/csky/kernel/vdso.c
index 92ab8ac6a5960e30b660530ae9b10137d5872369..c54d019d66bcaf8ac4633067076679d83b67a8f8 100644
--- a/arch/csky/kernel/vdso.c
+++ b/arch/csky/kernel/vdso.c
@@ -82,10 +82,3 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	mmap_write_unlock(mm);
 	return ret;
 }
-
-const char *arch_vma_name(struct vm_area_struct *vma)
-{
-	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
-		return "[vdso]";
-	return NULL;
-}

-- 
2.47.0


