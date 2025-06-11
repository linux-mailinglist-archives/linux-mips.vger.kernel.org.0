Return-Path: <linux-mips+bounces-9244-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30DAD4980
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 05:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB1B57A775F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 03:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5236020E034;
	Wed, 11 Jun 2025 03:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z33pKRSU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5481749;
	Wed, 11 Jun 2025 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613222; cv=none; b=H6HzIOdNHEu4/Z5TWokXNAiTWk8AoHh9UhluEBbvpE3QQ2kns5h+dYKGBTSwiM4QrtXCf7xDVhBuTnUpsx0T2IGZRL2XNqT0s5fphiyiNY/L72fZtr2/nwhyBgq4BPQ/FjCo+1ZLqPLvTXKsZg45rBcWIrqMEKx45UH1EpIozN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613222; c=relaxed/simple;
	bh=UPRjxBTu6kPICuG6iqdM2F4dkniXO25Wjw0+01KGFmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8wsOh8KbzGKyS4OB6gPIEff4j0eiG/9g/169qgTHT30Pc8OSlL5huYBP40PCOnKWr4S8el2vNyjRLbUrnM2XZbh41DCbN70Q5uCd6u7hVQBPGWUhoV57ZteaBu+mfP/l9PsxKeG7x9qdoSRqM/mXUPAqGjk6eJLX6aJv/BaCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z33pKRSU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33443C4CEF0;
	Wed, 11 Jun 2025 03:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749613221;
	bh=UPRjxBTu6kPICuG6iqdM2F4dkniXO25Wjw0+01KGFmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z33pKRSU6mJ9GSS4cRBNfZIfpjRhPF1PZPALwTKO3QwWXB5uo9f61gwgeH769IoAC
	 d6xahp+3wHEl4r/g3tk8o+BeqhrARs7AzJELD84EBatPgwfxi9bkQhTlk8qLlt4j6D
	 ebmTuRLjo4AW4jTitCG74cjdELPhR8GJah7XjR6cri9pKFl1+4Nf7SIUAbOSQUDMG2
	 zRUlMRhHZq20l0KfOHLL0Jewlitxfm0yqgy/t3mD7bWYL93vdxOe6a2WRTu3jz7/p9
	 w+AWN6gAQ46GgDieGGe7FQ6BwXkjIZI2t56ro6VAKh5jCj8mKLOKKm3ef64c2f069E
	 29Prr/qCH9kjQ==
Date: Tue, 10 Jun 2025 20:39:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250611033957.GA1484147@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEjo6YZn59m5FnZ_@gondor.apana.org.au>

On Wed, Jun 11, 2025 at 10:24:41AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > +       {
> > +               .base.cra_name          = "sha512",
> > +               .base.cra_driver_name   = "sha512-lib",
> > +               .base.cra_priority      = 100,
> > +               .base.cra_blocksize     = SHA512_BLOCK_SIZE,
> > +               .base.cra_module        = THIS_MODULE,
> > +               .digestsize             = SHA512_DIGEST_SIZE,
> > +               .init                   = crypto_sha512_init,
> > +               .update                 = crypto_sha512_update,
> > +               .final                  = crypto_sha512_final,
> > +               .digest                 = crypto_sha512_digest,
> > +               .descsize               = sizeof(struct sha512_ctx),
> > +       },
> 
> This changes the export format which breaks fallback support
> for ahash drivers.
> 
> You need to retain the existing export format.

Do you have a concrete example (meaning, a specific driver) where this actually
matters?  Historically, export and import have always had to be paired for the
same transformation object, i.e. import was called only with the output of
export.  There is, and has never been, any test that tests otherwise.  This
seems like a brand new "requirement" that you've made up unnecessarily.

It also makes much more sense for the export format to simply be the struct used
by the library (e.g. sha512_ctx), not some undocumented struct generated by
pointer arithmetic.

And drivers should just use the library as their fallback, or else just do what
they did before when they must not have been depending on a particular format.

I'll add export and import functions if you insist, but it seems pointless.

Could you at least provide proper definitions for the legacy structs so that I
don't have to do pointer arithmetic to generate them?

- Eric

