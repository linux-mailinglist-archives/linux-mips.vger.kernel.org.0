Return-Path: <linux-mips+bounces-9983-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5CB196CF
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 00:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890871892B86
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236171FECAB;
	Sun,  3 Aug 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3CbHS0X"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5F2E36E8;
	Sun,  3 Aug 2025 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754261816; cv=none; b=oiSZ3ynt78JsC9etKx1rJEYlffXj4w/V3N1vGH3lU+ei09KppcAKKBptO9+ZdyCM+0kXn3KbhXN4UiGdMwxmYR5fy1NkTWVXHUxKIQkuXZcME9dhbnc6IVSXPSIyar3xUb52CeJIvtWIlwwVgL+rxsmDJV1Edjn7ZDPXVy97Bp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754261816; c=relaxed/simple;
	bh=Ym+yYLpWdX2ByNjDG8czIJWJsK5Au9w7AVSJSphPKIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2Sj4Bn/+FWtHuIOrAiOVPeC1KE6zHHjweNIyLs8vi8PpocJUetjOExMDsQo2ED0GcZjFnpTFgjRdo4l/ioEEfEAUcYl0wGYSmV/VYwj1EaHQat/gXCcJdOvK66CqzRRrepRLZwo61SsB8Ro9YLizlmBpMC4BwIWWxUiennDjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3CbHS0X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B364DC4CEEB;
	Sun,  3 Aug 2025 22:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754261815;
	bh=Ym+yYLpWdX2ByNjDG8czIJWJsK5Au9w7AVSJSphPKIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3CbHS0XgKSoVBKeaq8ORC8nEoU8TGYQCUhn4dkm3IQ7qpZseRsaF/CV47bAjRD+4
	 LkCXnI0DjDXZLL47aQj8eD6nH6cRBCENJDu+v/d2acAR7+92ZEHJdI8VtnXCtODMs3
	 QvvbNAKDRsp3w4IUGSnJ40fuzuKi1LYomogzDOXYraSnfQaqXU/bFiMRifoptpwONT
	 ZEG+lTQrQZsoIWbKBToO18Z6Vi0JwTGZ/ds+weGh46QwIJl1/yYQetRrMFjhTYsjvT
	 Y4wTg4MbzPl2V3/0HZ5ZV/AQ0v7e+0yU2zdXSfZnxS4GJr9of1s9xg05GbUuCeogPl
	 XZLvSH8Bw1dDQ==
Date: Sun, 3 Aug 2025 15:56:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250803225652.GA2142@quark>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <aI_djr4v-3nQqG9E@gate>
 <20250803221438.GA119835@quark>
 <aI_iNQXxU6wKPEN8@gate>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aI_iNQXxU6wKPEN8@gate>

On Sun, Aug 03, 2025 at 05:27:01PM -0500, Segher Boessenkool wrote:
> You are replacing a known-working target implementation by a lower
> performance generic implementation.

That's probably correct, though FWIW there have been quite a few cases
where optimized assembly code in the kernel actually turned out to be
slower than the C code.  (That primarily happens when the assembly code
doesn't take advantage of any special CPU features, which was the case
for this PowerPC code.)  I don't have PowerPC hardware to check the
exact performance differential here, but IMO even if there was a
slowdown the factors still weigh strongly in favor of retiring this.

> But is that one known-working at all?  Does it come with tests?  Was
> it tested to have the same outputs as the existing thing, maybe?  Just
> on a few inputs maybe.

Of course.  Patch 7 adds a KUnit test suite for MD5, and there are still
the older tests in crypto/testmgr.c.  And of course generic code is much
easier to test than arch-specific code.  So not only is it tested, but
the test coverage is much better than it was before.

- Eric

