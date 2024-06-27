Return-Path: <linux-mips+bounces-3993-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E728291AFDE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 21:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDE2FB20FA3
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 19:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282CA19AD81;
	Thu, 27 Jun 2024 19:54:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3814A4B5C1;
	Thu, 27 Jun 2024 19:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518084; cv=none; b=sA62R7oml5xrrpLTWgP5YTZuuMZtufIYsodGBr95whBlYMiiyVXisn/RQjN4BLVF156wvp2yAvd0I4ZWxFSgB0lokTHVpFTTw96oW5KG+Kf4SXubS0sLPZpWVC8kPgR4amZ3NtyvYII+nMoIDGxx5zpS6rlC148S1vt5TS67yyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518084; c=relaxed/simple;
	bh=RunB0BdrK5QfK3qubVsk9mwavGqYlgg/gcfGgzVJ3zk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cV64nYcKQUlk5bn6P8fX9HhZMXuIU4tasFYaT6L9575Frc5x8YOTHwwDw9pZm8RWsiIIy11VW4OWQfT20z1sxtsrO96ALCcVbo8Kz5hxte3+HP1Mktc/A7tONL+RqCU/fwvCJVKT4FbxRX4felr3vtJTxNu5XCX1OE8VAOU/ydU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2B59F92009C; Thu, 27 Jun 2024 21:54:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 251BC92009B;
	Thu, 27 Jun 2024 20:54:39 +0100 (BST)
Date: Thu, 27 Jun 2024 20:54:39 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
In-Reply-To: <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com> <Zn1FuxNw2CUttzdg@alpha.franken.de> <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Jiaxun Yang wrote:

> >> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf_state *state)
> >>  	t->thread.fpu.fcr31 = c->fpu_csr31;
> >>  	switch (state->nan_2008) {
> >>  	case 0:
> >> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
> >> +			t->thread.fpu.fcr31 &= ~FPU_CSR_NAN2008;
> >> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
> >> +			t->thread.fpu.fcr31 &= ~FPU_CSR_ABS2008;
> >
> > why is this needed?
> 
> Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this case we the default
> value of c->fpu_csr31 is read from hardware and we don't know what would that be.

 But it has always been like this.  What has changed with your patch that 
you need to mask the bit out now?

  Maciej

