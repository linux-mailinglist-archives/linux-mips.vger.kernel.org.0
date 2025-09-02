Return-Path: <linux-mips+bounces-10969-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC46B407C7
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 16:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76712042C3
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C5230EF7A;
	Tue,  2 Sep 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFGskFyj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C30631158C;
	Tue,  2 Sep 2025 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824402; cv=none; b=RmtHvFMD8iFqp5Ys3W1E8oRB0UHRGbEVGfVlQ09BS3aBnFczQJBMi6causccLtAG45RGs30UCNl1sNGLSdclds7ER4kD9zB/ZiQqQJaXLo3iQzXH8G54IAw+nwgVZTsHjUuQ5+M2UR+ljURIhS/mxcXXTDgLyulmiXF+Q4KP0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824402; c=relaxed/simple;
	bh=Wx5EU3ck/BxVVGxoCPPqG0+FAlUpEvvPwJtcEzKjaII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPyoqADUpf6vqOZUM7yFCVfumKTlwZrG0yr/cOugjUSk2v1Fksp7mTZS4+aIe7vCOF219lqKF0azfrimKKfkuhCMRl9rfWOw06jCSm89ISUyX144qt+vWDZ1PMrTo24yCtQUjx0fKhRspK9Po4O+WmifHlGloxE4cpR6PRYGi0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFGskFyj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756824401; x=1788360401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wx5EU3ck/BxVVGxoCPPqG0+FAlUpEvvPwJtcEzKjaII=;
  b=MFGskFyjsH15aNbS6dY1N4MLFe5sztvKqv3LZzw3uPRMt0+432xXJ6kc
   G0tcOzCQpdFrbvYFoQRcywZjXq5nK+W6Pr2i/XTw4TpNUTsYoWq01eGqD
   ngU8m21J34F28/aG4dx2G2hUnokG3l00i3V8IwX6b4cQLwWaabfDWVUsk
   dk2SvviMH1Nn4mO8bsLEvmQFQ4hJELprvMUICB/aj7f1igd3d6M0Xlf1/
   iM1MuEKcflAdgqdooCX+ulEPvrAlXSQwHPhSjbJZQ1IVspwzPoG3m+GDh
   dPpLBaVKxjhGDh9Rqe4Dyp3v81BOoA/aJZHf4HIlDyqMqACEAhR20OYPI
   g==;
X-CSE-ConnectionGUID: 3UJPX/zYSsmXVWLjb73AHg==
X-CSE-MsgGUID: xVyJbmWQQq6gD9raPcpb9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76545788"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76545788"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:46:40 -0700
X-CSE-ConnectionGUID: USnIJsbFRhyH+qHMzQmVsQ==
X-CSE-MsgGUID: 2OVUpl5DTIeZGPOdwEp2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171189727"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:46:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utSHA-0000000Aig8-04Qa;
	Tue, 02 Sep 2025 17:46:24 +0300
Date: Tue, 2 Sep 2025 17:46:23 +0300
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <aLcDP36eEIZ_tqFv@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 01:59:09PM +0200, Bartosz Golaszewski wrote:
> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
> 
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)
> 
> This typically makes sense except when the pins are muxed to a function
> that actually says "GPIO". Of course, the function name is just a string
> so it has no meaning to the pinctrl subsystem.
> 
> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
> 
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.
> 
> To that end: we first clean up the drivers that use struct function_desc
> and make them use the smaller struct pinfunction instead - which is the
> correct structure for drivers to describe their pin functions with. We
> also rework pinmux core to not duplicate memory used to store the
> pinfunctions unless they're allocated dynamically.
> 
> First: provide the kmemdup_const() helper which only duplicates memory
> if it's not in the .rodata section. Then rework all pinctrl drivers that
> instantiate objects of type struct function_desc as they should only be
> created by pinmux core. Next constify the return value of the accessor
> used to expose these structures to users and finally convert the
> pinfunction object within struct function_desc to a pointer and use
> kmemdup_const() to assign it. With this done proceed to add
> infrastructure for the GPIO pin function category and use it in Qualcomm
> drivers. At the very end: make the Qualcomm pinmuxer strict.

I read all this and do not understand why we take all this way,
Esp. see my Q in patch 16. Can we rather limit this to the controller
driver to decide and have it handle all the possible configurations,
muxing, etc?

I think what we are trying to do here is to delegate part of the
driver's work pin mux / pin control core. While it sounds like right
direction the implementation (design wise) seems to me unscalable.

In any case first 12 patch (in case they are not regressing) are good
to go as soon as they can. I like the part of constification.

-- 
With Best Regards,
Andy Shevchenko



