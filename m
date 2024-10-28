Return-Path: <linux-mips+bounces-6525-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0BA9B38A9
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921B71F21826
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1BD1DF749;
	Mon, 28 Oct 2024 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtEcfTSA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EFF185B5B;
	Mon, 28 Oct 2024 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138525; cv=none; b=DmOy+5nGRe1PzZUhHI4hdWgOVXugVFkQpOYION6k3zbaMrfsDWSa2uH7VeB8ef6CwdPK/ct3I12Soxc0D6CWp8ZAw6QcrEj/GGY6RvLi4B8HoBEtAD8uAX3qZDjoEXbtYbMWecdASQPJ4sZhtbhHQ5xsfP07F56tOSn+YHVwRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138525; c=relaxed/simple;
	bh=Cqqg0EuRygm2muKmG3Em56D2KQbpxOn57TA3RY3+BS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aK/+f3lj+aygdJ/rsYgjbvR9EsXnmHXZht1+oHn0vl/IjAJlkcvKbb3vvo/YvwBq+xBP/q6iO5IOpjjc57HXOaBZ4+Uobw3Ee8s55VW+Q6X5xr1dFVt3FFEqUQA6V5mC+Q8jDkN0NWjhdK54yxoHegF5+T7vt3KZBcDJ23caVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtEcfTSA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8251C4CEC7;
	Mon, 28 Oct 2024 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730138524;
	bh=Cqqg0EuRygm2muKmG3Em56D2KQbpxOn57TA3RY3+BS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtEcfTSA06walZP4EYky8YvX5+tSLqxGDLXcf9dA0tiJOg6r12ODMxN4IBYDVwhg7
	 /9sHuVvYEUTAUeLgzE/KvgtlkLSdirLw00I5bGlwJ/Cgt7TVO5MVaTO6+UMlpVICeX
	 OxI9y0jpxfslXPNVHEstnt5RNnozHioJPVXd5A12qMAr+Tmg8g+i3JF03owZspBheX
	 5WbgQU4+e5FVES1E30JvzTbHetoei1m463Q75tPDO+KVh/8FHNHcyhbP4oOnAr90BU
	 lHyfVNVrxZxPWRybYPdWzcCypiAkDKEiZjwaR4QWRqEopGgtZU/FsDxoBuXS7+xjxA
	 lBkIk08k8iv+A==
Date: Mon, 28 Oct 2024 18:01:54 +0000
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
Subject: Re: [PATCH 04/28] arm64: vdso: Drop LBASE_VDSO
Message-ID: <20241028180153.GA3029@willie-the-truck>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Oct 10, 2024 at 09:01:06AM +0200, Thomas Weiﬂschuh wrote:
> This constant is always "0", providing no value and making the logic
> harder to understand.
> Also prepare for a consolidation of the vdso linkerscript logic by
> aligning it with other architectures.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso.h       | 9 +--------
>  arch/arm64/kernel/vdso/vdso.lds.S   | 2 +-
>  arch/arm64/kernel/vdso32/vdso.lds.S | 2 +-
>  3 files changed, 3 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

