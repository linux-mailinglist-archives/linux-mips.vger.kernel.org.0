Return-Path: <linux-mips+bounces-716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3098112B2
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 14:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5711C20C0F
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 13:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4912C870;
	Wed, 13 Dec 2023 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgvNcYez"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E8DAB;
	Wed, 13 Dec 2023 05:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702473729; x=1734009729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aynrVvDsgLEQ+oNpXkj3YsTsnJctWZHApJV8F3owo30=;
  b=hgvNcYezeBjiQ/qv58XjF9NRFTvZ/5kUMix9yF7LU/5YhhEz1P3CR1RU
   Sso90NlRp441xL05XJAzGeZp8rva+PJb6HeqT7FeDa7VKHBlB287++3o/
   0KLUmadjg3OzIinqjpKJwP+95WM45tP42Mg1grSjgkUh7eoC7NbmrGxlg
   2fTN5AiCAjFVmks51PmU4TfpSbqx0DgZcO1xzNBFLkMWUgwTgFBskR3U5
   cNxH5/Jw4hfxH9ZpRPQzXCXFW6NWaxwB7Os3Qx5u23hHEiPXzRmkIsVcW
   /Sp39rkyweiXtrh3+VhIpmoke7nXuqOYA3z90x/ROjY8/KhGK6FBaK6hZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398804938"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="398804938"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864625953"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="864625953"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:21:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDPBT-00000005X7P-2zJE;
	Wed, 13 Dec 2023 15:21:55 +0200
Date: Wed, 13 Dec 2023 15:21:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in
 PINCTRL_PIN_GROUP()
Message-ID: <ZXmv81bJRMqB1GLY@smile.fi.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
 <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
 <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 13, 2023 at 10:55:46AM +0100, Paul Cercueil wrote:
> Le lundi 11 décembre 2023 à 20:57 +0200, Andy Shevchenko a écrit :

...

> > -#define INGENIC_PIN_GROUP(name, id, func)		\
> > -	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> > +#define INGENIC_PIN_GROUP(_name_, id,
> > func)						\
> > +	{							
> > 			\
> > +		.name =
> > _name_,								\
> > +		.pins =
> > id##_pins,							\
> > +		.num_pins =
> > ARRAY_SIZE(id##_pins),					\
> > +		.data = (void
> > *)func,							\
> > +	}
> 
> This INGENIC_PIN_GROUP() macro doesn't need to be modified, does it?

We can go either way. I prefer to go this way as it reduces level of
indirections in the macros. It makes code easier to read and understand.
But if you insist, I can drop that change in next version.

-- 
With Best Regards,
Andy Shevchenko



