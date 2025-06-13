Return-Path: <linux-mips+bounces-9277-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF93AD899A
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 12:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC113B549D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 10:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DB42989BA;
	Fri, 13 Jun 2025 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISfiiyr2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834825B30C;
	Fri, 13 Jun 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811153; cv=none; b=J2CKboSAzoKohBM6ovL1hSoJEUvsxY7vXnMNL/Kpt06EVSgYlBbZTchMxATu6s2oACB37MSyOlCQfM89Anf3G7jjf+BnrI2AWrXqMU3TerYImHOiyMqxIsXedNgH7yjr8UhLcl5rPtEOoEuUmZaQNtwcTZE9je1LjqSNIdG6kng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811153; c=relaxed/simple;
	bh=lTnmuJ4Zw3G9dBvu7NKjvEJCyXHzKDQ65nEqpiNtDFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY5OIvqZg3QXWZWVJ+Kqxqm44tukEUjHOBvygeU6q/RIA24A6LSg9QMdiOOv2YZYvMCBkRdQpSQpGnF5Da50+7bKK9kOZvF4JULTKkWxN/TRrl0Gs/V0RLd+WCgkzk1/ZrmwdCXflyTmfb3m66DEVJYLYgegpDlUsuesstlaEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISfiiyr2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749811152; x=1781347152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lTnmuJ4Zw3G9dBvu7NKjvEJCyXHzKDQ65nEqpiNtDFo=;
  b=ISfiiyr2K+jMxxDWgM+dxw9NOjBxUPzwe+CgNrH5OuKFMhuNDOE2Ks0D
   9zVpqWBR/cjCDbLFIIDZdXHIb74Ju5QiIFNrfcSTuBSR1deRe8CUNFEUs
   v3PHG+vroJWXRZmD7RLcwGzthePlAIGiU+T5hmxyx8UVis+ruOhjjrQRC
   oJOZaPhL2MWVyuWe24YXaN1lYvdb6tm9zQvaXN/ksR3thP3tfQ6uSLwvi
   XVPTC8ehz4zvadBt4m53fI43Cr65Bxmbzv4qVg06/eAcHpSNBWjb9YI4s
   OUGqL614yxXEy+qtXY8Rm0Gvm1WppmYdF1T3VfZo6zWQVRcN2mvIlx6Al
   A==;
X-CSE-ConnectionGUID: beQ8ftboT4aRlwvmqmDqew==
X-CSE-MsgGUID: 6LtwW3ypQ6eN2MoLlbsZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63375282"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="63375282"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:39:11 -0700
X-CSE-ConnectionGUID: rEJYELCnQN2xerUUmvLz7g==
X-CSE-MsgGUID: RmyrZvILRR6G+bZEy6+kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148681207"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:39:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uQ1oR-00000006DOa-32d4;
	Fri, 13 Jun 2025 13:39:07 +0300
Date: Fri, 13 Jun 2025 13:39:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+Cc: Bart.

On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:
> The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> This seems to be a leftover for a 5 years.

Any comments on this, please?

It prevents us from moving forward with the killing the GPIO legacy APIs
(it's not critical at all in this case, just an inconvenience for a `grep`,
but still...).

I think we can take it via GPIO tree if there is no reply.

-- 
With Best Regards,
Andy Shevchenko



