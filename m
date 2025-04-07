Return-Path: <linux-mips+bounces-8495-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4B2A7D384
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8253AE337
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 05:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB31E222595;
	Mon,  7 Apr 2025 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="UHwODn/V"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4A222597;
	Mon,  7 Apr 2025 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744003747; cv=none; b=QuaOzgnxoJX1xfF/1E1PpUpRSz+i2Zr0QQWuAUy3NxU9VbwOc5Tpoll8pub6k+IyBRm5SjqMAp0X/9LZdvKqa1KTcFpsxjWQgm9KV0Zt1AuVZVanHsI/cqRxf6mr/rZ/JgrogBWgAQMONb6iMropzfHAEwW4m6h4MFWJFn9tcyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744003747; c=relaxed/simple;
	bh=TMWo6TilJBKfo3LYo71Znhv2YGopbCDAEw2cpZxuRnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M0RaSnWvjB/LrP9JjnZ1P+s3yjROmwHY4Cd/g6ioeoSVpNhEZaJwGOsQJTTt4J71iI7CCs6DvGmW8+e5gzbg6ai6YthwK2SnZFdhp28h0AMXCmHzIIXhcQp7/SfBvee3NpGqE07uZGTWtEVu360OA/ver/sBRcZwvg7kYbcOaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=UHwODn/V; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dB9keRMOwVIcNoNRSHHCD2QKgPNuoGWRXYd2uwzW990=; b=UHwODn/VjKqS1kbYWo32znTwIw
	MpG+JrhQnruzYLJX7YQgJWvbKzQEVRLBvy+UtAHi+prcy5LeUWFzHeyu50iWv7ZK2ZXKEI411HdBa
	INdLSkaiUMFA7St1XvHZCW6gpjZ/2fBNspqrUn4sydcldmLTQK3JipGLUX6JBpyhtaGFyUko+gNb9
	ahhkIXuXKtsuWfFxIr07DIWSvlFWv9XCC35yW/hlTv6DR0CyIboNnoXiPAZlcUDhopzdffRNRbUsV
	bbEO4jeMKg2+Ye/30S7ktszHbEo4g+SHTyevuL6IO8GGowfjSH7PNtJ1Mzj5vhPd3xQZHT7RapLsr
	wT/2Mn5g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1f2Y-00DNNS-2U;
	Mon, 07 Apr 2025 13:28:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 13:28:58 +0800
Date: Mon, 7 Apr 2025 13:28:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 0/9] Remove per-architecture ChaCha skcipher glue code
Message-ID: <Z_Nimiv1Wkfo3gBd@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Eric Biggers <ebiggers@kernel.org> wrote:
> Currently each architecture exposes ChaCha not only through the library
> API, but also through the crypto_skcipher API.  That requires each
> architecture to implement essentially the same skcipher glue code.
> 
> Following the example of what's been done for crc32 and crc32c,
> eliminate this redundancy by making crypto/chacha.c register both the
> generic and architecture-optimized skcipher algorithms, implemented on
> top of the appropriate library functions.  This removes almost 800 lines
> of code and disentangles the library code from the skcipher API.
> 
> From what I remember, the following are the reasons why it wasn't just
> done this way originally.  But none of these really hold water:
> 
> - The skcipher code was there first, so it may have seemed more natural
>  to add onto it rather than replace it.
> 
> - Architectures could register multiple skcipher algorithms using
>  different CPU features and have them all be tested in a single boot.
>  This was convenient in theory, but it never really worked properly.
>  It didn't apply to the library code, the x86 ChaCha code wasn't
>  actually doing this (it used static keys instead), and this cannot
>  catch bugs like accidentally using an AVX instruction in SSE code.
>  Instead, a correct solution, which also doesn't require any special
>  kernel support, is to just boot the kernel in QEMU using different
>  -cpu arguments as needed to test all the code.
> 
> - There was a concern about changing cra_driver_names potentially
>  breaking users.  But in practice users rely on cra_name, not
>  cra_driver_name.  We already change, add, and remove cra_driver_names
>  occasionally for various reasons.  And even if someone was relying on
>  a specific cra_driver_name, there are some more lightweight
>  compatibility tricks that could be used.
> 
> - There was a desire for users to be able to override the kernel's
>  choice of ChaCha implementation by blacklisting the arch-optimized
>  ChaCha module.  But that already became mostly impossible when the
>  library functions were added to the same module.  And in practice
>  users don't do this anyway.  Even if, hypothetically, someone really
>  needed to do this and for some reason the kernel couldn't be fixed to
>  make the right choice in their case automatically, there are other
>  ways this could be implemented such as a module parameter.
> 
> Eric Biggers (9):
>  crypto: riscv/chacha - implement library instead of skcipher
>  crypto: chacha - centralize the skcipher wrappers for arch code
>  crypto: arm/chacha - remove the redundant skcipher algorithms
>  crypto: arm64/chacha - remove the skcipher algorithms
>  crypto: mips/chacha - remove the skcipher algorithms
>  crypto: powerpc/chacha - remove the skcipher algorithms
>  crypto: s390/chacha - remove the skcipher algorithms
>  crypto: x86/chacha - remove the skcipher algorithms
>  crypto: chacha - remove <crypto/internal/chacha.h>
> 
> arch/arm/crypto/Kconfig                 |   7 -
> arch/arm/crypto/chacha-glue.c           | 243 +---------------------
> arch/arm/crypto/chacha-neon-core.S      |   2 +-
> arch/arm64/crypto/Kconfig               |   7 -
> arch/arm64/crypto/chacha-neon-core.S    |   2 +-
> arch/arm64/crypto/chacha-neon-glue.c    | 146 +------------
> arch/mips/crypto/Kconfig                |   6 -
> arch/mips/crypto/chacha-glue.c          | 131 +-----------
> arch/powerpc/crypto/Kconfig             |   8 -
> arch/powerpc/crypto/chacha-p10-glue.c   | 147 +-------------
> arch/riscv/crypto/Kconfig               |  11 +-
> arch/riscv/crypto/chacha-riscv64-glue.c | 112 ++++------
> arch/riscv/crypto/chacha-riscv64-zvkb.S |  71 +++----
> arch/s390/crypto/Kconfig                |   7 -
> arch/s390/crypto/chacha-glue.c          |  99 ++-------
> arch/x86/crypto/Kconfig                 |   9 -
> arch/x86/crypto/chacha_glue.c           | 144 +------------
> crypto/Makefile                         |   3 +-
> crypto/chacha.c                         | 260 ++++++++++++++++++++++++
> crypto/chacha_generic.c                 | 139 -------------
> include/crypto/chacha.h                 |   9 +
> include/crypto/internal/chacha.h        |  43 ----
> 22 files changed, 413 insertions(+), 1193 deletions(-)
> create mode 100644 crypto/chacha.c
> delete mode 100644 crypto/chacha_generic.c
> delete mode 100644 include/crypto/internal/chacha.h
> 
> base-commit: 56f944529ec2292cbe63377a76df3759d702dd39

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

