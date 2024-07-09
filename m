Return-Path: <linux-mips+bounces-4197-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B492B2B6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 10:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD511C21985
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 08:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFCB15358A;
	Tue,  9 Jul 2024 08:55:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDB014E2D9;
	Tue,  9 Jul 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515356; cv=none; b=czrYWvoEYu30wlm9FNYCwhyntxoex8hr765WwBIkXssupByiE2KdaU2qFJjxswTHAwKsJ2wJ29Uu5eIKDt+KfixSa1JQnsYVt5SETy88XjV7XCDpeBuShXYQL7xmhsZjPs0MCx0zvkofMPU68T9F1wpHFV8bhGKYnXq0xXIgIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515356; c=relaxed/simple;
	bh=oVjVFSnFCha3efjxmv3xh62Kiit5wNco299Vz9gRcDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glgJBAlTIubOzzc7MmlpERUE1n1X+4bzwXkph31wYN2XaTBN8Fnmysf3QzuDhXITm0yQvhbWakR1obJop5u0MZv3thRHxSbbYBG0hBfUXH0dIV5DYjDJxV/GL/i1DMKlsoRZr61s4KZukaxTQq9vgPQUGqqk5jRfnJRO38mLpP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sR6dK-0000Pq-00; Tue, 09 Jul 2024 10:55:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C567EC0411; Tue,  9 Jul 2024 10:55:21 +0200 (CEST)
Date: Tue, 9 Jul 2024 10:55:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Message-ID: <Zoz6+YmUk7CBsNFw@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>

On Fri, Jun 28, 2024 at 01:33:06AM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月27日六月 下午8:54，Maciej W. Rozycki写道：
> > On Thu, 27 Jun 2024, Jiaxun Yang wrote:
> >
> >> >> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf_state *state)
> >> >>  	t->thread.fpu.fcr31 = c->fpu_csr31;
> >> >>  	switch (state->nan_2008) {
> >> >>  	case 0:
> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
> >> >> +			t->thread.fpu.fcr31 &= ~FPU_CSR_NAN2008;
> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
> >> >> +			t->thread.fpu.fcr31 &= ~FPU_CSR_ABS2008;
> >> >
> >> > why is this needed?
> >> 
> >> Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this case we the default
> >> value of c->fpu_csr31 is read from hardware and we don't know what would that be.
> >
> >  But it has always been like this.  What has changed with your patch that 
> > you need to mask the bit out now?
> 
> After this patch kernel's copy of t->thread.fpu.fcr31 can disagree with hardware.
> When disagree happens, we trigger emulation.
> 
> Before that patch for nan legacy binary running on nan2008 CPU t->thread.fpu.fcr31
> will still be nan2008 (for ieee754=relaxed) so that's not relevant.

I'm considering to apply your patch, how much testing/verification did
this patch see ? Do have some test binaries ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

