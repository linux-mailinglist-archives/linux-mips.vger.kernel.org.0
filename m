Return-Path: <linux-mips+bounces-6007-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26099BB33
	for <lists+linux-mips@lfdr.de>; Sun, 13 Oct 2024 21:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16732818B7
	for <lists+linux-mips@lfdr.de>; Sun, 13 Oct 2024 19:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5071487D6;
	Sun, 13 Oct 2024 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvLUGWza"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D318E20;
	Sun, 13 Oct 2024 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728846431; cv=none; b=gM3odIz+t1euYaKzsBhmWDZcQ3w57m1apKPpTJFrLgaLC2OccWPs/NOJmTOTZH3iaVqYVERbYlal8Zj2VfW2xoB+NkeyKEDguzeg04tC+BFwTrJW0N8WWeQV4F5M3YA18mKMeH3rCBUx08iJ/ijrPj5YFNY2xIByGvcu3p9gYvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728846431; c=relaxed/simple;
	bh=WGChKk/v2bPtQT9tEv5O167MmakFHiIXP3SY1CjcKp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiltFl8tKG2q6/xN/kRVYe5lcirzlRj3TOPInahZTqphEe4J8ljEo+jmXduUkNVj5y1Fj7Z85AtJhH6Yi+h42hpgOdWRi+GyNjNsxHJvSvUpM7K5vBD83xcgRyqyvLNgVtejVEXFymc3kofOUcblBu2DAegfMjpJTrFI5qjKUZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvLUGWza; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728846431; x=1760382431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WGChKk/v2bPtQT9tEv5O167MmakFHiIXP3SY1CjcKp4=;
  b=AvLUGWzaBS8bn76fGcDtKxUB26QJj5VcfIkXE7QXKuTKKBbp/0RCAIEp
   zwtBZeUDdvTkB0cKQqaUVI+L9n5nbuWcRuK5JlygUoQ2OT5ry0GB5zSg/
   pZWV4kS+BDFObytYkuBQHzxTpKwcMADW6+02Hqiis2YF9kWFPDaQkEebp
   4w7ovol9NcFUC5BxrImdbThei+xBQGrdg3+A6Dm/WyIws6X/1FSR9ykaq
   Ka671gCH54xIEX1kBDuhaubHREhjo5Z6wedt3w4QKSTogwGcgIdnGj2Og
   yCjESzn0FwkdWEX5PP4NXmRK2AZeumVtqOzxduas4NcKEtC0/ayLo+qEb
   A==;
X-CSE-ConnectionGUID: y/muvMTORo+pnykSNHhA5A==
X-CSE-MsgGUID: GmMTZspwT9udFIqSAD0I9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28284787"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28284787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 12:07:10 -0700
X-CSE-ConnectionGUID: rvoJPcVARkW8LU9GiA/URw==
X-CSE-MsgGUID: /QRixkdfQrOwfc40emSk8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82167393"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 12:07:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t03vk-00000002eal-22tz;
	Sun, 13 Oct 2024 22:07:04 +0300
Date: Sun, 13 Oct 2024 22:07:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: linus.walleij@linaro.org, alexandre.belloni@bootlin.com,
	quentin.schulz@bootlin.com, lars.povlsen@microchip.com,
	horatiu.vultur@microchip.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v2 1/1] pinctrl: ocelot: fix system hang on level based
 interrupts
Message-ID: <ZwwaWLT_A8LoVsbl@smile.fi.intel.com>
References: <20241012105743.12450-1-matsievskiysv@gmail.com>
 <20241012105743.12450-2-matsievskiysv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012105743.12450-2-matsievskiysv@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Oct 12, 2024 at 01:57:43PM +0300, Sergey Matsievskiy wrote:

...

> The similar code with chained_irq_enter() / chained_irq_exit() functions
> wrapping interrupt checking loop may be found in many other drivers:
> ```
> grep -r -A 10 chained_irq_enter drivers/pinctrl
> ```

Side note: `git grep ...` is much much faster if you have a Git tree at hand.

-- 
With Best Regards,
Andy Shevchenko



