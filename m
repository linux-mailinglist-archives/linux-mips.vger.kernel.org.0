Return-Path: <linux-mips+bounces-8253-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB79A6B9C0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 12:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8BCB3BB09B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 11:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F802236E9;
	Fri, 21 Mar 2025 11:18:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADA0221548;
	Fri, 21 Mar 2025 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555901; cv=none; b=orlCpDk3ai+UzxoUF4ZBhKmr4Mn4g13RKun88XEM9+oTMOdhnUpkMOdshwY3NVTx2I1M9OZwNEMVAftXVTIDapUZTvXPEh3QghLFgKN5IWIsjIqLy+OlhcDjlG+sEZTcWXIQhvZYRnBUsAn/SGwzoMJ5mnm85lABdCffgfZtScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555901; c=relaxed/simple;
	bh=adAJURnTnEkt52SYXoMg4r2H1sce2Lk4TMB3Lpgjnuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2/GG0MxxsW+KEorlHN5DbJGZgqZqmJef2edNOomUADfHSg9+4CWysP+VTO9FFz6y1OoOyjhrE7D/1s2PVXiB0F4DwQkzUS19E5Oc1X9UTd8wtxD8ZDIGnJJRdWTxqKHwz9pk4ijdlGaxiW3NfNDDpYNp/LezAUAlgl5qlpbhl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tvaOE-0007yE-00; Fri, 21 Mar 2025 12:18:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 27456C0135; Fri, 21 Mar 2025 12:17:55 +0100 (CET)
Date: Fri, 21 Mar 2025 12:17:55 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z91K46zSMPzvjzvp@alpha.franken.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
 <Z9rjZf0ZT7iejVlA@alpha.franken.de>
 <CAAofZF7XPm+tzPpwAPu0oDZem+EOVY18oAbVwAXzkGmtstnBQg@mail.gmail.com>
 <Z90zebpJE4Y9SbkK@alpha.franken.de>
 <CAAofZF50P0+c6QbNxzEunwbDGUZEZpKM8wa2dBYXAVFFYGq-hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF50P0+c6QbNxzEunwbDGUZEZpKM8wa2dBYXAVFFYGq-hA@mail.gmail.com>

On Fri, Mar 21, 2025 at 11:44:10AM +0100, Marco Crivellari wrote:
> On Fri, Mar 21, 2025 at 10:38 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > do we really need that for a symbol local to that file ?
> 
> Not really, I can use the label directly.
> 
> On Fri, Mar 21, 2025 at 10:38 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > > +       /* Check idle interrupt region size. */
> > > +       .ifne   __r4k_wait_exit - __r4k_wait - 36
> >
> > I have to say, that I prefer my .if statement, since this clearly spells out
> > the comparision in the expression. Is there a reason for your version ?
> 
> Sure, let's keep your version.
> Can we use the "error" message above? (""Idle interrupt region size
> mismatch: expected 36 bytes."").
> Or at least something similar, I think it is easier to understand the
> reason for the error. What do you think?

the error message works for me :-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

