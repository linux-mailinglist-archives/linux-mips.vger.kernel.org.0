Return-Path: <linux-mips+bounces-11154-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53DB4FE17
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 15:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFEF04E40FA
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0108C340DA1;
	Tue,  9 Sep 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHIJZG0Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910C33A023;
	Tue,  9 Sep 2025 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757425542; cv=none; b=RbjgKNhsECLlg1bmGgqIo7zEirIIJczDOOWkgdzVv9uTg9eGSb2iQn2WLSTbk5X0AzuHwk4anjTT8L07Qp5mgEYYmdq0Hz61836riHdykEmq1T5v0aXxsgfq5est5ey1Jjgt0l+bqraLerytRtghjPZr0XFMNCX0kwNIha0EwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757425542; c=relaxed/simple;
	bh=cuvp1jqzP0KmBIeFPlYIHdueAMSWUkXNMbTb2SDREqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5FW9DM9b+NQO5rGnyrpXYPakANi41jDJreMxZlnMMbqtwVZQumT2LhjBAx2RC9/lu7YJk1dWG+dTas0fsNsT/XpNzr5VKy7g9LaZ81xpIjViEvXZ7OCVHLn2dEJDTfUR4RBB4BGqSMz9JLq4gHAcS/QUHQyDnbcMvQ86tHCgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHIJZG0Q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757425541; x=1788961541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cuvp1jqzP0KmBIeFPlYIHdueAMSWUkXNMbTb2SDREqQ=;
  b=UHIJZG0QilN5UP3SMzS52/kV2RuPrkp2PuS2ah72yEMz/+jGzTLyOXRy
   /g1+u1s6+mxCZCGL6TL+nYz441Ynp3uzjLMXhpt3ifHSvao9uAnHKIAVE
   0hzoXYH2HCHUu4DwRZ4sC59cSDofLn670+5zxU+Xg9HJFDYrjhP229z3r
   /VbszCFEZEd/NQ6TDEGasZ83k0ZXcD8koJvxqufQ4Q65JgM3O+V55ieKX
   +3dNqHgARF975Acepb5rfoaDuAgh+yI6nW44k0OLa60Gi/9nnGX4+YVdv
   FzWQHRvnIGxa7Ng/yeC3fxdFmgoQjSEJV6MxnMIpdDiBmzag90SZRKfvc
   Q==;
X-CSE-ConnectionGUID: WaWDCbPLROGk6zdH6Bogzw==
X-CSE-MsgGUID: 6lpE/R0KSESTGQ2113I+4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77320974"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="77320974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:45:40 -0700
X-CSE-ConnectionGUID: YelEPzAPTVimIapPXZjDQA==
X-CSE-MsgGUID: DSSZAarXTPmifkvXgS2MQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="177436591"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:45:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvyf5-00000001S9X-2kkM;
	Tue, 09 Sep 2025 16:45:31 +0300
Date: Tue, 9 Sep 2025 16:45:31 +0300
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
Message-ID: <aMAve1MbONmKVjjg@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 08:24:23AM -0500, Bartosz Golaszewski wrote:
> On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
> > On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> >> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> >> <andriy.shevchenko@intel.com> wrote:
> >> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> >> > > +     config = (typeof(config)){
> >> >
> >> > This looks unusual. Why can't properly formed compound literal be used as in
> >> > many other places in the kernel?
> >>
> >> It is correct C
> >
> > If it compiles, it doesn't mean it's correct C, it might be non-standard.
> > Have you checked with the standard (note, I read that part in the past,
> > but I may forgot the details, so I don't know the answer to this)?
> 
> It's a GNU extension alright

clang, I suppose, also okay with this?

> but it's supported in the kernel as it evaluates
> to a simple cast.

There is no cast. And that's make a big difference to what the code tries to do.

> >> and checkpatch doesn't raise any warnings.
> >
> > checkpatch is far from being useful in the questions like this.
> > It false positively complains for for_each*() macros all over
> > the kernel, for example.
> >
> >> It's the
> >> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> >> kmalloc(sizeof(f)).
> >
> > Maybe, but it introduces a new style while all other cases use the other,
> > _established_ style. So we have a precedent and the form the code is written
> > in is against the de facto usage of the compound literals.
> 
> It may not be *very* common but it's hardly new style:

I think your statement is incorrect see below why.

> $ git grep -P "\(typeof\(.*\)\) ?\{" | wc
>     108     529    7315

Not correct. The correct output will be closer to

$ git grep -l -P "\(typeof\(.*\)\) ?\{" | wc -l
15

And if you looked at the output carefully, you see the bug in the RE you used.

So, even closer will be this one:

$ git grep -l -P "=[[:space:]]+\(typeof\(.*\)\) ?\{" | wc -l
7

2 out of which are related to libeth, effectively makes this 6.

No, this is completely non-standard and unusual thing in the kernel.

> >> I guess it's personal taste but I like this version better.
> >
> > In kernel we also try to be consistent. This add inconsistency. Am I wrong?
> >
> >> > > +             .dev = &pdev->dev,
> >> > > +             .sz = 4,
> >> > > +             .dat = sd->gpio_pub_base + GPINR,
> >> > > +             .set = sd->gpio_pub_base + GPOUTR,
> >> > > +             .dirout = sd->gpio_pub_base + GPOER,
> >> > > +     };

-- 
With Best Regards,
Andy Shevchenko



