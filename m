Return-Path: <linux-mips+bounces-5026-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208895B87D
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 16:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148A61F21CC6
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 14:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34241CC167;
	Thu, 22 Aug 2024 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MmE2IZpm"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDF11CC170;
	Thu, 22 Aug 2024 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724337204; cv=none; b=NbujshkLVxrtN12jV0Gjn4dvL17++eDdV8642IAXilzIZHaEONhiFEcUrmIR+4pwRGMTNOil1DW8ijywMD7yMTxUbgg8WXk0hGqXDMu8wTknWLUDIHuv6IbwbJuP96gjamShc3KKn9ggsiy5QhJyv2kY9e7Wda7jkCNf/tfhaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724337204; c=relaxed/simple;
	bh=ul7PizNZdzC7kUZvz7lhJEslbAa1y6aQFceRLhnnaPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOtCMSsT0/KxDgZle3Ply6fhEk7zmBSDV1BxsMeEC1G2XJ+ap3EoJblRk3ehPGlOGaIdqN5PkYP9wtuFOO3i5o7LoCnLqdkoK7AT92INXk2OutniGipNA6NLh9g0kW6Uarmjm4XWlXWX9LfHizACDRmUrrK+DcSn8e/tH8SVgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MmE2IZpm; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6BBF1C0002;
	Thu, 22 Aug 2024 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724337199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28KjxeZ01+p9nDVnGtXx9KfJaHBczSdiwVjl2vmbphI=;
	b=MmE2IZpmpKFJ4A+9lsXAKU6W/E6Whvpbyy4BTW/u9jMcZ/kVKNoKCfgBmi6FUpl9ngeq2T
	jY4JhCs28GxODWc7Ckqrhcu9ZytXED4ifDTkMbDd+4INaZ9enWDSxSfPNhlqy/Xmfv5w9X
	aIXpRI0K3ER1hNzFuCfUbPGXnGLY/nMTaI0chcba5QUSnTcnEeN0SH/GSHVIJ1A9b3mjo0
	gnPZOYtCJ+fuTZm7aIiPfHP1iKEYzuI6rEUSb5d52Ugs37TTubxvW1Pk36T5hkKzmoRE26
	sQMCRp4IUvgBMPgmPEnOyQtwlHW4Y7tmuo/RCjTgySkhgK9eJhmohngZfX0Xvw==
Date: Thu, 22 Aug 2024 16:33:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard GENOUD <richard.genoud@bootlin.com>,
	Lei Liu <liulei.rjpt@vivo.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
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
Message-ID: <202408221433165841f563@mail.local>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-5-liulei.rjpt@vivo.com>
 <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
 <Zsc-ZNg_S8uT9gpR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zsc-ZNg_S8uT9gpR@smile.fi.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 22/08/2024 16:34:28+0300, Andy Shevchenko wrote:
> On Thu, Aug 22, 2024 at 03:28:40PM +0200, Richard GENOUD wrote:
> > Le 22/08/2024 à 05:39, Lei Liu a écrit :
> > > The devm_clk_get_enabled() helpers:
> > >      - call devm_clk_get()
> > >      - call clk_prepare_enable() and register what is needed in order to
> > >       call clk_disable_unprepare() when needed, as a managed resource.
> > > 
> > > This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> ...
> 
> > >   	 * The peripheral clock can now safely be disabled till the port
> > >   	 * is used
> > >   	 */
> > > -	clk_disable_unprepare(atmel_port->clk);
> > > -
> > Why removing this ?
> > This is not an error path.
> 
> Good point, I wouldn't apply this patch as well as a few others in this series
> due to this reason.
> 
> Instead it might make sense to add a comment on top of devm_clk_get() to
> explain why _enabled() variant is *not* used.

Or maybe stop doing brainded conversions to new APIs.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

