Return-Path: <linux-mips+bounces-5011-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63A95B64F
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB0EBB24949
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D242F1CB12D;
	Thu, 22 Aug 2024 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+vpwglV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E226AC1;
	Thu, 22 Aug 2024 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332785; cv=none; b=WiuDbwKArMOC9LILxOpAhZPnJ/gxlCJekwEQlgcgV5nOhs7mULyAr50l217qzQFB+PyFdg7IMoBvAe8vTSY3fXpRHrZhuF4qAywKXaGGmfvd6X1t8EbwFEBP0pezBmiGqX0bC+kHiXPiK47mxE1wL4697KC/Qrs5vQmSY6WyqZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332785; c=relaxed/simple;
	bh=AOwS0wzy6B8Bvq3MTZmnJ0ymFayaCPe5P2yYx0ql3J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7FI/7OZbtQQ9hG3GddvEDM9XZ6gPDaObmF5fRf6Fy3ylbyJHG6TL9Lv1cwT9URM2udGKKwgpcY6QZnvkx4cn/AEc+byhG6LiXvoXI2WLdcv84C4Td9f+pRciLCD5KFcco0eCB6J0aP4LqzOwBRfgsm3l+qJs2Cx8dBYrKv4q+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+vpwglV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724332784; x=1755868784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOwS0wzy6B8Bvq3MTZmnJ0ymFayaCPe5P2yYx0ql3J8=;
  b=H+vpwglVWgoC/avrB9DxIKxx/gLjCi1f26Jth7Tn6TVSim397GhaBmmX
   vt3pFT/TRuPf3lJQxu9MUWmLxMHFmewQJQ9OFLSkxxQV+hkcfOXuLBdl4
   RPfakzSMcf1MZoA6KFjGZUPf39O8FAzrN4+zeZc3XOJ1HYCFtxXkPmcUc
   Bml/vLniXieAhzffi8Hk6f/7pxvcHA3lCuQ24mQj5EeMrMQnF4HtvMgtB
   scy+5KKqT5EmfjQe3QJ5rr9YHoKCU49kquLLLbA/JmxIPhUipFgstrmum
   eXw1gnr7DYbQ6nwvWINd6bZgz9eUPxRBmRC0EUsXffvor04mCVnOCoLZU
   Q==;
X-CSE-ConnectionGUID: xy4MgfQhSJOnSdcmQeJwWQ==
X-CSE-MsgGUID: GC5IktyIQJm5SE03JqkdUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26495225"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26495225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:19:43 -0700
X-CSE-ConnectionGUID: aZqIIPrXQmaC3bF8xGIB7w==
X-CSE-MsgGUID: cjWQAwxoQza2rxDC3PVRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61110275"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:19:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7it-00000000Sdx-13zx;
	Thu, 22 Aug 2024 16:19:31 +0300
Date: Thu, 22 Aug 2024 16:19:31 +0300
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 5/8] tty: mps2-uart: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc645l_nFK_Xp-t@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-6-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-6-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 11:39:09AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

> -	mps_port->clk = devm_clk_get(&pdev->dev, NULL);
> +	mps_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(mps_port->clk))
>  		return PTR_ERR(mps_port->clk);
>  
> -	ret = clk_prepare_enable(mps_port->clk);
> -	if (ret)
> -		return ret;
> -
>  	mps_port->port.uartclk = clk_get_rate(mps_port->clk);
>  
> -	clk_disable_unprepare(mps_port->clk);

Your change is not equivalent. In case this clock is shared this may lead to
run-time issues. Hence I don't think this patch is needed in this case.
Instead, you may add a comment on top of devm_clk_get() to explain that we only
need it be enabled to get clock rate in the probe.

-- 
With Best Regards,
Andy Shevchenko



