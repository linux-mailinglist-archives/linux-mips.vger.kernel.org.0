Return-Path: <linux-mips+bounces-10016-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720CB1AB25
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 00:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D46087A119F
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 22:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21330290BB0;
	Mon,  4 Aug 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivRrWtSu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E218D23B0;
	Mon,  4 Aug 2025 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754348344; cv=none; b=N4bpSZG/Q3m9KaMwe+fFBq+jMQnm+STB4lhZkvbzDALknbjV+v1g7ch4bsB40VybIGOk/Cq4iwT59BWbfjaS7YUZC4a0DB6NxE7j3/uJVQNTTkA3jE+/r0jhK4btxYnaplp3bsg/08oaBcT+SEwl8toW64jIDZVDMFjJg2jv6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754348344; c=relaxed/simple;
	bh=/qER347ubgNca1vJIVA2EJEZhgWxYnA/KKlAgCOFShg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAdn7kdFg4x9/+A+8RmX2opEUaB+YZkKw+UtXdgVtopTpO49jbQ056O2j2IbhocD+Kgv/LE24Xrag4OIajtOsLsF7fn5ceo91QBmBLaNDg3V/cuKuJRQn4WRuWd9/53604185DP81uptK3aPwt20I9EofmzxSUFEReQsMtjDLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivRrWtSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D22C4CEE7;
	Mon,  4 Aug 2025 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754348343;
	bh=/qER347ubgNca1vJIVA2EJEZhgWxYnA/KKlAgCOFShg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivRrWtSu26qH9LsU+sZqAxs0R5VKnScPCpe/hlDYz3+kjmAdIz4GZ0hNGHyYVEU0Y
	 6Na+FfGvs+1pk89tUEGobWEvx6P4HhoMO3oOMOlhjbH9ayzsnBDu8lJfN8gFeJuMh0
	 uvafDyWsKHBW+gKZimM1Dd/KSXE6/pdL9c0Z5ckmol50aJZ3rLTVIVMCphlrpzuMxR
	 Q6J9UJoura3IETnH9tL7elgUGjmPvdDrBKsmVW8vGqchMmxy2LS+5L6eJ0ZKcY6DNt
	 MRbJm2D5YrAHczg0H2wcjHfRmrw8GDMJ2eqim+8DwtLcdXUUKJZImZyW3JHFvsUWoj
	 xVcLdaCwTLzmA==
Date: Mon, 4 Aug 2025 22:59:01 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250804225901.GC54248@google.com>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>

On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
> 
> 
> Le 04/08/2025 à 20:09, Eric Biggers a écrit :
> > On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 03/08/2025 à 22:44, Eric Biggers a écrit :
> > > > MD5 is insecure, is no longer commonly used, and has never been
> > > > optimized for the most common architectures in the kernel.  Only mips,
> > > > powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
> > > > only the powerpc one is actually testable in QEMU.  The mips one works
> > > > only on Cavium Octeon SoCs.
> > > > 
> > > > Taken together, it's clear that it's time to retire these additional MD5
> > > > implementations, and focus maintenance on the MD5 generic C code.
> > > 
> > > Sorry, for me it is not that clear. Even if MD5 is depracated we still have
> > > several applications that use MD5 for various reasons on our boards.
> > > 
> > > I ran the test on kernel v6.16 with following file:
> > > 
> > > # ls -l avion.au
> > > -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
> > > 
> > > With CONFIG_CRYPTO_MD5_PPC:
> > > 
> > > # time md5sum avion.au
> > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > real    0m 1.02s
> > > user    0m 0.01s
> > > sys     0m 1.01s
> > > 
> > > Without CONFIG_CRYPTO_MD5_PPC:
> > > 
> > > # time md5sum avion.au
> > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > real    0m 1.35s
> > > user    0m 0.01s
> > > sys     0m 1.34s
> > > 
> > > I think the difference is big enough to consider keeping optimised MD5 code.
> > 
> > But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
> > it has any effect on md5sum.  The difference you saw must be due to an
> > unrelated reason like I/O caching, CPU frequency, etc.  Try running your
> > test multiple times to eliminate other sources of variation.
> 
> md5sum uses the kernel's MD5 code:

What?  That's crazy.  Userspace MD5 code would be faster and more
reliable.  No need to make syscalls, transfer data to and from the
kernel, have an external dependency, etc.  Is this the coreutils md5sum?
We need to get this reported and fixed.

- Eric

