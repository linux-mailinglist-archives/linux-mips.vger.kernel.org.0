Return-Path: <linux-mips+bounces-8972-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84265AB2F18
	for <lists+linux-mips@lfdr.de>; Mon, 12 May 2025 07:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB8E17200F
	for <lists+linux-mips@lfdr.de>; Mon, 12 May 2025 05:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C9E2550AA;
	Mon, 12 May 2025 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="S/s7t2pO"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73772576;
	Mon, 12 May 2025 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747028772; cv=none; b=ZPrhUcEJuK9omqgaYPvy+lyMcv9f04w25PZx9sQ/xJ0d1s8IRP7gMcMVoMzbFJUJ3OfC5EKoIGDTQ8/PF9TCtRdZwoWeRUu7Ol94G4Ziu0rZVok/If14smHVhmomVE2JNM0yWKxmJ4E/KTzVVDtW45h6TA7wbzSw2dErRSfkWaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747028772; c=relaxed/simple;
	bh=u64s+zlla2jJXpvc4naROlFKmTDabF0VIueBA0xb8l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sGOpSUJMncuFxBIN4Iy3efJqk3T0tfyTG31l/AhJdz2iHdSa9n6LbziJ5gpjCYotZ8KG8rXQh9Y0PqtvLhMRAEEVbxDhR4YnRSBCFPOT3oN0wViD9/pm2TmGEtIbDdYUY3FEE5QXBgKPtowaVflHUUzF+SkTtES5UbPqoUkN1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=S/s7t2pO; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xxYezVCCW8thv+qLiUz6l9UAqKd/qP+JO8d98YSqd48=; b=S/s7t2pOkSMknAlt9Xo72xB+Xk
	2BeBKd0JobLfzVY1rfopu4wpLQVmbiyoIyrKWNfw7fJElr2DnZf+2tHomWPWndlZcrQd/HdtxrhMo
	tTihOowVp20dSE+SUvgkndWKyD9qKp1x0wWN4TQ/VwCRY6nFbhGy50FuzlO8OKpMeqYiggyoTmsLl
	jQkWg8LN7KnZjUelc9rjFiuoTc8BIYX9Cd3aVWjMbysGB/o95Lhq3vAWZktaVIkqPbsqxzOxFvI26
	OMBaBIB1PNbiIjiT0ucY5IFwu4MO/jlIIwZjeJxlcxvoVPc77KsOtexUw0YOl1fVZTXqXTY0jvh6h
	Lula7ezA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uELz5-005LnN-2T;
	Mon, 12 May 2025 13:45:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 12 May 2025 13:45:51 +0800
Date: Mon, 12 May 2025 13:45:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	Jason@zx2c4.com, tytso@mit.edu
Subject: Re: [PATCH 0/4] crypto: lib/chacha - improve type safety
Message-ID: <aCGLDzAkVn65P4n4@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Eric Biggers <ebiggers@kernel.org> wrote:
> This series can also be retrieved from:
> 
>    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-prototypes-v1
> 
> This series improves type safety and clarity in the ChaCha functions by
> strongly typing the state array and adding explicit array bounds for
> other fixed-length arrays.  No functional changes.
> 
> Eric Biggers (4):
>  crypto: lib/chacha - strongly type the ChaCha state
>  crypto: lib/chacha - use struct assignment to copy state
>  crypto: lib/chacha - add strongly-typed state zeroization
>  crypto: lib/chacha - add array bounds to function prototypes
> 
> arch/arm/lib/crypto/chacha-glue.c             | 34 ++++----
> arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
> arch/arm64/lib/crypto/chacha-neon-glue.c      | 27 ++++---
> arch/mips/lib/crypto/chacha-glue.c            |  6 +-
> arch/powerpc/lib/crypto/chacha-p10-glue.c     | 17 ++--
> arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
> arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  9 ++-
> arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
> arch/s390/lib/crypto/chacha-glue.c            | 13 +--
> arch/x86/lib/crypto/chacha_glue.c             | 62 ++++++++------
> crypto/chacha.c                               | 20 ++---
> drivers/char/random.c                         | 41 +++++-----
> fs/bcachefs/checksum.c                        | 18 ++---
> include/crypto/chacha.h                       | 80 ++++++++++++-------
> lib/crypto/chacha.c                           | 40 +++++-----
> lib/crypto/chacha20poly1305-selftest.c        |  8 +-
> lib/crypto/chacha20poly1305.c                 | 53 ++++++------
> lib/crypto/libchacha.c                        |  2 +-
> .../crypto/chacha20-s390/test-cipher.c        | 10 +--
> 19 files changed, 253 insertions(+), 208 deletions(-)
> 
> 
> base-commit: 64745a9ca890ed60d78162ec511e1983e1946d73

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

