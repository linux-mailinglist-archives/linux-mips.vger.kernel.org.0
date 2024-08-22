Return-Path: <linux-mips+bounces-5012-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D795B672
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C3FF282549
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EEF1CB326;
	Thu, 22 Aug 2024 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLpMf/uz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA41CB319;
	Thu, 22 Aug 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332930; cv=none; b=IrCBMOCHAnA1Y8vEDX/ETUJLOyTIY6YSXqOsoCCZksSB8tAIEd2D78SCyiOrMvt48jos/kq90dt7ND2qRnYURgyrOQ20kLO5QpoZNXSgzyq3rOeQPo/4Xqv2AfxM23s4eGk2yUb8vuFagRsUzhEm+czW1lLIqo/+Iwo1FCi+M4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332930; c=relaxed/simple;
	bh=6lUyVJL682/y+zHKSdeUnO1XoMkcTCqidWCSE5Cgcds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOsGw7avhJ8ofFOvtV4OvmjcvSQjgVNorHCT7QvS6/qLDvpkBXM/1tUZCWSNQOAq5LlTYmuSm4X/yXNOWNz4Qu6NI1miU4SrF9W3Bh+tzvxI1fxlNHHwDuCxdv77hB9Y8N2WTAIXmud7mEnrqH/Zsqf6TevAVzh2mw29d4OzUxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLpMf/uz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724332929; x=1755868929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6lUyVJL682/y+zHKSdeUnO1XoMkcTCqidWCSE5Cgcds=;
  b=dLpMf/uzpJ9gyC7mJtyVDFrAlN9TDUBOjQLNP5QTLWqExauqjFJbZEOf
   C55fXCVx+pkfEMy0ueE/nvFuA4TeXYytzpZTxzBWaSpZ+vnW3k+dnor+u
   EOJ4qPvP325r6F1v+Lnl1SCaidAbaWX0M5T1mWcTjZ60lyP+8qfYdo3xl
   XJ9320PdqHJHrXioRvboHgThAhxvgtDVHVz4ZDa3BQZ28UHpliBSLs7xp
   PPicJci7OVNsjGiY0NzVSiW5zVdjRP/CDhyBnx+6NWDIHsudXhZ3m0tRj
   6zO/haCKF6xu0f3Fyncijh1/5el6YzoxUKQS1hucQAgyH//5oKHKr8yBl
   g==;
X-CSE-ConnectionGUID: aa3otHPtQfq1HMWgAtRA5A==
X-CSE-MsgGUID: dM2C/5CLRPSgtJNmpyu9ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22268332"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22268332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:22:08 -0700
X-CSE-ConnectionGUID: mIssrLQYQ4eMGfz/yeBcfA==
X-CSE-MsgGUID: 7UrOXBtlTwKCxSEkW+YKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66126744"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:22:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7lD-00000000SgH-0pqd;
	Thu, 22 Aug 2024 16:21:55 +0300
Date: Thu, 22 Aug 2024 16:21:54 +0300
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Erwan Le Ray <erwan.leray@foss.st.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 7/8] tty: st-asc: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc7chKkKMZLs-bZ@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-8-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-8-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 11:39:11AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

Same caveat as in another patch comment.

> -	ascport->clk = devm_clk_get(&pdev->dev, NULL);
> +	ascport->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  
>  	if (WARN_ON(IS_ERR(ascport->clk)))
>  		return -EINVAL;
> -	/* ensure that clk rate is correct by enabling the clk */
> -	ret = clk_prepare_enable(ascport->clk);
> -	if (ret)
> -		return ret;
> +
>  	ascport->port.uartclk = clk_get_rate(ascport->clk);

>  	WARN_ON(ascport->port.uartclk == 0);

Btw, not related to this series, you may try to get rid of these 0 checks as
the serial core has this and it will fail anyway. Perhaps you want to expand
serial core to issue an error message (if it's not done yet).

> -	clk_disable_unprepare(ascport->clk);

-- 
With Best Regards,
Andy Shevchenko



