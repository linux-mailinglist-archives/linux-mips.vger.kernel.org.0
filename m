Return-Path: <linux-mips+bounces-4330-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAC09313D4
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 14:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ADA41F20F26
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 12:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E8B188CDA;
	Mon, 15 Jul 2024 12:15:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35E513B295;
	Mon, 15 Jul 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045724; cv=none; b=LLVNvk1BqHNLubNjdf/cCl/l0NpOXk9C6pAOcL/6CrDRklpqEki205g67Rvnag34M52+Q0jxKmw0UOXz1BWz0HJbDdHEy3o0w6Y9iS/x/D9kMfeN7uWyhmsOpxlIYiZmgREa562S9+SihYU9VzHwpXPpNiunBa8mFTOaF9RgCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045724; c=relaxed/simple;
	bh=Yv1FXgC8K277VcLGgKR1E3bX/WLiJjyURUvSGP89N7o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=en0Mty3m711fLQDfPqAJqLJ1GQseHFcpMYwl4hXjI76qhkHD8yzmnuEmYaq3hPv56ynDYWNHp40qRew0nHs5BG38DxrxJ1qKjOKlyKIQ5syFg8PbCP3Czwq/6QDN9Y8UrGGkFbzWaTcoV9L11y66tuk+S3Z5udH3wasgW2SyAcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 10DC592009E; Mon, 15 Jul 2024 14:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 02E3692009D;
	Mon, 15 Jul 2024 13:15:12 +0100 (BST)
Date: Mon, 15 Jul 2024 13:15:12 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
In-Reply-To: <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com> <Zn1FuxNw2CUttzdg@alpha.franken.de> <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com> <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk> <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de> <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com> <Zo457UgAkhbAgm2R@alpha.franken.de> <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk> <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
 <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk> <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com> <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk> <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 14 Jul 2024, Jiaxun Yang wrote:

> >> >  Yes, sure for reads, but how about *writing* to the bit?
> >> 
> >> Tested flipping nan2008 bits with ieee754=emulated with ptrace, it works on some extent.
> >> (flipping the bit to unsupported value immediately triggered emulation).
> >
> >  What about the other way round?
> 
> It works on both side (NaN2008 binary with ptrace flipped back to legacy and legacy flipped
> back to NaN2008).

 So this is clearly wrong for this scenario.

> >  Anyway I think we need to prevent it from happening, matching runtime 
> > behaviour, i.e. if the program itself cannot flip FCSR.NAN2008 via CTC1, 
> > then ptrace(2) must not either.  And the same for the emulator in the 
> > "ieee754=emulated" mode (but not for the emulator modes where the flipping 
> > is currently permitted), as it would be a one-way switch.
> 
> It is out of the scope of this patch I think. Maybe we need a prctl to 
> set NaN2008 status.

 I don't know what prctl(2) has to do with this.  If you don't implement 
this part, then your change will cause Linux to behave inconsistently and 
therefore I'll have to NAK it.

 It's not much to do anyway, as I have prepared `ptrace_setfcr31' already 
to handle masking correctly, so all you have to do is to set the mask as 
required for the right thing to happen.  I shouldn't have needed to point 
you at it though, as that code is easy to find.

> We are unable to prevent user applications write NAN2008 bits for the "switchable
> QEMU" as well. So I'd perfer leave it as is, and let this feature go into 6.11 so people
> can start to use it.

 This doesn't matter either, as your change only addresses the case where 
FCSR.NAN2008 isn't writable anyway, which is the sole reason you want to 
switch between native hard float support and emulation, doesn't it?

 In fact where FCSR.NAN2008 is writable your new mode has to be equivalent
to "ieee754=strict", because then there is no need to trigger emulation 
for either NaN mode.  Please do verify that this is the case.

> This is actually a request from Debian MIPS team so they can get glibc tests run on
> mismatched NaN hardware.

 That doesn't matter for us here (and I have a bad suspicion anyway), but 
the Debian team is of course free to do what they want here, the GNU GPL 
applies.

 And also they can always use the "nofpu" kernel parameter to run their 
verification.  I used it for mine back at ImgTec before 2008 NaN hardware 
was available, also to verify emulation, which I wrote too.  Perhaps that 
is also the right solution for Debian actually?

  Maciej

