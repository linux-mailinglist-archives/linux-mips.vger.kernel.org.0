Return-Path: <linux-mips+bounces-8683-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA6A96075
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5FF8188E6EF
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 08:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9CE256C81;
	Tue, 22 Apr 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjAZH6Pu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FC256C71;
	Tue, 22 Apr 2025 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309019; cv=none; b=AlgqfdZn3wEsvD5mHW9cOQ0nFnH6YyGPfGww6yPz8p3uXZLG011UXo9cwFAkipCizohA8LICDwidsN2jK1AavSo/p5r/UumttRfSkVKJUn/U+vgOyrwdU7m/Kv8IyWz8eX07V+A6FmOYcexdfN3ZhtGQKaM/tN94mHXgHRrDycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309019; c=relaxed/simple;
	bh=o7H/iq0YMoBxJPp7UTWI0Eo19jVEqBYyBI7h/GajBb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYX0VYLul6QG2fnv1KjMVOsugGTABBzpEmzvEnTn9EbiX1Y3s91yblBgqMBrv5lI43aPbiNKwu+8PhMzevlJgG4F5DBuPqlkOIidLmgCJKDKn4bbpB8fBY17ItkRKjlBktPlAxv52wEAsZ1/DLYlLsMjQvdxz8mBjSjNKNeiUGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjAZH6Pu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745309018; x=1776845018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7H/iq0YMoBxJPp7UTWI0Eo19jVEqBYyBI7h/GajBb8=;
  b=IjAZH6PuFne+uaiTwqKcJ63VnA5oB5qAagSDvlw0Am1LfhGWe8p6zc1g
   LYprMGj5s2aYaCc+AUbySO+SgUzgKG7+CJ43q3uXw6Y4GwqgfTkvJaO9o
   FP5WwJ3NOJH8WgeWI4N2J0204b1B5/fcQ/hhaqZQycO3fRNJJvWiBOlhb
   VUm6NpB3jTy/GqTA8o4OkurmttNYYAUlwVEzqP1ouS1sqKUXymRpUTbKd
   bSBGbfZvmXW3KIzfQlzE87da6aB0QC8gPOzGlyThDokUhDRODIz0SR0+W
   +xIkcu5RMusv+EYqdeOMRhlLr6jF3ZHR+Zd9fxONCrCLzwJs8rdg7s7Gs
   w==;
X-CSE-ConnectionGUID: vLfpHkRXR6a6zmycar0BYQ==
X-CSE-MsgGUID: TTibbZMkRTqt+ZMvaW1CtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47038065"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="47038065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 01:03:37 -0700
X-CSE-ConnectionGUID: DCmJpHjLQI+JbkbI4Kc4KA==
X-CSE-MsgGUID: kotw2JxqTm2AEiL0dDjwfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="162993425"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 01:03:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u78bM-0000000EfTR-2H33;
	Tue, 22 Apr 2025 11:03:32 +0300
Date: Tue, 22 Apr 2025 11:03:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63XX: Replace strcpy() with strscpy() in
 board_prom_init()
Message-ID: <aAdNVAzu0rmIfGGC@smile.fi.intel.com>
References: <20250422074257.544016-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422074257.544016-2-thorsten.blum@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 09:42:55AM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.

> Link: https://github.com/KSPP/linux/issues/88

> Cc: linux-hardening@vger.kernel.org

Can you use --cc OR put this line...

> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

...here (after the cutter), so we won't see this in the commit message? The
list will be available in the lore archive anyway.

> @@ -764,7 +764,7 @@ void __init board_prom_init(void)
>  			snprintf(cfe_version, 12, "%s", (char *) &cfe[4]);
>  		}
>  	} else {
> -		strcpy(cfe_version, "unknown");
> +		strscpy(cfe_version, "unknown");
>  	}

Have you compiled this with `make W=1` with recent GCCs? I would recommend to
rewrite the whole function, as per commit ee44a1def7ee ("leds: core: Bail out
when composed name can't fit the buffer") in Linux Next.

-- 
With Best Regards,
Andy Shevchenko



