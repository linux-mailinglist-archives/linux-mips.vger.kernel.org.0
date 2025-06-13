Return-Path: <linux-mips+bounces-9285-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAAAD8C85
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 14:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A361F3B9590
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 12:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEF01BC5C;
	Fri, 13 Jun 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EY6TI2uW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A517993;
	Fri, 13 Jun 2025 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819004; cv=none; b=K0M/oWQa4Z8BUdRJ/ri3h01IaWisYQqjSMUzNFabkTzETsBeraFiHAml713/jPP0SGqvKSAUYPCzTRoHHkAFtwt79UPKAlMjiqVXr1Vlnfqa3MLRbrQpruFWclIni8xK4SJGlgbRkFveipr1aTGo4z2GGjx9MM6C1wvmiG9zLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819004; c=relaxed/simple;
	bh=VVooEnK9D5zFZcWpktrHIi7OoxMG0j0/XqgYzhRo5us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAUsxvy2b4iu2poW/w58xxgphTsy5VvC3Umwerp0XtD5/fq2VylQj+7M3xaVMNp+iiVSe9Ux4Rbr8yOH0hZksS7sFq2FnFG0skd/hFjHrDSTfhLQ/v0rnmMSDPQQ3/G1WNSPx6bwLvoOvcyYWVhF/dyfKIHDWUO4/KY548Q3A4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EY6TI2uW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749819002; x=1781355002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VVooEnK9D5zFZcWpktrHIi7OoxMG0j0/XqgYzhRo5us=;
  b=EY6TI2uWUxTYt6iKfuc+glYtrfk+clkWkqVPgxsuhOy/5OUlBIX83VN+
   aLYb8ZqlIlLogvryDVBN3DbveXAAlWdYsucaEt1s0ufp7xracFWHxYQcZ
   S1DGxnpL6TwqInnA0Sw+nPGxcbEepwveaxlkVaMbfgbis2Y97SF0Ifhge
   04Ezl9VVj7NtIFgNYOkwcV93D2bqHdPPaXF9qu8BloFIHWwVy1no7TO2Q
   RJELHgjxbMycTj53InqdTbhRXlNtsR14c+MnzFZUJeuf1EIdezcqlrucx
   3SjehOy5xgv4voTepGTCkihxgY2acnyQHvzz4IVv5oN4t+aKzgxheFMU3
   g==;
X-CSE-ConnectionGUID: nBI3pMbcTEidJ87k7QI2vQ==
X-CSE-MsgGUID: dq/3f7+qSgmHLNUAXKn7DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52127910"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="52127910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:50:01 -0700
X-CSE-ConnectionGUID: w5SFzDZDQCOlcZkDfOiPCg==
X-CSE-MsgGUID: fVwc4owzTxSsyWDP1NAQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147705011"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:49:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uQ3r4-00000006FQ6-1BGv;
	Fri, 13 Jun 2025 15:49:58 +0300
Date: Fri, 13 Jun 2025 15:49:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEwedl1hxfWfmnmV@smile.fi.intel.com>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
 <CAOLZvyGTRvBnpqVVWB8c2uukk0jVRar=DU_ndS+gxXvxfcM7bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOLZvyGTRvBnpqVVWB8c2uukk0jVRar=DU_ndS+gxXvxfcM7bg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 01:29:43PM +0200, Manuel Lauss wrote:
> On Fri, Jun 13, 2025 at 12:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > +Cc: Bart.
> >
> > On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:
> > > The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> > > This seems to be a leftover for a 5 years.
> >
> > Any comments on this, please?
> 
> This is fine with me!

Formal tag, please?

-- 
With Best Regards,
Andy Shevchenko



