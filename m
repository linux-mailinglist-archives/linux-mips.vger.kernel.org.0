Return-Path: <linux-mips+bounces-5861-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69483997EF6
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99B6B1C21502
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71C91C68A7;
	Thu, 10 Oct 2024 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fT0XYr4b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RLtYsY+x"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371D1C5782;
	Thu, 10 Oct 2024 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543738; cv=none; b=Nrs6r43dzj4LVETvDBeDQLD17pRKc4aE3VSokyQ2TveJrSlTlAIQw8g3OdtcBjUceyLvF/QRJ43xvA9elnz+3INMBZUP8kMqBVmMLqjQZ3muIvhAosHjJulQB1fPBR7ZF5nH/3l8O3LizgTzR/w2V9fCkC84W6X20X8+Dp4Eo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543738; c=relaxed/simple;
	bh=XEWFVUSPeF1jA5lPR0wVB+XVxyxTVSWbfiAECWo8WxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKbNY5ax2rOKgNlSL17yBd+YimhbTS3NbZ4ND6GRe2Foihpgs4lcq/I8Y/c+R7hSD5sHoShkkke8DiPbMU+xcjMdGepjVLHj784+Yj7FUQ5Zz+ei/34xJG1ACtVoNcPbn2WtbhLhTOaDOhFeVC9XLu1t16xhK8YCqgFBWS86z30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fT0XYr4b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RLtYsY+x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	b=fT0XYr4bt3T8KG54HnN3IYu2UZ0oTO+t6RT7qYYVQ5ARIpM6klUk3a2g0UECskgVzPJfdN
	VT6ZV16Gf1SZohSZwi/MhptGx/HtmLY7jjmapoXCxbKjWk+DXYGNIb8s/wBv0s96WfT8B3
	anvuKC8obtknKT/40GHIWCtdpiHFy0kip7ZlHlcF5yTR/pRYuUl6zaluvDOjReafPMqlbr
	bxp2t8chniqiO6W2rONnBrnLNcFpA3e7mFUcmYnHHbKpxNrRG2exEH+hX1EOvrVu0rhwRP
	54szeRYq9V+rGF7eaeewh09tD2xsVlJoD++R8Xl1eiU0kNaZf3iVydyqKa/wcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	b=RLtYsY+xUckUP0mZzR4vMb5ox7tYb5/K6vCHcQmXEE2h+d6EE9vVy/zlRHhln4NALyW684
	UK3WXX9KOUIHitCg==
Date: Thu, 10 Oct 2024 09:01:23 +0200
Subject: [PATCH 21/28] powerpc: vdso: Remove offset comment from 32bit
 vdso_arch_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-21-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XEWFVUSPeF1jA5lPR0wVB+XVxyxTVSWbfiAECWo8WxA=;
 b=am78tsBd74RSO+kD9Bu9TdSyO3ydCuUjYTZu3uyOVJurwtzIFBgZGPAxHaCrBfouNaLGr49Ox
 fsYzkbNAIVfDQitCU8gng++Dlgtv6VnR21Em9CwtI8nf81CpBJx+Yzl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This offset was copy-pasted from the systemcfg structure.
It has no meaning for the 32bit VDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso_datapage.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 248dee138f7bf5dc11a9490a97f4a3917bc46e92..3d5862d4c4e1618a27840d9136e890870e78a761 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -92,7 +92,7 @@ struct vdso_arch_data {
  * And here is the simpler 32 bits version
  */
 struct vdso_arch_data {
-	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
+	__u64 tb_ticks_per_sec;		/* Timebase tics / sec */
 	__u32 syscall_map[SYSCALL_MAP_SIZE]; /* Map of syscalls */
 	__u32 compat_syscall_map[0];	/* No compat syscalls on PPC32 */
 	struct vdso_data data[CS_BASES];

-- 
2.47.0


