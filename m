Return-Path: <linux-mips+bounces-12748-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B1DCF2D7F
	for <lists+linux-mips@lfdr.de>; Mon, 05 Jan 2026 10:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EC09301294A
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jan 2026 09:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E881731A818;
	Mon,  5 Jan 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gu4sRzEp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B+u12E+A"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6A314B6F;
	Mon,  5 Jan 2026 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606215; cv=none; b=u2XX1jcECFbQyDieEipu153oWu4TlVzwWiUGT6te/s6TvVbgOpEytmxlYuQDRVLmi+mNqbji4blqcbS+SZxdEeOo2AIr6cvEMS9kdm5x2kce8Br6bVJvAzQRmWZQxycPMN/KWJwYX0WbLaWXtPHKSjy3t5wbcPLee+IftK3IJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606215; c=relaxed/simple;
	bh=sIGYXcNpIMuRmYce9aAgStTekNnJ5WvGFwAHDTrBa44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKlurm252Hl0T7PV7xlx2OCxCOjcQmtvgqWNAYQy3EH2ZrAIAwW6m2iV5qWYWUgr+bcJS1eb0J9WBGe10OY7JFDbsfvkBIZksnP5bSS07WjW1f64tul6dfMKcfhO6Z6MASoH8w7FCeOT96tspxKTwyF19Dlp7aPrCz4wnVFnseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gu4sRzEp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B+u12E+A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 5 Jan 2026 10:43:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767606211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4gErALjI/ldsk6WYp0LkB8yJYSYBapy7ReHWjdiv+Q=;
	b=Gu4sRzEpcujpgBV8yn3pimbCxnPhoGFbXRtuhCaMt/3aalLPFw4WjQI7p55yCxFnItPiSg
	HIgtetFMCCgJRxrmzALR73x/6T6dJ0A3ns5scF6DZE2WG51IWu5FqTIrewiReOcPRTfkuG
	sVDrXb7gfnR4EHF7kECVv0+mabiOgNIegeBxcLvJ7cYQESjSPi5awF1DYAUalIpPSQKr6x
	1VQ5SQ10kKPMUSmdp7IGGb2Yf4+vzY5w9YObUHXONZ3M0VpPl8gm4DnjWBKZQ7yiDUhadT
	p6pira0WcbqdW7EGJF+CjIxBfJ1ZDmi4s+YI0GnMhJd5yJ1Ftw5LdxOWl0VT4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767606211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4gErALjI/ldsk6WYp0LkB8yJYSYBapy7ReHWjdiv+Q=;
	b=B+u12E+AfiXycNYqS8pcm9zU4hKuYlDMBhPauRHlhS/4AFt8KRSYv9Pb3My3qEPWuIAnYv
	pRi7a5aPv4LPXBCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <20260105100507-14db55e3-aa71-48bf-a6ac-33b186bd082f@linutronix.de>
References: <20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de>
 <alpine.DEB.2.21.2512310212490.14570@angie.orcam.me.uk>
 <20260102083410-1d87a83f-875a-444f-8b43-4abbce317b5a@linutronix.de>
 <alpine.DEB.2.21.2601031930080.14570@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2601031930080.14570@angie.orcam.me.uk>

On Sat, Jan 03, 2026 at 08:36:46PM +0000, Maciej W. Rozycki wrote:
> On Fri, 2 Jan 2026, Thomas Weißschuh wrote:

(...)

> > > Also does the n32 ABI have to be factored in, since IIUC this 
> > > stuff is about user programs?
> > 
> > It can be added, but I don't think it makes much sense.
> > It would only be used if CONFIG_MIPS32_N32=y (which is non-default) and if
> > the toolchain which has no n64 libc, but does have a n32 libc.
> > This seems unlikely to me, but let me know if I am mistaken.
> 
>  My observation over the years has been that n32 has become the industry 
> standard for 64-bit MIPS configurations; it's the default arrangement too 
> for the GNU compiler for `mips64*-*-linux-gnu' targets in the absence of 
> explicit `--with-abi=64' `configure' option, and no multilib support may 
> have been enabled in the compiler (which is not required to build Linux, 
> as 64-bit MIPS GCC and binutils are always able to produce code for all 
> the ABIs regardless).

(...)

>  It's not clear to me offhand how the infrastructure concerned here is 
> used, but it may make sense to default to either NewABI and resort to the 
> other if the default turns out unsupported in a given environment.  This 
> for a change I cannot decide on based on information I've gathered so far.

This infrastructure is currently used for example programs which are part of
the kernel tree. I also want to extend it to test programs [0].
While CONFIG_MIPS32_N32 is optional and off by default on the kernel side, it
seems to be enabled by all the relevant defconfigs. Given that it is the
default on the toolchain side, I agree that it is probably the right choice.

[0] https://lore.kernel.org/lkml/20250717-kunit-kselftests-v5-0-442b711cde2e@linutronix.de/


Thomas

