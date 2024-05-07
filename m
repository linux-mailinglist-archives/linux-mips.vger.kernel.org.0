Return-Path: <linux-mips+bounces-3156-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A08BEF31
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 23:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE19BB21C4D
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 21:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857AA78C72;
	Tue,  7 May 2024 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M25IOCRZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C177658;
	Tue,  7 May 2024 21:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118517; cv=none; b=uzdZkBRnuO9/mMNFZzG9O95iqkfC2/5eWnbYyJ677iHrbSX6oPnXpZnwVuIxWavEqeqsXeZueMYC1q85K1to4Gl6A4WKyYiAoQB91ms8sk+7czAxOJut6fIkRAATkWMsCfditc1dBILHPYkMT3qLdymj++HDEAzDd5oYl8yJTGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118517; c=relaxed/simple;
	bh=kYExVs3vNwZrtKx+Xy37TbIuGlIJdAuIbdrEdpK1v1w=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tzLamFpbp+KPo/x+4UV/3OXVF0Uz5R7JooNRNfuHgQPQqiTXQqUNTg57HLfy6tEquLqfACodFy+jkKYL5xuVdKYWsLkuQXnrXnGzvuTREtT27KxpG2oHQDKd5IG06UO3UVexwJSuMPrmypbe+lwyt76C5DBLkT4I8ipHPn2uSSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M25IOCRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C75C2BBFC;
	Tue,  7 May 2024 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715118516;
	bh=kYExVs3vNwZrtKx+Xy37TbIuGlIJdAuIbdrEdpK1v1w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M25IOCRZTNR8OgIC66y02fXlHkoX8fDq82A9T1fvm2I0jY47iyDErvHoTEfFbchYl
	 mSHHEfUmA1loX81Nbx+G0Y0kBF4uSlUF3mJbTr9ATPeCSLwLIFOzt66L8IcjtWLWr/
	 EtJsZOkf5WVfpj0ug8T5jUyCG6EM5BOWL/bwWNhWOnhCElU8SR0Rf0GbwiaOl/cMgj
	 hN9xwJJU5mwisMFd+/Ze4IN0bmph62tYR00qvhDPXmd3D5f/a8NFEgXtyqxFiEGcP5
	 JuyEGh923mgDUcMVgFa2rNWUN2pd0NqCNttTvM9rIb2Hmoc/+S4UmNp7sF12wFeZ7Y
	 okDaNLFtqTVbA==
Message-ID: <62e1512be0bc44acae9afb34467753db.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <D13HXGJGMS76.XIIIZLZBCZ09@bootlin.com>
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com> <8dcdb1422cd144128c1dc6fff1c273d3.sboyd@kernel.org> <D13HXGJGMS76.XIIIZLZBCZ09@bootlin.com>
Subject: Re: [PATCH v2 00/11] Add Mobileye EyeQ system controller support (clk, reset, pinctrl)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Date: Tue, 07 May 2024 14:48:34 -0700
User-Agent: alot/0.10

Quoting Th=C3=A9o Lebrun (2024-05-07 07:52:49)
> On Sat May 4, 2024 at 4:34 AM CEST, Stephen Boyd wrote:
> >
> > Why can't you use auxiliary device and driver APIs?
>=20
> Good question. Reasons I see:
>=20
>  - I didn't know about auxdev beforehand. I discussed the rework with a
>    few colleagues and none mentioned it either.
>=20
>  - It feels simpler to let each device access iomem resources. From my
>    understanding, an auxdev is supposed to make function calls to its
>    parent without inheriting iomem access. That sounds like it will put
>    the register logic/knowledge inside a single driver, which could or
>    could not be a better option.

You can pass the iomem pointer to the child device, either through the
struct device platform_data void pointer or you can make a wrapper
struct for struct auxiliary_device that the child device/driver, e.g.
pinctrl, would know about. Or you can use a regmap and pass that through
to the function that creates the auxiliary device.

Either way, we don't want the iomem register logic inside a single
driver. Conor recently made that change for mpfs. See this patch[1].

The syscon code uses a regmap so that register access uses a spinlock.
Maybe you need that, or maybe you don't. I don't know. It depends on if
the device has logical drivers that access some shared register. If that
doesn't happen then letting the logical drivers map and access the
registers with iomem accessors is fine. Otherwise, you want some sort of
mediator function, where regmap helps make that easy to provide.

>=20
>    Implementing a function like this feels like cheating:
>       int olb_read(struct device *dev, u32 offset, u32 *val);
>=20
>    With an MFD, we hand over a part of the iomem resource to each child
>    and they deal with it however they like.
>=20
>  - Syscon is what I picked to share parts of OLB to other devices that
>    need it. Currently that is only for I2C speed mode but other devices
>    have wrapping-related registers. MFD and syscon are deeply connected
>    so an MFD felt natural.
>=20
>  - That would require picking one device that is platform driver, the
>    rest being all aux devices. Clock driver appears to be the one, same
>    as two existing mpfs and starfive-jh7110 that use auxdev for clk and
>    reset.
>=20
> Main reason I see for picking auxdev is that it forces devices to
> interact with a defined internal API. That can lead to nicer
> abstractions rather than inheriting resources as is being done in MFD.
>=20

The simple-mfd binding encourages sub-nodes for drivers. This is an
anti-pattern because we want nodes for devices, not drivers. We should
discourage the use of that compatible in my opinion.

I could see the MFD subsystem gaining support for creating child
auxiliary devices for some compatible string node, and passing those
devices a regmap. Maybe that would be preferable to having to pick a
driver subsystem to put the platform driver in. Outside of making a
general purpose framework, you could put the platform driver in
drivers/mfd and have that populate the child devices like clk, reset,
pinctrl, etc.

The overall goal is still the same. Don't make child nodes.

[1] https://lore.kernel.org/linux-clk/20240424-strangle-sharpener-34755c5e6=
e3e@spud/

