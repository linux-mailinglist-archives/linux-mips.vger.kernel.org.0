Return-Path: <linux-mips+bounces-4332-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88626931650
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 16:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3244F1F2227F
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 14:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8869218C32B;
	Mon, 15 Jul 2024 14:02:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B19180A70;
	Mon, 15 Jul 2024 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721052126; cv=none; b=LsukFUycVUBYatlKtlPZuSnAHDY+r8uIvOvYfRIdyuJCZqYtEoYhn8cbBqme3/LNrp7Kj1+xgSH1G7qIO5Pxv54h8bDg1vK46TtkKnIiKbSt9rKF/LqEjZALGqtzop4dkZurJ4++tt45N8iAScXEfJfTLws8FOWuozwEtIa9BRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721052126; c=relaxed/simple;
	bh=B4E4p8BrMrhrC5orvlrwTPX8j2UKBdQTzuEZehStOlw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z4gWdg2OnIxvUbGaCvDiPZ/n+2bjmvUdUb/5VtE61xgOed7TR+4fMc4TCbH8ykk5PSZ5rLcHiiYeHOmhMaZ1I8xuq7EGsGkBpRxN1cxljZG8h52SX2ScMkcCGsiW5CfzFXYm9Q7tncypzGeSqDcaiIvQc42Kgq2OY2Crwvy78GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 045B892009D; Mon, 15 Jul 2024 16:01:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id F103C92009C;
	Mon, 15 Jul 2024 15:01:58 +0100 (BST)
Date: Mon, 15 Jul 2024 15:01:58 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
In-Reply-To: <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2407151422040.51207@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com> <Zn1FuxNw2CUttzdg@alpha.franken.de> <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com> <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk> <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de> <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com> <Zo457UgAkhbAgm2R@alpha.franken.de> <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk> <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
 <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk> <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com> <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk> <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com> <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
 <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Jul 2024, Jiaxun Yang wrote:

> >  I don't know what prctl(2) has to do with this.  If you don't implement 
> > this part, then your change will cause Linux to behave inconsistently and 
> > therefore I'll have to NAK it.
> 
> I think your concern was regarding user space application needs to set NaN2008 bits
> at runtime?

 Nope, following the objective of your change: the EF_MIPS_NAN2008 ELF 
file header flag instructs the kernel to choose between hardware and 
emulated hard float and that's not supposed to change later on throughout 
the life of the program, because it's not something the program can do 
itself, because writes to FCSR.NAN2008 are ignored by hardware.  And it's 
not a functional regression, because flipping FCSR.NAN2008 isn't allowed 
by hardware concerned anyway, we just want to have it consistent including 
the debugger interface.

> >  It's not much to do anyway, as I have prepared `ptrace_setfcr31' already 
> > to handle masking correctly, so all you have to do is to set the mask as 
> > required for the right thing to happen.  I shouldn't have needed to point 
> > you at it though, as that code is easy to find.
> 
> I think I got your point, will try to implement it.

 Thank you.

> >  This doesn't matter either, as your change only addresses the case where 
> > FCSR.NAN2008 isn't writable anyway, which is the sole reason you want to 
> > switch between native hard float support and emulation, doesn't it?
> >
> >  In fact where FCSR.NAN2008 is writable your new mode has to be equivalent
> > to "ieee754=strict", because then there is no need to trigger emulation 
> > for either NaN mode.  Please do verify that this is the case.
> 
> This had been verified with perf math-emu counters to ensure no unnecessary emulation
> is triggered.

 Thanks.

> >  That doesn't matter for us here (and I have a bad suspicion anyway), but 
> > the Debian team is of course free to do what they want here, the GNU GPL 
> > applies.
> 
> We care about our downstream users, don't we?

 There is a balance for us to keep.  Requests made have to be reasonable
and code contributed has to be architected well and meet quality criteria.  
Every change carries its associated cost and especially with the limited 
manpower available we can't afford having a technical debt created.  Any 
unclean piece of code accepted will strike us back sooner or later.

> They asked me to help and that was my solution. I sincerely want to get this change upstreamed
> to cover some downstream use cases.

 If it's your own genuine from-scratch implementation, then I have more 
faith in it.

> I don't know what theory do you have here, but that's all stories behind.

 I have seen odd requests and code changes stemming from embarassing lack 
of understanding how things work with the MIPS architecture.

> >  And also they can always use the "nofpu" kernel parameter to run their 
> > verification.  I used it for mine back at ImgTec before 2008 NaN hardware 
> > was available, also to verify emulation, which I wrote too.  Perhaps that 
> > is also the right solution for Debian actually?
> 
> I'll suggest to them, thanks.

 I note that it's been like this since 2015 and it has been documented:

	ieee754=	[MIPS] Select IEEE Std 754 conformance mode
			Format: { strict | legacy | 2008 | relaxed }
			Default: strict
[...]
			The FPU emulator is always able to support both NaN
			encodings, so if no FPU hardware is present or it has
			been disabled with 'nofpu', then the settings of
			'legacy' and '2008' strap the emulator accordingly,
			'relaxed' straps the emulator for both legacy-NaN and
			2008-NaN, whereas 'strict' enables legacy-NaN only on
			legacy processors and both NaN encodings on MIPS32 or
			MIPS64 CPUs.

(see the part following the last comma in particular).  It usually makes 
sense to read documentation and I'd expect MIPS Debian port experts to do 
it from time to time.

  Maciej

