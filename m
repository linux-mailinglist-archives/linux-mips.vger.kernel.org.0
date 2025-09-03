Return-Path: <linux-mips+bounces-10983-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37611B41C02
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE801BA6057
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 10:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB32ED865;
	Wed,  3 Sep 2025 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoIeSVfg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD55258CDF;
	Wed,  3 Sep 2025 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895925; cv=none; b=kT8Kj4j0iVJf2C43Sp5iDwdPsTDLSdXl5mJH25KbfZgcyi4fQt7/zy7BNxYJ8kKZi82+7uznt96e31DVCjVpqAaSiLWG4NYssPfqOdLvw7MQzK8mCNcz32lloC8y8gJi1uNekllnVftjNgR3oxv/hLhhSNXk8QOt3nvBNfIOCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895925; c=relaxed/simple;
	bh=GCTF1UYtOSCeRAlhubdQAJ7qhlBqyZpfpnhA1MMIZJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaoY5na9iFzoHZdcee8m4+gcXKSxfw7blnozHd5xOdMOup+l2xG0jYqX6AGiVzRmYu5Ec016KxU2PnKakMVo7C2RVi1U/LzHOWogqFAAECDdW7YSgkqY0OfuAkKrIoo6GE8XDLbIhDZEqNDAqq2/ZgyMMSVUUma414L0QUupmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoIeSVfg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756895924; x=1788431924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GCTF1UYtOSCeRAlhubdQAJ7qhlBqyZpfpnhA1MMIZJE=;
  b=aoIeSVfgjxBHaBK/rH7eeDtjQn6Q93RiB9ABmLVlCPmjCKXUIIPqN/nV
   KM0cssTP95HMkBWKzLY0/l3d8NRTnpcK4PWYron/+JrhboKVkBl4U3S13
   Bh5pybcx0vaY35wVOE8ZSR9zcTmuu0lWla6FXzgj2yW3A871RzNYklG+s
   H6Wx/gRMJ2u06zDiAGYIDycA0GJ4+I49tlpOw8m68CWbTRw1S4FJDiAl1
   WR4uza9hQ6vvJnArbqe30TMsnQqJIvR1ViQWKsDWHtb2oW+AsD9Qwz3C+
   F8G8jGU51Sa5bgwGByzQnnOOdHZt4KSMXnrBor9D/06I8fGrJSaACIqMA
   w==;
X-CSE-ConnectionGUID: TJP5/xWPQoiHurVgJD/mLg==
X-CSE-MsgGUID: l58jsQxpQGeM2TkdaaISDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70632573"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="70632573"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:38:43 -0700
X-CSE-ConnectionGUID: gcUgIZtvSDO2dFM95UNdfw==
X-CSE-MsgGUID: hQkiLlfsRpSs+9G/ykDw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="202430131"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:38:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utksl-0000000AxU5-0dpr;
	Wed, 03 Sep 2025 13:38:27 +0300
Date: Wed, 3 Sep 2025 13:38:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
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
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
Message-ID: <aLgaoivmBUgoeO6B@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
 <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
 <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 3, 2025 at 12:22 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 2, 2025 at 10:46 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Sep 2, 2025 at 8:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > On Tue, Sep 2, 2025 at 4:38 PM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:

...

> > > > > > > The strict flag in struct pinmux_ops disallows the usage of the same pin
> > > > > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > > > > process with enough privileges (or even a buggy driver) can request a
> > > > > > > used pin as GPIO and drive it, potentially confusing devices or even
> > > > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > > > >
> > > > > > How does this keep (or allow) I²C generic recovery mechanism to work?
> > >
> > > Anyway, what is your point? I don't think it has any impact on this.
> >
> > If we have a group of pins that are marked as I²C, and we want to use recovery
> > via GPIOs, would it be still possible to request as GPIO when controller driver
> > is in the strict mode?
> 
> Yes, if you mark that function as a "GPIO" function in the pin
> controller driver.

How would it prevent from requesting from user space?

-- 
With Best Regards,
Andy Shevchenko



