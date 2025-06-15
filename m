Return-Path: <linux-mips+bounces-9312-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA99ADA307
	for <lists+linux-mips@lfdr.de>; Sun, 15 Jun 2025 20:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78CA13ABD44
	for <lists+linux-mips@lfdr.de>; Sun, 15 Jun 2025 18:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E81627C175;
	Sun, 15 Jun 2025 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBPtFxhS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1127BF95;
	Sun, 15 Jun 2025 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750013226; cv=none; b=nQBKTC5rc6Kk+M+QzUWUM6Ug9p6LJ3fiqkqd03pbnBca/5pB7iNXmqxPtiCTeFjh3vD6PmDQDgYecXjTOulj99KpMeBDMP4AWBWTOopOHgkbNaSCr4CPtv3orxz9exSZ3+ZeU+2EJyqATkmUk6obyVPPwaidoHjs1WL5XyEfgZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750013226; c=relaxed/simple;
	bh=5b3uNryP074LRzS0e8lRw21Ibl8znCFGJk8dG32zXQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2w4MYW2vJCtPQcnzMs8C37/SmewTwzXzd6Sd6TVE89eHo4yzn8VS6qFmYA+TqZ9vU2iiqn/ks+oUR7AbCZxjpAaua8eTLNAfcPZ4S8XQLn0QkbNZS74amdp/p6Zh4VV4TmHcK6hFAxC6ltVLxX1CNcwrzmGhGWrM1Delb+Ldk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBPtFxhS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA633C4CEE3;
	Sun, 15 Jun 2025 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750013226;
	bh=5b3uNryP074LRzS0e8lRw21Ibl8znCFGJk8dG32zXQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBPtFxhSJMUXxmaT/KxQ35nsgIcXL/g9ImLlDTQb++SUrhRAv5BrYEyhMzlivQTnA
	 b5r6qgTgn/HKGqJKv8iIJZIrBrbSU8quRUHzUx02dyadCT/fXANUmLE4BYuuyerOk5
	 syWDFFmKz8D7g32RagfLqYXxRSTC1HcHir74l/R1J5sHSjE1peKYYs60gZCL3eQPFb
	 cTq1v0r+DKJnH6n9ApPtKk3wepQy940tpEOG1qlya7EY3CViKAzbLFJr2wnU1AGoVG
	 WMCEPfl0m7mcUWeu5p5Yg2rrbz49hc8W2AJ7VRhT2wOOyNch3zWfyN/nLXRv7u5Cna
	 suPZqRSuvlvJQ==
Date: Sun, 15 Jun 2025 11:46:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
Message-ID: <20250615184638.GA1480@sol>
References: <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol>
 <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>

On Sun, Jun 15, 2025 at 09:22:51AM +0200, Ard Biesheuvel wrote:
> On Sun, 15 Jun 2025 at 05:18, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> ...
> > After disabling the crypto self-tests, I was then able to run a benchmark of
> > SHA-256 hashing 4096-byte messages, which fortunately didn't encounter the
> > recursion bug.  I got the following results:
> >
> >     ARMv8 crypto extensions: 1864 MB/s
> >     Generic C code: 358 MB/s
> >     Qualcomm Crypto Engine: 55 MB/s
> >
> > So just to clarify, you believe that asynchronous hash drivers like the Qualcomm
> > Crypto Engine one are useful, and the changes that you're requiring to the
> > CPU-based code are to support these drivers?
> >
> 
> And this offload engine only has one internal queue, right? Whereas
> the CPU results may be multiplied by the number of cores on the soc.
> It would still be interesting how much of this is due to latency
> rather than limited throughput but it seems highly unlikely that there
> are any message sizes large enough where QCE would catch up with the
> CPUs. (AIUI, the only use case we have in the kernel today for message
> sizes that are substantially larger than this is kTLS, but I'm not
> sure how well it works with crypto_aead compared to offload at a more
> suitable level in the networking stack, and this driver does not
> implement GCM in the first place)
> 
> On ARM socs, these offload engines usually exist primarily for the
> benefit of the verified boot implementation in mask ROM, which
> obviously needs to be minimal but doesn't have to be very fast in
> order to get past the first boot stages and hand over to software.
> Then, since the IP block is there, it's listed as a feature in the
> data sheet, even though it is not very useful when running under the
> OS.

With 1 MiB messages, I get 1913 MB/s with ARMv8 CE and 142 MB/s with QCE.

(BTW, that's single-buffer ARMv8 CE.  My two-buffer code is over 3000 MB/s.)

I then changed my benchmark code to take full advantage of the async API and
submit as many requests as the hardware can handle.  (This would be a best-case
scenario for QCE; in many real use cases this is not possible.)  Result with QCE
was 58 MB/s with 4 KiB messages or 155 MB/s for 1 MiB messages.

So yes, QCE seems to have only one queue, and even that one queue is *much*
slower than just using the CPU.  It's even slower than the generic C code.

And until I fixed it recently, the Crypto API defaulted to using QCE instead of
ARMv8 CE.

But this seems to be a common pattern among the offload engines.
I noticed a similar issue with Intel QAT, which I elaborate on in this patch:
https://lore.kernel.org/r/20250615045145.224567-1-ebiggers@kernel.org

- Eric

