Return-Path: <linux-mips+bounces-10971-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E61B408E5
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 17:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8FB0207C6B
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C532031DDB8;
	Tue,  2 Sep 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJDeognU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D46320A02;
	Tue,  2 Sep 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826874; cv=none; b=p+gw+nx0WsBIizlUYPtjYrzZFASkermjKreCgLCaD+7/Y8IJtJN1Tw3c8sgHrI+M8gWJvGj89s5X9n+89gUskn5YpxW7eqEymLvhe2AXrN8M3AbhAwU5MAsri2DfJGqSxFJ4DmVrg2RZWatyMshJfV+LWx0dO0lCf4VgpGFDncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826874; c=relaxed/simple;
	bh=pxDRyV6r3uWk5lkkZlh4n7lncpUrSzOFA8awI6XQfUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmuKoSeXV786JGOGUJ+KkjHX0JRezznitOMnOcuXkyqOHUTCA/kt+PUbR+lhrOIbVPuDuCZQJNrDUmeR6n13znP4ehiQrTrAWPxsqJ+sXJFmi1DShezbm0hK40bVvwPrK8t3znaLG76z1e2XQcY/pG2Pz0FIPJ7lZI32kETQHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJDeognU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756826873; x=1788362873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pxDRyV6r3uWk5lkkZlh4n7lncpUrSzOFA8awI6XQfUU=;
  b=FJDeognU0Pi3EDW0Y1moH9T8qeMlFhmiC3T2NoYJ99D82V2KHNX2Zmmh
   CMz6B4gjO58NY2ytxtrOB2KkgiTMa6EAsY36INhZr6/R/OYxhLmIWwkZn
   HSpB0UGMkryeQRI7QE4Ai0YojB6VHNsxj9Uj03vsPAI0mHEA+8+FR5nF4
   evNIVvYvRqeghvcPqCQP6zrAvmNUSvi3j6Yfycr9uEdR7xAVz5+Gjfr6U
   oEy/kv3Ai1DdWlT/I32eXSMY6BzAs8rrQeqLKz3l1wKf0Cr8+ykWD+15c
   EBfofLYMbBIqsLNAQZQo+NoqUhyMQgH4ntTkR58tJmo/CyId+Ddv/yKTd
   Q==;
X-CSE-ConnectionGUID: Po5pBkEzSveLxUccKekz3w==
X-CSE-MsgGUID: GuI9qRMFT2WqYQ6s8pyjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58965293"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58965293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 08:27:52 -0700
X-CSE-ConnectionGUID: Mff6GxWfTJyq2rWNK/1oVw==
X-CSE-MsgGUID: caNsXPCtQ0WFMdHw7a+vaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170562537"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 08:27:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utSv1-0000000AjNy-1oS6;
	Tue, 02 Sep 2025 18:27:35 +0300
Date: Tue, 2 Sep 2025 18:27:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Message-ID: <aLcM58IEH8hGYLnx@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
 <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
 <1034c70a-da67-4914-b23c-8d006b7611bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1034c70a-da67-4914-b23c-8d006b7611bf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 05:12:24PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 15:15, Andy Shevchenko wrote:
> > On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:

...

> >> +	for (i = 0; i < soc_data->nfunctions; i++) {
> >> +		func = &soc_data->functions[i];
> >> +
> >> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> >> +		if (ret < 0)
> > 
> > Why not simply
> > 
> > 		if (ret)
> 
> Because existing code is as readable?

I don't agree on this. And Bart explained why. So, it's an API requirement
after all.

> This is just some serious
> nitpicking which is not actually helping at all at v7.

Agree, this comment is a nit-pick which can be ignored at v7 stage.

-- 
With Best Regards,
Andy Shevchenko



