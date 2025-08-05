Return-Path: <linux-mips+bounces-10027-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E343B1B917
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 19:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C3917D818
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 17:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3341F8EEC;
	Tue,  5 Aug 2025 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRYG99sc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606F1C01;
	Tue,  5 Aug 2025 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414217; cv=none; b=QFSwtLPnX8Yp+BlVAUa6+L1yHLiwsUa7vv6zsYpJRKy2gJF7gqaF7n4VhkuLOVv31BjiksK4DiDYAYfA8ubpifkRwATUA8NxfXR1LvJpvKjzf4fZiG7pssLukKThwJSDp/bpH6fiNs/EH4WcUvy2HAGHi332v4uFGHohaIeAjGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414217; c=relaxed/simple;
	bh=YfPLugcY/4DNYLvJWGV+HUVg0Siur4tr4bhOtIjPq3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hblrzJmXVpwYiKZQ3gidYAaQEBHDl/20OmcnbQG6ehJu3kJCrF4jHhmektoG0rY4qffdEHWGU1KdkCX3i7jYVhABr+5wBkhXb8O3+9rSUqWRmnqIp6F2uca4q2cgyZcPHvwph7/p4dfLyi5tVbyJbRv693hqEcn3WCiOfM/vzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRYG99sc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762CBC4CEF0;
	Tue,  5 Aug 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414216;
	bh=YfPLugcY/4DNYLvJWGV+HUVg0Siur4tr4bhOtIjPq3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRYG99scX5PpcPD92+lXtvbuNPsFs1I6wKB5/PXi/6ldu2DQpZe+ntBllKw1dCqu0
	 vztlgCn9/cBqwNnXtFy8Q91/UQlNGVdl/iqdUNSoOqhbryjPDerQBCxto3nwMfh6Uw
	 xY5kn00Yt0nPi71vufuyf74O2qgJhSKRtDhcV80MMAVGMIzU6bjyX43oroScX1yKmp
	 B3v/Fq+/VCem8zYFbOPxA+GPZ+QSdQine5wA9kEprm9h0V6fRk2qjFhmDILnPWWOqW
	 GSZV4xr71jAJtUnusPCPxeKZZ2hChxgvS6z9PbfRVR8IPA58TMq5pEtz5ZrMhteDPp
	 Pfob2koRbbVJA==
Date: Tue, 5 Aug 2025 10:15:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: Crypto use cases
Message-ID: <20250805171558.GC1286@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
 <20250805045846.GA10695@sol>
 <854efc41-c40f-46c9-b8ae-84bda9d17faa@hogyros.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <854efc41-c40f-46c9-b8ae-84bda9d17faa@hogyros.de>

On Tue, Aug 05, 2025 at 04:17:49PM +0900, Simon Richter wrote:
> Hi,
> 
> On 8/5/25 13:58, Eric Biggers wrote:
> 
> > What does this have to do with this thread, which is about the PowerPC
> > optimized MD5 code?
> 
> Hence the new subject. It is still related to removal of code, but asks
> about the bigger picture.
> 
> The code removal changes you've been pushing lately absolutely make sense in
> the context of "the crypto subsystem is for internal use by the kernel, and
> all known users will only ever submit small work items."
> 
> However, there is also the userspace API, and hardware accelerators also
> register with the crypto subsystem, so it is *also* the way for userspace to
> use specialized hardware.
> 
> If these are separate, then it makes sense to acknowledge that the kernel
> will never use asynchronous transforms for anything, simplify the internal
> API, and move all the hardware support to a separate registry that is for
> userspace applications only.

I think you're grouping together different things that aren't actually
very related.  For example this patch series proposed removing some
software code, not async drivers.  The only async driver I removed
recently is one of the crc32c ones.

Doesn't lib/crypto/ largely accomplish what you're thinking of as
"separate registries"?  As we migrate more in-kernel users to
lib/crypto/, the old-school crypto API becomes more focused just on
accomodating AF_ALG users.  However, that is, and will continue to be, a
long process.  In the mean time we still have many in-kernel users of
the old-school crypto API to decide what to do with.

> I'm also not convinced that fscrypt cannot ever learn to submit a single
> large request or a large batch of small requests if it is asked to decrypt a
> large file, so in my opinion the common registry makes more sense.

It's certainly never going to be the entire file or a single batch.
That's just not how filesystems work.

As for offloading entire I/O requests, fscrypt already supports that,
just for inline crypto engines instead of the old-school separate ones.
Inline encryption is fundamentally much more efficient.  The same
efficiency can't be achieved with a separate engine, even with a large
batch.  If people would like to continue to explore that approach
anyway, they're free to do so, but it's not a promising approach, at
least not on any of the platforms I examined.  (And pointing to
irrelevant data, like for compression, is not helpful.)

> Making sure that hardware support actually works and is tested is the
> responsibility of the driver and port maintainers. We understand that
> subsystem maintainers do not have all the hardware available, but the same
> goes for all the other subsystems -- the DRM maintainers routinely merge
> drivers for hardware they do not own, because the changes come from people
> who *do* own the hardware, and have tested the changes.
> 
> The latter is a project management issue, mostly: if there is a lack of
> working relationships with driver and port maintainers, then that needs to
> be fixed, not assumed to be an unchangeable part of the environment that
> technical decisions are made in.

This significantly understates the challenge that exists with a large
number of drivers, including orphaned drivers and architectures, as well
as the high standard of correctness that cryptography code needs to have
vs. more everyday device drivers.  And also the fact that async offload
drivers are fundamentally much harder to get correct than software code.
The odds are really stacked against everyone here, and I think calling
it a "project management issue" largely misses the point.

- Eric

