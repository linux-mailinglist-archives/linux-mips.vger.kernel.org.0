Return-Path: <linux-mips+bounces-6562-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD09B6209
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86F4B1F21B9A
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A231E4937;
	Wed, 30 Oct 2024 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rhEg0d1z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Sf9t6VjH"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618061E49B;
	Wed, 30 Oct 2024 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288390; cv=none; b=oT8Sebch8Vp6zrU3qOlQYKAERU2KSk8758x7exFUctIg2WUg/InvPsu7d7MTtViDGf+sf0r9M1F9hP1mm5Wkayn/fki/C0HvBRua19r2/yaNhbsohRxS0bYUxRgU/uFwJXSq5DL6Y6edQnE6BnixS9XmOzOOdkUKw4nZlmhzZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288390; c=relaxed/simple;
	bh=7eL/IITYqZV4GKb8Ss/XdGwYmKuSXJu9nnxd/jfR1P0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F1hJ/HU/AVRaB2mQxj5Wu1T3FccPSTMdABkx3qYowu9zk9Nqf47QbceZBNhupjrtx6nONIu0Rr39nyf2T8f2z1rHtEvXbcjG6jiQNURQPBUYNH8lVzN3+aqviQhV2r1+mieOpOA7Tj+xoCxrIgG86Ss5R3d10a3PZGKQytOvgO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rhEg0d1z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Sf9t6VjH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=rhEg0d1z87PUbjnSMEsHa2ZTMjm4V7As2oyILf5i4K2VK/32cI0L1o8550RHGdp6sqGjh3
	ErfD1VAW2o++iRalLhw8wi1ciSvnXToQPU/7Dqz5Wlnc51fuF7yZtMempbYTt2HzLBGqx0
	Y9YSzHbUO+IR24Yjq+Ny338RBqa0jzNLUw2m9Vrr52kzfVeGJB4+uj1JaJRYCIo3DE6Lly
	bobxafA+CuOfJYFL3jZUIAtXVESnMTctTppzVthR6fn1ijnvzGIvSfDwZ8yFMWE8zMh75v
	CjtAzrsY5JQC46+IYsUu5faYS3U6XCuR8hSr6G0+pno9IQ0T9vFbLX0np3OHDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=Sf9t6VjHntegt94+/ZST48Lk206fyTt9ZFie/7zblKXgaCtLwerDU5H5dAAiGuPUAe0Y5b
	9F1eFOTF9JGc5hBw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Guo
 Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
Date: Wed, 30 Oct 2024 12:39:45 +0100
Message-ID: <871pzxzuny.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Folks!

On Thu, Oct 10 2024 at 09:01, Thomas Wei=C3=9Fschuh wrote:
> Historically each architecture defined their own datapage to store the
> VDSO data. This stands in contrast to the generic nature of the VDSO
> code itself.
> We plan to introduce a generic framework for the management of the VDSO
> data storage that can be used by all architectures and which works
> together with the existing generic VDSO code.
>
> Before that is possible align the different architectures by
> standardizing on the existing generic infrastructure and moving things
> out of the VDSO data page which does not belong there.
>
> Patches	 1- 2:	csky
> Patch	    3:	s390
> Patches	 4- 5:	arm64
> Patch	    6:	riscv
> Patch	    7:	arm
> Patch	    8:	LoongArch
> Patch	    9:	MIPS
> Patches 10-20:	x86
> Patches 21-27:	powerpc
> Patch      28: 	Renamings to avoid a name clash with the new code.

As this has been sitting for two weeks now without major comments, I'm
planning to merge that through the tip tree tomorrow.

Thanks,

        tglx

