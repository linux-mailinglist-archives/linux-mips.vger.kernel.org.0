Return-Path: <linux-mips+bounces-6755-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDDE9CDD39
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 12:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A33C282F1B
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 11:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D101B3920;
	Fri, 15 Nov 2024 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SeFjPEgG"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05C154C00;
	Fri, 15 Nov 2024 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731668829; cv=none; b=ud2NkZW9O7F0MhNRIBsTLHuUnQoOk7foM2eYJHcYOZgqWPW2PjF6QHDiNkZHnaVDo7jVGxXhy1cIEwLXCBAu4UoxEcZW3/mtu/zkHFEEKXvB89RLYuz3lTniL4i7HFJSLVYXujMM0Oe5Mu0WvvUU2bdWAzap2eQ6bOeXtvXllLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731668829; c=relaxed/simple;
	bh=sxjUkrp2sY7Gfo6L3BtpQIWNGJIu5e/zmHa4vKadX08=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OcKS6eD7Io+8nyuN7BXJM8tjanc4MuiWC6UL6W+KV/w4lcxnhgdQ7A3Gjtrkp9bdMas9FarU9WSIAPJwZEOYIaUaQ2wKXsQ3dA+XYtnQDoz1uh6imbDs3VEURMaT58jnmjirXPZXOXEhWOHx0KlVgKu/KNPbqaUpEjr3KuNgwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SeFjPEgG; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9053EC0005;
	Fri, 15 Nov 2024 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731668819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1r+porGWUKsy9GTMrdmavZUnF68ePErI4fI6DHmlT0=;
	b=SeFjPEgGqfvR6d676Fe7UeowEhPzNjwd9lQcp8H1AMuRJcA0ftgo7z1RkHmjr1Hzj+4poe
	tUzH9IL8BtasWVl8LK4n0Cb++FiP9jeVVaZNEMUj5W9yvErk3RyyBPshINiZS0vRv10CTx
	+SWHdOCQEtF5V54EP/8t5kT9mNLrlVmeMtYD49wVMXoPrDobuW41kj/q0BrAflfb3LND0s
	uSisXbuPz9V+ah5vbxJ4YCoOouKT7OrUU/VBg0EdW8TWbilagX5aUQEwi5zQcYfKunJGXm
	hQTjldNsdH+ITrk9EgiVSuqarRddkZ1gIZddh46wl5KKiRQRvgB4/C9Qwt97jg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 12:06:58 +0100
Message-Id: <D5MPD4TS05ML.12HKW12NG083W@bootlin.com>
Subject: Re: [PATCH v2 00/10] Usable clocks on Mobileye EyeQ5 & EyeQ6H
Cc: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Stephen Boyd" <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
 <D5MN6O1SHWV7.31HDXZG3NEOCK@bootlin.com>
 <ZzcVlrbnMw7CXEC4@alpha.franken.de>
In-Reply-To: <ZzcVlrbnMw7CXEC4@alpha.franken.de>
X-GND-Sasl: theo.lebrun@bootlin.com

On Fri Nov 15, 2024 at 10:34 AM CET, Thomas Bogendoerfer wrote:
> On Fri, Nov 15, 2024 at 10:24:29AM +0100, Th=C3=A9o Lebrun wrote:
> > On Wed Nov 6, 2024 at 5:03 PM CET, Th=C3=A9o Lebrun wrote:
> > >  - MIPS:
> > >    [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for fi=
xed factor clocks
> > >    [PATCH v2 10/10] MIPS: mobileye: eyeq6h: add OLB nodes OLB and rem=
ove fixed clocks
> >=20
> > Do you think we can make those two patches go in before the next merge
> > window? Stephen just accepted the above patches. This makes both MIPS
> > platforms usable on upstream kernels!
>
> I've applied, but not pushed, because this
>
> Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/mobileye/eyeq5.=
dtsi:20.19-20 syntax error
> FATAL ERROR: Unable to parse input treeo
>
> My tree misses the new CLK defines.
>
> I haven't decided whether I'll ignore that and push it now or put them
> into a second request vor 6.13.

It was either breaking the driver build or the DTS builds. I preferred
breaking DTS as that way no kernel robot would come yelling after me.
Sorry it has to fall onto you to handle that.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


