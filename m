Return-Path: <linux-mips+bounces-5850-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBD997E4C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2EF52868A5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84801BE23F;
	Thu, 10 Oct 2024 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tklXBa7x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4KV9SqG+"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47271BC073;
	Thu, 10 Oct 2024 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543729; cv=none; b=hkXl66OvYbWae57m6GUKRJ38JCHPNBafx386YHqsgKRSPlYhyPbhttBQ32J9xW6WGi3KrfrZHc81NLBDzi6iBJSbqcEQwkX/83URcInzsLkzRV9jDwKuAtE39A79GKXd9tbPxiyS43y+xTt7x2tnd2ueB8QGrnQ2rlKMdnO9hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543729; c=relaxed/simple;
	bh=dMMe+I6fcjh0GGIC72EgiCzXdt0VcHRiCFHYCaqC+kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzcXLvS0yV94vUuv22KbiKA8LaaQxxDeHeFXMOgwW7tHTaSNLclIeSo4wJRkXDxLS2Ml4tUmVOAl2as8mrm5KkjNONam5N1oPG3xArlWb+//ipk0E3GBxH+z4RgzLR9W1ufHVprgQnzLECyqBPBLeIpcUKOvYmEypnQMTCjIM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tklXBa7x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4KV9SqG+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	b=tklXBa7xWPl+94ERFSx5VYFVU6R2SM+ueh7GGooFNR6Mp7U7q+HRsvN4m5KNEiANvjBB32
	8bo3I3tg+ABsVYW3oWyHT48H0ysVjbAC4Xy51Sty7YUC9+/eOMfH7BDXI9d4wghh8FLABS
	YjH2GLE3On43Z3aBpofYG2nQUmPAdm6dup09L3ZaRfeJJI2OnA0Y54Lpl05YZpIUtWybL9
	+MTHCX3NKefTyQQXjbWoFEVVCVX0klqqcDGcmaITXKcLnmVvtf3nsXkMKn4SoQnNIKqBG5
	v9bnr3FOLLd/zj8gKdKRFHfjToA67jwOVYMa8bN5Vz2YWXJ5Q5uDbXUS2qKfrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	b=4KV9SqG+okf/1Ooh0DC9aya12Po7rP+0eNk/wrqju5ibqZTy9FUvHZqgGqiLHiD8XPBHt0
	Hn5PUudGn66tgQAw==
Date: Thu, 10 Oct 2024 09:01:12 +0200
Subject: [PATCH 10/28] x86/mm/mmap: Remove arch_vma_name()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-10-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dMMe+I6fcjh0GGIC72EgiCzXdt0VcHRiCFHYCaqC+kg=;
 b=m9t57qVudUvQD7qumicgQPp+/WUG5fIfqupzAy4yMaYthYPm9/oO8yU7qpoE5ULp19HrG7r/s
 +zUDjxBFvCqBxs4uey8HDMXMTjnS0wBto/zlOtGPRIl8B5vfTM+9eGR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This function does not contain any logic, delete it so the equivalent
weak definition from kernel/signal.c is used instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/mm/mmap.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/mm/mmap.c b/arch/x86/mm/mmap.c
index a2cabb1c81e1aec2fc82339c1092bf8b8167908a..b8a6ffffb4519cd77f6a540562ef6d3efa4e7b0f 100644
--- a/arch/x86/mm/mmap.c
+++ b/arch/x86/mm/mmap.c
@@ -163,11 +163,6 @@ unsigned long get_mmap_base(int is_legacy)
 	return is_legacy ? mm->mmap_legacy_base : mm->mmap_base;
 }
 
-const char *arch_vma_name(struct vm_area_struct *vma)
-{
-	return NULL;
-}
-
 /**
  * mmap_address_hint_valid - Validate the address hint of mmap
  * @addr:	Address hint

-- 
2.47.0


