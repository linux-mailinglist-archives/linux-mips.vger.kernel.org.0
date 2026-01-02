Return-Path: <linux-mips+bounces-12696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E19CEDFC8
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 08:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3B8730054BA
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 07:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50ED450F2;
	Fri,  2 Jan 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FTWuxlWz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XJWMsG4l"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2ED33985;
	Fri,  2 Jan 2026 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767340040; cv=none; b=k/jF4aQHx9ZsSWx6aO1IoSZGIa36vu0EGNotVrLIvbrSxKCTnaqcHFVIGorse+QTxmMh1T/4Vwuh9N9otrK7jpsgT+etAnU8+dHAkud+oUTc9KYZhicx60UEGuxvOHpAEjfLheP+NK0Yv0X8gZs8A/C4FMyfe0i8hVsrOJithj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767340040; c=relaxed/simple;
	bh=KM6Y7NeOFkv5e1WEcR9D7MkpWIzzdNolb+nzxidK9q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCx36rOKkmJexMwDaEKziTA4c3M5IOBxWCpElIoxnlaGnuf5Ak38k3o6XKKYbeoc0sNRJ7KQchTj445LuxqMDWjtH1ykqkIQUK6zKHvmkzNrcYUqiFXubxDlUGZ6e/tfm7KzLEFAJsBsVBee669Pe1B09SsB8K45M0TFnlipx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FTWuxlWz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XJWMsG4l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 2 Jan 2026 08:47:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767340037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzLlF80uMMaWrgWHQtgMQXB3nlwT6ewpfjWguuaNto0=;
	b=FTWuxlWzwNZy43NTZ7GmOLC71jNc/nvLIozmPxJDehR5bQc7JMsNzT53WyWGdBti/dULSC
	NhBLNcXG4/k+HZ0RpMUUZGtVSeRzkGtc/P/Ulm4s99IOvy52i60Odf/zPp48RJ3ILi85/P
	4nr7zQKp2SrJUGwnpSJ0MLp0CZHwvaU2tS/4suDtYFhX6Dp9lqjVMAfakTtiIVJxG5eAJx
	MU5/+mFNfolRiZCw0jbWbt3KULkY+8zcXG55vZGQIrY0GlOdBeWERd8q7Bz+v3Zuze7S8c
	WZCmAYECDhqzQDvC23jk29dr3/mc4bYAwXJU7wWwqpKzz4t+oB+fE9OuGVmv2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767340037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzLlF80uMMaWrgWHQtgMQXB3nlwT6ewpfjWguuaNto0=;
	b=XJWMsG4ltzWi49caAxfCcc+7nJDW5gzWz4e1zrSVkuSg7r9OnpeCuDDRBTPvgxpN6GhUI0
	OL9lNNwZb9W64BCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <20260102083410-1d87a83f-875a-444f-8b43-4abbce317b5a@linutronix.de>
References: <20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de>
 <alpine.DEB.2.21.2512310212490.14570@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2512310212490.14570@angie.orcam.me.uk>

On Wed, Dec 31, 2025 at 02:33:40AM +0000, Maciej W. Rozycki wrote:
> On Mon, 22 Dec 2025, Thomas Weißschuh wrote:
> 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index b88b97139fa8..316e3c29c431 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -3126,6 +3127,20 @@ config CC_HAS_MNO_BRANCH_LIKELY
> >  config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> >  	def_bool y if CC_IS_CLANG
> >  
> > +config ARCH_CC_CAN_LINK
> > +	bool
> > +	default $(cc_can_link_user,-m64 -EL) if 64BIT && CPU_LITTLE_ENDIAN
> > +	default $(cc_can_link_user,-m64 -EB) if 64BIT && CPU_BIG_ENDIAN
> > +	default $(cc_can_link_user,-m32 -EL) if CPU_LITTLE_ENDIAN
> > +	default $(cc_can_link_user,-m32 -EB) if CPU_BIG_ENDIAN
> > +
> > +config ARCH_USERFLAGS
> > +	string
> > +	default "-m64 -EL" if 64BIT && CPU_LITTLE_ENDIAN
> > +	default "-m64 -EB" if 64BIT && CPU_BIG_ENDIAN
> > +	default "-m32 -EL" if CPU_LITTLE_ENDIAN
> > +	default "-m32 -EB" if CPU_BIG_ENDIAN
> 
>  There are no `-m32'/`-m64' options with MIPS GCC; where did you get them 
> from and how did you verify your change?  Did you mean `-mabi=...' by any 
> chance?

Yes indeed. Not sure how that happened, I do have a correct version in
another branch...  Thanks for spotting this.

> Also does the n32 ABI have to be factored in, since IIUC this 
> stuff is about user programs?

It can be added, but I don't think it makes much sense.
It would only be used if CONFIG_MIPS32_N32=y (which is non-default) and if
the toolchain which has no n64 libc, but does have a n32 libc.
This seems unlikely to me, but let me know if I am mistaken.


Thomas

