Return-Path: <linux-mips+bounces-7892-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272FA3F919
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 16:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9527704696
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 15:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2901D5172;
	Fri, 21 Feb 2025 15:37:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83D58632E;
	Fri, 21 Feb 2025 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152237; cv=none; b=YeBgsEAzQhgyDtrpk/atys9jr/QK3BcJmzaBPk60z9VXLZLn+387GtBdagNkEPAy4DeoX3XzWxTfFWcb93y5WzvMHKzJglvM+bpBaKWw1NiykYma/vYMzHcRQBmII7HonSPDtutAY0knHkznv/zx+WgHeMkWW6L2Z0DXsJiVyI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152237; c=relaxed/simple;
	bh=fNwEUMICWArtXN6ij1vQ7gWszyVTypN8591MquG7YJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0IcOx151YsOl3fv+o1XxCFOKebfRzigU3gRaXdx5gbdXsLUtO2cf8j6UKq6SN4H5/K+vnotN4YG7DRVg9hq7bH73Nw3pr3A4YVwNV0Ph8jOhjoS1v2wNDnULEkcD1HeefAyNWXuTOjFiSLSkB23utZDQFJsXhnaC3Oxgs0DT98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlV5S-0001AO-00; Fri, 21 Feb 2025 16:37:10 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CA4BEC0135; Fri, 21 Feb 2025 16:36:34 +0100 (CET)
Date: Fri, 21 Feb 2025 16:36:34 +0100
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
Message-ID: <Z7idguBa2bxZRoxX@alpha.franken.de>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-VevC+_=HxhMU6-at0bKut_JqdgO7j2detuB4s8R_QFQ@mail.gmail.com>
 <Z7iHorlRgtsi1LOo@alpha.franken.de>
 <CAMhs-H-fcWU-rz_3FeAuRe0xdCMmvffX2zrZwwmt=8RYpY4Lyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H-fcWU-rz_3FeAuRe0xdCMmvffX2zrZwwmt=8RYpY4Lyg@mail.gmail.com>

On Fri, Feb 21, 2025 at 03:50:09PM +0100, Sergio Paracuellos wrote:
> Hi Thomas,
> 
> On Fri, Feb 21, 2025 at 3:05 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Fri, Feb 21, 2025 at 11:48:34AM +0100, Sergio Paracuellos wrote:
> > > Hi Thomas,
> > >
> > > El El lun, 20 ene 2025 a las 10:21, Sergio Paracuellos <
> > > sergio.paracuellos@gmail.com> escribió:
> > >
> > > > Hi all!
> > > >
> > > > Ralinks SoCs have a system controller node which serves as clock and reset
> > > > providers for the rest of the world. This patch series introduces clock
> > > > definitions for these SoCs. The clocks are registered in the driver using
> > > > a bunch of arrays in specific order so these definitions represent the
> > > > assigned
> > > > identifier that is used when this happens so client nodes can easily use it
> > > > to specify the clock which they consume without the need of checking
> > > > driver code.
> > > >
> > > > DTS files which are currently on tree are not matching system controller
> > > > bindings. So all of them are updated to properly match them.
> > > >
> > > > I'd like this series to go through kernel mips git tree if possible.
> > > >
> > > > Thanks in advance for your time.
> > > >
> > > > Changes in v3:
> > > > - Address Krzysztof comments in v2 (Thanks!):
> > > >   + Drop reset include file since what it was defined there were hardware
> > > >     constants and no binding related indexes at all.
> > > >   + Update patches for not referring to this reset removed file.
> > >
> > >
> > > I was expecting this series going through the mips tree.
> >
> >   DTC     arch/mips/boot/dts/ralink/rt3883_eval.dtb
> > Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/rt3883.dtsi:2.1-9 syntax error
> > FATAL ERROR: Unable to parse input tree
> 
> Weird, it looks like dtc is not happy with the "include" line with new
> definitions? Are you getting this only with rt3883? Since all the
> patches are almost the same and I compile tested this before sending..
> Something got corrupted? I don't have my laptop now to check but I
> will recheck again on monday.

rt2880_eval.dts:/include/ "rt2880.dtsi"
rt3052_eval.dts:#include "rt3050.dtsi"
rt3883_eval.dts:/include/ "rt3883.dtsi"

rt3052 works, rt2880 and rt3883 don't.

changing the /include/ to #include makes them compile.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

