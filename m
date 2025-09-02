Return-Path: <linux-mips+bounces-10966-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853AB406CE
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 16:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCB1188C7EC
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2C130DD36;
	Tue,  2 Sep 2025 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi7F8Pqx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA62FD1CA;
	Tue,  2 Sep 2025 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756823479; cv=none; b=jT6JuD2RJrO7gFFLjk+dOhq5R8QfDZL18UCIJTwpmhXFMCyRFirtXv3x5R0Zw5IfnYpbKzOe3sOI1gzyQfNzJ5nlrdSVrKKXL8BeNQhMeVPAbS4eesE4EQfVTc/5QItOZHsX8jVvjKTTDUtUNZbyDo06g2Q3TwugCYXew7oRnH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756823479; c=relaxed/simple;
	bh=wNLf2ov03mImFGkf61U7OTdGwEMuGY1mZCV4bcE5xQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTPM8l/7flytcH3pcZWSH+n2n0dR+cYx3WeWHg8PJFGyChCBqi/XbNzFEhq2iOS2R/mXOlgppyr54qTbBIEvylf7k2btY2YrT6lc1RWatS4+lFYhlDPv1VpZ/qWh1qZmpHrwKG/AE+LmIqk4bvQ7ojCi+6qxvESR4uSy1ROpOjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi7F8Pqx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756823478; x=1788359478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wNLf2ov03mImFGkf61U7OTdGwEMuGY1mZCV4bcE5xQ4=;
  b=hi7F8PqxTiWmXg6tOg2omhuA8qoAj1WmL2vsIhAh++8y2daC+M56gfv8
   OJ04UBZMGEfUbTKFmlWjNST+zfchgROgDLecQy+PhAalpzreLiLtbuyhG
   9r8xqXc8TR0M6hyjO8GHw8Y77SqvfQ2+TsVEDAv1F2icxHwzVqbwRiS4i
   zdCK+819Z3deGa+JTJNaVzJMM5T4laD6qXOu3vUP865+vBEY30lMNK73w
   qWbrHPx/Iy5UJ0juwbiniKCgS7T+mMgxaZf+QCiP2b6Cln5APBk/5CVhj
   DPhiGZbTHJ/MURdjtPnjiQEEZPzSnaMbTaDWIcQFWU4Si4Ppsn9pCIMRq
   g==;
X-CSE-ConnectionGUID: wmplzVwmRjKQebKTMlxJOw==
X-CSE-MsgGUID: ceZnExAtQQKDPxt/pjFAoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76543125"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76543125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:31:16 -0700
X-CSE-ConnectionGUID: fiXJ/SYAR0Our4Y6vRb6cQ==
X-CSE-MsgGUID: /BXe/BoATnONrCvRrOtmbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171186010"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:31:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utS2G-0000000AiTf-1Q9X;
	Tue, 02 Sep 2025 17:31:00 +0300
Date: Tue, 2 Sep 2025 17:31:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
Message-ID: <aLb_pOG-yc-CHoiY@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 01:59:22PM +0200, Bartosz Golaszewski wrote:
> 
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core.

Which I disagree with. The pin control _knows_ about itself. If one needs
to request a pin as GPIO it can be done differently (perhaps with a new,
special callback or with the existing ones, I need to dive to this).
On a brief view this can be done in the same way as valid_mask in GPIO,
actually this is exactly what should be (re-)used in my opinion here.

> While we could go with
> a boolean "is_gpio" field, a flags field is more future-proof.

This sentence is probably extra in the commit message and can be omitted.

> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers.

So. this changes the contract between pin control (mux) core and drivers.
Why? How is it supposed to work on the really strict controllers, please?

> Add a new callback to struct pinmux_ops - function_is_gpio() - that allows
> pinmux core to inspect a function and see if it's a GPIO one. Provide a
> generic implementation of this callback.

-- 
With Best Regards,
Andy Shevchenko



