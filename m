Return-Path: <linux-mips+bounces-10981-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3135B41BB1
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 856977A4488
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 10:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1BE2E973D;
	Wed,  3 Sep 2025 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HggVaUDs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA32D63F4;
	Wed,  3 Sep 2025 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894973; cv=none; b=bvp6hFHqVLoau7RpAYwgXMiwF0BI5afLUMscLP4MOe5QKw3JBYE2AiN3IMj7TnUo7MsUJUNpJVknJnqnJxURYRcAECAn1x731YXHTLIRS+ddOBfdzd6X7v9F70rZh1kMl2LROVbKI70OW3I+murkTSYbgIxpIr7S0/ReJnxQYjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894973; c=relaxed/simple;
	bh=hEddkyRBq0eYhs86EpYDI0PR1kM06ibMXa7C70wF0A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWED1N5E91Rtb6ETSkzxNNi9r79OY80BmoCp79incPny9xX8GZ7jAsNnYDgD2Q89qLwg8MUVI9vh9sAmTuKYy1NXyvHedFXbPTzozN7BisNnyCwmDR5F46k943szMNNrtVOlP0SSAcBdbjbPWpWWE+k1I3mKpaZm4Iord8QFXXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HggVaUDs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756894972; x=1788430972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hEddkyRBq0eYhs86EpYDI0PR1kM06ibMXa7C70wF0A8=;
  b=HggVaUDs6B5f0jjwnfhFSe8/Ze/5LEgjauNQ/5TUJY30DB18cimKRVkT
   +aNsLVgdW55iJaeiH7gtEgadiG+IjSN3n6xz20M2CsssdMiQ0/aLUtxlc
   vCgaGi1TB7AbGvlg6SgwfpuANKZ9vf3lKfLI1k8V6BsWuiC+kv095E8sM
   OZE3t4WV4l13e4hwEWIuf4Q+dVawdt66nXtB5qSekXcp5xPM5iX+QLm96
   2DjXdKqLpo/pKvvgwFGszxCfBbhoaMEKEfjafZYOW9AEgzkvYZwBDfXy5
   h97+mgrGnUqBdI38YP63yiC4Fl8T1uGjmG1zPyi6o60nqR/5is3wICIE3
   g==;
X-CSE-ConnectionGUID: 9y793YRqT9q9KsmIRzgYQQ==
X-CSE-MsgGUID: TKosgqm4QMOmg8xd/O6PZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59318108"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="59318108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:22:50 -0700
X-CSE-ConnectionGUID: YTo0WasPQBSP1GD2jJB+Ig==
X-CSE-MsgGUID: 5tCXY7/9Tha1Hp4Y6DZptQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="195180921"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:22:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utkdQ-0000000AxFa-1l46;
	Wed, 03 Sep 2025 13:22:36 +0300
Date: Wed, 3 Sep 2025 13:22:36 +0300
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
Message-ID: <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
 <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 2, 2025 at 10:46 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Sep 2, 2025 at 8:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Tue, Sep 2, 2025 at 4:38 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:

...

> > > > > The strict flag in struct pinmux_ops disallows the usage of the same pin
> > > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > > process with enough privileges (or even a buggy driver) can request a
> > > > > used pin as GPIO and drive it, potentially confusing devices or even
> > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > >
> > > > How does this keep (or allow) I²C generic recovery mechanism to work?
> 
> Anyway, what is your point? I don't think it has any impact on this.

If we have a group of pins that are marked as I²C, and we want to use recovery
via GPIOs, would it be still possible to request as GPIO when controller driver
is in the strict mode?

-- 
With Best Regards,
Andy Shevchenko



