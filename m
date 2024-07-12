Return-Path: <linux-mips+bounces-4302-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 223AA92FA1B
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 14:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCBD71F224AD
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 12:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919F716DC1A;
	Fri, 12 Jul 2024 12:23:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C255115A4B3;
	Fri, 12 Jul 2024 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786981; cv=none; b=UYpo1qff8PRA40Im00LnBJENvFnQLMaQrIAYzYNAucxkT7Rlv/ZzYHChbpSoVn+05ds5FznLbhyvT4m1MDXZJJtByLd2cuZusDdvGKU+y2K3EutM73yzLFPDC/JxpkGNGbM9MKbF9KfXjFHd72btfQUH9JSQ5UcRleFwp9rdaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786981; c=relaxed/simple;
	bh=E53mlU8u+G+uQ+BwkpZ8gR+rC2y5bBtGOSyYYdppZ14=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QU7LS9pDcZLL+B2sDe7iHclVqPATQTDGSuoymF9HtBJtc2syCkM+OkvDUrrVbDrMjtMZqIWOF9mmyzmt0XvHdm0oWu2GsS6Zh7s8OtfHgTm7s6h13swJ/jAJC30fr+qTi8qIr995Iu+DVWIuuJDXNoQvtDZ8Hmj3gSUbsobiGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 828BE92009C; Fri, 12 Jul 2024 14:22:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7C1C892009B;
	Fri, 12 Jul 2024 13:22:49 +0100 (BST)
Date: Fri, 12 Jul 2024 13:22:49 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
In-Reply-To: <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com> <Zn1FuxNw2CUttzdg@alpha.franken.de> <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com> <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk> <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de> <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com> <Zo457UgAkhbAgm2R@alpha.franken.de> <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk> <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
 <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk> <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jul 2024, Jiaxun Yang wrote:

> >> >  It would be good to check with hard-float QEMU configured for writable 
> >> > FCSR.NAN2008 (which is one way original code was verified) that things 
> >> > have not regressed.  And also what happens if once our emulation has 
> >> > triggered for the unsupported FCSR.NAN2008 mode, an attempt is made to 
> >> > flip the mode bit via ptrace(2), e.g. under GDB, which I reckon our 
> >> > emulation permits for non-legacy CPUs (and which I think should not be 
> >> > allowed under the new setting).
> >> 
> >> PTrace is working as expected (reflects emulated value).
> >
> >  Yes, sure for reads, but how about *writing* to the bit?
> 
> Tested flipping nan2008 bits with ieee754=emulated with ptrace, it works on some extent.
> (flipping the bit to unsupported value immediately triggered emulation).

 What about the other way round?

 Anyway I think we need to prevent it from happening, matching runtime 
behaviour, i.e. if the program itself cannot flip FCSR.NAN2008 via CTC1, 
then ptrace(2) must not either.  And the same for the emulator in the 
"ieee754=emulated" mode (but not for the emulator modes where the flipping 
is currently permitted), as it would be a one-way switch.

 In other words we need to be consistent and the NaN mode of operation has 
to be strapped in "ieee754=emulated" mode according to ELF file header's 
EF_MIPS_NAN2008 bit for the duration of execution of a given program.

 Likewise FCSR.ABS2008.

> >> The actual switchable NaN hardware (M5150, P5600) uses a dedicated Config7
> >> bit rather than writable FCSR.NAN2008 to control NaN2008 mode. This is undocumented
> >> and not present on some RTL releases. FCSR.NAN2008 is R/O as per The MIPS32 Instruction
> >> Set Manual. This renders the purposed test pointless.
> >
> >  Yes, for R6 and arguably R5, but not for R3.  Architecture specification 
> > revisions 3.50 through 5.02 define FCSR.NAN2008 (and also FCSR.ABS2008) as 
> > either R/O or R/W, at the implementer's discretion, so it is a conforming 
> > implementation to have these bits writable and our FPU emulator reflects 
> > it.  I won't go into the details here as to why the later revisions of the 
> > specification have been restricted to the R/O implementation only.
> >
> >  NB architecture specification revisions 3.50 through 5.01 also have the 
> > FCSR.MAC2008 bit defined, removed altogether later on.
> 
> Thanks for the information, I don't have access to those manuals so I was unaware
> of that. R/W NAN2008 is prohibited by AVP as well.

 There is a mention in revision history at the end of the current document 
anyway, which in this case is perhaps more informative than individual 
documents themselves.

> I briefly tested NaN2008 distro on QEMU modified with r/w NaN2008 bits in ieee754=
> strict mode, it seems working fine.

 Good.

  Maciej

