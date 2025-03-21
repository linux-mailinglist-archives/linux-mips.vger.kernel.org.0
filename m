Return-Path: <linux-mips+bounces-8254-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB56A6BA30
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 12:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03EC54830A0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 11:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9735922370A;
	Fri, 21 Mar 2025 11:55:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C437494;
	Fri, 21 Mar 2025 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742558149; cv=none; b=WwfAz89BFfiiWUi3KDUkjhTkiUh5oEgqju8GMYv+QDh7cdE4BATCYCCOVHYnrcckVBYujJ1sddDW9Hhf1hWWdTrCpr+vp9ZyykUPkZMos/gLVOb2QdJ83JR0jQHa3/IWc9AQxg9PpbhFdO7M+p0OnJEZ0dFikovcRlZuQjRYNv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742558149; c=relaxed/simple;
	bh=1E2Xb7jgzpRaAx7PtXU7lnXcqXtQgD+02+UuHal/ZG8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lR6ms/tqDx1QX7AENYBJTwW4Xz1mwOmSlaWY5oVGLzlZdz0ge2CoIQBWWgJdVbJsoayJ30+dLQrHujf4afZvmCov8BASoUE7nA8NHUYsIpSEZU20nU3yrINNfbQ1Tj24lv7Y6xyt/tWqP04vrdUOCxwr7LvGU08tn0HiwuCKvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7372F92009E; Fri, 21 Mar 2025 12:55:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6FFF292009D;
	Fri, 21 Mar 2025 11:55:45 +0000 (GMT)
Date: Fri, 21 Mar 2025 11:55:45 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Marco Crivellari <marco.crivellari@suse.com>, 
    Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <Z91K46zSMPzvjzvp@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2503211154380.35806@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <Z9qlW81QikxeVzQa@alpha.franken.de> <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de> <Z9rjZf0ZT7iejVlA@alpha.franken.de>
 <CAAofZF7XPm+tzPpwAPu0oDZem+EOVY18oAbVwAXzkGmtstnBQg@mail.gmail.com> <Z90zebpJE4Y9SbkK@alpha.franken.de> <CAAofZF50P0+c6QbNxzEunwbDGUZEZpKM8wa2dBYXAVFFYGq-hA@mail.gmail.com> <Z91K46zSMPzvjzvp@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Thomas Bogendoerfer wrote:

> > > > +       /* Check idle interrupt region size. */
> > > > +       .ifne   __r4k_wait_exit - __r4k_wait - 36
> > >
> > > I have to say, that I prefer my .if statement, since this clearly spells out
> > > the comparision in the expression. Is there a reason for your version ?
> > 
> > Sure, let's keep your version.
> > Can we use the "error" message above? (""Idle interrupt region size
> > mismatch: expected 36 bytes."").
> > Or at least something similar, I think it is easier to understand the
> > reason for the error. What do you think?
> 
> the error message works for me :-)

 I'm glad seeing this being sorted properly, thank you!

  Maciej

