Return-Path: <linux-mips+bounces-3800-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AFB911055
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 20:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87A6B1C24180
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536701BD017;
	Thu, 20 Jun 2024 18:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nXQuPruI"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A41BC098;
	Thu, 20 Jun 2024 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906453; cv=none; b=gEuqDP2lSPNoqpBwaNdrqd9hq+NvEVJivRcz4UDLb5VkGsiQSG45c26KZbBP+T/zpOJW39iIkbD5bzmMeb5zL1f7S1VXVoe4Njg5Kc814yalGIcS+8eWM080vC8OT44n0fWrtet4g3N+Gu2UX680+WUsFiJnjyYmakfGFKXxD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906453; c=relaxed/simple;
	bh=K3FDmzmWo3PowEgtwwebEio5I5t4ZNfKyn+kSIZil5M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JA853FZdynP1zGpxBnDEusUHqQckzDdCnxb8V7xDpdb2zYsD+4PWWYFc893dvdruqpfb39/64peLeRF5QI0pJSTgUr0c/lq6g49AqI+xKpBkf/yagt3LiboDnrjBcYCgkF0Q19Wlu0I1OSszIF+C3gYmnkvEGVMzTr8worAfpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nXQuPruI; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B3AFF803;
	Thu, 20 Jun 2024 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718906448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fl1pRBkgxx3hCPtJuR7dl8WXtq89w/4Jn+JJJxvnML8=;
	b=nXQuPruI9WoyrMqrDMEoSj6TAmBGWPemPJTZuwzaRu8cnfQXhJrw+1VecqdM6DwBIiztcK
	cCo99uN3Xd5QYpWdH4Ue49ciSqQaD+fmAFPFCq+m8leit5G6SorLFCy2tIal8wprrhScw4
	1DPlgfY8pUeVCfW8zYQlfnjvuCcvMXnqVQedL7r8cXX2bymjyVZaQMeoBMc60ll+Z9E6ZY
	Kg2NWHL7QY7JZV+W/I55+ivmVoVzL61LSw+l3qVdQhbCoj884dR1bmPrXRygaF52YcCGPQ
	cW0+1k4rntofZh+PSMqHZDKXjoZLHGdv4VY9jIY7M/eAmODySDsxFlYn6VCDbA==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Jun 2024 20:00:46 +0200
Message-Id: <D251HCFITAUR.2SM3S9Q75K4C7@bootlin.com>
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
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <8dcdb1422cd144128c1dc6fff1c273d3.sboyd@kernel.org>
 <D13HXGJGMS76.XIIIZLZBCZ09@bootlin.com>
 <62e1512be0bc44acae9afb34467753db.sboyd@kernel.org>
In-Reply-To: <62e1512be0bc44acae9afb34467753db.sboyd@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Stephen,

So, you should have received the latest revision [0]. It takes the
approach you advised:

 - One driver (clk) is platform. Others (reset, pinctrl) are auxiliary
   drivers.
 - The clk driver spawns auxiliary devices, passing to it the iomem
   pointer using ->platform_data.
 - The auxdevs spawned are based on compatible match data. We don't need
   any info to spawn them except their name, so match data only has an
   optional string. No array needed even, just two pointers: plain, simple.
 - This means the iomem register logic is split across each driver.

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootl=
in.com/

On Tue May 7, 2024 at 11:48 PM CEST, Stephen Boyd wrote:
> I could see the MFD subsystem gaining support for creating child
> auxiliary devices for some compatible string node, and passing those
> devices a regmap. Maybe that would be preferable to having to pick a
> driver subsystem to put the platform driver in. Outside of making a
> general purpose framework, you could put the platform driver in
> drivers/mfd and have that populate the child devices like clk, reset,
> pinctrl, etc.

Having one of the driver be platform and spawn others reduces the amount
of boilerplate (no driver that only creates sub devices). That sounds
like a nice advantage; to be contrasted with having unrelated code in
subsystems (eg auxdev spawning code in drivers/clk/).

Thanks for your pieces of advice Stephen,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


