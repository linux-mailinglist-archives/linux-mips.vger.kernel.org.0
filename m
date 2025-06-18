Return-Path: <linux-mips+bounces-9373-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CDADE158
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 04:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4004F3B1F36
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 02:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036E41ACEAC;
	Wed, 18 Jun 2025 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPFoctY2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16FD78F36;
	Wed, 18 Jun 2025 02:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750215164; cv=none; b=bOyTqJ/2mXkYtoGUi26P9JHL5QWOc/u8W7mS2NXKV22LKo8QCp2BzLWItWmtdYbCd8hIqfglYb1Y+PihdPlxMlHF4wvjfNvyY1EG2sj83fP2B7/DxtrMm7+JeacaZ46WwFwWHThG94sa3JiBvNHVU5JUxbuUc6F73H00DgjX1bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750215164; c=relaxed/simple;
	bh=xibkBkl+LKRXep54JINrCcQx7QYwck9H1g7WJvKYXXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvG4y2xYwf13FYd8a3xkkHQkEN/olOVLpe5hhbbppGY2rSVO/cT6ecw9MFpIBP+DxHKDVngvkO/KpOCwxQIwSL8dp9AFYLXYfz3x7isXzmm2VONhmoz2aRViWmIlb9JUeacFWguOU38mfFB4gcb668BsXBCzvUz3njqJ2uZ09aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPFoctY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC05EC4CEE3;
	Wed, 18 Jun 2025 02:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750215164;
	bh=xibkBkl+LKRXep54JINrCcQx7QYwck9H1g7WJvKYXXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPFoctY2b4YRp0ICParubEBIZbOSf9Vk5KK8uS5PrU68/mm+Tz8vijYy669L9yxjm
	 Jsv6rP0LyKuxoI+O6bOEIwMiUBAvM0LFyxdmzqXTetuviDjXgL79zCa0MkNRe26UZJ
	 nmTPEi+nsnNBnQNcZVTMorAMhKugQ20v2b7tS7R4Wg/qgU1aCe1/KxTNGbXHZNp3s2
	 x1c6uvob6lNCYNLO/miSBxmUGAC6yCJweLgoMx1DbKIQB9lR06t0ghAy3rr9+u8lXf
	 Xpv9Fu6WPFd657Fqb98bOrRaq1+T2zwE7IyENAPdIk0Jvy78IS8GMNY23Rlo0baNFn
	 vSmEyoM6yt63A==
Date: Tue, 17 Jun 2025 19:52:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 8/9] lib/crypto/x86: move arch/x86/lib/crypto/ to
 lib/crypto/x86/
Message-ID: <20250618025213.GA426513@sol>
References: <20250617222726.365148-1-ebiggers@kernel.org>
 <20250617222726.365148-9-ebiggers@kernel.org>
 <983d7906-6510-4867-978f-4f937b29224b@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983d7906-6510-4867-978f-4f937b29224b@intel.com>

On Tue, Jun 17, 2025 at 05:41:09PM -0700, Sohil Mehta wrote:
> On 6/17/2025 3:27 PM, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.
> > 
> > The new code organization makes a lot more sense for how this code
> > actually works and is developed.  In particular, it makes it possible to
> > build each algorithm as a single module, with better inlining and dead
> > code elimination.  For a more detailed explanation, see the patchset
> > which did this for the CRC library code:
> > https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> > Also see the patchset which did this for SHA-512:
> > https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> > 
> > This is just a preparatory commit, which does the move to get the files
> > into their new location but keeps them building the same way as before.
> > Later commits will make the actual improvements to the way the
> > arch-optimized code is integrated for each algorithm.
> > 
> > arch/x86/lib/crypto/.gitignore is intentionally kept for now.  See
> > https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
> > I'll remove it later after some time has passed.
> > 
> 
> After this change, arch/x86/lib/ has a lone empty directory crypto with
> the .gitignore file.
> 
> Instead, would it be cleaner to get rid of the crypto directory
> altogether and update the .gitignore of the parent?
> 
> As per the link above, commit 2df0c02dab82 ("x86 boot build: make git
> ignore stale 'tools' directory") says this:
> 
> "So when removing directories that had special .gitignore patterns, make
> sure to add a new gitignore entry in the parent directory for the no
> longer existing subdirectory."
> 
> With that change,
> 
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Yes, that makes sense.  I'll do it that way.  Thanks!

- Eric

