Return-Path: <linux-mips+bounces-8233-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D2A691F1
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 15:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61213AD22E
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 14:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4DA1C5D6F;
	Wed, 19 Mar 2025 14:42:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5D012C499;
	Wed, 19 Mar 2025 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395368; cv=none; b=DGq2QoBoBInnuha7owvL2n9IOLjX75TppDjUy9eSE+4Z1jxRO6hDyfZjKRMS9xFxj5pI0Yore4/6zFKLkJMiFl3uzmNbwIbucFVgyCFGeOuSKugxKmXzWtASHhAOZ5bz3oKJm1Anw1pd0t07LnUyHY6wE8QQBsn1TRXWZGpEjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395368; c=relaxed/simple;
	bh=zgGAJx5LzyoBPs1GPTnWGzlUqNKXLOEmJPCGxLyryZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsC/rjVaKmxTpBtxhH+OM5bLsLx8GP+KE/6nxrAxSdASzFfCnhebxPWFKs2hwPfTXGDm7HUHrvO/j9RmNsaTgeMXBZO9iCWAUTUPM1iDqXFr1Q3G4dFZCkcJ1ltXCgDWZhJDp61Xfj3zDDWFSgByRIv7tk33DpECru9feZuc5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tuucx-0007V1-00; Wed, 19 Mar 2025 15:42:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B8A15C0135; Wed, 19 Mar 2025 15:42:16 +0100 (CET)
Date: Wed, 19 Mar 2025 15:42:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z9rXyGQZFSIgvQrh@alpha.franken.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rPVHop5Ob5nAdc@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9rPVHop5Ob5nAdc@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>

On Wed, Mar 19, 2025 at 03:06:12PM +0100, Frederic Weisbecker wrote:
> Le Wed, Mar 19, 2025 at 12:07:07PM +0100, Thomas Bogendoerfer a écrit :
> > On Sat, Mar 15, 2025 at 08:40:02PM +0100, Marco Crivellari wrote:
> > > MIPS re-enables interrupts on its idle routine and performs
> > > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> > > 
> > > The IRQs firing between the check and the 'wait' instruction may set the
> > > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > > interrupting __r4k_wait() rollback their return address to the
> > > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > > again before going back to sleep.
> > > 
> > > However idle IRQs can also queue timers that may require a tick
> > > reprogramming through a new generic idle loop iteration but those timers
> > > would go unnoticed here because __r4k_wait() only checks
> > > TIF_NEED_RESCHED. It doesn't check for pending timers.
> > 
> > can you give a commit ID, when this change got introduced ?
> 
> That would be:
> 
>      Fixes: c65a5480ff29 ("[MIPS] Fix potential latency problem due to non-atomic cpu_wait.")

hmm, so even then checking TIF_NEED_RESCHED wasn't enough  (we are talking
about 2.6.27) ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

