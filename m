Return-Path: <linux-mips+bounces-9279-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 192ABAD8A92
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 13:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D4E1896737
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 11:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64B42DECBC;
	Fri, 13 Jun 2025 11:32:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBBF279DA5;
	Fri, 13 Jun 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814343; cv=none; b=L7HEwYewSwsJohTSnVzznLuJ2bOZmSMdoUHybse9OkjWt+8S1L6p+xTvtz4NjJAz4/mWReGoqQBqC7ANdsU5xqhQj2G4+MTodaL22M2MKtu+W8rIWqkCCZgQio17oFpJ+frj6FAA+tszt2ALMbB2QAVDQNMOR4JoaFgHEQKoW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814343; c=relaxed/simple;
	bh=UK+cvFq8rfx03qph2xxeqVs8LNSKipPyiS1et9vKuCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJ9BY0PdhkpPHMIYaHBsvBlqrzxsAj1Fslj9Hh1ZG6M9cuFeGdn8MCly3614NPmhgnWKDO1NG/bCBKANkiq5JiTKZ94cvNnxIx2Wah45VfNkoby6qv635qe3R6ZnjZFci+5rZ8NmCvhMhwtwKPlWJUmC4/XpliwK2b0Ek/hVeQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uQ2dm-0003r3-00; Fri, 13 Jun 2025 13:32:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AB030C05F3; Fri, 13 Jun 2025 13:31:33 +0200 (CEST)
Date: Fri, 13 Jun 2025 13:31:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEwMFVSPzc-mV1ve@alpha.franken.de>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEv_y5Lfe3Dul48I@smile.fi.intel.com>

On Fri, Jun 13, 2025 at 01:39:07PM +0300, Andy Shevchenko wrote:
> +Cc: Bart.
> 
> On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:
> > The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> > This seems to be a leftover for a 5 years.
> 
> Any comments on this, please?

looks good

> It prevents us from moving forward with the killing the GPIO legacy APIs
> (it's not critical at all in this case, just an inconvenience for a `grep`,
> but still...).
> 
> I think we can take it via GPIO tree if there is no reply.

please do

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

