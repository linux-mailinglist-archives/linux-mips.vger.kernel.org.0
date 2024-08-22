Return-Path: <linux-mips+bounces-5009-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C798C95B614
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C641C23159
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572631C9DD7;
	Thu, 22 Aug 2024 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrumjZko"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFEC26AC1;
	Thu, 22 Aug 2024 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332258; cv=none; b=daWomIp33ykPkWKP0Jevfdj000Gd+3ONqg1rrK7mj7pDN1EEI4TujO9ddWVwaATf6VedKwikCjzXjhNlt1pcXZCrYX5uJhGFBovEyRZWS0sikx5+VuOnJrgH7zr3v4X6Q59DnIchA9z050gSixJaBxAfYBVrk4raA2SR1XoGh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332258; c=relaxed/simple;
	bh=xmonMa7CWYPhpUCav6lGTP6kAPkTd4VjdENwMfAjDQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNFHFSOcxtYE/JHVQK3U55OpjyISWIq8/Pb/3iQ58AAJZfUdQCsm+igCw8UNBu5YzaDKB2cAziRiPqcv5jwzkCxTViNTNlLVQw6A8V4OSYUhFwK8x05DxtdSjdbZR+oQCiqMynF+sdSPd3lBtvcdZStdM+hCOnu6NUCsa30rn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrumjZko; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724332257; x=1755868257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xmonMa7CWYPhpUCav6lGTP6kAPkTd4VjdENwMfAjDQ8=;
  b=GrumjZkonQLszmfbZGVyqIe7P3/SUiGoYCxmQUAp9pwTrRqwgYkdYFQR
   ea8lyFxVmYlcGVPWaPzGPDwrWtWONWpSEjblsz+MeTBjaxhFVpH1W6rZb
   Uzo+dCd47nTtGyXLJLdgQ6sWoHlPAQtlQNUaJn/NRIz9BOqm1EU9kCOZ2
   6Wk3D9/UbJWAf0BLN5/gHFIpzTlYbVZQAQwOOGgusNoTNEhEY8p1h9NX6
   gYBm7XNduoZIlI7nQiI79WwkWgR+BZXtDfEJEQRaktF1bG2a62UsJRhsV
   4W7P0j0FXJuT3JGG5DoIk/RVK63S7iaedKFZnn6YUXEzNf2xPbvW8AiyT
   g==;
X-CSE-ConnectionGUID: zRGoc1d0Qnyqb+ilC3gxAg==
X-CSE-MsgGUID: pB3v8YtBTJyc0geX6FI2OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33896709"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33896709"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:10:16 -0700
X-CSE-ConnectionGUID: 1SNaBPdZR7KIjuHORoDEkg==
X-CSE-MsgGUID: dDS462oYQ5eH9CKAcZxrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61759647"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:10:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7ZB-00000000ST5-0oxN;
	Thu, 22 Aug 2024 16:09:29 +0300
Date: Thu, 22 Aug 2024 16:09:28 +0300
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 1/8] tty: 8250_ingenic: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc4iPRCRKuFW0ZZ@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-2-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-2-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 11:39:05AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

>  	data->line = serial8250_register_8250_port(&uart);
>  	if (data->line < 0) {
>  		err = data->line;
> -		goto out_disable_baudclk;
> +		return err;
>  	}

	data->line = serial8250_register_8250_port(&uart);
	if (data->line < 0)
		return data->line;

-- 
With Best Regards,
Andy Shevchenko



