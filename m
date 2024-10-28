Return-Path: <linux-mips+bounces-6528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA69B3958
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73F3AB22609
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7561DFD95;
	Mon, 28 Oct 2024 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufVbxxkT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68C1DF972;
	Mon, 28 Oct 2024 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730140789; cv=none; b=poWbdNtyfSxdtOBeL1kN8QUQZ6lsYDdJ/QDmNWHqgUzLn3cKLH8cTX3So5dGY2b3zTAULZNUfuwRGM6y132EUIqwoSxBybldbkRsYWbH49Wcsj+a1EF6rILz0R5+1O4EjJwGkE3Fezx6JR0o/4c6Yvfvrvc7JM7Izku2U2Ls8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730140789; c=relaxed/simple;
	bh=uk4BWPlVVVwanPbUBrAaB+ERcnlLbOL0Xx2a3Ixjboc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9rhzs6eUATWdEW72bLDH9/FBUpll2yGGp/nM1cRIKJPmTyWXQxbWLJ5DbdcgRHkWhEminy6WwQsIoXzfUh4ER7Vw+DcqLJPwt92c5Iz4/cFmSc8jhTLBO3F943sAx7Smzu4byjaqbY/SgfIaw1NMKvFG78HIUfocvuN71Si1fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufVbxxkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611F4C4CEC3;
	Mon, 28 Oct 2024 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730140789;
	bh=uk4BWPlVVVwanPbUBrAaB+ERcnlLbOL0Xx2a3Ixjboc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufVbxxkTWxJDj8HIHfBS/e+90hOVJwh2ipSDoAm1RUfU5KMmgV7WmmTEjAnysS0gC
	 z5jEygQH1q1/a4tB71R8Bp1ATC7U76OqZCKr7wjOu+I99j4mc2QjAt8Nucxunj7xg1
	 wZGv+VyMIcKunGsRclb7iUvRyfGDDFbVTaCVCog4/uhm9IRpC0XmzA5NwCl+5V8/Bn
	 9wZ5570n4BR8rOzU1bjzDuSdR42R13+66vSllQDn/p2SFwTnRgy26PwXV6Ke4S75WX
	 FEIMyZc4Wgc+/rkrpAtXMY0SjfvDNi/ydcZe2lrkEs8d5xkzyJZMRC4Uj03ufeh6Rh
	 9Iy6DC7COCGhw==
Date: Mon, 28 Oct 2024 18:39:38 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/28] arm64: vdso: Use only one single vvar mapping
Message-ID: <20241028183937.GA3132@willie-the-truck>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Oct 10, 2024 at 09:01:07AM +0200, Thomas Weiﬂschuh wrote:
> The vvar mapping is the same for all processes. Use a single mapping to
> simplify the logic and align it with the other architectures.
> 
> In addition this will enable the move of the vvar handling into generic code.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/kernel/vdso.c | 43 +++++++++++++------------------------------
>  1 file changed, 13 insertions(+), 30 deletions(-)

I took this for a spin in qemu to double-check that compat and native
tasks can peacefully co-exist while using the vDSO. It all seems ok, so:

Acked-by: Will Deacon <will@kernel.org>
Tested-by: Will Deacon <will@kernel.org>

Will

