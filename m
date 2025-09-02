Return-Path: <linux-mips+bounces-10954-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3BB401FD
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC08188C4A3
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1612D9ED7;
	Tue,  2 Sep 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQCIDNYV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C52D59F7;
	Tue,  2 Sep 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818403; cv=none; b=t6zXLZ1rCudLDag6mrKlOfqi/NhmzaWKdddXKIQ9WLPuINAQCmeF7kc84mqWyaYxDiDO1wBttlNwnuY1JQ1xZneiQauS9hjfuCx89pZz9h2MV5CnWGoOqM5Jqq/IJFRrXVsBdkY7j6ABlJ0/1xG6szKrnQmXE8/gZV4TL7lxMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818403; c=relaxed/simple;
	bh=304mhcCsZ3DPW/ZeHF0UCdKTce70KODDh/J7W7FbB/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1s0H/6pSDMlH+uwD4YCX6th3hQUBuGFBRW5p3uivbxaY9zKwRoT763+mrOCyLAeLaoorB7TPy2+ffHHlDVZsW+/BBE2scBYlsGErf+2CYyEwdvPyyOnepJx/aP3Kk+ZVEjg6rq5kiPZ4PT87G/oB7PN+CcUeWKLiow20jSiSNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQCIDNYV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818402; x=1788354402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=304mhcCsZ3DPW/ZeHF0UCdKTce70KODDh/J7W7FbB/E=;
  b=UQCIDNYVGpxtvgbkoY7oFmF1uEHsOnvPkPekgEus5qGJynNt6xWHlzFa
   TWHxSPe0G3h5Utjn7kuBwsm64ho/mdg76e2OvNOzK8lNOHc9KIr9WD+p8
   3zER82Z0y7/EQNQ1p0NDn++8QH1CpnQbKEWuxamzkJzp4+v1Rc37odw56
   wDJ30Ycr7hTDWtJcY45rF0SjGNTR+BQ+EaM2ai9fSVUTo7ipuwHJ87ge+
   zug56QWzODqP8bIW1vfmvzkiaU6dRqgDEm/EZfxU0PAkON0tcjPECUrLN
   ZeLPftYJbNYKKjKs677gxRgzPge20DevVGRTYJsP+Tug/Y/AKJfPvkntz
   g==;
X-CSE-ConnectionGUID: v59mql1DQYSn9d5KaX9Kow==
X-CSE-MsgGUID: Kjs3JnUMS8GhbW3/WQUYzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59028180"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59028180"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:06:39 -0700
X-CSE-ConnectionGUID: ahJv6su8QkCwIee8PybbEA==
X-CSE-MsgGUID: WBNgT/TJTkOlqIdmDhs4Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171432863"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:06:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utQiN-0000000AhP0-4600;
	Tue, 02 Sep 2025 16:06:23 +0300
Date: Tue, 2 Sep 2025 16:06:23 +0300
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
	stable@vger.kernel.org
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of
 pinmux_ops::get_function_name()
Message-ID: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> While the API contract in docs doesn't specify it explicitly,

So, why not to amend the doc at the same time?

> the generic implementation of the get_function_name() callback from struct
> pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> NULL. This is already checked in pinmux_check_ops() so add a similar
> check in pinmux_func_name_to_selector() instead of passing the returned
> pointer right down to strcmp() where the NULL can get dereferenced. This
> is normal operation when adding new pinfunctions.

Fixes?
Reported?
Closes?

...

>  	while (selector < nfuncs) {
>  		const char *fname = ops->get_function_name(pctldev, selector);
>  
> -		if (!strcmp(function, fname))
> +		if (fname && !strcmp(function, fname))
>  			return selector;

I would slightly refactor this:

		const char *fname;

		fname = ops->get_function_name(pctldev, selector);
		if (fname && !strcmp(function, fname))
			return selector;

>  		selector++;

-- 
With Best Regards,
Andy Shevchenko



