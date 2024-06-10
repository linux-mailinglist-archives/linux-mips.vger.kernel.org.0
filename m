Return-Path: <linux-mips+bounces-3551-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE849027A2
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2024 19:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC9D1C2125B
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2024 17:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C87145A01;
	Mon, 10 Jun 2024 17:19:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E55A145328;
	Mon, 10 Jun 2024 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718039979; cv=none; b=Ypl0IYYvUff8MEZ58+uv2wQKqVRsKHxjhGvdrTFEjN+KZssMV3ADXrUgpc9ZBZsdDTHf3Nd2VUEYwRKF0uEEe7iel4RnGrbERLwk1AiEUJN8fs3tRbVISrbpiE0sKlsr1XhisBp7XtKZjaiWeqXzYVVeALQBplwQtzkz0ZexrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718039979; c=relaxed/simple;
	bh=41nEsnnCsKwXDdxo654ikec4MjyqGigRJTVzBXlKI2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7+MUlM4L4yrqT9gwUPZ4clVdi9fsxaRR5fPMd7MdBdOnCPZmx2Yjb6l/kLnHEOLj/WKvz+USR/D/O0oL2Kt/qUdDmuPs0M+Gv1eOAwnebMCAwjruNzNg9G0m60RucMw+NAEL2eQyrCJBOHuadtT3ki0sz/abs0h6CQWVt9ARRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGi0z-0000qj-00; Mon, 10 Jun 2024 18:37:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7FBF4C031A; Mon, 10 Jun 2024 17:17:44 +0200 (CEST)
Date: Mon, 10 Jun 2024 17:17:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 0/3] Add support for the Mobileye EyeQ6H SoC
Message-ID: <ZmcZGC0Q91rd6uSI@alpha.franken.de>
References: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
 <87zfrsetws.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfrsetws.fsf@BLaptop.bootlin.com>

On Mon, Jun 10, 2024 at 04:47:47PM +0200, Gregory CLEMENT wrote:
> > Following the support of the EyeQ5 SoC, this series adds the initial
> > support for a newer SoC, the EyeQ6H.
> >
> > The EyeQ6H (or "High") from Mobileye is still based on the MIPS I6500
> > architecture as the EyeQ5. The 2 clusters of this SoC contain 4 cores
> > each, which are capable of running 4 threads per core. Besides this,
> > it features multiple controllers such as the classic UART, high-speed
> > I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
> > interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
> > also includes a Hardware Security Module, Functional Safety Hardware,
> > and video encoders, among other features.
> >
> > For now, this series just adds initial support with UART and Pinctrl
> > support. Another current limitation pointed out in patch 3 is that
> > only one CPU is actually running. This limitation will be solved with
> > upcoming series.
> >
> > The main change in this new version is the use of the new way to name
> > the clock nodes.
> 
> I sent this second version a month ago and the first version even before
> that, and I still haven't received any feedback from your side. Does it
> mean that you will merge it?

I will this week. The second version came around merge window, so I didn't
want to include it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

