Return-Path: <linux-mips+bounces-10962-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8AB40586
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEB597ABE1C
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E493112C4;
	Tue,  2 Sep 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRgAjFqj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F393212556;
	Tue,  2 Sep 2025 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821039; cv=none; b=D0MhMCiaGBaogt0XtGKiGPEGRu//aOgjdmP0fnI4pLTp0mUfuC+rd4dod409b6PqXEpbh7hLbMkAbwBIrbRpI29761mheTDe7dVFgK8cr9VHItVn52h2tnWD2c600iE/viKiOXbm25muhlldwipvHsQbMrNZYkkoCtC4txjemEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821039; c=relaxed/simple;
	bh=pxx41/VBJwEQCpU5u+vMOlc6AdRXauTq/XBO/2b9BuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leGMOxLdK48Mvg48LLwHFnZM0figRKf4P68RRMQlMcPYzPUEJYBbaEhJi4fUZ0Dj//2HJVr2khUFTqCT3l6T0xuM+YIi52rmkFBslcnVxW1wrzfmEYBJDuue5O3XDa65imx6ZWDzS69tC6SpF2jrDcoPZQqEy7aSP4osexAVulg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRgAjFqj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756821038; x=1788357038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pxx41/VBJwEQCpU5u+vMOlc6AdRXauTq/XBO/2b9BuM=;
  b=eRgAjFqjrvlk3rcCDhqI43ucdTkT/uOXlKMyRfYBSbsfxy7wKMiCYiU4
   rRH6X5fWqrUvQSc6tyv0mZhHxPGjPLVLZd7iowQYgLqC/PPwXDi96UHQq
   YmUA38gVUu5waT7H/8HpHvB+aNzX2xavUHd+ObEBZ5pAr5HSyu6IFqK7r
   yUi14fqD5BlqhnklO+lBigcehHsn7YXZq5Z9jUfQTAD2E9WG0LpQLQ3ux
   YfGbn4A6wfw5RGN1VMFlIZENAfKJVXzk1aYUWI/RL241J93Xd/2787EVi
   3jDjd3EH8nZj1WCowwDa5vwdFubZEtufUfinT7tF+1aLKLnbXTCp8MXBG
   g==;
X-CSE-ConnectionGUID: pAVJrVGfSqSLaUBO+akCwg==
X-CSE-MsgGUID: iVN9697HTdGfGFlrWT5emQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62738133"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62738133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:50:37 -0700
X-CSE-ConnectionGUID: ZHIE/dHOSB+FAZRCRRCs4Q==
X-CSE-MsgGUID: 2IiLBKTERdG7VU87j86+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176590815"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:50:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utROu-0000000AhyY-2NM3;
	Tue, 02 Sep 2025 16:50:20 +0300
Date: Tue, 2 Sep 2025 16:50:20 +0300
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
	stable@vger.kernel.org
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of
 pinmux_ops::get_function_name()
Message-ID: <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
 <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
 <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 03:29:31PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 2, 2025 at 3:06 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > >
> > > While the API contract in docs doesn't specify it explicitly,
> >
> > So, why not to amend the doc at the same time?
> 
> Because this series is already big as is. That would be another commit
> that can be separate.

I meant _in the same_ patch.

> > > the generic implementation of the get_function_name() callback from struct
> > > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > > NULL. This is already checked in pinmux_check_ops() so add a similar
> > > check in pinmux_func_name_to_selector() instead of passing the returned
> > > pointer right down to strcmp() where the NULL can get dereferenced. This
> > > is normal operation when adding new pinfunctions.

> > Fixes?
> 
> This has always been like that.
> 
> > Reported?
> 
> I mean, technically Mark Brown reported my previous patch failing but
> I don't think we do this if we're still within the same series just
> another iteration?
> 
> > Closes?
> 
> Ditto.

I meant that this fixes a potential issue disregard to your series, right?

...

> > >       while (selector < nfuncs) {
> > >               const char *fname = ops->get_function_name(pctldev, selector);
> > >
> > > -             if (!strcmp(function, fname))
> > > +             if (fname && !strcmp(function, fname))
> > >                       return selector;
> >
> > I would slightly refactor this:
> >
> >                 const char *fname;
> >
> >                 fname = ops->get_function_name(pctldev, selector);
> >                 if (fname && !strcmp(function, fname))
> >                         return selector;
> >
> > >               selector++;
> >
> 
> You can do this in a subsequent patch, I prefer a smaller diff personally.

Sure.

-- 
With Best Regards,
Andy Shevchenko



