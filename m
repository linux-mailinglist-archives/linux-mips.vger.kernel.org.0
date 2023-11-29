Return-Path: <linux-mips+bounces-362-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 918AD7FD92F
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 15:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08384282FC1
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921143065D;
	Wed, 29 Nov 2023 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMam2tcO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A13BF;
	Wed, 29 Nov 2023 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267806; x=1732803806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i+nKxtVOoA7/2O3dUI5Zs5QSN68782gToG5E1Dn3b/0=;
  b=BMam2tcOO7h7oYN+AXqv09Imrcb5qRWJip2vCyzoFbrkdf0dOZ57fhyi
   qOYejD14LUMrcAoBtfPyB/68/9onfdmk1F7r5stuyYmWz0ywSCQS/ZghT
   EFrPb16XGVADMEYh3/5D9xjsBp645I3ManhdfYu50JAKrID3v483lbLJn
   CG8rxV4i8IhKsvkMxY5cknnQVPOKDlZIv6KaZxPgrR2pDi8Fv0BIuVWtm
   PApNeYFyMEH7AkacJmC6TY8C423Yq30UyA9zDoQreAwD3vDAkXzvzzxMp
   rrf7JC0u90sNWSJ7OqK/+kkFm0sJo9XEocyuFajzGXl8cnBmgfP8TmPWL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="424313715"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="424313715"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100543308"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="1100543308"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:23:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8LT7-00000000SaA-0d82;
	Wed, 29 Nov 2023 16:23:13 +0200
Date: Wed, 29 Nov 2023 16:23:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v3 06/22] pinctrl: core: Make pins const in struct
 group_desc
Message-ID: <ZWdJUBNMYj9qvCf2@smile.fi.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
 <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
 <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 03:41:55PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 29, 2023 at 12:21:45PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 28, 2023 at 9:04 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > It's unclear why it's not a const from day 1. Make the pins member
> > > const in struct group_desc. Update necessary APIs.

...

> > >  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
> > > -                             int *gpins, int ngpins, void *data);
> > > +                             const int *pins, int num_pins, void *data);
> > >
> > >  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
> > >                                  unsigned int group_selector);
> > 
> > Probably this is also the right moment to change all of these to arrays
> > of unsigned ints?  Else you will have mixed int/unsigned int after
> > "[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
> > group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
> > core: Remove unused members from struct group_desc".
> 
> Hmm... Can it be done later?
> 
> I can, of course try to change the parameter here to be unsigned, but it most
> likely fail the build for those drivers means need more patches, more delay to
> this series.
> 
> Linus?

On the first glance updating API here does not fail the build.
Lemme incorporate this into v4.

Meanwhile the drivers I left untouched, it might be separate changes
to convert from int to const unsigned int.

-- 
With Best Regards,
Andy Shevchenko



