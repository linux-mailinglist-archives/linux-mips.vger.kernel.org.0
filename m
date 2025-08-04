Return-Path: <linux-mips+bounces-9988-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A93DDB19B52
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 08:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A893A8DBF
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 06:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFA5221703;
	Mon,  4 Aug 2025 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WB5Ojvzz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCA72E36F4;
	Mon,  4 Aug 2025 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754287735; cv=none; b=G4RNQv2jXKfx4DT+kZvKfpTtM45YkK0NNtTvasemcsEyqtF0u0xJtQYLJVddB1YevEXPX9lxeYz/sHIgYp/FnTYfAoTeNzqysKyi6ZZkH/mSWwmM9xpa6uz11XseNTAvhnNNFqZdA6e6libqSH52xdmrxsXst+p9OVCMGJxlrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754287735; c=relaxed/simple;
	bh=ipRZKPKGvZYye+NbUN1kZp7BEdItabd5U7NljxzHgfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0Hi5BuYN2toJLIzGd6t3p+614XozpVMlPU+4uKB93NGOrG52oBAx/tWSBl34sVgruWb1VM7FvFAS+mRk+Cqel6MeLb698S+dFWZfxJTJJ8iBg/RdUc5R+iWcGiieMGyIoxW5ruwi4vnLEaAbVlB96NTlRVohTRmRXwOTVnybrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WB5Ojvzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F8CC4CEE7;
	Mon,  4 Aug 2025 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754287734;
	bh=ipRZKPKGvZYye+NbUN1kZp7BEdItabd5U7NljxzHgfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WB5OjvzzZ9vAddGUmIgd58d+GXAOhK71sgg1sPjKZ2V4EdqoOJbqAVclrdZTG/XGi
	 Rv4OLHjfwhr7v2ooiI/Y5m0mdTZlLU2yegwzf+bUDcd7s6iwcEdBh06+6nVz8/Wa/O
	 +nBnfaXt4XJKLaoT1RHqMmETX8rjF2Kmy/dnJIcDEMFfT32WMoSpIh/T72/QhtzayO
	 wodMKqYXABzuIYri2XMu2dcy12w6CtEODa+LxF9rvgQZnWzVvzu9RJJN6NHZ3iDIfB
	 stPKSSjzPiUTU8EaLaIBQafQgp2iiOYNb0jxbpJZIqI9VBJDNEZXHdhqUN4pmoXW8a
	 x2CW/8wn0ESAQ==
Date: Sun, 3 Aug 2025 23:07:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 4/7] crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
Message-ID: <20250804060758.GA108924@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-5-ebiggers@kernel.org>
 <3de7cc4d-cb88-4107-9265-066cbedd4561@hogyros.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3de7cc4d-cb88-4107-9265-066cbedd4561@hogyros.de>

On Mon, Aug 04, 2025 at 01:44:21PM +0900, Simon Richter wrote:
> Hi,
> 
> On 8/4/25 05:44, Eric Biggers wrote:
> 
> > Taken together, it's clear that it's time to retire these additional MD5
> > implementations, and focus maintenance on the MD5 generic C code.
> 
> [...]
> 
> > -	ldd	[%o1 + 0x00], %f8
> > -	ldd	[%o1 + 0x08], %f10
> > -	ldd	[%o1 + 0x10], %f12
> > -	ldd	[%o1 + 0x18], %f14
> > -	ldd	[%o1 + 0x20], %f16
> > -	ldd	[%o1 + 0x28], %f18
> > -	ldd	[%o1 + 0x30], %f20
> > -	ldd	[%o1 + 0x38], %f22
> > -
> > -	MD5
> 
> This is a literal CPU instruction that ingests sixteen registers (f8 to f23)
> and updates the hash state in f0 to f3.

Note that QEMU doesn't support this instruction.  I don't actually know
whether the SPARC64 MD5 code even works, especially after (presumably
untested) refactoring like commit cc1f5bbe428c91.  I don't think anyone
does, TBH.  No one seems to be running the crypto tests on SPARC64.

> I can see the point of removing hand-optimized assembler code when a
> compiler can generate something that runs just as well from generic code,
> but this here is using CPU extensions that were made for this specific
> purpose.

You do realize this is MD5, right?  And also SPARC64?

I'm confused why people are so attached to still having MD5 assembly
code in 2025, and *only for rare platforms*.  It's illogical.

We should just treat MD5 like the other legacy algorithms MD4 and RC4,
for which the kernel just has generic C code.  That works perfectly fine
for the few users that still need those algorithms for compatibility
reasons.

> This is exactly the kind of thing you would point to as an argument why
> asynchronous hardware offload support is unnecessary.

For an algorithm that is actually worthwhile to accelerate, sure.  For
MD5, it's not worthwhile anyway.

- Eric

