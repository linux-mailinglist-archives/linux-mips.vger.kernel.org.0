Return-Path: <linux-mips+bounces-6688-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D839BDF1D
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 08:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0C81F242F6
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 07:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4AB193404;
	Wed,  6 Nov 2024 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="h80rEgtJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B603A2D;
	Wed,  6 Nov 2024 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730876813; cv=none; b=bL8WSCcwe41hD4FbejvDYUDCpwljpLj8tNPYjbw5lwTelzhN0QwdebF/PD0mrvQ8rJhVosQ3gifU4PoVN59Y3Ph/YBik4qsoZBD/pFj8pLyXJzrp6SpVFAi+GIyL55ipAdONEYWldTSwuexYqVp2QaS1DjdhDWdUQb7cuuuv6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730876813; c=relaxed/simple;
	bh=mxUa4wXzdvBDGoXNKjPAAdJI49s9TSRxkkDIR/2IP/A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CM/RtJtQnioCElDQVvJY5/UXLAVMSKx8VGl22z3BQNsYr4SBvPhtlqhMrvVQ9UG2FkTdMoTWBNkbAucZrhNCoCk+93/cGmu5DJPh9Rih8LQDqCoj1GbcPxetQlsxc+HwI2Xjt4dxrtmvs7e+TkCCoL6KHSA9Xuhn/pHzvIwt8PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=h80rEgtJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730876806;
	bh=yAUFaVAsNQ/ccJyGlmMcytG2+Qr2oEjByXJHlP+rk68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h80rEgtJ7qD9jyDyLJcISbRk3INZH8ZPcYosK4VrHHZVogREXxmMdnucgdz5uGIVq
	 2FKIvnwHaCmTCM5h2wCPV5BHvVPqGtTkGb8EMAQ3QpqRcFOIuuN9J+N+f2mo7sMJe/
	 dU4VVqU+Z1FcyNgWJiu6rzNqueMfO3e6FKKNop6UZT1IVzPlW79wIw8rl8ikKnhRpJ
	 +n1/bbdRaP9EQPbjeaxIqHG5JuYMBpoWql3abi4yDgJ1tGm3FhgLFRk5m7yklMr2OW
	 JsGlZDD1354L3XGFFlQ4dOrEE1hpvtyE9IKa50nyhPWS+nOpSyzlxB/+3KkxmrZtK5
	 AOEEtdbWDj8jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xjx8D1mmSz4x11;
	Wed,  6 Nov 2024 18:06:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner
 <tglx@linutronix.de>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx> <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Wed, 06 Nov 2024 18:06:35 +1100
Message-ID: <877c9glu2s.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 30/10/2024 =C3=A0 12:39, Thomas Gleixner a =C3=A9crit=C2=A0:
>> Folks!
>>=20
>> On Thu, Oct 10 2024 at 09:01, Thomas Wei=C3=9Fschuh wrote:
>>> Historically each architecture defined their own datapage to store the
>>> VDSO data. This stands in contrast to the generic nature of the VDSO
>>> code itself.
>>> We plan to introduce a generic framework for the management of the VDSO
>>> data storage that can be used by all architectures and which works
>>> together with the existing generic VDSO code.
>>>
>>> Before that is possible align the different architectures by
>>> standardizing on the existing generic infrastructure and moving things
>>> out of the VDSO data page which does not belong there.
>>>
>>> Patches	 1- 2:	csky
>>> Patch	    3:	s390
>>> Patches	 4- 5:	arm64
>>> Patch	    6:	riscv
>>> Patch	    7:	arm
>>> Patch	    8:	LoongArch
>>> Patch	    9:	MIPS
>>> Patches 10-20:	x86
>>> Patches 21-27:	powerpc
>>> Patch      28: 	Renamings to avoid a name clash with the new code.
>>=20
>> As this has been sitting for two weeks now without major comments, I'm
>> planning to merge that through the tip tree tomorrow.
>
> To avoid any future conflicts with powerpc tree, I suggest you merge=20
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=20
> topic/vdso into your tree before applying this series.

I thought the same, but there actually isn't any conflict at the moment
between the two trees.

Some of Thomas W's later changes to convert arches to generic VDSO
storage do conflict, but they look to be destined for the next merge
window.

cheers

