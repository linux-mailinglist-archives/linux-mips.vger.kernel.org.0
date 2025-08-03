Return-Path: <linux-mips+bounces-9982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C23BAB196B7
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 00:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7726B7A1526
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1C01F5838;
	Sun,  3 Aug 2025 22:27:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6DB1CF96;
	Sun,  3 Aug 2025 22:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754260029; cv=none; b=TBXxXVX72R97BORIDjW6ypXDkWV0DQvZOxeq9NNv3p2O8UZYV6HNe6jo9PKEfUTX6mi7TtgwQhSpUGIQHnOgz1Zm17bnB35uFatvfOOcuD8Kb3dMU51KzSNCqiiat5OqKyjIodsijjmQMCoG4OSc5vF/XAQn+ptbpA9w5zcEmf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754260029; c=relaxed/simple;
	bh=FkkVRJp5hZd8KkpzRG0aUfu8hIB8Abc4p8uJysAO5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isG2TjpAoYK64Vknt97D6jGdM0JVbESniTLxsmZu9o5LvtNeMZJuWUukyWD3P7UZZV9uybc91deUTbOa53sLEUS+NgVOv3HIWxDTYOsvWUvfPBzpLJpEKUBWn6jPvylnm8z/ln5csE9CE4VHK90pVW9p4HUl4+RcJK0ge4yZbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 573MR2Ob1823279;
	Sun, 3 Aug 2025 17:27:02 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 573MR1Ii1823278;
	Sun, 3 Aug 2025 17:27:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 3 Aug 2025 17:27:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <aI_iNQXxU6wKPEN8@gate>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <aI_djr4v-3nQqG9E@gate>
 <20250803221438.GA119835@quark>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803221438.GA119835@quark>

On Sun, Aug 03, 2025 at 03:14:38PM -0700, Eric Biggers wrote:
> On Sun, Aug 03, 2025 at 05:07:10PM -0500, Segher Boessenkool wrote:
> > On Sun, Aug 03, 2025 at 01:44:29PM -0700, Eric Biggers wrote:
> > > MD5 is insecure,
> > 
> > Really?  Have you found an attack?  Can you explain it to the rest of
> > the world?
> > 
> > MD5 is not recommended for future cryptographic purposes, there have
> > been some collission "attacks" on it (quotes because such a thing is
> > never an attack at all, merely an indication that not all is well with
> > it, somewhere in the future an actual vulnerability might be found).
> > 
> > Since there are newer, better, *cheaper* alternatives available, of
> > course you should not use MD5 for anything new anymore.  But claiming it
> > is insecure is FUD.
> 
> Many attacks, including practical attacks, have been found on MD5 over
> the past few decades.  Check out https://en.wikipedia.org/wiki/MD5

There is no new information on that page.  There are no practical
attacks mentioned there, either, just some collission things (which
never can be practical attacks for most applications).

> > > This commit removes the PowerPC optimized MD5 code.
> > 
> > Why?  It would help to have real arguments for it!
> 
> Sure, check out the commit message which mentioned multiple reasons why
> maintaining this code is not worthwhile.

Of course I have read that, but that information went missing, if you
intended to provide it :-(

You are replacing a known-working target implementation by a lower
performance generic implementation.  But is that one known-working at
all?  Does it come with tests?  Was it tested to have the same outputs
as the existing thing, maybe?  Just on a few inputs maybe.

We were not told anything like that.


Segher

