Return-Path: <linux-mips+bounces-10989-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8786DB41DC2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 13:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17D3E7AFF28
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 11:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D982FCBF5;
	Wed,  3 Sep 2025 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKny0KDG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB932FB991;
	Wed,  3 Sep 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900339; cv=none; b=dgSn4QTA17qKAgNK6Ff9WBcJe151gkhGSrp7AJTU9YUymjMID7HvDzpPHpiwVV+kBdwiyPzdkzvE4gwFSZze88lglXzB1hcuCTG5Ozr1PeeE8e9XizrT+RtxZf+8n7WwyFQwOxvEgvN7c1m32gADL3XUKZRNVH4knt3iDg1P9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900339; c=relaxed/simple;
	bh=rCkMsvnUjuBn7HONdhIgvsPhXdCF7ZF1EijdEX8RKxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuIVgkZAZYV30zfzqoWI62EY7I0e95zcUCOsyYphIxhdNJ9Cv8OKMu2cTCeVLtTNSkQgmhpQ3jXpI4r6wf7Rocks9bNw15QHy14Imo+d1U327HIiZpkdT4xLEdD40kVsW4jhx+huTUtbnAQ2mHFDBe26yF1OUj16tooIaImaEyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKny0KDG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756900338; x=1788436338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rCkMsvnUjuBn7HONdhIgvsPhXdCF7ZF1EijdEX8RKxc=;
  b=kKny0KDGjeWU6AUNiIgDwk82a849XrXLFERs7ASz2e3leJApksTDR90g
   WwUNd2l5X5wj/LPeYwqG23/tmTmLJZ0dc40Sx78F5TvUQRFS0fDK8fGhH
   r48wWp8UqXymF4xEnUkgneo2wXvhbfVEozq+l5zfCxVNJAYZpq/43FEM1
   aUD1AEDPRzBTXsDCwo6A7QDFR1eYUK0Yrtu25eQqfpTvAmgrwsEac6JIW
   uo1x4I1SBcNSnjw0WAZMEVhChLkVfdKHyapK6Jvv931o6ETC6pZupB0In
   QzWiE+cy+LScvIKKamERBPVwLAuzpn108fw2ngEBCbPIwAqkYPnCWxBnf
   A==;
X-CSE-ConnectionGUID: fK0acRAMR8e0M49SUYYmIQ==
X-CSE-MsgGUID: bS88Lc6oR9+erFmyDuLzkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63043870"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63043870"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:52:17 -0700
X-CSE-ConnectionGUID: LSXzFaryTGiV559A8n4EkQ==
X-CSE-MsgGUID: vvcyrhQPS3KYbuchLY9f0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="176849676"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:52:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utm1v-0000000AyQf-39cY;
	Wed, 03 Sep 2025 14:51:59 +0300
Date: Wed, 3 Sep 2025 14:51:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
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
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <aLgr30rvGBCcsOWa@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 03, 2025 at 12:18:18AM +0200, Linus Walleij wrote:
> On Tue, Sep 2, 2025 at 1:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> > other platforms as well) where we mux a pin to "gpio" function using the
> > `pinctrl-X` property in order to configure bias or drive-strength and
> > then access it using the gpiod API. This makes it impossible to mark the
> > pin controller module as "strict".
> >
> > This series proposes to introduce a concept of a sub-category of
> > pinfunctions: GPIO functions where the above is not true and the pin
> > muxed as a GPIO can still be accessed via the GPIO consumer API even for
> > strict pinmuxers.
> 
> This is what I want for pin control, and fixes an ages old issue
> that pin control has no intrinsic awareness of if a pin is muxed
> to a function providing GPIO.
> So patches applied!

No objections, let's move on.

> Any remaining code nitpicks can be fixed in-tree, I need this
> to be able to apply the much desired Broadcom STB driver,
> so this needs to go into -next now for cooking.
> 
> I also want to strictify some drivers using this, bringing GPIO
> function awareness into them, which is a good thing!

Well said!

-- 
With Best Regards,
Andy Shevchenko



