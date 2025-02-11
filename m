Return-Path: <linux-mips+bounces-7736-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F93A3141B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 19:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2EBA167B21
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 18:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12670262174;
	Tue, 11 Feb 2025 18:30:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4448262162;
	Tue, 11 Feb 2025 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298638; cv=none; b=Xz4S/5qYereUzeM26iV30b0SqK1LRAHWBXgWqAFXpTw1bloMujnUtkOU/zqjvUWsGxsXFNWCyKb7P+g6gGzZxIvHrZMLOMQ9qzeRIAUlV/vjd3VvPNuMe0ICu/1knZob5/Yl2kZsNFzocZOXSXd4HGMJpkkKVt5xGQUMg3gStBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298638; c=relaxed/simple;
	bh=tDM5G4GV+vmmkPwoRxuTiGq3yUtm5bGhMlIKryS1kus=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DGPxj8BZZlRySrOvvX1WODIhdXyYXyv0qKrkFAloJJHXFLrOXZ49ldwvtyad0Qhmf6noKUdlWlG5lrojUT0nkxKmwh0qtRxJds1Pua1hM2/ITiz2hB6FiTA9HMG60bvJ7CDv47mDX7Yy+xIv58a0kBAIOIg7AioWr8wxa254KJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0983E92009D; Tue, 11 Feb 2025 19:30:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 048FA92009C;
	Tue, 11 Feb 2025 18:30:33 +0000 (GMT)
Date: Tue, 11 Feb 2025 18:30:33 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Dmitry V. Levin" <ldv@strace.io>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, 
    Alexey Gladkov <legion@kernel.org>, 
    Eugene Syromyatnikov <evgsyr@gmail.com>, 
    Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, 
    Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] mips: fix mips_get_syscall_arg() for o32
In-Reply-To: <20250210113442.GB887@strace.io>
Message-ID: <alpine.DEB.2.21.2502111530080.65342@angie.orcam.me.uk>
References: <20250210113442.GB887@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Feb 2025, Dmitry V. Levin wrote:

> The first assertion is fixed for mips o32 by using struct pt_regs.pad0
> instead of get_user() to obtain syscall arguments.  This approach works
> due to this piece in arch/mips/kernel/scall32-o32.S:

 I've had a look now and I can see what's going on here.

 The thing is we're trying to access another task's context and obviously 
dereferencing $sp obtained from it is not going to work via get_user(), 
because that just peeks at the current task's context.  It often does not 
crash, because the default user stack always gets assigned the same VMA, 
but it is pure luck which we wouldn't have if the stack was switched (via 
setcontext(3) or however) or say a non-default process's thread peeked at, 
and in any case irrelevant data is obtained just as observed with the test 
case.

 We ought to be using access_remote_vm() to retrieve the other task's 
stack contents, but given that the data has been already obtained and 
saved in `struct pt_regs' it would be an overkill.

 So I think your change is actually the correct thing to do, but please 
let's not abuse a struct member called `pad', the name of which indicates 
its contents are not supposed to be of any use.  I have therefore posted a 
preparatory cleanup[1].  May you please rebase your patch on top of that 
and also update the change description so as to reflect the findings?

 Thomas, can you please apply my cleanup soon and ahead of Dmitry's change 
so as to make things easy to proceed with?  Or otherwise let me know what 
works for you best.

 Also I have a suspicion this stuff ought to be backported, but I guess it 
can be decided later on.

 Thank you for your patience.

[1] "MIPS: Export syscall stack arguments properly for remote use", 
    <https://lore.kernel.org/linux-mips/alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk/>

  Maciej

