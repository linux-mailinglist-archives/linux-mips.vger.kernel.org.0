Return-Path: <linux-mips+bounces-5158-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACC962BC1
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 17:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07ED7286760
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 15:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AAD1AB513;
	Wed, 28 Aug 2024 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlXAWp/h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1B1A3BD0;
	Wed, 28 Aug 2024 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857903; cv=none; b=Wtu6nfaQ5mvVZjT5HPY1EnBOzQkN/ox7MiHmZjIM9o3gR9kwVyjELZAAIrekgtOX6H1jwglA7Fn/MD4h8hTj3nGjIUg2dJX48DWz40ZhZgrV5mfICGo3Oy4b8rJ7bdFMGM3BYI8or2whwi9w5ON5vTSBrWPl/e6hD6t48BkiweE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857903; c=relaxed/simple;
	bh=5YJPyU93FZIqQ3QHkGoylE4Fc+ccIKPNGyZgM50RjXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfYrE7hQ0bc5FJNvrKfaUTDx51TLX2YWcl+xsHFbOUKLHkS8EaaltJJAL0nrfYVSLjatJsaCjVvQHvK+tqs2m+qzuR3o8esLv3rXvOapVG3oMystSq6+Nmdqb8+RiV69vg0yqC58HbKl4xki5g/nhNDAl/jaJ5n2RsnlSx2vv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlXAWp/h; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724857902; x=1756393902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5YJPyU93FZIqQ3QHkGoylE4Fc+ccIKPNGyZgM50RjXw=;
  b=VlXAWp/hRZeg7VSm2ha+kw9MzXIjOKodLHjeoF1vpm43jq08FXIvJsdI
   6R3feUE6dFZL557G2kfJMv3o/o03pfIEhEo1Nox3GxpMuKab+bGp+oCgl
   sjYoqmBsUql7s+wT58rw7AaVsBmNP0+QzvTpiZPfMRPeaiK9of6Bio/7Y
   6n0VgXZLk/9pe3PQlnG1VvkW5o0vTDD0E3v7suQCszGgwnB7As6GIE9yP
   vk+bmHghhhg5EB7sVh4fX45mzXj0m0RWYV71vI4EvMchY7G3QbJR7uQqI
   Drb5bs/bSVo/VSGXrIUj7KJjLQTQ5bxak0w02ECm5weN6a6dn/KDdRRhs
   w==;
X-CSE-ConnectionGUID: K2obO4k0QGuEHl9bAjkhpg==
X-CSE-MsgGUID: BDXpQwj3Tk+gaGnWOikpEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23200976"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23200976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:11:41 -0700
X-CSE-ConnectionGUID: GJ2FmotUT3i99/ZNkEtC6Q==
X-CSE-MsgGUID: 2fokvfrRQ5KhwzXOcKAFmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63246069"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:11:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjKKd-00000002gZH-28Fd;
	Wed, 28 Aug 2024 18:11:35 +0300
Date: Wed, 28 Aug 2024 18:11:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpiolib:legacy: Kill GPIOF_DIR_* and GPIOF_INIT_*
Message-ID: <Zs8-J2fXH6oF7roE@smile.fi.intel.com>
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 28, 2024 at 05:23:56PM +0300, Andy Shevchenko wrote:
> Shrink the legacy API and definition surface by killing the (internal)
> definitions. This, in particular, will fix a couple of drivers that took
> it wrong.
> 
> This is assumed to go via BPIOLIB tree as this is quite small series and
> most of the changes related to it.

Hmm... LKP complained that it can't apply them on top of Linux Next, however
I don't see any issues as my branch based on next-20240828.

Tell me if I need to resend.

-- 
With Best Regards,
Andy Shevchenko



