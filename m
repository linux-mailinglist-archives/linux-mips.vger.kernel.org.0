Return-Path: <linux-mips+bounces-8688-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5495A965A8
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E125117B671
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF37820B806;
	Tue, 22 Apr 2025 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6Tu+Zty"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306461EE008;
	Tue, 22 Apr 2025 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317059; cv=none; b=YTHr7eO4eQ9Ydij6J6HrM19w+CK5GDq3IE00Edi/u7JcV1sA8+2RgYapMghqomLVCJhsuBxqOj/5YvF6RYTEnyY7KRPIYZCnVtHL9WjglBROFlC+JsUwpFU9JiYds+oADlL5lzdPMazucjuIaRix6fgNnNbOUgD0fyIzZnT5ZNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317059; c=relaxed/simple;
	bh=ICn3ej4bYqpepjVRI/bsdzwHSJX/XypuJfJ4hGas654=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHIm09tWrSmxzKuOnn6V/RTd4W/sbAATotaD5+x4JrKvpU6+FrJxFNRdmJXrj4rOp9iyRXxi0dT38cqSkFKpEAoS9V3jmAp7BriGYsRIxA1EEDmWdIvCaQ9DPoBhmfGVkXJMmETf5gPmZiHIDxCHxw3RrREVaEU5e58SlJkaPu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6Tu+Zty; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745317058; x=1776853058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ICn3ej4bYqpepjVRI/bsdzwHSJX/XypuJfJ4hGas654=;
  b=U6Tu+ZtyA9FND2p3yNdnwSB5TzGG6A4UacSTXqAy1F2LvXefoT8AA5RG
   xlMHd9+/4a1Z/c+WUIO2wsrUCU9qtAcSFri3MWa/bI/7sWHgBr96gT9ZE
   56SckPP3g25UMElv+LonmUdXzWgjmuGglU2p49tslgUL8udEed1X3n8Tr
   WHWWgN1nZfAJ3ZbyKfVKCtgo2mdBfHw8GvDjDQI8AUHVUS9JaKCiEbgQX
   +CSJFrYgEG/S9Zs/KLaXVL9aN8W3DpPRZuIiXEN5l1GUCNrAeOMN4HWw0
   4V477I3q4ptj9+pah46Rigj/62+NZ7Uo2vgjxcbUK9rH3XWRlbECHmOSp
   g==;
X-CSE-ConnectionGUID: fT1G4+4YSgasd7zQhjaOcg==
X-CSE-MsgGUID: OKmcZGPTQWe49FCXDpDvHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46749585"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="46749585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:17:37 -0700
X-CSE-ConnectionGUID: Z4imsfK6Q3yLgapJRD6PdA==
X-CSE-MsgGUID: UhWr/HJZSS6ONrcSceSTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="136764804"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:17:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7Ah2-0000000EhKO-453j;
	Tue, 22 Apr 2025 13:17:32 +0300
Date: Tue, 22 Apr 2025 13:17:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63XX: Replace strcpy() with strscpy() in
 board_prom_init()
Message-ID: <aAdsvNKuPd-qPuE4@smile.fi.intel.com>
References: <20250422074257.544016-2-thorsten.blum@linux.dev>
 <aAdNVAzu0rmIfGGC@smile.fi.intel.com>
 <86E5AC5D-11BC-4B4E-B08E-845F59AACF6C@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86E5AC5D-11BC-4B4E-B08E-845F59AACF6C@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 10:27:33AM +0200, Thorsten Blum wrote:
> On 22. Apr 2025, at 10:03, Andy Shevchenko wrote:
> > Can you use --cc OR put this line...
> 
> Yes, will do next time.
> 
> > Have you compiled this with `make W=1` with recent GCCs?
> 
> Yes, I compile-tested it with W=1 and mips64-linux-gnu-gcc 14.2.1.

Cool, no warnings?

-- 
With Best Regards,
Andy Shevchenko



