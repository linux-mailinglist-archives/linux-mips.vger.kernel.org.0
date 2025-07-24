Return-Path: <linux-mips+bounces-9919-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E93B1099C
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DA511CE10EF
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5376F2BE627;
	Thu, 24 Jul 2025 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB7bc/Hb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E72BD5B5;
	Thu, 24 Jul 2025 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753357968; cv=none; b=pfDf6WePQgcA82JtYgasubleLI3NyvKc5MGH253/O6ZyS4x8mnKy81iCtGrOZ2Oz+oLUB1aal25wkv5jHEq31+iP1CisYvfgymUXf3h1LAw9tfI0eE3NVWSxg9dAR3TeksQuw93Ueq46Tm6VNPas9wMkle1PUPWaJ35WSd7W9zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753357968; c=relaxed/simple;
	bh=skduPBA0XOiRRFwQNtjlPasZ0GUfqz6drj8febfSOhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kla6PgZuAqxM7OdewCFjajlpdjvaKZnUIYcHC+39UAzZmZRAaYp0oUW8bNkeVGOUOqpgd7swmPDAWL9Oed7JluVS55y0QRmELwEP3/yu9aXEMQa76ogOm01dvkFKp1mfXI9aq9kny3d6hC/8LEGLBxxefZzw9ts1ekm1HEdwMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB7bc/Hb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753357967; x=1784893967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=skduPBA0XOiRRFwQNtjlPasZ0GUfqz6drj8febfSOhY=;
  b=LB7bc/Hbo81gIBp8JKhBQ6KMocGkhnEEyEr21+TdL8b27T1zyZrqeOuo
   y/vvK5nTt2HsMXCq85We0HTQB3P/P0hJWrXEB241r+8neVIMaHPxP710K
   pn6Tkwm14hnBJsSyS/hNU+qDLnmM549B7/ZbdhREuO1kz5G6wVUlm1lUV
   myh0h9IhIQ6bXFpzCyJ20isX/aiWcl9JuO1bIeg1qSMynOSzF8RYsFZgy
   cBYAu3N6CRO+DLORslJBoqoDITmz7KEAO8ROJkKAlt2ZgSUzxsW0tweAA
   2nmAsvI9SjaJxrEsNd1nBOUEqSZfPOM7TscElfUGplh/j78J/vYyNtfOE
   g==;
X-CSE-ConnectionGUID: pgf3WXWBSayHguckRosE8g==
X-CSE-MsgGUID: aM42GNHIRwC6Ju/0gK6tOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59473460"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="59473460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 04:52:46 -0700
X-CSE-ConnectionGUID: gH3texk5RoaLOe2vbIi/aw==
X-CSE-MsgGUID: lF7KjgBaRhmOljQc+wknEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164253907"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 04:52:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ueuUx-00000000Yl0-3pfo;
	Thu, 24 Jul 2025 14:52:31 +0300
Date: Thu, 24 Jul 2025 14:52:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
Message-ID: <aIIef0MDcZiElgN1@smile.fi.intel.com>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
 <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
 <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
 <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 24, 2025 at 12:15:11PM +0100, Lorenzo Stoakes wrote:
> On Thu, Jul 24, 2025 at 01:12:49PM +0200, Andy Shevchenko wrote:
> > On Thu, Jul 24, 2025 at 1:10 PM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > > On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:
> > > > +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
> > >
> > > Please drop extern, it's unnecessary.
> >
> > It's all over the header. This should be done as a precursor patch and
> > I know that usually people push back on doing that. I gave up on this.
> > Kernel is going to rot sooner or later... :-(
> 
> In mm we just update as we go, this is probably the best approach to avoid
> unnecessary churn.

I agree on the idea of eliminating it, but also I agree on the consistency over
redundancy. That's why I prefer to see this done at once for all (in the same
header) than doing one-by-one. And this approach got a lot of pushes back, while
the former even more pushed back on the (in)consistency matters.

-- 
With Best Regards,
Andy Shevchenko



