Return-Path: <linux-mips+bounces-5014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6935595B682
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7017B262C6
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DCF1CC15C;
	Thu, 22 Aug 2024 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VezjcJ6S"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B571CC151;
	Thu, 22 Aug 2024 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333059; cv=none; b=LfmhB1NxfASYJBTxRBZ6WPLquadL1JAesjaPL3zOhM0ClPTgbRpbHpfwMA5EQ8lUuKC7b8rsy7qaGPqwgvNMn7VkpGd8e4ur9gsvbydl5NGBJctdCTLq0xBMXZFEdrjQfTzu+THGrO3BPZqBlh+0SEfNKr5fmYf4qLBdtWtM6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333059; c=relaxed/simple;
	bh=Ifzdw8rZaLUtG4yjgZfU3oaFMdqGu3/9BL4OZPs5jTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umykvL5nmhHl29twOEksTCZbwsQmX5+crxmdDX8ilPUenn/ZuwDZ2WzQeFjPKUtWn+ZfH5dI3rhaACRuP9i/0mwgeME+N8ubT+DuICIMjWycJPjKD0+sxhDW2YNz1OajFFQExsZnT5eq9EXrSyoCn+nRMmaahmCxnuefSjN57ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VezjcJ6S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724333058; x=1755869058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ifzdw8rZaLUtG4yjgZfU3oaFMdqGu3/9BL4OZPs5jTM=;
  b=VezjcJ6SoCjfXvMnbTp6nuaCthl9H4reMo5TJFDAWRCjZtiqBgToBMT/
   MFg1fvXvxUrxBwgcgcgPTNOjOmxBeXwPkhnVH+gVovOahUvd489ha7jOc
   uPFkwQq9nxYEqDtt+/RWyNslFT75uzf8W5XsFZPpJcv40YCH+E0DREXY6
   G7MIiOJ6HloimolbIYh5b1RP8cGEbH/CSyJS672p9sV4OJZvUVYqTTukr
   lejxZe4UoKjT8GIqPyssJKRMzllQi41f+33YlKgJg8dvq8Fibp9bP2We0
   bbJFsg0ANLP/NfUJFMkwlXjUYPhiVF6vd9sIMfq3Dwbd0SVK45EXrFzYh
   w==;
X-CSE-ConnectionGUID: w6Iq4jioQnKBncraYmxkeQ==
X-CSE-MsgGUID: Fz8CJB25R9mrigqNCJTCQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22614258"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22614258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:24:17 -0700
X-CSE-ConnectionGUID: l54lGSTOTjqGjj8UehtWGA==
X-CSE-MsgGUID: 8oVq4/R6Qk+gMwwh54YXQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61596334"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:24:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7nJ-00000000Sif-16vw;
	Thu, 22 Aug 2024 16:24:05 +0300
Date: Thu, 22 Aug 2024 16:24:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Lei Liu <liulei.rjpt@vivo.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 1/8] tty: 8250_ingenic: Use devm_clk_get_enabled() helpers
Message-ID: <Zsc79Y6MURWZdnzU@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-2-liulei.rjpt@vivo.com>
 <09d6a69610ccec161ad8e0f2df64d8264c0a64fe.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09d6a69610ccec161ad8e0f2df64d8264c0a64fe.camel@crapouillou.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 11:40:46AM +0200, Paul Cercueil wrote:
> Le jeudi 22 août 2024 à 11:39 +0800, Lei Liu a écrit :

...

> Not really worth a V2, but if you make a V2, please "return data-
> >line;" directly.

> Acked-by: Paul Cercueil <paul@crapouillou.net>

Despite of this, the series has other small issues that needs to be addressed,
so I would wait for v2.

-- 
With Best Regards,
Andy Shevchenko



