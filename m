Return-Path: <linux-mips+bounces-11155-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8429B4FE1B
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 15:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2B133A94F0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A9F32275B;
	Tue,  9 Sep 2025 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpJvyial"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1632CF7A;
	Tue,  9 Sep 2025 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757425641; cv=none; b=pc7XYsIg8B38OAubDh6Q42et7OhwdLouauG0GDC9YqhJLF5Na8YiqNJL7HTKBJVXKRwFovZsq4fUEuXb41ucw5MWLAeiFZvl7aThyzgZk/PPUplYyC1RNIdP6E2T8MlipaYpj+Dq9jzGGYC+YWngRGmtoB9e8WlzkqLbDYltqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757425641; c=relaxed/simple;
	bh=SgpPAjADQzC6Aebwe3Gl5hrmCduvtTFHZe4sNN8KxNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaqCEVBWZjkIPWohYqLMJS2Zsv0EiDmWQVgm52K7NIfVRfyoD1yvFJ+jadqZ+Re9fNs6KMD0gxrb5LhPpUwFz33P2WCRyDqhGKrjTBm6/lY16YPWyIo2vXgm3N9y7CzbGhDpGaK0LgSwesnm5Gi7JdhlGHRkuvIRQitfTKhsaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpJvyial; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757425640; x=1788961640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SgpPAjADQzC6Aebwe3Gl5hrmCduvtTFHZe4sNN8KxNA=;
  b=CpJvyialNhQqSwiAUvGUNEgyH7jPPjni4Q4TRZKoZ6lglirQB+n6vG8o
   M8AFYfdEgROxCUOWUFnQj7hO+rvdWbsALT3lL5js+9qeWlN2wgJ/J1VVt
   3QRxI+y8FSt75U2Ko1FvMEfI8oiYlFljT23iotGtUFRKJEpJRNlr8q1rj
   p95fOzUfZ9STedj4Wn07o2CmF3MN5tQbu7oTlYtrtUUDoARjlOBp6oVww
   wLw3zLr/pa2bo/BVpIbhgpFDKof6aVirp+h6dWZxOKBRi/g+QwB0pyLAy
   mQUxaZJrHJYY2CrbnE3IdNRGNFUzbA9WyPP0phCz0QnOgtwoFRYgNcgHL
   Q==;
X-CSE-ConnectionGUID: 4yFjxPBDTauivDFKi7dx6w==
X-CSE-MsgGUID: YDSPkkzZR3envU1LghONAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="85156569"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="85156569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:47:19 -0700
X-CSE-ConnectionGUID: aQJ5SNjrRiC9oY5or5hmCw==
X-CSE-MsgGUID: IvhvaCp3Shak7FgkN3F39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173207838"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:47:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvygf-00000001SBf-44Rc;
	Tue, 09 Sep 2025 16:47:09 +0300
Date: Tue, 9 Sep 2025 16:47:09 +0300
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
Message-ID: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMAve1MbONmKVjjg@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 04:45:31PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 09, 2025 at 08:24:23AM -0500, Bartosz Golaszewski wrote:
> > On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
> > <andriy.shevchenko@intel.com> said:
> > > On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
> > >> On Tue, Sep 9, 2025 at 1:31 PM Andy Shevchenko
> > >> <andriy.shevchenko@intel.com> wrote:
> > >> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:

...

> > >> > > +     config = (typeof(config)){
> > >> >
> > >> > This looks unusual. Why can't properly formed compound literal be used as in
> > >> > many other places in the kernel?
> > >>
> > >> It is correct C
> > >
> > > If it compiles, it doesn't mean it's correct C, it might be non-standard.
> > > Have you checked with the standard (note, I read that part in the past,
> > > but I may forgot the details, so I don't know the answer to this)?
> > 
> > It's a GNU extension alright
> 
> clang, I suppose, also okay with this?
> 
> > but it's supported in the kernel as it evaluates
> > to a simple cast.
> 
> There is no cast. And that's make a big difference to what the code tries to do.
> 
> > >> and checkpatch doesn't raise any warnings.
> > >
> > > checkpatch is far from being useful in the questions like this.
> > > It false positively complains for for_each*() macros all over
> > > the kernel, for example.
> > >
> > >> It's the
> > >> same kind of argument as between kmalloc(sizeof(struct foo)) vs
> > >> kmalloc(sizeof(f)).
> > >
> > > Maybe, but it introduces a new style while all other cases use the other,
> > > _established_ style. So we have a precedent and the form the code is written
> > > in is against the de facto usage of the compound literals.
> > 
> > It may not be *very* common but it's hardly new style:
> 
> I think your statement is incorrect see below why.
> 
> > $ git grep -P "\(typeof\(.*\)\) ?\{" | wc
> >     108     529    7315
> 
> Not correct. The correct output will be closer to
> 
> $ git grep -l -P "\(typeof\(.*\)\) ?\{" | wc -l
> 15
> 
> And if you looked at the output carefully, you see the bug in the RE you used.
> 
> So, even closer will be this one:
> 
> $ git grep -l -P "=[[:space:]]+\(typeof\(.*\)\) ?\{" | wc -l
> 7
> 
> 2 out of which are related to libeth, effectively makes this 6.

TBH, I think those 6 all made the same mistake, i.e. thinking of the compound
literal as a cast. Which is not!

> No, this is completely non-standard and unusual thing in the kernel.
> 
> > >> I guess it's personal taste but I like this version better.
> > >
> > > In kernel we also try to be consistent. This add inconsistency. Am I wrong?
> > >
> > >> > > +             .dev = &pdev->dev,
> > >> > > +             .sz = 4,
> > >> > > +             .dat = sd->gpio_pub_base + GPINR,
> > >> > > +             .set = sd->gpio_pub_base + GPOUTR,
> > >> > > +             .dirout = sd->gpio_pub_base + GPOER,
> > >> > > +     };

-- 
With Best Regards,
Andy Shevchenko



