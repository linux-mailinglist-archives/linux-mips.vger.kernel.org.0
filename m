Return-Path: <linux-mips+bounces-5013-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBF95B679
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D601C22AEF
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDA81CBE93;
	Thu, 22 Aug 2024 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evq7WW+W"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D81CB150;
	Thu, 22 Aug 2024 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332997; cv=none; b=dfoA4lL0ovkfcvbdKi9J2f6+y9w+uzYYrlJSdzhzHsyMeIAKHurAh3cK0yj4fPlw1KT9N7TfBx1PZBFdOD+Y2zwohuy+4cOIXqmKzbfpgdi21xW1XfZUMdDOusWDEE0nwS8dptb+WmBCzEQEZZUZx51LRQ7g1sRIVWEVezorfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332997; c=relaxed/simple;
	bh=KFpKpnvDW0vqhhMnIVIsrqf2HnMAwgbclbS7nIfq404=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOgl73Rk0VNP6dqUzGU0MIlR/X3gEryrtu6y2j7qIrUrVujeYGKYXcb5GeX+Zw0zXibsWv8qw9VgV1ChGZTyftZhqeoVzDni/jZJ6mdn363tDh00SamaOJBrZ+goKUDHtNz8hHna+kEy2EgHqngYUH+iZ6TLvvSwItSjpvIJq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evq7WW+W; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724332996; x=1755868996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFpKpnvDW0vqhhMnIVIsrqf2HnMAwgbclbS7nIfq404=;
  b=evq7WW+WktleBA/ikqcK1M+UVjEh/Rf7+PjOs2P6h+pwD+w5FQhhy+u8
   WHZGp3tk5PHlKJHqLCmd1Ca++1aFfFZOZ5jdfyT3kZ3w/ggk+Y2Wx8Tv7
   rkyNaRxLXAEQLdeV08qbn3B9tCqd0kIR5AZEc6L3I3eDMMs9WxaWoL1XU
   La2nfRVvH8WR1KK8tTRlNr3GjvIanIoJjPlYgwtR/yP0TKCbAkhi0LNFK
   XbU9+Ij0CS2XdJxrSS/FPXb6vV33OqNY3HFc4ScFKDgk3M3sDrPZxj77n
   2dAH0c45O1aLV6npd9bgokp4mg+nY0V1Ywd27p+d7KOyCmJ2GXZbZrDTe
   A==;
X-CSE-ConnectionGUID: knoBIpfFQNyX8UFDegX0Jg==
X-CSE-MsgGUID: nEMRu3trSx6m59z+sdNo+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40206693"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="40206693"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:23:15 -0700
X-CSE-ConnectionGUID: mVP2oLmLRwW6zgMul9JDcQ==
X-CSE-MsgGUID: /9OVbZTARoyrygXmExiBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="65644729"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:23:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7mI-00000000Shg-0KHI;
	Thu, 22 Aug 2024 16:23:02 +0300
Date: Thu, 22 Aug 2024 16:23:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 8/8] tty: stm32-usart: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc7tWn7oSKp7zTx@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-9-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-9-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 11:39:12AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

>  err_clk:
> -	clk_disable_unprepare(stm32port->clk);
>  
>  	return ret;

No unneeded label, please drop it as well and return directly.

-- 
With Best Regards,
Andy Shevchenko



