Return-Path: <linux-mips+bounces-9299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072BAD95E4
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 22:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ADAE1E2F30
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 20:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74DD22DF9E;
	Fri, 13 Jun 2025 20:07:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B55472608;
	Fri, 13 Jun 2025 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845253; cv=none; b=maTGo+rvX2Yrhfu2jL+mQUvB8cwnn8Jnejnti1gjjH0uCV6DyqzvlS1PjspPfSMjji7popzTdwS7zjgGhtcdmKsWHsX+eCMClJMiUl5llWXk7Ttn2Y6Vf21sE4fogtt5uhGPLjXddSFGjiJwSACWfXPfzIfNr8PlhaAdUIkzS+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845253; c=relaxed/simple;
	bh=mWoVO4+nIqKJNfVlaTd98H8+f125Mc8TgZzKioB0I2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCAw5TD2E75t9SP+IGAXWa9P+E5C/NjfoShJ0ASavaQd1nr0SCLzZj06cU1h7h5Bz6/xf3j/gCiMsp6LjewRj6w2aMRaydbJzYKHXh0hH2SYnWQhtM5HE9iIRqQsOX+lEOaRP/NnGcgdQpv4lPn9EcsDtvSFgI/mENyNpu8MxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uQAgQ-00007d-00; Fri, 13 Jun 2025 22:07:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B0F25C0176; Fri, 13 Jun 2025 16:16:57 +0200 (CEST)
Date: Fri, 13 Jun 2025 16:16:57 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEwy2Ud08nHHAdED@alpha.franken.de>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
 <aEwMFVSPzc-mV1ve@alpha.franken.de>
 <aEweZReuPzQ_hq8L@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEweZReuPzQ_hq8L@smile.fi.intel.com>

On Fri, Jun 13, 2025 at 03:49:41PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 13, 2025 at 01:31:33PM +0200, Thomas Bogendoerfer wrote:
> > On Fri, Jun 13, 2025 at 01:39:07PM +0300, Andy Shevchenko wrote:
> > > +Cc: Bart.
> > > 
> > > On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:
> > > > The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> > > > This seems to be a leftover for a 5 years.
> > > 
> > > Any comments on this, please?
> > 
> > looks good
> 
> Formal tag please?
> 
> > > It prevents us from moving forward with the killing the GPIO legacy APIs
> > > (it's not critical at all in this case, just an inconvenience for a `grep`,
> > > but still...).
> > > 
> > > I think we can take it via GPIO tree if there is no reply.
> > 
> > please do
> 
> Acked-by?

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

