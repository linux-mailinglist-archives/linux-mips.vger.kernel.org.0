Return-Path: <linux-mips+bounces-9886-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DECB0F257
	for <lists+linux-mips@lfdr.de>; Wed, 23 Jul 2025 14:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012985840A6
	for <lists+linux-mips@lfdr.de>; Wed, 23 Jul 2025 12:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1B2243378;
	Wed, 23 Jul 2025 12:32:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BF52E3706;
	Wed, 23 Jul 2025 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753273947; cv=none; b=JgBzhDXP0/G1lECYhbbtRhOOgLUFPl91VU5Bx7VfHU0YNuawdn6b29MV7mntvszOZAROKON04AAtBFG3XttFyshjuT/jtc9qHV+TC0OaTM9ghj9UZWFQ/HSrF0pcwN+WKSF9gFzqbuV4RrtDfoB0jy2BinnDioH7b99Jw9dCcCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753273947; c=relaxed/simple;
	bh=FcTS4xpatQf/onsAoJ6AnBi5BnNbAcej5H9zsDx9U/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ih0ZhuIO63VnZkl+n/TxSZ4mZi8Bil2PB60iO0uP74c97ZtADqodMqbJYMldOR3eWZbeA7gJdUYn7vfxnsKGRvViQ1uOrQGS/58fD+Zc00ajmTIfEXFsCu2jJZkhIU7H2BZdiGp604iVBmZQr0ksKeb0GkLD9lC4SEdjELsNOJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ueYds-0007ie-00; Wed, 23 Jul 2025 14:32:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CAA80C035D; Wed, 23 Jul 2025 14:32:05 +0200 (CEST)
Date: Wed, 23 Jul 2025 14:32:05 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] tty: serial: ip22zilog: Use platform device for probing
Message-ID: <aIDWRZXXfvaO_4xl@alpha.franken.de>
References: <20250723115823.76341-1-tsbogend@alpha.franken.de>
 <2025072321-scorer-surfacing-1cdf@gregkh>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072321-scorer-surfacing-1cdf@gregkh>

On Wed, Jul 23, 2025 at 02:02:43PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 23, 2025 at 01:58:23PM +0200, Thomas Bogendoerfer wrote:
> > +static int __init sgi_zilog_devinit(void)
> > +{
> > +	struct resource res;
> > +
> > +	memset(&res, 0, sizeof(res));
> > +	res.start = HPC3_CHIP0_BASE + offsetof(struct hpc3_regs, rtcregs);
> > +	res.end = res.start + sizeof(hpc3c0->rtcregs) - 1;
> > +	res.flags = IORESOURCE_MEM;
> > +
> > +	return platform_device_register(&zilog_device);
> 
> Odd function, why do you need "res" at all if you do not do anything
> with it?

ouch, leftover from copy&paste... will remove in v2

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

