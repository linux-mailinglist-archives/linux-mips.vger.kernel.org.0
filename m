Return-Path: <linux-mips+bounces-5851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEAA997E55
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B13741F279FA
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548C1BF300;
	Thu, 10 Oct 2024 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DlOxxwET";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/5YBI8zM"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816221BCA1B;
	Thu, 10 Oct 2024 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543730; cv=none; b=EQCpo+GxqoD9ulJTSiNoBTdd4IWA2g3Uj++QbsVZtQDPt9WT5QSEysYgC6jdBd9xwE8CC61JEKSYh6ZQzSQL4mBZ+ZlnS1/13g90MRXvYSU/LmChbrCMncKPzK39CqUA3Wt3szxBa6agr+kLsNyR/5YIqIephijJLZVFpsY/XfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543730; c=relaxed/simple;
	bh=l5D8fVN3aaA8131sEeFVg9vgV5lu/zKv8tftufGa+9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESBpNK1kNeG7oHKiNelpH0S/tS051t4Tyed7px1C8BN6FrVbtn7jQf9N9zlj0hjLBONA2z4j1ffHQvl6pf72LuDNBb7twjsxo7rY4DWlIoFY43weqMbTAv8RH8fqcZXWGAF4akTJHLhDxrN6FTp9a6Tp2RPc5be06IWwK2PpN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DlOxxwET; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/5YBI8zM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	b=DlOxxwETZAxA9RhV/JznUypAblffACAwmhmbzWihKTz6AoOeLhwRnA1ukaJoAnRtozKk26
	DlbvYyplIjBFkbxJypcleV9ML9vwxUDVv/g+9gCL9qmBbsFnAi0SfOMKflBkLNFsATVS40
	BR0/LBnPUS+8jbGZlbJZq16s2s1+l2ZsznjzDOB5pvzlWqP3mgUeBOEadfANZHOKL6B1JT
	C8ZBNqILWkhCxqxwPwivhO0T8fVwHmMeEsMW7j7YRAniTcVCr9Kss3aGKxedaEpObq32hP
	y/Xw7Y7vnw7KWQiNy1c11xFD2KpQzMkoXx5vzuV7pYNCXdw/FGHyFM7vLSDrzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	b=/5YBI8zMSmdgRX+tzQmAYFuw+rKVOSXC6dss2zODxuOwAxU8/niqmHv7dePR8JKJCXe+bE
	3l94qY6mRiWTU/BA==
Date: Thu, 10 Oct 2024 09:01:13 +0200
Subject: [PATCH 11/28] x86: vdso: Use __arch_get_vdso_data() to access vdso
 data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-11-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1197;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=l5D8fVN3aaA8131sEeFVg9vgV5lu/zKv8tftufGa+9s=;
 b=yMtNmStMkDOKrNizRAIE2blEjN7roFN5utdJ25lrGaymlV+mNbkoLLCg0uck8P2iyvgDKwB45
 x92w3Z4p27QBEyzr4NDw5s4XKataw8016PEsD81PtJ1XALVRg28suWI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The implementation details of the vdso_data access will change.
Prepare for that by using the existing helper function.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vdso/getrandom.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/vdso/getrandom.h b/arch/x86/include/asm/vdso/getrandom.h
index ff5334ad32a0f56b2d4265fd38d9c287de3dfaa1..ecdcdbcd3392533e5619d7f09403d60a9810ceab 100644
--- a/arch/x86/include/asm/vdso/getrandom.h
+++ b/arch/x86/include/asm/vdso/getrandom.h
@@ -32,8 +32,8 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
-	if (IS_ENABLED(CONFIG_TIME_NS) && __vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)&__vdso_data);
+	if (IS_ENABLED(CONFIG_TIME_NS) && __arch_get_vdso_data()->clock_mode == VDSO_CLOCKMODE_TIMENS)
+		return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)__arch_get_vdso_data());
 	return &__vdso_rng_data;
 }
 

-- 
2.47.0


