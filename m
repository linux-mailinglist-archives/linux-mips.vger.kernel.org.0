Return-Path: <linux-mips+bounces-7974-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF6A45544
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 07:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7998D3AA5AB
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 06:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D6725D537;
	Wed, 26 Feb 2025 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIZ9LpwA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE933997;
	Wed, 26 Feb 2025 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740550048; cv=none; b=crZXNY1okGnaKxrhC/8Ro+zR7yROcornhczfCBHpf1LPJAvuabcLhAeWl+if30XpMhgPUtzSPp3YNOFlqu4qaSxl/B2ScJyHZn01DFJkAxhCUC1GIcgj41tvdN1fRMCREIV1kmRSLpTcIHcUBXH9qresfKxrA6as8iEt9SfN3B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740550048; c=relaxed/simple;
	bh=ZyHSW2CFJY0phCrOV3ftPgjBH4sON/3HnsEMzS5mjrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1KCIy+Y227CvR+olANXrbs0VJ2xeLIm+u1pX6tveMFE7JmShsNAQC/7Orq6t0OFaOTf6bXycV6e/6xXo9uSqsP0kLbdBNYmHkBvPzQ0cpqJdYljvdTSlktoEeNS//8RvMppuJYYjCxo/ydoiLdsztYN1GU5LqoVpH9E2AL7xHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIZ9LpwA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CA6C4CED6;
	Wed, 26 Feb 2025 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740550048;
	bh=ZyHSW2CFJY0phCrOV3ftPgjBH4sON/3HnsEMzS5mjrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIZ9LpwAcREXQgfuNg0zyNw0M++bvgoKOyYmGBHqKBWJWIkoYcu+Sm1wJ8tWOUEZh
	 EnRA0v7pJNyg+h1sZYC8QkXrwzrlQH24Zzku0cZm99ayVIxijNVEBS0K/LruEWa8dT
	 /hKigNIP8L0xmkTai29HFfvIkz/ayat6ka7Vel+0SD+hwTpopXHvo0TtdnZ/3xwKzQ
	 x2ilMqyS7yU8GnKatLUixjjy4COKOFtxw6qAmfTxiliNM5KapWNaR6v44zxjFGKNrQ
	 3Ep/Rd4/juKbj150cjM6pJHukAy107hyro8VaICi4NEhenpUukLcRfhaxEVth95Gzo
	 mP2bYYkBWGW9w==
Date: Tue, 25 Feb 2025 22:07:25 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <20250226060725.GA41090@sol.localdomain>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>

On Wed, Feb 26, 2025 at 12:36:33PM +0800, Herbert Xu wrote:
> The ARCH_MAY_HAVE patch missed arm64, mips and s390.  But it may
> also lead to arch options being enabled but ineffective because
> of modular/built-in conflicts.
> 
> As the primary user of all these options wireguard is selecting
> the arch options anyway, make the same selections at the lib/crypto
> option level and hide the arch options from the user.
> 
> Fixes: 1047e21aecdf ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502232152.JC84YDLp-lkp@intel.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

As I said earlier, fixing the arch-optimized code to be enabled automatically is
the right way to do it.  There are still some issues with this patch, though:

>  config CRYPTO_LIB_CHACHA
>  	tristate "ChaCha library interface"
> +	select CRYPTO
>  	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
> +	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
> +	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
> +	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
> +	select CRYPTO_CHACHA_S390 if S390
> +	select CRYPTO_CHACHA20_P10 if PPC64 && CPU_LITTLE_ENDIAN && VSX

There's no need to have a select for every architecture, with the dependencies
redundantly listed.  Instead just 'default' each of the arch-optimized options
to CRYPTO_LIB_CHACHA.

> config CRYPTO_CHACHA20_X86_64
>	tristate
>	depends on X86 && 64BIT
>	default CRYPTO_CHACHA20
>	select CRYPTO_ARCH_HAVE_LIB_CHACHA
[...]
>
> config CRYPTO_CHACHA20
> 	tristate "ChaCha"
> 	select CRYPTO_LIB_CHACHA_GENERIC
> 	select CRYPTO_SKCIPHER

This introduces a problem where to enable optimized ChaCha in the crypto API
users will now need to enable CRYPTO_LIB_CHACHA, instead of
CRYPTO_CHACHA20_X86_64 etc. as was needed before.  LIB symbols should never be
user-selectable, so that makes no sense.

The way it should work is that CRYPTO_CHACHA20 should just select
CRYPTO_LIB_CHACHA (and thus also the optimized code).

And similarly for the other algorithms, which should be in their patches.

- Eric

