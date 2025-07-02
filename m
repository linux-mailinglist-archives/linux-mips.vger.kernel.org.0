Return-Path: <linux-mips+bounces-9604-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12CAF586E
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9ADA7B9C3A
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F30F27978D;
	Wed,  2 Jul 2025 13:19:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D921E485;
	Wed,  2 Jul 2025 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462347; cv=none; b=AX+tqf4FU4eu/JTHzk7QXzpld7wXIOqxObRDfORmwesF0gwIAuTW7opHcLi1/Yj4FPP8HZBDiIBdjXwBrR6WYjr8EnGkNwzmhRbdNUcSHVb6+Yn3n7J2rHsCB7BtvszebkTZd1BQFIkrmCwd5Z1RV+P4B1LUk2KbEFKLTu9BHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462347; c=relaxed/simple;
	bh=a3Wyp5SqjigUho7y7SxxcO6AUOzylt0NJ22sAZJxEPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDnihphMIOmyBNZT6hXnfHuG3GA7F0KksF85al6P+XDkWTqXblHuijimC1BIs55mwhwBoMCWQQ0QM+3aut8okhHwKVFw3dvtvq3vfoIp1Z0+pRxNcKn2odRekYmt7IeOY8NZ4n0qG2HhXNOVLsVWL+gV3BP+jAn1YGS+7yHH+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwab-00058O-00; Wed, 02 Jul 2025 14:29:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B451FC0C37; Wed,  2 Jul 2025 14:08:48 +0200 (CEST)
Date: Wed, 2 Jul 2025 14:08:48 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: disable MMID if GINVT is not usable
Message-ID: <aGUhUM1y-ZLGWZg-@alpha.franken.de>
References: <20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com>
 <808e21d2-1212-4358-9ba6-29f9d097be8a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <808e21d2-1212-4358-9ba6-29f9d097be8a@app.fastmail.com>

On Wed, Jun 25, 2025 at 03:44:00PM +0100, Jiaxun Yang wrote:
> 在2025年6月25日周三 下午2:27，Gregory CLEMENT写道：
> 
> Hi Gregory,
> 
> > If System-level Interconnect (aka Network on Chip) does not support
> > the global invalidation, then MMID feature is not usable. Indeed the
> > current implementation of MMID relies on the GINV* instruction.
> 
> Yes, it is the case if the NoC IP can't handle AMBA ACE DVM requests.
> 
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> > ---
> >  arch/mips/Kconfig                    | 6 ++++++
> >  arch/mips/include/asm/cpu-features.h | 5 ++++-
> >  arch/mips/mobileye/Kconfig           | 2 ++
> >  3 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 
> > 1e48184ecf1ec8e29c0a25de6452ece5da835e30..05ce008459b89f03fa71d94429607feb9d06526f 
> > 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -2575,6 +2575,12 @@ config WAR_R10000_LLSC
> >  config WAR_MIPS34K_MISSED_ITLB
> >  	bool
> > 
> > +# Some I6500 based SoC do not support the global invalidation on their
> > +# System-level Interconnect (aka Network on Chip), this have an
> > +# influence on the MMID support.
> > +config GINVT_UNSUPPORTED_NOC
> > +	bool
> > +
> 
> I believe this should be a DeviceTree property of CM node instead of Kconfig
> hack.

Either that or by a runtime check, if possible.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

