Return-Path: <linux-mips+bounces-9284-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104AAD8C84
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 14:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E42C7AD8CB
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 12:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175B779F2;
	Fri, 13 Jun 2025 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0yxx6Kr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABC1CFBC;
	Fri, 13 Jun 2025 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818988; cv=none; b=XF25jiE8wyjtMaF9kA3S6MnRxTTS8tPTJz5hTFx5g/2Wt+3bHjP1KrxAveFSwLsB1Al5R9LfHziac+uqVBEmmPl2G/i/T2l3yIZm+sHoT1gnvEQyk4gF1IBqU5ZXroHEyf0o4NEszhvqGFScJz24huOHbWDHr7gGAK1H7Pr8Mkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818988; c=relaxed/simple;
	bh=ek/eN2D8taHMBYdQGwF6lG7+XsxcXMWy1Zxnj0njFgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhzBA6zjQKmctB0neRY+uI7vamtdd0dwZEsrmCHwm1jY3mCNTxX/oETKjf4H9vPJlxhrGdsLkzhCPfGisSwkkFO0wl8QqIBUfh6hmoAZ9ejPRfhMMzSx5CAGXWQ59JGJFckQLwcxRCgCb4sqdwlO7V0t4Rl/mxwRLBw8+eoJXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0yxx6Kr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749818986; x=1781354986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ek/eN2D8taHMBYdQGwF6lG7+XsxcXMWy1Zxnj0njFgo=;
  b=P0yxx6KrtEzbp/K7lnka5kEka65c2+Ev5R24SDE7p4EeVsPjw4YwRYYo
   aX69dq16Y9/qhoSfOmzOsQF12UFK2ckMESXxKZ5Rg3uhiE5kYSsChGw5s
   v4utGmmJEhBbG+OWZ74SPnHhv6mpFgj5ECdfX5N26pRH06QbPfblNntDh
   oC4hxl+rLmF/5DTUPxNycY0Aow+j60pACo45RV4ZKNrU6k2HHELhLc/VR
   nOXXlGCibeuW2n2Br34to1Pextxa6JpIIQX8LlGzzNZCYppvW8x7KvBno
   PmCuuYqEL9s36BORXmLKSr9qFY4BRvkc3B8OlxQHFbKtcXJvFvbWHDSu6
   A==;
X-CSE-ConnectionGUID: D1hTrai7TlmuiJqrf+j0sQ==
X-CSE-MsgGUID: OGgHy8otSDaSOOClHeMxSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52127887"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="52127887"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:49:45 -0700
X-CSE-ConnectionGUID: HZy3oaWCQDiPIbH3D8Vs+Q==
X-CSE-MsgGUID: n6gVM+05RPivmmFQPEPW6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="151641284"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:49:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uQ3qo-00000006FPu-0Csj;
	Fri, 13 Jun 2025 15:49:42 +0300
Date: Fri, 13 Jun 2025 15:49:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEweZReuPzQ_hq8L@smile.fi.intel.com>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
 <aEwMFVSPzc-mV1ve@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEwMFVSPzc-mV1ve@alpha.franken.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 01:31:33PM +0200, Thomas Bogendoerfer wrote:
> On Fri, Jun 13, 2025 at 01:39:07PM +0300, Andy Shevchenko wrote:
> > +Cc: Bart.
> > 
> > On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:
> > > The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> > > This seems to be a leftover for a 5 years.
> > 
> > Any comments on this, please?
> 
> looks good

Formal tag please?

> > It prevents us from moving forward with the killing the GPIO legacy APIs
> > (it's not critical at all in this case, just an inconvenience for a `grep`,
> > but still...).
> > 
> > I think we can take it via GPIO tree if there is no reply.
> 
> please do

Acked-by?

-- 
With Best Regards,
Andy Shevchenko



