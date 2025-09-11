Return-Path: <linux-mips+bounces-11237-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC0B52B16
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 10:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57AE5175B4D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 08:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1576C267B7F;
	Thu, 11 Sep 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7guNbje"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F122A4DA;
	Thu, 11 Sep 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577758; cv=none; b=eHTDoVeVHBp7IOSYRIcTm4nmvM8Vb2yO8hkDyOvlk9zZbcPjUIB73KEdjfjwep+MEImVOr7TUrychWNMAa8jML9g9nvFUazYYbUiu4a+OHXV1Tq3YMUp736udhUUnAutvs2ced517qxtSxF/CVMelyTIRkcy15mctXJIFzTQaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577758; c=relaxed/simple;
	bh=kdicIERSEGS6CGqV+GThuXvTSIsMgiNJoEUEEMAQ7JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEj2g9AVs5szuTCwpkPLDpHH/7twa7cijy4CVtG04ZhpNXfqriLJcGHk2oM4i+492Znhbb6TdNZA1OY1gIJ2LK7hED7eG/rJp6yS4UkyMof0ZR6ET5x3EtXX/Vk4Ml0VcknEjllduKq+tMbq7B4XeeIcLkCRXQ84fZh1Gp8QZ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7guNbje; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757577757; x=1789113757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kdicIERSEGS6CGqV+GThuXvTSIsMgiNJoEUEEMAQ7JM=;
  b=c7guNbje9iJPg+0qLq68qWFeoneuyW14ngsfgGOSE4RYTMhgEwhOsnrc
   0JJGd8ahSwav5d8hfpDGjhMk/6EFve555i/ZJIVC8z71RPQ/RFlbdXM9r
   QWRGdYAv3oDVWuDuiB8RH8twnTWBCM9UI1ztOoM9zGqlVEMRUsWatbFjE
   BzztSqB9BAQq3obzOtnP32/33OYdahBb231amxuCZYMKona1c5eZa7v6l
   OaEBBT6YfNL6NYlIP0EseM8qw4wE1uJTBVmMB5x/V955NExJw4HkImETn
   Q7W/KTsBbkw+MShs+3wRnWjR2BNpkxrZ2vo17pQlK37El5AFLFmqKMLZ8
   w==;
X-CSE-ConnectionGUID: a5DLk4TrTcypGyos7APTYA==
X-CSE-MsgGUID: NNbTmojcTdeLgzhVOM3RVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59130651"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59130651"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 01:02:36 -0700
X-CSE-ConnectionGUID: HSAt/B/2T7CyoKV4/Fpp1g==
X-CSE-MsgGUID: KD+qII/XTDGOjnGuMB8DWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="172805532"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 01:02:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uwcGA-000000022ZP-12Gk;
	Thu, 11 Sep 2025 11:02:26 +0300
Date: Thu, 11 Sep 2025 11:02:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>,
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
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
Message-ID: <aMKCEjwDUFH4OZAf@smile.fi.intel.com>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 11, 2025 at 09:56:28AM +0200, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 2:11 AM Doug Berger <opendmb@gmail.com> wrote:

...

> > I'm just curious about the longer term plans for the member accesses. Is
> > there an intent to have helpers for things like?:
> > chip.gc.offset
> > chip.gc.ngpio
> 
> I don't think so. It would require an enormous effort and these fields
> in struct gpio_chip are pretty stable so there's no real reason for
> it.

What I would like to see in TODO is to "make struct gpio_chip const" when
passing to the gpiochip_add_*().

-- 
With Best Regards,
Andy Shevchenko



