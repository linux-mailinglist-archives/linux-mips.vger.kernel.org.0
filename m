Return-Path: <linux-mips+bounces-11152-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D77B4FC24
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 15:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252E01C235CC
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6E6340D93;
	Tue,  9 Sep 2025 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBTiLlyd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DE340D85;
	Tue,  9 Sep 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423595; cv=none; b=JWXD+vk91Ph37faCJF/I5J0qBhJcbyu/46isS0LyuA9N6Hqt1aDrxzSD5m4ZNcSu4ZL4JuTwzFOFyIau7cuxc/KPtc0RCRch0F4fQ7T7v5J2hTMVVevaeM044lJzYWlrikKviSk3FcLpAtFXaRWzJx2LW1Zx3stQLRJsjrX/B7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423595; c=relaxed/simple;
	bh=L6CwOVwYJN4Y/x7PmC4SNNIsn1PcLQu+MvjuP9uomWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2dyoFORnn1fttmBzhg1boMEPnqqU0wihWVfekorIZjP3A7KZ3FeBjoUj3l6sjsAl/ilFSmYqm5y13EbNp7HRRK6ecuugAvrJLOdvAJYW7foEjqFIkm3gikEhyyOCmvMryBf3ES/AMVRe5kGjB1np4N7rJfTs/Xyw9pOAjaFr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBTiLlyd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757423593; x=1788959593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L6CwOVwYJN4Y/x7PmC4SNNIsn1PcLQu+MvjuP9uomWU=;
  b=lBTiLlydhz6UG+xbO2+REzhWCYdJ6xubL1jpQd/sJNXdJ+9c56Rsfjxv
   E1YRfIpZU3iRIM9xXt0HpOi7a2TC2/4iSP9WDR91GrgU+FmXlMaMwQRrM
   5N7dOAZSkE814/SCA9Vwa+IU5NFUwiO7UXUuh8MMjaJ3E838Kk5XA8B7X
   JL4JF4LkluYEIZFvu5AauksMWBfHKzijGMVmf7yBKgJZtdcmaAQg7pdyX
   D9NsW/AziOWdqlVWiR/PM+Nw61ybzkdnCQHKCdGv5U/s+q39ml8dSEMaD
   SITWSslEMOylt88zL9h7BZsIuMPHdcnENLTAW7HUWZRVW2bc2eeyPZ3kf
   Q==;
X-CSE-ConnectionGUID: xmHsdx8SRxeI+rsQhOEFzw==
X-CSE-MsgGUID: 0RyCS3CDRTOygfsGOQAXNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82295496"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82295496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:13:13 -0700
X-CSE-ConnectionGUID: uvql51LsTAqr3Q78sqHnqg==
X-CSE-MsgGUID: bZMIDd5nSnSWd1c35O6zLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="210237526"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:13:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvy9g-00000001Rlg-2b48;
	Tue, 09 Sep 2025 16:13:04 +0300
Date: Tue, 9 Sep 2025 16:13:04 +0300
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
Message-ID: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> > > +     config = (typeof(config)){
> >
> > This looks unusual. Why can't properly formed compound literal be used as in
> > many other places in the kernel?
> 
> It is correct C

If it compiles, it doesn't mean it's correct C, it might be non-standard.
Have you checked with the standard (note, I read that part in the past,
but I may forgot the details, so I don't know the answer to this)?

> and checkpatch doesn't raise any warnings.

checkpatch is far from being useful in the questions like this.
It false positively complains for for_each*() macros all over
the kernel, for example.

> It's the
> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> kmalloc(sizeof(f)).

Maybe, but it introduces a new style while all other cases use the other,
_established_ style. So we have a precedent and the form the code is written
in is against the de facto usage of the compound literals.

> I guess it's personal taste but I like this version better.

In kernel we also try to be consistent. This add inconsistency. Am I wrong?

> > > +             .dev = &pdev->dev,
> > > +             .sz = 4,
> > > +             .dat = sd->gpio_pub_base + GPINR,
> > > +             .set = sd->gpio_pub_base + GPOUTR,
> > > +             .dirout = sd->gpio_pub_base + GPOER,
> > > +     };

-- 
With Best Regards,
Andy Shevchenko



