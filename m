Return-Path: <linux-mips+bounces-9355-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B004BADDC2A
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 21:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975364024CE
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 19:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB78F25BEFC;
	Tue, 17 Jun 2025 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axo6SFaY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAF21771A;
	Tue, 17 Jun 2025 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188134; cv=none; b=L7vQlpt42uCGrgV/q5tYcEQNLIrH+YUs8LlzeIkTSKth8SyYt3nnV3QdWZEWsDfSe4YBVYyQYG81B3EKGH/wwR8aqOtQiShqEfM0rp3gtBlI2k5StYFYrYLQi6oIXjaQDBI1fFEdAcwvRTkP6k28UGnSeD0ueUKrM/JvJs0Dzik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188134; c=relaxed/simple;
	bh=DIeweH4tJgRpIMI6A93lfPzWuHCR0d9IDLxqeAGEsJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZD+Uz2NUjcG4H4KowDsTtRE3V/AJVa6ym0CQWsePW++OCdIClFrkCxS7bKi2BWTEmREhqUu0DyKx2/UbAA8SCfGaAflxt3l/ri8O+pZGQ2xhUDqV3XmQO0x51SqzK8lrf+F1DLWhwf97qGHYDqqmfzfUX8sai1UbLzNxZ2gOZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axo6SFaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA501C4CEE3;
	Tue, 17 Jun 2025 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750188134;
	bh=DIeweH4tJgRpIMI6A93lfPzWuHCR0d9IDLxqeAGEsJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axo6SFaYaKEZtTtcZaKVei2M5O0lKIXRPx4u/MNnAOO+0bF2HOtITPs3y7H0ALP4g
	 KKK04dXoQRHYOgBrwNnMdSyZhnWbSk/GagXcltvVYEn6s0k7veB4uGMXHXE0/A0gkv
	 D/tZbxEYdExfyODv0Ie0mWcHFrKzFSNgt4yu1FRZj9AeiKuZzRcdrojpBJv5fIsnGr
	 IPNAszMnDgJtoFmYVULSx4B/oC7/P/yN5TuUbsv9bhjHsDMcMCDX8r+PvYGhgeNLAv
	 ESPGFAZuTwnWs8tzMkLgW+I1oOtKdoGuqYwO51+lcR2vsGfO0kPfoaBjSRUPHTT2So
	 t99/eHv/dZ9NA==
Date: Tue, 17 Jun 2025 19:22:12 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617192212.GA1365424@google.com>
References: <20250616014019.415791-1-ebiggers@kernel.org>
 <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>

On Tue, Jun 17, 2025 at 11:29:15AM -0700, Linus Torvalds wrote:
> On Mon, 16 Jun 2025 at 23:05, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > An additional note on testing: [..]
> 
> Talking about testing - when adding test scripts, can you do it as a
> separate thing entirely - either before or after?
> 
> As it is, this code movement is hard to judge just because the stats
> are all messed up with new tests:
> 
>  77 files changed, 4012 insertions(+), 1756 deletions(-)
> 
> that's 2k+ new lines of code that pretty much entirely hides the
> question of "did this code movement result in a simpler / same / more
> complex end result".
> 
> So in general, I'd really prefer big re-organizations to be *separate*
> from new code changes.
> 
> It's just a pain to review renaming when it's mixed up with other
> changes - whether renaming variables or whole files.
> 
> And that's as true on an individual commit level (we try to avoid
> renaming things *and* making other changes in one go) as it is on a
> pull request level.
> 
> If I see a pull request that only adds new tests, it's a no-brainer.
> 
> If I see a pull request that only re-organizes the code and the
> diffstat just just renames with some small updates for new locations,
> it's a no-brainer.
> 
> If I see a pull request that does both, it's a pain in the arse,
> because then I need to start to look into individual commits and go
> "which does what".

The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
has a negative diffstat once you subtract them.

(And most of the positive diffstat in the tests is generated test vectors.  The
rest is mostly code that I'll reuse later in tests for other hash functions; it
just gets blamed to this one because it's the first one.)

I'd really prefer to keep testing as a first-class citizen.  Tests should be
contributed along with the code itself.

And the point of this patchset is not just "code movement", but rather adding a
library API, including documentation *and tests*.

Later, I'll be converting various in-kernel users to use that API, just as I've
been doing for crc32 and sha256.  It's already been shown that the
"librarification" works well and is much simpler than the old-school Crypto API.

If you really want patches 4-5 in a separate patchset that's based on this one,
I can do that.  Ultimately, the result would be the same.

I think your request for there to be a separate "tests" pull request is a
non-starter, though.  That would imply separate git trees, and we then wouldn't
be able to land tests at the same time as the code itself.

- Eric

