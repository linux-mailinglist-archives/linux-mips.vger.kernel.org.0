Return-Path: <linux-mips+bounces-9290-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F6AD9022
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 16:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5252D1893C6A
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 14:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9A19FA8D;
	Fri, 13 Jun 2025 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYCjanIC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D45433A5;
	Fri, 13 Jun 2025 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826295; cv=none; b=r+mt9NKRvY+QvbIt0M3pHoZTW7qzwwz2AvBK4Nt9MVlAJfUgeVu0IyImqidC02Oq4jrWgJ+mCnKwSLKuiVHD+yXmEej37q4M3gQC02SAZ4fSpk+8o6j1KfzAKevtjRD2FUxVDJqLtJ+VguV1ZKlGOiki1cPbJIJmPCagaVPJVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826295; c=relaxed/simple;
	bh=a9gFEcNHOIC/Oz4QB/0+6Gj9TjA8O4O73SG5pKhkDQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or+vk7ngd6lUblBmOG9umtWVZSHt/NQBU7pXdIFowB6vgJSaSRXI9DnlmiVQweIRovd9LDCJJafMEVtxGh8br4RFUpmsmPs3vNvHlYi5KRZxAulMrh7XrkCOHTWyHffTy9i9AMz/n840ahnKeOe/dpfk+q0DuTN5jsIqHlV+4CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYCjanIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEACFC4CEE3;
	Fri, 13 Jun 2025 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826295;
	bh=a9gFEcNHOIC/Oz4QB/0+6Gj9TjA8O4O73SG5pKhkDQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYCjanIC9/ogE7BdmHldhYndikxkMFKyqq9mPw6xl6mpfeCU8xq4U0zUWklx3SSvr
	 e9WbsvU7oIvvYCBptqhLerjURuJCA8xnaDTABdNeXAy1B09nrKLDsh9BrqfYzGwq8f
	 0mQMRj2FmejGCqqaDhkK4ShurJ5BQTHmLtsrpI61urwamObAs/mE0q4BWwC/J7kl+n
	 uv3mVq6uKsGRsdSa89jxh6Y5KWaPihaeIP4MerLNjVzuGAF7xWZ6ujHlPCnVWGME6b
	 yp0xmWbNhmK4FlxYgcpDJvquONpj1F5m9bl0mHgZIFU6AyPzdK3I+xfWmlHTCZfIGV
	 2ZwEwxOvLUDkw==
Date: Fri, 13 Jun 2025 07:51:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250613145108.GB1287@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
 <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>

On Fri, Jun 13, 2025 at 04:39:10PM +0800, Herbert Xu wrote:
> On Fri, Jun 13, 2025 at 09:38:11AM +0200, Ard Biesheuvel wrote:
> >
> > Perhaps I am just slow, but could you please explain again what the
> > point is of all these changes?
> > 
> > Where is h/w accelerated ahash being used to the extent that it
> > justifies changing all this existing code to accommodate it?
> 
> There are two separate changes.
> 
> First of all the export format is being made consistent so that
> any hardware hash can switch over to a software fallback after
> it has started, e.g., in the event of a memory allocation failure.
> 
> The partial block API handling on the other hand is about simplifying
> the drivers so that they are less error-prone.

Is it perhaps time to reconsider your plan, given that it's causing problems for
the librarification effort which is much more useful, and also most of the
legacy hardware offload drivers seem to be incompatible with it too?

- Eric

