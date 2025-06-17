Return-Path: <linux-mips+bounces-9357-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96130ADDCCA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 21:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 408E217F554
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 19:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21722E3B09;
	Tue, 17 Jun 2025 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpuuywa+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87789237180;
	Tue, 17 Jun 2025 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190369; cv=none; b=IbsmmhpS0g7abPSIM/7W8lVMxFg+zXCH7+Z6Qm5Pq3xrRm59iWJMbXaPJcih6jdYIV4gMausMYkRzrf5xib67fgg7k5VQK+SI4gFlNrluVWQL8lfDL7s+M36pZtB17cwBORVStFr0V/NyWqPqJydP6QSY0C/T50ipUico6L9AWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190369; c=relaxed/simple;
	bh=sVM19GCCKQhRp7EuGvOjAU8kPQ/rNAQiUgZpz7qYa9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Imx5qijM2bqwO5Lnsqy5AWScFOYGnf91TRdcUoaCKfYY1Qe3jDW+22IjPFKOuWl/etc2myAXSI8D5qG7q8t5rW4JsbUhz6DyFSKKwgwcnfqarKzZ/r/IIagx8ytQyuxUjqCy5++8Sem+ln1TdAMfCjset46ktvCNpbI8cH9yl1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpuuywa+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D714C4CEE3;
	Tue, 17 Jun 2025 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750190369;
	bh=sVM19GCCKQhRp7EuGvOjAU8kPQ/rNAQiUgZpz7qYa9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpuuywa+IXfUA58X/baAFYHnGhet/xCyxu6nUDvANGgktcIrxSAm0C3qyjPft1OJ8
	 /y4dJgVEs9CvsoBUi7zm41P2K5DVBQGFHkF63SMXLVtBPNg+RNoCDRhykPgB/cCb/I
	 0GUs7QVKT7dzc10B7nKJBKSa+HGdx8xUpToVFPL/pn9lQnclWua9imiZaTuOFliWkK
	 QJ3Lk7X8LqghgjWhlMoEew05m6Q36dKnoSXfGrVIyruIKgN0nV1Ro/IMSMFobGM2Ss
	 yUn50Tvu5YRZwURvrxaD4PLtRZwUsym+zN1F6jHXG/OF7wTlnMynGIiEcyupVN8L2t
	 rC07wEKDje+cg==
Date: Tue, 17 Jun 2025 12:58:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617195858.GA1288@sol>
References: <20250616014019.415791-1-ebiggers@kernel.org>
 <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com>
 <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>

On Tue, Jun 17, 2025 at 12:43:54PM -0700, Linus Torvalds wrote:
> On Tue, 17 Jun 2025 at 12:22, Eric Biggers <ebiggers@kernel.org> wrote:
> >>
> > The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
> > has a negative diffstat once you subtract them.
> 
> Yes, the patches were separate, but my point stands.
> 
> Let me repeat that part of the email since you seem to have missed it:
> 
> > If I see a pull request that only adds new tests, it's a no-brainer.
> >
> > If I see a pull request that only re-organizes the code and the
> > diffstat just just renames with some small updates for new locations,
> > it's a no-brainer.
> >
> > If I see a pull request that does both, it's a pain in the arse,
> > because then I need to start to look into individual commits and go
> > "which does what".
> 
> IOW, I really prefer pull requests to do clearly separate things too
> when we're talking re-organization. Or at the very least spell things
> out *very* clearly.
> 
> Otherwise I have to waste time just to go split things out _anyway_.

Again, the tests depend on the code they test being added first.

I could do two pull requests, the first with all non-test code and the second
with all test code, where the second depends on the first, i.e. it will have the
last commit of the first as its base commit.  Is that what you want?  Or are you
misunderstanding and thinking the tests are independent and apply to current
mainline?

- Eric

