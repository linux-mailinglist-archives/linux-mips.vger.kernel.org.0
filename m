Return-Path: <linux-mips+bounces-5862-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72F997EFD
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A416B227D9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE70C1C6F5E;
	Thu, 10 Oct 2024 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VUkjSFBk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d3/0sfbJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983E1C57A9;
	Thu, 10 Oct 2024 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543739; cv=none; b=e7r10ZyRb3kzFU4nHff+xXwbQ9vTd+9+ABUzVSf2UyEmT5RzgNoofAhnjz0Fx/8Cl2/L1CRb24rbzeJgI0w9J99MlKDiUnTmHU2s0Vzn/+d0Yufx+ImUIRu0bEf34NKBhnkbiWURKpTdYgc20UFTQ8PBdv48XNom5R45Ay32vyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543739; c=relaxed/simple;
	bh=ILVVV4C4Cn6a/ycb+VwQKK6Cv18zEgAwyS7MEYqbXP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqGMAxO0jg6fr+8kW+VBeDlwr9SOApWpvLkM4rQG4BUUT3SoL+WtvbU9Swu5xdGybt35TTe/Q5C32VtfkLLcJjffnRd/Rki3DL1qbBZKgctrOh02MRSRKVy3tQor1Sy/fyVMfZrXOsWiuMxei2baY94GbDDSAr0hFKYNH9d1yVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VUkjSFBk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d3/0sfbJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	b=VUkjSFBk2MQwzN+ejztrVxQKhRHQ+9Yl/6wxSFJwKQcH9II+0ehbH0LPd0MM6vQoZ/HDO3
	AQEr2gejOYAR2XAGB/sSNVekevUe6V1wcGFw/QL+DLmC9N99X8j5fyvXaPipiVRRc5Yf4O
	2pSZstOJBdCblxxzLGpOQ4jtJFNtb0KRN+2tpga3h86cWvTE6FK95XshBy3V5sBp1pQfAw
	lD8vKj8R6WKLzfjFUkxp6JxMmVY9z2fhJ2R8eY9/ZtCjHbSjayyacu2J3HORJcdf18+jz4
	VXyUxfxScOWvjlPDHn6Gwvam4Q+L7qGpCm+XbyjKpJEpwm1H+HJi1H8JSzzFgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	b=d3/0sfbJfcCoywGbj+ofl3ZPzDeWOe3+X1t86Ir5PG/WJxdDRPOcIBAdlleGtqmDvX4E/l
	LIXafBtIM6E7x2CA==
Date: Thu, 10 Oct 2024 09:01:24 +0200
Subject: [PATCH 22/28] powerpc: procfs: Propagate error of
 remap_pfn_range()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-22-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1079;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ILVVV4C4Cn6a/ycb+VwQKK6Cv18zEgAwyS7MEYqbXP8=;
 b=rFDW1DuF1EN9zH9ReKWGHDOnqsiH+sp/YP1SF/BKn15kPFCLbQRqr8F1aO3GxLRfzj/ugXTr9
 m+/fZDMJUB6DZ3liFKdAy994YFnGHbTZc+LlsXSeuQdIxLarPfK3zOJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

If the operation fails and userspace is unaware it will access unmapped
memory, crashing the process.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/kernel/proc_powerpc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index b109cd7b5d01fbe6870b60e60965effa86ecf3b6..910d2082e05fd86bd1146815d4b67633a6f2b459 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -33,10 +33,9 @@ static int page_map_mmap( struct file *file, struct vm_area_struct *vma )
 	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE)
 		return -EINVAL;
 
-	remap_pfn_range(vma, vma->vm_start,
-			__pa(pde_data(file_inode(file))) >> PAGE_SHIFT,
-			PAGE_SIZE, vma->vm_page_prot);
-	return 0;
+	return remap_pfn_range(vma, vma->vm_start,
+			       __pa(pde_data(file_inode(file))) >> PAGE_SHIFT,
+			       PAGE_SIZE, vma->vm_page_prot);
 }
 
 static const struct proc_ops page_map_proc_ops = {

-- 
2.47.0


