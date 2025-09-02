Return-Path: <linux-mips+bounces-10956-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66357B40255
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106191A86017
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409E33019A5;
	Tue,  2 Sep 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTIEpFsu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A000F2FF65C;
	Tue,  2 Sep 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818922; cv=none; b=pkKK5o2J1+AXdKz9feaqzrcIhbV00LC/txcbTkh8eZbQqUeeNJ3L9/EgIxo6HQU8kP/XzUgTyabpkh1+Dcw+64mcw+xkWaY/pOwcTft+QHso4wHLPHkVgpeH7Qh9Tq2M6YHEBtj2dnRW2Szxg3ZeX5/s4THD3/Ix/61g0WwjJ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818922; c=relaxed/simple;
	bh=cIei6RTUCtT55QsspDgWfZe1lPcqVs/yM9oKakcEt4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXBHgUDxrKAMhdJ+xv+iCQU7gWJAgdbNDB8NPRfpevifiqbSegzkdeGrlqQpUl2Nv9if77tO2tj20oFcSXao2NkNtMGEP+FOTpYOnWVXxBj0vJS/PBFgl4B/rWXKgPEkqnJM3EUi20g102aoPQIUv12yeW5nUxipkMVurAqPtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTIEpFsu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818921; x=1788354921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cIei6RTUCtT55QsspDgWfZe1lPcqVs/yM9oKakcEt4M=;
  b=FTIEpFsuLv9mZ8+akStrwqn7q0K3h49PXIrkbx8Ksykja4UHhcl3M19D
   17n1cfItwZn1D8DdsKTTZI0bt/JL4cdyAPrNIS85yJI6QthMY7z1YydGm
   8KgU3djf9M1El7zJfFU5cvIlFcppF2cX9hvLExudeCXLxkSakQE3i6/Vj
   JzExbneItCn/D61gR4vI3G+b+y0WOdH6FOPZmmXRlke7rgUONOG4K/UdC
   I/0AgEAUzAsqbQsdAZZwjzR1lhvlEIb5+zowvYzjlzaulzFuILzghyDAi
   GoW6bvSER5qEPqyrrxD18t9xJQn4yoPKnpAzVo4kHBQ7XY2ubSvFC2gVP
   Q==;
X-CSE-ConnectionGUID: by+Coq1TTI29NWGTOE1Uqw==
X-CSE-MsgGUID: 1B+y3jNcRey3auUzx9UVsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59041796"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59041796"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:15:20 -0700
X-CSE-ConnectionGUID: QF8sMWo2SGOcClSTfRIdKw==
X-CSE-MsgGUID: FLZgbnm/Swu9LSfjg8Kdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170530232"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:15:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utQqn-0000000AhVQ-1jBt;
	Tue, 02 Sep 2025 16:15:05 +0300
Date: Tue, 2 Sep 2025 16:15:05 +0300
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
Message-ID: <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.

...

> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)

Why not simply

		if (ret)

> +			return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko



