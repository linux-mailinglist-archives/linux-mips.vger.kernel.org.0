Return-Path: <linux-mips+bounces-8644-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CBA930DE
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 05:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D69637A8698
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 03:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53F37E0FF;
	Fri, 18 Apr 2025 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbV/7d47"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3721E4AB;
	Fri, 18 Apr 2025 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744947512; cv=none; b=M4kdYV78jfbUoBynHtGpCLQf2Cb2EJshEtHSl8YhZ8eswEY5Z3BoS0gfXQDyuvtdT90nYQglw0Q+Ah1avZF6NsUd3qspXmjNAPbVA0sHEn3H6G8qvtOAP84KNrDCTzxLfJqYSuBy9CqEzrScMgszrRySr8ibE5BIUinFrCwskSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744947512; c=relaxed/simple;
	bh=JIccxkbUkJv2mhfcvak7GTlHD8kRGQhmDGq2CC/2MlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbqhHuwjbx9lI2EwACOvBQ2W0i65eP1e9I52QUdUWuv86spHH0XcbL0thFYwyW/FBuDBmQB9sl7zUdUgCUJqtg/BJrQiq1ZfwBpEkt01zlqSChwt/QpqllFen78ASJzbByvN0BVb6VmnzPMAe30PfNrW/gG9Vz0pUMDF9WfjDqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbV/7d47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC94C4CEE2;
	Fri, 18 Apr 2025 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744947512;
	bh=JIccxkbUkJv2mhfcvak7GTlHD8kRGQhmDGq2CC/2MlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbV/7d47vHOJChB47qhZmb0CfoN/a3qx2MFQWBgheSbIGzLw0f2MlJ5Ku660xMDdN
	 T4loJYW/hWRNd0mew7guTwfHnu2tM8xDIubGn1ERQsyKxMx5ar2zFZUJ2Lrwbz6r98
	 yNZwbC1RlV+RdXfe82WOaIXpLWfmd2tlKB3jl32SbbQuj8P+fcZHE8UE6qTKi/BRn7
	 rRIzvkx8PAQGfQK9vD+DANxt4gQtM8rY6YozQ2Af70zxW9lO+cSmZlU7C5/oCMGSPk
	 yR8h1YTR/Hx45pr9O8JqluF6gUxSJfqBiXPtG8LY8J46QrYMhVbT8pMdKsD5QHusBf
	 izokyk+75mmyA==
Date: Thu, 17 Apr 2025 20:38:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <20250418033829.GC38960@quark.localdomain>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>

On Fri, Apr 18, 2025 at 11:24:01AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > -static void __exit chacha_simd_mod_fini(void)
> > -{
> > -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> > -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> > -}
> > -
> > arch_initcall(chacha_simd_mod_init);
> > -module_exit(chacha_simd_mod_fini);
> 
> Why did you remove the ability to remove the module?
> 

Well, I forgot that an empty module_exit needs to be kept around for the module
to be removable.  I'll send a patch that adds these back in, though I'm doubtful
that anyone ever removes these modules in practice.

- Eric

