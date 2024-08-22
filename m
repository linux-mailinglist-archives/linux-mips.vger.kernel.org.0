Return-Path: <linux-mips+bounces-5017-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0995B6EF
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F162283623
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0831CB15A;
	Thu, 22 Aug 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcngvEks"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493751C944B;
	Thu, 22 Aug 2024 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333755; cv=none; b=ZeZAyX3VylH6APfUSe/zIprbodnRsgd2h3Of/3b3Mt+CQLEeJ0Uh81FGzOxpsDUfGid6Fzn1Hz4GwdaoVpI1nFfrti5WZttwCaIVfC4Ro1LbIWCalGZGQK8NxQ5LK9jqAm79R890bk9rNNeti2lAkSlUsb1sMNUILtltRDQYQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333755; c=relaxed/simple;
	bh=0LjGR0jv6vQPi1I16qcrigZKwqwq5Ay6KaAm2phGUVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfQbkBZNeiRoZcbWgIsZTMlNLq5blebK5DtZnIbxXPCvgpilBCrr7ao9XpD4nqxZQ3bppyE+NYpGtaD0tkm1Z3pkDIm7NbVq6OU9ymJRGhYAj7icNCwGwDcUaMoaMDfDofi7ITdLyzO2TC06YranNp4UP4IG4HykOtkewVop6bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcngvEks; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724333754; x=1755869754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0LjGR0jv6vQPi1I16qcrigZKwqwq5Ay6KaAm2phGUVQ=;
  b=LcngvEks1OhIKHwZaSfzd88C3xOdGP7Sa6OhXYIuJb2fbuNgpZZM/6t5
   PINLjvY3CwGt7INE/YA56MoBjVeYS0g5KKSkqGAPsSpJGeSnIWn2pVm9s
   ZetMfJJ01QFnBMd4xCm7ROTUk5mdoA/B50VM8LnPkLweyJ5imXS1RIpjQ
   bs3j5c/djl5nF7fHyUNWrtjLhYOz76A+O9r0tVs4J4ac2L6SOF1+rK8+H
   CIl4WJytw4S1HlS30EhsLO2pvseUzFvZ4MYNOqKLYEawEqo7xX0ox8JfG
   uSoxL7uiu9Y46fKF6D5+GnZNfUapqZI24uF2dLnmMMZnEhdfh1bDz6MbW
   A==;
X-CSE-ConnectionGUID: WU1qI+RwQ3+fBC5XMhtVfQ==
X-CSE-MsgGUID: aFK6I2OuThu8vW+rhNNDUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22927338"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22927338"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:35:53 -0700
X-CSE-ConnectionGUID: 6/NWjhhmSSKzAJQm5iXJ3Q==
X-CSE-MsgGUID: ei5bsNzcSRiljAVcDqkypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61293724"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:35:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7xM-00000000Sux-3XeL;
	Thu, 22 Aug 2024 16:34:28 +0300
Date: Thu, 22 Aug 2024 16:34:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Lei Liu <liulei.rjpt@vivo.com>, Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
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
	Andi Shyti <andi.shyti@linux.intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Erwan Le Ray <erwan.leray@foss.st.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 4/8] tty: atmel_serial: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc-ZNg_S8uT9gpR@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-5-liulei.rjpt@vivo.com>
 <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 03:28:40PM +0200, Richard GENOUD wrote:
> Le 22/08/2024 à 05:39, Lei Liu a écrit :
> > The devm_clk_get_enabled() helpers:
> >      - call devm_clk_get()
> >      - call clk_prepare_enable() and register what is needed in order to
> >       call clk_disable_unprepare() when needed, as a managed resource.
> > 
> > This simplifies the code and avoids calls to clk_disable_unprepare().

...

> >   	 * The peripheral clock can now safely be disabled till the port
> >   	 * is used
> >   	 */
> > -	clk_disable_unprepare(atmel_port->clk);
> > -
> Why removing this ?
> This is not an error path.

Good point, I wouldn't apply this patch as well as a few others in this series
due to this reason.

Instead it might make sense to add a comment on top of devm_clk_get() to
explain why _enabled() variant is *not* used.

-- 
With Best Regards,
Andy Shevchenko



