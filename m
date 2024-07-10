Return-Path: <linux-mips+bounces-4243-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5492CC17
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 09:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDA921C2060E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 07:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A0E83CD7;
	Wed, 10 Jul 2024 07:41:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32842824BC;
	Wed, 10 Jul 2024 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720597261; cv=none; b=jT/H8Iy8FKQ5s22o0uJ2th6qZPolcPugt+oLqebWItl0duaGphEjD+j/eJL/OUjXlVtKDsDMFWEP8y05VhEorK6ohmpTNO/dYoR1+FLA2jEQvrjLekbXNBIJtCiW2O+61OfRtazZZCgdOl+tFCTxWVmkbLMHTW/Ic8jdXuFVf8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720597261; c=relaxed/simple;
	bh=ic/doOQaVCqp0tFw78Ip2mj0kPGzk2er21GSUClPl3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2hKFGQNAYY69XvDIYK/hjNO0CgwL5haLJX8fCeffuOiAsOjTTH0r2pm+l/dTepE1c2XsdV9zXKLbfrviX4c29NzA01vtm3W0wMyw2DF1cWSXPvFdfUaet7C4KONvorQgZNenbe0Vz+yp/CxCjhrr9PSN2Cy0ONegNSfMsbfdRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sRRwG-0003DV-00; Wed, 10 Jul 2024 09:40:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6ED58C0120; Wed, 10 Jul 2024 09:36:13 +0200 (CEST)
Date: Wed, 10 Jul 2024 09:36:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Message-ID: <Zo457UgAkhbAgm2R@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de>
 <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>

On Wed, Jul 10, 2024 at 01:34:41PM +0800, Jiaxun Yang wrote:
> 
> 
> 在2024年7月9日七月 下午4:55，Thomas Bogendoerfer写道：
> > On Fri, Jun 28, 2024 at 01:33:06AM +0100, Jiaxun Yang wrote:
> >> 
> >> 
> >> 在2024年6月27日六月 下午8:54，Maciej W. Rozycki写道：
> >> > On Thu, 27 Jun 2024, Jiaxun Yang wrote:
> >> >
> >> >> >> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf_state *state)
> >> >> >>  	t->thread.fpu.fcr31 = c->fpu_csr31;
> >> >> >>  	switch (state->nan_2008) {
> >> >> >>  	case 0:
> >> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
> >> >> >> +			t->thread.fpu.fcr31 &= ~FPU_CSR_NAN2008;
> >> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
> >> >> >> +			t->thread.fpu.fcr31 &= ~FPU_CSR_ABS2008;
> >> >> >
> >> >> > why is this needed?
> >> >> 
> >> >> Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this case we the default
> >> >> value of c->fpu_csr31 is read from hardware and we don't know what would that be.
> >> >
> >> >  But it has always been like this.  What has changed with your patch that 
> >> > you need to mask the bit out now?
> >> 
> >> After this patch kernel's copy of t->thread.fpu.fcr31 can disagree with hardware.
> >> When disagree happens, we trigger emulation.
> >> 
> >> Before that patch for nan legacy binary running on nan2008 CPU t->thread.fpu.fcr31
> >> will still be nan2008 (for ieee754=relaxed) so that's not relevant.
> >
> > I'm considering to apply your patch, how much testing/verification did
> > this patch see ? Do have some test binaries ?
> 
> It has been tested against Debian rootfs. There is no need to test againt special binary,
> but you need NaN2008 hardware such as Loongson 3A4000.

that's just one case, what about NaN2008 binaries on a legacy MIPS CPU ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

