Return-Path: <linux-mips+bounces-306-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C97FBEC2
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 16:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44572282660
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0010735297;
	Tue, 28 Nov 2023 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SU5xqc/t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DB190;
	Tue, 28 Nov 2023 07:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701187142; x=1732723142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aFGhnhLBctAxdXmqRzubiIeJfbC6+H1rRvtasuLMDp8=;
  b=SU5xqc/tolCPmRhRaW+96fpfD4SZJfmY05hz8cmwIwmXLRjJrI+3oif4
   bd3FfCIFqnlyEyrqjKoIt6umUz+GAy8VY86w4UJQ83CzenYSuZ1Q6fraA
   C4K0CmlR/QdCAXv0+/L0i9Mh+57wCmY5cCvIEbTlqhXy9q5YtgBM6Thd2
   FH2gqVYAUr4pVDNWebe292PrTG0txN0+GChhC0BCvNlN0xpDzxpR9kM0b
   xlK4Qe6OxyJUVu0nHj1nYjelSWnL/dpDbmwtzhSHfsY/k1kt8X563JI/b
   TzpXu/Y6XXOcZ4uqXjtOkqwW7n7E5sbY4od2P7qRyfkRmxu7isRs/Jmg/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372324490"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372324490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="802984915"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="802984915"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:58:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80U5-00000000Cdt-1MWE;
	Tue, 28 Nov 2023 17:58:49 +0200
Date: Tue, 28 Nov 2023 17:58:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 12/21] pinctrl: core: Embed struct pingroup into
 struct group_desc
Message-ID: <ZWYOOW0KojJSTROj@smile.fi.intel.com>
References: <20231123193355.3400852-13-andriy.shevchenko@linux.intel.com>
 <202311250448.uz5Yom3N-lkp@intel.com>
 <ZWYM8Pjl-S-8CMPu@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWYM8Pjl-S-8CMPu@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 28, 2023 at 05:53:21PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 25, 2023 at 07:39:02AM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build errors:
> 
> > [also build test ERROR on linusw-pinctrl/for-next next-20231124]
> 
> Hmm... I have compiled tested on Linux Next it several times, I can't reproduce
> this neither with GCC nor with LLVM.

Actually it rings a bell that some versions of GCC have a bug (?) that they may
not identify initializations like this to be converted to constants as we are
using compound literal it should make no difference.

-- 
With Best Regards,
Andy Shevchenko



