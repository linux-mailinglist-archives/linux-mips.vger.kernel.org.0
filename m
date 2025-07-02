Return-Path: <linux-mips+bounces-9609-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6303CAF588D
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DA84A8122
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C4427A451;
	Wed,  2 Jul 2025 13:19:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F48027603B;
	Wed,  2 Jul 2025 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462363; cv=none; b=b64FlZ1NPoDEY/SvVgI791IAMOxBapR/ddHUlWVpbtG4asx0Q6uKXQn9lhgvfnRLMB+zewd0gTnsZDvOw8KZVOd7r9iPz5xktKO8OFn/vhG4nI1+bkjD1fxGuJgDwGRUnUkE4uWIiOyin2VKtcweR97owz416TNyrIGSKEHBT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462363; c=relaxed/simple;
	bh=xh8Nx0MkhW4nPCK0WeyG9XGZD1r8RsIQFFetDPDIgt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX3qd+sjRek4TVHQksJ8f6dGR+j7y7ZXwuOjkjLNdHTvsn82nSJtobhwy1EUINF4VOQpDEutn0c1y2wNmZYYhZItPBI245YIyPFylcVAoqzmRcYYiIqVeHBFtE6LF+Jc+3jCgYix818MP40udptTElhPU/xypsWfR62ArfSG2GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwaa-000588-00; Wed, 02 Jul 2025 14:29:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 23B72C0176; Wed,  2 Jul 2025 13:10:18 +0200 (CEST)
Date: Wed, 2 Jul 2025 13:10:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v1 1/1] firmware/nvram: bcm47xx: Don't use "proxy" headers
Message-ID: <aGUTmtdyZEi8yMnT@alpha.franken.de>
References: <20250626175926.372183-1-andriy.shevchenko@linux.intel.com>
 <ff0cdcc3-db09-44fa-b5f7-8fe150e619f8@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff0cdcc3-db09-44fa-b5f7-8fe150e619f8@broadcom.com>

On Mon, Jun 30, 2025 at 12:03:46PM -0700, Florian Fainelli wrote:
> On 6/26/25 10:59, Andy Shevchenko wrote:
> > Update header inclusions to follow IWYU (Include What You Use)
> > principle.
> > 
> > Note that kernel.h is discouraged to be included as it's written
> > at the top of that file.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Thomas, can you pick this up? Thanks!

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

