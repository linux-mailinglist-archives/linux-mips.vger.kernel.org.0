Return-Path: <linux-mips+bounces-11159-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D33DBB4FE99
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 16:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4261B24147
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E33431F5;
	Tue,  9 Sep 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TA5GwGk0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DA178372;
	Tue,  9 Sep 2025 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426578; cv=none; b=K0VACxlWaXZ0K61/QooaHt20LVPEwAE2pGwHOAuNOqcnAvRP1AOwGRqsUxOmuOa444Sxj/9f+g15h391KTOq8LbxD4PM/o62eG4NvDjza7TGkP2HzPOr6eFJiVkJEuMajK13zGM9nofVwAT2HZhAWeBXl2ZyYfsTzoCkodr/wh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426578; c=relaxed/simple;
	bh=PyP1a8xmh42gYWEndpBNTjWqCkcaPl/QUUp6gJ3BY2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Arx6iPqH1yo+dCelr9bBTz3y2hv/YiSJeiZDr/893i0IjEc9qo1SGSA1JFGdOQBrxJzf+p1Cr99cfufC1EaMqIyEHWSMKr3a0ls0Z5W1Vwqhjtd6yM8hqb2URGke4p1BkwYb7VuiLoZuyaQ8QH0DKqj/P14aCTzwlL3/LVExh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TA5GwGk0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757426577; x=1788962577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PyP1a8xmh42gYWEndpBNTjWqCkcaPl/QUUp6gJ3BY2g=;
  b=TA5GwGk0KkWwqpxCnmqfwNwI1uRICTO7Xlvy6EJrD4qS8j06PcEpLfk2
   KjfIBtW9lt3Dpz+NqHicyv/BATMFIsar/nNz6CZp9G+2Oo/UD7lE3lVJV
   uj2D94JQ7jmq9sXy6NtZ3qydDOgjO1vZquAS/al5h+1yXygtWbRoWifGT
   tkrVB4FyZcXzjOIzXJWXpDqJd/vYpvEaMvOhvUfLNc7pcE2lA5vp0q4P0
   SAQUS9iyD+YhJJCqEYQJDPhFB294N9Su3goLdMWlBfpXudPLe/vS7ruQh
   foZK16GpgpwNTunGa40N27kqPQHVNWQkVw7jE/rPOjKdxEQ9C4ljhxsoH
   w==;
X-CSE-ConnectionGUID: fJaKfeQXSbubnrpQ7/4kzA==
X-CSE-MsgGUID: 3kh7+m5JTw2//VMPTDkYYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59637907"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59637907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 07:02:56 -0700
X-CSE-ConnectionGUID: EuRcTEMrQAmZQt5EaJp+DA==
X-CSE-MsgGUID: WWEJI342Q1WIfol7oak04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172685288"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 07:02:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvyvF-00000001V3U-0RwC;
	Tue, 09 Sep 2025 17:02:13 +0300
Date: Tue, 9 Sep 2025 17:02:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
 <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 9, 2025 at 3:47 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > TBH, I think those 6 all made the same mistake, i.e. thinking of the compound
> > literal as a cast. Which is not!
> 
> What do you suggest?

Write it in less odd way :-)

foo = (struct bar) { ... };

> And are we not allowed to use C99 features now anyway?

It's fine, it's not about the C standard number.

-- 
With Best Regards,
Andy Shevchenko



