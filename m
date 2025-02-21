Return-Path: <linux-mips+bounces-7895-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A149A3FCB8
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 18:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 908607A733F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 17:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BE3244E96;
	Fri, 21 Feb 2025 17:02:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223B124336E;
	Fri, 21 Feb 2025 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157342; cv=none; b=s+C31e0r4U/ZdR1EaBb4qE3TDddkVZs3NyXeC12rCMna1IDhRGKcrypHRU31swXMxoiv/sXN0LKH8WcSJLpyeU7Or37lYrUQ5NnsBA7cu+JWufFU+ebMn4D4CuWtjIh9OhnRE3zec+LWiTlnXvtHYTgG1CFapuUyU68qbTdx5jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157342; c=relaxed/simple;
	bh=eDJSMOr+h1SSZEQ8kxz+WyG6t2AUCYwQFo5uAoH21rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKXvoldzEQHLUKEmbr65s7f6mavb7nXrmxiGKooxvZGgHhpxTtr0acbHjSVM+A+x60NAFRowm3JeXf6QQY9p3a5uO/rwf0s74SOy1uzLXPDOxHHHbH9EvRJMsIOCK8P72o4i6tTTftc9WaQxDCAlOzWt/J4v23ojwr68nanTnvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlWPn-00020g-00; Fri, 21 Feb 2025 18:02:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A1DE8C0135; Fri, 21 Feb 2025 18:01:48 +0100 (CET)
Date: Fri, 21 Feb 2025 18:01:48 +0100
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
Message-ID: <Z7ixfMbpePvkpp2q@alpha.franken.de>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-VevC+_=HxhMU6-at0bKut_JqdgO7j2detuB4s8R_QFQ@mail.gmail.com>
 <Z7iHorlRgtsi1LOo@alpha.franken.de>
 <CAMhs-H-fcWU-rz_3FeAuRe0xdCMmvffX2zrZwwmt=8RYpY4Lyg@mail.gmail.com>
 <Z7idguBa2bxZRoxX@alpha.franken.de>
 <CAMhs-H91Pv4bygmL2jL0=swn-wHT0mRYGaYO6Hjm5O-xmmrJ0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H91Pv4bygmL2jL0=swn-wHT0mRYGaYO6Hjm5O-xmmrJ0w@mail.gmail.com>

On Fri, Feb 21, 2025 at 05:40:34PM +0100, Sergio Paracuellos wrote:
> On Fri, Feb 21, 2025 at 4:37 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Fri, Feb 21, 2025 at 03:50:09PM +0100, Sergio Paracuellos wrote:
> > > Hi Thomas,
> > >
> > > On Fri, Feb 21, 2025 at 3:05 PM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > >
> > > > On Fri, Feb 21, 2025 at 11:48:34AM +0100, Sergio Paracuellos wrote:
> > > > > Hi Thomas,
> > > > >
> > > > > El El lun, 20 ene 2025 a las 10:21, Sergio Paracuellos <
> > > > > sergio.paracuellos@gmail.com> escribió:
> > > > >
> > > > > > Hi all!
> > > > > >
> > > > > > Ralinks SoCs have a system controller node which serves as clock and reset
> > > > > > providers for the rest of the world. This patch series introduces clock
> > > > > > definitions for these SoCs. The clocks are registered in the driver using
> > > > > > a bunch of arrays in specific order so these definitions represent the
> > > > > > assigned
> > > > > > identifier that is used when this happens so client nodes can easily use it
> > > > > > to specify the clock which they consume without the need of checking
> > > > > > driver code.
> > > > > >
> > > > > > DTS files which are currently on tree are not matching system controller
> > > > > > bindings. So all of them are updated to properly match them.
> > > > > >
> > > > > > I'd like this series to go through kernel mips git tree if possible.
> > > > > >
> > > > > > Thanks in advance for your time.
> > > > > >
> > > > > > Changes in v3:
> > > > > > - Address Krzysztof comments in v2 (Thanks!):
> > > > > >   + Drop reset include file since what it was defined there were hardware
> > > > > >     constants and no binding related indexes at all.
> > > > > >   + Update patches for not referring to this reset removed file.
> > > > >
> > > > >
> > > > > I was expecting this series going through the mips tree.
> > > >
> > > >   DTC     arch/mips/boot/dts/ralink/rt3883_eval.dtb
> > > > Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/rt3883.dtsi:2.1-9 syntax error
> > > > FATAL ERROR: Unable to parse input tree
> > >
> > > Weird, it looks like dtc is not happy with the "include" line with new
> > > definitions? Are you getting this only with rt3883? Since all the
> > > patches are almost the same and I compile tested this before sending..
> > > Something got corrupted? I don't have my laptop now to check but I
> > > will recheck again on monday.
> >
> > rt2880_eval.dts:/include/ "rt2880.dtsi"
> > rt3052_eval.dts:#include "rt3050.dtsi"
> > rt3883_eval.dts:/include/ "rt3883.dtsi"
> >
> > rt3052 works, rt2880 and rt3883 don't.
> >
> > changing the /include/ to #include makes them compile.
> 
> Mmmm...does this mean that this was broken before my patches? Since I
> have not touched the files that need the replacement.

no, without your patches everything compiles. I guess dtc (?) doesn't
allow #include in files, which were included via / include /. But that's
just guesswork

 So I probably
> checked in the openwrt tree and missed this totally. Sorry for that.
> How do you want to handle this? Should I send v4 including these
> replacements? Or do you prefer to handle them directly?

I'll fix the includes while applying.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

