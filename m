Return-Path: <linux-mips+bounces-9474-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE8AE67B5
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 16:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D144C7CC7
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 14:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3766127C16A;
	Tue, 24 Jun 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFg/HG1h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337427AC25;
	Tue, 24 Jun 2025 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773716; cv=none; b=n4tE2T3FbdzqDZae7ywTH0ltgTgmQt6kmwGJeIHdgeo55r5TTbgOefDSB1aH9QBq+9sOg+UdkyYzSY71x+oM4+yYxIqTgMnTLT15Mt9toRTRJl+r5uqnMAyJnXLY4S6EMcmj6PmVAzntMRPqAiwv+gBJUER+CopYgze7I4oMfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773716; c=relaxed/simple;
	bh=qe/lKzDIKQb9yrByvn2o2OiLeZ837IOlRXcF3CcOVxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ykg+VvU8/J8SP+A1P4zld+0MA6BXCfkYflkC2s+ihJEzrI2x9ao7G/EYq1TS0qVL4rbPdF9V5H/IKtP9X3mEEqDWH4FVYbPRmiNMefMEnL9x55OKmCUubvPSBM54rXVgWKK4Nz6foj4FwyZIPrxysRdfAZxYlnnjDohNvz3gjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFg/HG1h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750773714; x=1782309714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qe/lKzDIKQb9yrByvn2o2OiLeZ837IOlRXcF3CcOVxY=;
  b=OFg/HG1hvZ6L4XxcdKofaXr5E3+wuY5PNS6t6tjxB8qmZnnTbWs9cTRZ
   YFNh/obsPCVggJ8+jY52SqXIeG5w+NRlPZDT4xx4YlnyMUkS/UQLymqOT
   6eQgKYrhND2yv9ZrGQ4TZ9dl4idQa47J8OJ8vc1xtONmxWXnDgkzZb/Mf
   cR3Aa92cWpbYIKrbQu+84lgpyYrAiOM0o3cIvpX8Uzj0GraFfHu11QqNz
   5C1Kj3nZkNXNtmwr1Carw4yDo9BECnGi88fCxZyfcWNY26Jdj0LPpujOT
   sr/go9jS2NCIam/sfEytZKE9QZ2Ia6xndbUCi8MksiUAefvfMkVAOjQWu
   Q==;
X-CSE-ConnectionGUID: EcylcUW5RgS7FD3D4eoctA==
X-CSE-MsgGUID: eYtG+Z2TQx6A3f+wAlnx3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40628397"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="40628397"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:01:50 -0700
X-CSE-ConnectionGUID: NcaZkpcHSr6VkMpll0qrAQ==
X-CSE-MsgGUID: 9v/ZDIeDRXS0b/f/E5hikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152450367"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:01:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uU4DI-00000009UFW-2HG9;
	Tue, 24 Jun 2025 17:01:28 +0300
Date: Tue, 24 Jun 2025 17:01:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aFqvuIzH2zo5X76q@smile.fi.intel.com>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
 <aEwMFVSPzc-mV1ve@alpha.franken.de>
 <aEweZReuPzQ_hq8L@smile.fi.intel.com>
 <aEwy2Ud08nHHAdED@alpha.franken.de>
 <aEydkh4EkKu6w2NJ@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEydkh4EkKu6w2NJ@surfacebook.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 14, 2025 at 12:52:18AM +0300, Andy Shevchenko wrote:
> Fri, Jun 13, 2025 at 04:16:57PM +0200, Thomas Bogendoerfer kirjoitti:
> > On Fri, Jun 13, 2025 at 03:49:41PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 13, 2025 at 01:31:33PM +0200, Thomas Bogendoerfer wrote:
> > > > On Fri, Jun 13, 2025 at 01:39:07PM +0300, Andy Shevchenko wrote:
> > > > > On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:

...

> > > > > I think we can take it via GPIO tree if there is no reply.
> > > > 
> > > > please do
> > > 
> > > Acked-by?
> > 
> > Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Thank you! Bart, seems we are all set to route this via GPIO tree. Do you have
> any objections?

Bart, can you apply this one, please? Or do you have objections?

-- 
With Best Regards,
Andy Shevchenko



