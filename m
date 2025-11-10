Return-Path: <linux-mips+bounces-12168-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682AC482EA
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 18:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D1CA54F5658
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 16:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0701331AF1D;
	Mon, 10 Nov 2025 16:52:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A45277C9E;
	Mon, 10 Nov 2025 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762793528; cv=none; b=kwDOuc9kW09a6aTLy8UljjwzQqiZgTQAaJp9rA3BN0bIwQHoUVqqxBWmlu/uqvpGifaUbXtC8MYOA+/Hcoa9qGK/o211MqwCs4Qmbe2kMls6kwnU9k71lnXLtWmh3Lce5irbF/EDao/Cgaev/m8bg82nPCYo1R4o7BbjZP1SEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762793528; c=relaxed/simple;
	bh=g/3LWrwhzXiK+StyewVO5x9YDmbI74yUYMlvkCQHe6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPeGMd48IUXz5E27IqFg2+/sehJ5/t4Ttd29dmXblmQbZdsFQjQUKbvWIDv+Fu3090SVXt+rdt6QpcTM1Am17oRyzb8DVv0pzlyygpo2dfSRIXwlDDQZ7N6O5zn6j/1i4Qp79WP7w4lYVVM+T2kSByKT352ha2j4ADkg2vjMA20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vIV7V-0005ri-00; Mon, 10 Nov 2025 17:51:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9D032C0591; Mon, 10 Nov 2025 15:37:22 +0100 (CET)
Date: Mon, 10 Nov 2025 15:37:22 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Fix HOTPLUG_PARALLEL dependency
Message-ID: <aRH4osz_OFxx8QZc@alpha.franken.de>
References: <20251027-mips_paralell_hotplug-v1-1-01b6cd13ee85@bootlin.com>
 <87v7jirnj0.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7jirnj0.fsf@BLaptop.bootlin.com>

On Mon, Nov 10, 2025 at 03:05:23PM +0100, Gregory CLEMENT wrote:
> Hello Thomas,
> 
> > With MIPS, it is possible to have SMP enabled without HOTPLUG_CPU
> > selected. However, in kernel/cpu.c, some code that uses
> > HOTPLUG_PARALLEL also requires HOTPLUG_CPU to be selected. Therefore,
> > we should fix the HOTPLUG_PARALLEL dependency to depend on
> > HOTPLUG_CPU, not just SMP.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202510270120.21wA1aX1-lkp@intel.com/
> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> 
> Do you have any comments about this fix?

all good from my side, does it need to go via mips-fixes ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

