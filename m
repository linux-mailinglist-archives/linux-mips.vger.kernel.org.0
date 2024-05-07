Return-Path: <linux-mips+bounces-3130-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 841158BE71E
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13AAF1F26F38
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3904A161336;
	Tue,  7 May 2024 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ISpe8zWi"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3215EFDE;
	Tue,  7 May 2024 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094872; cv=none; b=jei0tJAQv+AKVXcsphCaX7cXRbYLQkbU7e8YUcDZ+KFSI/v3YGlgfFyvmqQQUfFLFAXJQGnZI5HqitBOpmX/THc823iDLOV6VVdLJJy8Uyqzf7kKMFCbVyETRN2Y6WpZeFA9Q59xSrgzPRWePB2G3cJfRSN+Yl8RSK/FRpnNtok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094872; c=relaxed/simple;
	bh=nB/cJv7IcDvCVPO18M+qfbJN1yWBxowX9QN+QZhjrR4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=H4khYe0h5U/qJ6NHesExnrc4F1L4uHtETnecZXQyP3l8FpBReFUQuvOzXk6g/HzzYJILtwP081Rulj0+v7k1VIXJQvyeu9BdrpodEHdKvfOZEAxygEUb0mry+A2J50huTSNIaCCJzqe8CCq6jxjv8tNfbk4kj61hPrbo42xxT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ISpe8zWi; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D86E0005;
	Tue,  7 May 2024 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715094867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=206gGNUNB5hA5ZcFAZ6jyveJ5RgZY1MARbRfGQUc+HM=;
	b=ISpe8zWiQep2P8Frm93frtzWECPQK7E31QuFfs4MQwQGxwF1LFceQXULO98URfaceGT6Pa
	jd4Zwu76vmRl0LoukyAE9I4K5l8c8SUb5DBZzHHcw3hrTHvqkYr2ajIoRqQ5xcZmBMsaoO
	mNRJInwwjq8LXBtvcpKIP/bFFbFDdLjsLaWqrqqeLU8C4FBgvnvEkmqsG+PNicz8fn1Hon
	Fndh/FnABacFn11AoTLhgl5WSfUw1ks8SZSeCAQWVu0BWwIpo2bknBUYO/DPHUQqjVScoI
	ZBu3nmgXHXdEvbSPJoT7Z5PLlX5yPraMtGNFME/46CrnxcK7PhdX0+lnB1KFOg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 17:14:25 +0200
Message-Id: <D13IE06GUEJ9.UUNOU4QH2QN9@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 00/11] Add Mobileye EyeQ system controller support
 (clk, reset, pinctrl)
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Lee Jones" <lee@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <8dcdb1422cd144128c1dc6fff1c273d3.sboyd@kernel.org>
 <D13HXGJGMS76.XIIIZLZBCZ09@bootlin.com>
In-Reply-To: <D13HXGJGMS76.XIIIZLZBCZ09@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue May 7, 2024 at 4:52 PM CEST, Th=C3=A9o Lebrun wrote:
> On Sat May 4, 2024 at 4:34 AM CEST, Stephen Boyd wrote:
> > Quoting Th=C3=A9o Lebrun (2024-05-03 07:20:45)
> > > This builds on previous EyeQ5 system-controller revisions[0], support=
ing
> > > EyeQ5, EyeQ6L and EyeQ6H. We expose a few OLB system-controller
> > > features here:
> > >  - Clocks: some read-only PLLs derived from main crystal and some
> > >    divider clocks based on PLLs.
> > >  - Resets.
> > >  - Pin controller, only on EyeQ5 (rest will use generic pinctrl-singl=
e).
> > >=20
> > > EyeQ6H is special in that it has seven instances of this
> > > system-controller. Those are spread around and cannot be seen as a
> > > single device, hence are exposed as seven DT nodes and seven
> > > compatibles.
> > >=20
> > > This revision differs from previous in that it exposes all devices as=
 a
> > > single DT node. Driver-wise, a MFD registers multiple cells for each
> > > device. Each driver is still in isolation from one another, each in
> > > their respective subsystem.
> >
> > Why can't you use auxiliary device and driver APIs?
>
> Good question. Reasons I see:
>
>  - I didn't know about auxdev beforehand. I discussed the rework with a
>    few colleagues and none mentioned it either.
>
>  - It feels simpler to let each device access iomem resources. From my
>    understanding, an auxdev is supposed to make function calls to its
>    parent without inheriting iomem access. That sounds like it will put
>    the register logic/knowledge inside a single driver, which could or
>    could not be a better option.
>
>    Implementing a function like this feels like cheating:
>       int olb_read(struct device *dev, u32 offset, u32 *val);
>
>    With an MFD, we hand over a part of the iomem resource to each child
>    and they deal with it however they like.
>
>  - Syscon is what I picked to share parts of OLB to other devices that
>    need it. Currently that is only for I2C speed mode but other devices
>    have wrapping-related registers. MFD and syscon are deeply connected
>    so an MFD felt natural.
>
>  - That would require picking one device that is platform driver, the
>    rest being all aux devices. Clock driver appears to be the one, same
>    as two existing mpfs and starfive-jh7110 that use auxdev for clk and
>    reset.
>
> Main reason I see for picking auxdev is that it forces devices to
> interact with a defined internal API. That can lead to nicer
> abstractions rather than inheriting resources as is being done in MFD.
>
> Are there other reasons?

Self replying myself. I gave myself some time to think about that but I
still have more thought now that I've written the previous email, and
re-read almost all old revisions of this series.

I do like this auxdev proposal. More so than current MFD revision. One
really nice feature is that it centralises access to iomem. I've
noticed recently a register that has most its fields for reset but one
lost bit dealing with a clock mux. Logic to handle that would be in one
location.

Also, I just noticed you hinted at auxiliary devices in previous emails,
which I thought was a generic term. I did not see it as a specific
kernel infrastructure to be used. Sorry about that.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


