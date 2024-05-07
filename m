Return-Path: <linux-mips+bounces-3127-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38DE8BE698
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 16:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D590289034
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 14:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B915FD0E;
	Tue,  7 May 2024 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BWWaekmb"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7EF15FCF0;
	Tue,  7 May 2024 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093575; cv=none; b=skNfStd2FyDIoD85YFKGJIb30qVfmzrEGAM8zCUynS6dFqFL2eFvDBrfuo23/fyXiNXon3RY0GEu3psiSD9Mm2gcczC39ABstTlVzpZxDp16VLxUYw7Wqa1hW4HBrJdB735sEiTaLIPq0mA+1jN8NmXUu/P1FOH8rQFz2dYLNGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093575; c=relaxed/simple;
	bh=MlQMJtQlUuf6lLca3bql80rz2yBaAuTOSQM7x4CO/+E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=YEie/5xLR5KGKMqFhvia7yN02pILKObNf3TAanbAQ/cpROO3pqtMdmW798mTZHZrb8cxQB1Ezp4KjeoG4BDG+5FlTivbBy1YrmeRURaOSSl8rmkik2SdM42GIK9l7EXIyOV6GNzYf0e9wFITSPSRLTXmnSN7mse6dKve7FFDGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BWWaekmb; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D8DBC0002;
	Tue,  7 May 2024 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715093570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGenY7YAzUwlgiT73G7TaHalCSUU2X6AFVguS+ovgFw=;
	b=BWWaekmbWtG3JQ8gcKhy7e0+HcN08YNNci5RJE5FZSeN+mPVBdOtCyww7UraBvBuBvNe4j
	roYAhUgVdwh+j5vWIebRHxzomUrJwZcQ/rWk189pVSdKnmtnMoUiZQnH9uyhOUzhuFQfNP
	LMPFRd2atO3kzm+eFRMubYigSEaCuE+BqOnl9Jc3yZtRx9YorACLWdx9KZJcOpAN0cXTK9
	BpzVO+y3YCNj2AWGaxSiF8EnDdT9NWnes/ppIWSp+tMJw4iBuCmvMs2+q8ESc8VIzGX/61
	KexeA06fv4ck3ADqNmciQ4qi8pZnbmmPuJ0WYduRP8DP0xw1NhkhKm3qPyDtBQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 16:52:49 +0200
Message-Id: <D13HXGJGMS76.XIIIZLZBCZ09@bootlin.com>
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
To: "Stephen Boyd" <sboyd@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Lee Jones" <lee@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <8dcdb1422cd144128c1dc6fff1c273d3.sboyd@kernel.org>
In-Reply-To: <8dcdb1422cd144128c1dc6fff1c273d3.sboyd@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Sat May 4, 2024 at 4:34 AM CEST, Stephen Boyd wrote:
> Quoting Th=C3=A9o Lebrun (2024-05-03 07:20:45)
> > This builds on previous EyeQ5 system-controller revisions[0], supportin=
g
> > EyeQ5, EyeQ6L and EyeQ6H. We expose a few OLB system-controller
> > features here:
> >  - Clocks: some read-only PLLs derived from main crystal and some
> >    divider clocks based on PLLs.
> >  - Resets.
> >  - Pin controller, only on EyeQ5 (rest will use generic pinctrl-single)=
.
> >=20
> > EyeQ6H is special in that it has seven instances of this
> > system-controller. Those are spread around and cannot be seen as a
> > single device, hence are exposed as seven DT nodes and seven
> > compatibles.
> >=20
> > This revision differs from previous in that it exposes all devices as a
> > single DT node. Driver-wise, a MFD registers multiple cells for each
> > device. Each driver is still in isolation from one another, each in
> > their respective subsystem.
>
> Why can't you use auxiliary device and driver APIs?

Good question. Reasons I see:

 - I didn't know about auxdev beforehand. I discussed the rework with a
   few colleagues and none mentioned it either.

 - It feels simpler to let each device access iomem resources. From my
   understanding, an auxdev is supposed to make function calls to its
   parent without inheriting iomem access. That sounds like it will put
   the register logic/knowledge inside a single driver, which could or
   could not be a better option.

   Implementing a function like this feels like cheating:
      int olb_read(struct device *dev, u32 offset, u32 *val);

   With an MFD, we hand over a part of the iomem resource to each child
   and they deal with it however they like.

 - Syscon is what I picked to share parts of OLB to other devices that
   need it. Currently that is only for I2C speed mode but other devices
   have wrapping-related registers. MFD and syscon are deeply connected
   so an MFD felt natural.

 - That would require picking one device that is platform driver, the
   rest being all aux devices. Clock driver appears to be the one, same
   as two existing mpfs and starfive-jh7110 that use auxdev for clk and
   reset.

Main reason I see for picking auxdev is that it forces devices to
interact with a defined internal API. That can lead to nicer
abstractions rather than inheriting resources as is being done in MFD.

Are there other reasons?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


