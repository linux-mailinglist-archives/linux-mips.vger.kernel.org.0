Return-Path: <linux-mips+bounces-10955-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE9B4023A
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D5F3B5450
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7182DCF69;
	Tue,  2 Sep 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU8LJUbh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D92DCF47;
	Tue,  2 Sep 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818624; cv=none; b=GeRpB1QRYWwhxZdT+XkkbuR5ZEyh6IWlh+Wzp74D0HzbHKxnLAj+huvLm6ahcaOrQrkvBY/OL0jE+wv9PG4opAraRRWq7vgLJwvTi9ssO4M60RKJjDdDhmsWQipAZ73tRUsKXkLQak7WTBcBgZk1RmPWzqJEdMtt1yTIuYjhg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818624; c=relaxed/simple;
	bh=1LweHExYhd8TIGAtsNsPF1dVuZ9HmUdwiz8regfEmyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r65mKYiP0eKF7gzKkOQwZlhkFLPpaQtWF6QS2J9T5hAMSvDA9z2ie50nUWgjaMs1XLdGzJPTsTmf39V+rV4W7btiJfo0N5ogqmSlsKPZ+/jYkNOdZKKyh3V6g32H9w+h037ecFE3bpNAspD0ikpH4G3/tC/FbGse+JG5tXfACo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU8LJUbh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818624; x=1788354624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1LweHExYhd8TIGAtsNsPF1dVuZ9HmUdwiz8regfEmyY=;
  b=EU8LJUbhrReaeR5BaXC2iMzbBOCo3ZhQR5IU6toxEadsQQJYwTnECHFI
   x1X0a1xBKxDq4pnM73U5n9V2rpttf/jQBxOxjj7GNjBO5B2GfJVrq5W+T
   2rth/4JSlKOsrkF9cviwtxZlnLZZSf4esm/HYTVW3dRq1ns/8X1mEtOvs
   Yi03mzA50IAzmILdhR4vx+DqFjTHtew6PM/O3ofAgdJnOjJ2KgqjbUbuV
   E+Dw4WEw0v0NK4DgxdnqEpeTwFuiWAToUI/uofr04rcA6scg7Wk/OakKR
   Rd1kpOveMq6zRLih+TrF5kHbCtc/jLNS0Oj+ynI6JPuv8cU4ZX0VwuhpI
   Q==;
X-CSE-ConnectionGUID: eVtXAHTGTdefOQ8tYRaifw==
X-CSE-MsgGUID: XcnTAGQHTmmHPKZ1r0lkcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58296873"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58296873"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:10:21 -0700
X-CSE-ConnectionGUID: ABQ3ZIn+Qu67Yn1YR+Rhyg==
X-CSE-MsgGUID: rodiyp3KRASXPRSRymwAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175651755"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:10:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utQlz-0000000AhRr-2lqG;
	Tue, 02 Sep 2025 16:10:07 +0300
Date: Tue, 2 Sep 2025 16:10:07 +0300
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
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
Message-ID: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> 
> Unlike all the other allocations in this driver, the memory for storing
> the pin function descriptions allocated with kcalloc() and later resized
> with krealloc() is never freed. Use devres like elsewhere to handle
> that. While at it - replace krealloc() with more suitable
> devm_krealloc_array().

With that in mind...

> Note: the logic in this module is pretty convoluted and could probably
> use some revisiting, we should probably be able to calculate the exact
> amount of memory needed in advance or even skip the allocation
> altogether and just add each function to the radix tree separately.

...

> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>

This tag is not applicable to all patches, I do not believe this has been
tested.

...

> -	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
> +	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,

...switching to size_mul() also adds more robustness against too big npins
values.

> +				     sizeof(*keembay_funcs), GFP_KERNEL);

-- 
With Best Regards,
Andy Shevchenko



