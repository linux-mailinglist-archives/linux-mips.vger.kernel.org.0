Return-Path: <linux-mips+bounces-4139-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA0D927F10
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 00:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073671C21461
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 22:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4685143721;
	Thu,  4 Jul 2024 22:36:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448833F9C5;
	Thu,  4 Jul 2024 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720132566; cv=none; b=SQ+qWn4wjGgBoXvnYEBSghlNAqfXkmhnWM/jWAe69KbRWKd1XOvOuE5N9d/swg1rWEe7PRmYPLjhQDtvnp9LoxfCyx70LKHglAhjxDbkpgW6In076FD7oo8VoY3nbA/NBpb5z82oKahnvs5CUXai96t9TicwXvMEZjS+uczNE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720132566; c=relaxed/simple;
	bh=sjJcYABZyOR6FDEBheK8kNzPomh3KWnD6TI3P5yZdiY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OT2ZryGaSR8iLOeaLkCA1LqAvb0cjFm7cXj0qduAdJtBchicZ4sEdtw6/8jaRwa279UmnU6tRyloa+VrawdKR+py9CMYJMK4MT0qsFV6N9XLz+q25PXKmeC2nQFSYTCtrT9qiTxWFzXCX+1P/nlRKJ+doLOlRMkT8CrAJ7GvH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1E4CE92009C; Fri,  5 Jul 2024 00:36:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 147A992009B;
	Thu,  4 Jul 2024 23:36:02 +0100 (BST)
Date: Thu, 4 Jul 2024 23:36:02 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Florian Fainelli <florian.fainelli@broadcom.com>, 
    Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
    Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
    Serge Semin <fancer.lancer@gmail.com>, 
    "paulburton@kernel.org" <paulburton@kernel.org>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
In-Reply-To: <e54ec104-2e19-46da-8c3d-b6b7f620f563@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2407042324300.38148@angie.orcam.me.uk>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com> <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com> <ZoVokcDYqZnuqd2X@alpha.franken.de> <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
 <alpine.DEB.2.21.2407032204331.38148@angie.orcam.me.uk> <e54ec104-2e19-46da-8c3d-b6b7f620f563@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Jul 2024, Jiaxun Yang wrote:

> >  SOC-it (or SOC-it 101 to be precise) is the name of a bus controller:
> >
> > System controller/revision =    MIPS SOC-it 101 OCP / 1.3   SDR-FW-4:1
> >
> > used across numerous platforms from the M4K core onwards, UP, MT, or MP.  
> > I think it would make sense if you revealed the processor type instead.
> 
> Sure, sorry to be vague on the platform detail.
> 
> I actually tried on two Malta configurations, CoreFPGA6 interAptiv 2MPF (2 cores, 2 VPE, 4TC),
> and CoreFPGA3 34Kc MT (2VPE 9TC).

 This is much better, thanks, and the choice of CPUs feels adequate.  The 
mention of the 34K CPU brings fond memories too, as I was a member of the 
development team for this design, very innovative at its time, and still 
nowadays I believe.

> >  Technically I could run it on my SB1250, but I'm too overloaded now to 
> > commit to any timescale.  Sorry.
> 
> No worries, I'll try to fetch a BMIPS3000 SMP router to get Broadcom platform
> undercover.

 But that's a completely different design from the SB-1 line, isn't it?

  Maciej

