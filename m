Return-Path: <linux-mips+bounces-10964-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6261AB40692
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 16:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D83E203600
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7D230748B;
	Tue,  2 Sep 2025 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvutZJQr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520B2305E28;
	Tue,  2 Sep 2025 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822827; cv=none; b=oLXC8SImqN9q1ZLUFInncEdGgrPU3wohr+lAUPilkcHxFnxy1csYdnT0iFtVMeHGSCyL6sCIXmL/aXN1eHx0BTwBVuChKzpubIsQaT+/dpMtrhEXjqukgGNRTIPqoazpERNRfBXrVjn22DRr94EX/Hh9IykWdJtKy+xu5vIYDbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822827; c=relaxed/simple;
	bh=iAXUSwwbvwiZC9bhMY6s6lbOEzUht7j1jWcYwHXsu+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nh6YJMdSEJl+jGl7LssHGMpIzo9AnkzCOGyXXl9ddhgVRRtG33w8uiviJNHfid4o9XJX9zwoiF+ucabCb5eBC/ZYIGBVUmKrgby88CxP4XbjSovzUy4FvQs4W97FHooE1BDVVj3/j8YHuo7NTBlVVAgXdqvFy+JzsRC2zMi/XmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvutZJQr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756822825; x=1788358825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iAXUSwwbvwiZC9bhMY6s6lbOEzUht7j1jWcYwHXsu+I=;
  b=ZvutZJQr84oFZMCEmQWsuxcDvoOqPDwWfkU+VkqPpP4dDXOw9te4WgG8
   H2YlG7vB1YOQRPcNgCgy/OfZNCCGjgdBV4kSKJdzKJyVoOnavATFWRHG8
   x6hMbVi+JLc38iVKStQ1CjSVEC/jcwG9YAA0An/2gUZ1DkbumadxG4Fhc
   JsyvI5F/z9EyeD+q6LqOnO1Xer04EYkdcH9TdDVs6fXxiGN36j4km+EwX
   EMayxGn+N9UtgelVvkdmrYykRxuucT+PQ9St4BddYRK6d69DR+9pvw6W1
   VtB23yw1Qxgqf8s+4y9fp2Z3Zlj1Z174Y9FMv5y0bxORF9ptjw7V/cCbK
   w==;
X-CSE-ConnectionGUID: IXCpUvLwR9qZeLIqvv/kmw==
X-CSE-MsgGUID: szdYMZd+RKWDcMZWWNGAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58305917"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58305917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:20:24 -0700
X-CSE-ConnectionGUID: MsrrCbkESHiLoR6gD4wQng==
X-CSE-MsgGUID: WARwoctoTZupLE1EBSrbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202237611"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:20:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utRrk-0000000AiLA-3gUk;
	Tue, 02 Sep 2025 17:20:08 +0300
Date: Tue, 2 Sep 2025 17:20:08 +0300
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
Message-ID: <aLb9GKnQkAiayqpD@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
 <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
 <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
 <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
 <CAMRc=Mdp2djgGbgu_uwLSkrtRPomAU=6-SRdzCdSbrHWzS2c2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdp2djgGbgu_uwLSkrtRPomAU=6-SRdzCdSbrHWzS2c2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 04:02:27PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 2, 2025 at 3:50 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 02, 2025 at 03:29:31PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 2, 2025 at 3:06 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:

...

> > > > Fixes?
> > >
> > > This has always been like that.
> > >
> > > > Reported?
> > >
> > > I mean, technically Mark Brown reported my previous patch failing but
> > > I don't think we do this if we're still within the same series just
> > > another iteration?
> > >
> > > > Closes?
> > >
> > > Ditto.
> >
> > I meant that this fixes a potential issue disregard to your series, right?
> 
> No, as long as the imx driver keeps putting stuff into the pin
> function radix tree directly, this cannot happen. The issue was
> triggered by the discrepancy between the number of added selectors and
> the hardcoded number of functions (we started at 0 which was not in
> the radix tree and crashed before we got to 1).

Ah, thanks for the explanation. The problem is that current commit message
implies a (potential) but lurking somewhere (regardless IMX case). Can you
amend it to make more explicit that there is no bug right now.

-- 
With Best Regards,
Andy Shevchenko



