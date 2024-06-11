Return-Path: <linux-mips+bounces-3585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B7903E61
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 16:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E741C22119
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEC617D36F;
	Tue, 11 Jun 2024 14:08:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF441DDF4;
	Tue, 11 Jun 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718114883; cv=none; b=dlJyHpIi+D5JoZfz4UpsngodjF3wnkKS/Cq3rYkN6WnIJg/z1n5dGfw6r7g1Vgz4+31sGOM9zsU74/ZpEUYegWlhahq/zIK38Esd8Rrxmh41Xs7U4oJGtc5G01w6QJTtnFWzd+822mBjwA0RfRXZuKlYhRwY/TRP2rNQCY1xEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718114883; c=relaxed/simple;
	bh=v75fYsSUIgFo9A9XwziCLVc5Lj+NmGuKOUWo8pr3H+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2xJedNPMBroNVDHTC2RerPG7/Zi7Vjl4x+Lk0maEg2jW2VL4qahr5zev5baow93tLgs7i5UBpkm3vdGpEOZaCbVehP/CP7yDiEbPT2yEEPoEq9tewvA3TcyZ0ZPHfYOx5wtH4LqZEcsay/FGz5EDrY4WqxzKO3+uX+vbfniByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH2AG-00031H-00; Tue, 11 Jun 2024 16:07:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 087DAC031A; Tue, 11 Jun 2024 16:03:41 +0200 (CEST)
Date: Tue, 11 Jun 2024 16:03:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] mips: bmips: BCM6358: make sure CBR is correctly
 set
Message-ID: <ZmhZPdr9MpESOXgm@alpha.franken.de>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
 <20240611113538.9004-2-ansuelsmth@gmail.com>
 <ZmhHw5QZCQ6G6EbK@alpha.franken.de>
 <6668503a.050a0220.9ec4a.4777@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6668503a.050a0220.9ec4a.4777@mx.google.com>

On Tue, Jun 11, 2024 at 03:04:36PM +0200, Christian Marangi wrote:
> On Tue, Jun 11, 2024 at 02:49:07PM +0200, Thomas Bogendoerfer wrote:
> > On Tue, Jun 11, 2024 at 01:35:33PM +0200, Christian Marangi wrote:
> > > It was discovered that some device have CBR address set to 0 causing
> > > kernel panic when arch_sync_dma_for_cpu_all is called.
> > > 
> > > This was notice in situation where the system is booted from TP1 and
> > > BMIPS_GET_CBR() returns 0 instead of a valid address and
> > > !!(read_c0_brcm_cmt_local() & (1 << 31)); not failing.
> > > 
> > > The current check whether RAC flush should be disabled or not are not
> > > enough hence lets check if CBR is a valid address or not.
> > > 
> > > Fixes: ab327f8acdf8 ("mips: bmips: BCM6358: disable RAC flush for TP1")
> > 
> > should I apply it to mips-fixes ? If not could you just ammend
> > it with the following patch, where this is changed again ?
> >
> 
> Ideally this should be backported to stable kernel since it does cause
> kernel panic. This is why it's split and it's the first patch of the
> series.

ok, I'll apply it to mips-fixes then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

