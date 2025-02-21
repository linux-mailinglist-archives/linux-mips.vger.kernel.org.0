Return-Path: <linux-mips+bounces-7888-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A09A3F6CA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 15:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27075189896C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 14:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEFD20E307;
	Fri, 21 Feb 2025 14:05:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B671BCA07;
	Fri, 21 Feb 2025 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740146745; cv=none; b=G7XQ8pszPEGV9gN21UrvVFi4Wz6nyqwBINAqgCoA/AIBv7TrfXGD7FzorCz6QCbwn+KZyHPAwbPK17oNpKlfuezadEg/zHYzIQ2Pxc22JNnE48dHe9G2d/4MyhiN5oN+2TZJ9d9OldAv1ADzppB78pttsEcO+ArjGWuXWm6C0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740146745; c=relaxed/simple;
	bh=xU7/wEZfiw+9Pn0wYe4JOCCx45ck0D30lzuetNbvIYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAMXJ+B18qzn+L1pgufpMMJBZ1AlkF3ht2G76gVNV64ul5BgApeqe1cKIIG8/YJ0V6ErDVgGSCIKN4m/ZB3TmyAmoh8yncQey3kA3FupCn2KKPC+BfTxorihugoaXsjlpkhIRW/yWUCIcHXMYtmwJyXyF/kJNyxqJQIeo450gog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlTet-00007t-00; Fri, 21 Feb 2025 15:05:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C0706C0135; Fri, 21 Feb 2025 15:03:14 +0100 (CET)
Date: Fri, 21 Feb 2025 15:03:14 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] mips: dts: ralink: update system controller nodes
 and its consumers
Message-ID: <Z7iHorlRgtsi1LOo@alpha.franken.de>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-VevC+_=HxhMU6-at0bKut_JqdgO7j2detuB4s8R_QFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H-VevC+_=HxhMU6-at0bKut_JqdgO7j2detuB4s8R_QFQ@mail.gmail.com>

On Fri, Feb 21, 2025 at 11:48:34AM +0100, Sergio Paracuellos wrote:
> Hi Thomas,
> 
> El El lun, 20 ene 2025 a las 10:21, Sergio Paracuellos <
> sergio.paracuellos@gmail.com> escribió:
> 
> > Hi all!
> >
> > Ralinks SoCs have a system controller node which serves as clock and reset
> > providers for the rest of the world. This patch series introduces clock
> > definitions for these SoCs. The clocks are registered in the driver using
> > a bunch of arrays in specific order so these definitions represent the
> > assigned
> > identifier that is used when this happens so client nodes can easily use it
> > to specify the clock which they consume without the need of checking
> > driver code.
> >
> > DTS files which are currently on tree are not matching system controller
> > bindings. So all of them are updated to properly match them.
> >
> > I'd like this series to go through kernel mips git tree if possible.
> >
> > Thanks in advance for your time.
> >
> > Changes in v3:
> > - Address Krzysztof comments in v2 (Thanks!):
> >   + Drop reset include file since what it was defined there were hardware
> >     constants and no binding related indexes at all.
> >   + Update patches for not referring to this reset removed file.
> 
> 
> I was expecting this series going through the mips tree.

  DTC     arch/mips/boot/dts/ralink/rt3883_eval.dtb
Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/rt3883.dtsi:2.1-9 syntax error
FATAL ERROR: Unable to parse input tree

that's what I get after applying the series building for RT3883.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

