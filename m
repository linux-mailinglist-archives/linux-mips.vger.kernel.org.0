Return-Path: <linux-mips+bounces-5010-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3643F95B61A
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D29A5B25944
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E3D1C9DE5;
	Thu, 22 Aug 2024 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJmD7kjO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70CB13C90A;
	Thu, 22 Aug 2024 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332272; cv=none; b=E23jrScRhzmqTjOZEgwfpKS+3p1UybDZczL3Y5DFaVteSoykbn3BYDChI1rK5lRHTQ+7dZbZ+sMnhNDcTIRkPUFUHF68vwqZMhgN85ZGOXCmM/8XZn0f+dBhWREmIUSO8gWRVdBTJvsz2B5n4WqT3JOcjkphAlgc2dkAQBA1Dhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332272; c=relaxed/simple;
	bh=nFeXu58Z4i5680PFo/t6k5yRvztpjG8BD/ThcXiu3bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiWI74NxYbt3yuzexj71GGftBCvM38dfueH6wdEvA27LKhXHKW7jlMB5kzsnhiTQqgiLOGRk/IbVrMW/81gxePPfaAwGCTEBMAHujuDzReMqzVgobFIczs3Di1VACwc2za633GuH+/ZZMLQ2jv7L/7oPavzz65vgeAcC0kXf46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJmD7kjO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724332270; x=1755868270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nFeXu58Z4i5680PFo/t6k5yRvztpjG8BD/ThcXiu3bo=;
  b=IJmD7kjOpwRelDuMKvOLZUeuwQ1FerLXrYRrw2eGmsQeCYFicQ/In82P
   QxslS1GdWwgJhCmBWk8CWgiHoXS7iFGuaUV5FlTB2/c2xbfztI4YGsXfI
   i+WK2RH+jif6ffbLic9LE/zU0bE9zLs/MzNUWKQNOZlwc4kDXibLQc8Tf
   guWY+qSCRsSWsqksiqxUI9rq9DM9/RX2ctGytnfvPm4dIHwENVueQbLes
   pmBxYHZlDc4USNptGH0FYel4hrdTyeaLhqOw/RnhyZqvY6oux7kQWqc4u
   kY7MiQj/4aPEGKOWbsdBhotEpUeiyTnGxmCWf6IEXTq777zxQZN12KdxA
   w==;
X-CSE-ConnectionGUID: SH8dKo4kTg+EuHhQETHZ5g==
X-CSE-MsgGUID: lU5bcSNfTLKyXDOz+xjB2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33896775"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33896775"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:11:01 -0700
X-CSE-ConnectionGUID: Z9hUc+AGQPCSdbALuccE+A==
X-CSE-MsgGUID: Acs/L/uYTr2o+98GC88B4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="98954827"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:10:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7aC-00000000SUN-3Xpv;
	Thu, 22 Aug 2024 16:10:32 +0300
Date: Thu, 22 Aug 2024 16:10:32 +0300
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
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
Subject: Re: [PATCH 2/8] tty: 8250_tegra: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc4yD-7AcfkLTlQ@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-3-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-3-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 11:39:06AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

>  err_clkdisable:
> -	clk_disable_unprepare(uart->clk);
>  
>  	return ret;

Now this label (err_clkdisable) becomes redundant and code may use return ret
in-line.

-- 
With Best Regards,
Andy Shevchenko



