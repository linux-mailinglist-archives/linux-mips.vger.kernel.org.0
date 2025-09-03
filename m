Return-Path: <linux-mips+bounces-10988-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474BB41DB2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 13:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9773A181B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 11:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E382FF16C;
	Wed,  3 Sep 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwwQj+ZQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF82FC874;
	Wed,  3 Sep 2025 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900283; cv=none; b=TS9ygs5naXv2AyojqHIm3c3pbx17u3eRNasTbQ5ENMMaNeq+hzizAJH1RuKlgx2lswhqoM2YsWlXVoMki0onOhZWjzuXcnCjG4IYSeMw4dNpsijJU1jvrifHqWvxylbfhLeTzgXIeXqTh7PtMrUqfUx3ZOQrluAdvXrrh5BUqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900283; c=relaxed/simple;
	bh=nDvbAiY6rHd3SKV/DYo7HnX4lUjAZdHwuJei+GGsRW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1DbPP2WGFUSLNSDO6h4efG+WSOfOc7mKqEz1pflQFtyieGV0H4KPDUaNCp4Y3WyHssX2GRESmTRyzHGT7s35YiOs/Zs9qUvtmyi6/DPFTpuoCwvK3HyK6MJW4HDm6Mupvk3H7bTI1qwXUinGscMm4AOij/6fJP/FXXbXrQpd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwwQj+ZQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756900281; x=1788436281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nDvbAiY6rHd3SKV/DYo7HnX4lUjAZdHwuJei+GGsRW8=;
  b=WwwQj+ZQYt/6BqYvYcHz7lWjbLg26wheztfaS2gTmdYfpxM5/MgwvfII
   BmBMFbCNBcsh5Kaz8VDNYj0d6DKUYdeoTgPIJF59OT97w0hNdf6OJCy+W
   Pm3y1faZw5lyBEJNILax+qF7ro175aFBhLXz3Xiq4j+hik6TNgODxwJCR
   v1tEek+nGSDaFEq73+53KqX9N/TV/bCocuy+74h+pIcloDSoU/uOc1zSe
   J2xfobxUZr6sjyb8IVIz/m622/2hadnvpNc+D9ZSuDiHC5ghUXlhrZqjt
   /e631TOHFuerOOohDB/7jIdZxxzlOJ1Q2l6ZGLnqsDYZe+IMmXz1TcwiE
   g==;
X-CSE-ConnectionGUID: cpzLltgHSHCTGRqOo9j6CQ==
X-CSE-MsgGUID: Sqg7Ly4pR+awcUjJMbSaIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69822588"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="69822588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:51:19 -0700
X-CSE-ConnectionGUID: IwmxuAerSUCIeLGnj4/KSA==
X-CSE-MsgGUID: exSghXJzT32WBa3jKCspRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="195199401"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:51:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utm13-0000000AyQC-2iW1;
	Wed, 03 Sep 2025 14:51:05 +0300
Date: Wed, 3 Sep 2025 14:51:05 +0300
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
Message-ID: <aLgrqZETNLmuMHhv@smile.fi.intel.com>
References: <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
 <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
 <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com>
 <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com>
 <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 03, 2025 at 01:05:27PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 3, 2025 at 12:53 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Sep 03, 2025 at 12:41:48PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Sep 3, 2025 at 12:38 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > > > > On Wed, Sep 3, 2025 at 12:22 PM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > > > > > > On Tue, Sep 2, 2025 at 10:46 PM Andy Shevchenko
> > > > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > > > On Tue, Sep 2, 2025 at 8:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > > > > > On Tue, Sep 2, 2025 at 4:38 PM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:

...

> > > > > > > > > > > The strict flag in struct pinmux_ops disallows the usage of the same pin
> > > > > > > > > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > > > > > > > > process with enough privileges (or even a buggy driver) can request a
> > > > > > > > > > > used pin as GPIO and drive it, potentially confusing devices or even
> > > > > > > > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > > > > > > > >
> > > > > > > > > > How does this keep (or allow) I²C generic recovery mechanism to work?
> > > > > > >
> > > > > > > Anyway, what is your point? I don't think it has any impact on this.
> > > > > >
> > > > > > If we have a group of pins that are marked as I²C, and we want to use recovery
> > > > > > via GPIOs, would it be still possible to request as GPIO when controller driver
> > > > > > is in the strict mode?
> > > > >
> > > > > Yes, if you mark that function as a "GPIO" function in the pin
> > > > > controller driver.
> > > >
> > > > How would it prevent from requesting from user space?
> > >
> > > It wouldn't, we don't discriminate between user-space and in-kernel
> > > GPIO users. A function either is a GPIO or isn't. Can you point me to
> > > the driver you're thinking about or is this a purely speculative
> > > question?
> >
> > The recovery mechanism is in I²C core and many drivers use that.
> > I'm not aware of Qualcomm drivers in particular. But mechanism is
> > in use in I²C DesignWare which is distributed a lot among platforms,
> > so using word 'purely' is incorrect, and word 'speculative' is a bit
> > strong, but you can think of the issue coming later on when somebody
> > does something like this.
> >
> > The same applies to the in-band wakeup UART mechanism.
> >
> > Which means that with this series we will relax it back anyway for
> > the above mentioned cases.
> >
> > (Not sure, but SPI DesignWare requires programming SPI native chip selects even
> >  if the GPIO is used for that, this might have also some implications, but here
> >  it's for real 'purely speculative'.)
> 
> The high-level answer is: yes, a pin that will be used by GPIOLIB
> needs the function it's muxed to, to be marked as "GPIOable" in its
> parent pin controller if it's strict. That's still better than the
> current situation.
> 
> I can imagine we could differentiate between in-kernel and user-space
> users of GPIOs and then make it impossible for the latter to request
> certain pins while they could still be requested in the kernel but
> that's outside of the scope of this series.
> 
> I don't see why this would stop these patches though, as they don't
> break anything unless you decide to make your pin controller strict in
> which situation you'd need to verify which functions can GPIOs anyway.

It can't anyway, Linus already applied :-)

-- 
With Best Regards,
Andy Shevchenko



