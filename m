Return-Path: <linux-mips+bounces-8704-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A012A9705E
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 17:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531351787F0
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C2228EA78;
	Tue, 22 Apr 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjAMYbs2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21128F921;
	Tue, 22 Apr 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335126; cv=none; b=gj6bVapaKqSzQdrXIlXMBcQO5Zwzk592ug+4FMQ2LKml2zU2/Ojo7ZsDNRK0WlMEjovk4GHKOWj+7vuMhA71N6frhBFRSPixecxZCxk79pRGW0vqK9SDv4VLly4Ql9o1rF26TWsMk0zDkCRXwlMcBNPYINoHJzKpdryg8yJq06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335126; c=relaxed/simple;
	bh=fJHkOg9IwEJ5mae5qaFbTDQi3x77eIhoKz/zlvFifbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwfGciAEWEu1coqfodEU8Z7/j1EIxBlBDtnzQ1srlHmgDt8XkuzGQcvgGKTamTuUjSylfY4vUAeiVEwfDWjFiAI4nizWiKHaGp02khWnbnPwLpkMpzwZfHZIsViKREWvp9vuzZoyQfkpuPIR32H/exGtY79VuRVW2djWj3hGfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjAMYbs2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745335125; x=1776871125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fJHkOg9IwEJ5mae5qaFbTDQi3x77eIhoKz/zlvFifbk=;
  b=hjAMYbs2EqH4Url77S/0sMLhb/lTbxxD9zn32p0z+1ymj+b5hofixtcj
   xMvgpKmQRkTbY4wi4rYZuQujNfbdaz//Vgq1QobV3pu70nmznV8grXK/5
   425H3a7HhG9HLmYq7CkzrRC/eAhVyln5j9WTFeVbfOZ57pm89cyS+ok4P
   sw03saAwTLsPKx6D4DRL65Em7vhwQ7/O330u5PI9vRY4bBTYw6oBCBDVD
   KXn5pZC75XetlFozxrazp/C3q2EbglpfvVPNrrNOzROf2fV9Lf8u0HL48
   Zg4XKToaOGvknpB2PfldBRV34IdZWn82B1hGstbIXGXghbrxnKeuiKzam
   A==;
X-CSE-ConnectionGUID: 1FvPJUwrT8+lEN0SwRQ03g==
X-CSE-MsgGUID: b2kfG5AQTw2fWxhNRU2j6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="34517617"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="34517617"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:18:44 -0700
X-CSE-ConnectionGUID: WDqx3UnMQ0e2Jo4n8Gv+sQ==
X-CSE-MsgGUID: HgCRN1wvRPy9SPZ1blJ4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="137028123"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:18:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7FOQ-0000000ElMe-2Om9;
	Tue, 22 Apr 2025 18:18:38 +0300
Date: Tue, 22 Apr 2025 18:18:38 +0300
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
Message-ID: <aAezTikHO5W1VHr8@smile.fi.intel.com>
References: <20250422074257.544016-2-thorsten.blum@linux.dev>
 <aAdNVAzu0rmIfGGC@smile.fi.intel.com>
 <86E5AC5D-11BC-4B4E-B08E-845F59AACF6C@linux.dev>
 <aAdsvNKuPd-qPuE4@smile.fi.intel.com>
 <9FB72AC0-3FD6-4D9E-AE26-3EDC39A3025E@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9FB72AC0-3FD6-4D9E-AE26-3EDC39A3025E@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 12:33:48PM +0200, Thorsten Blum wrote:
> On 22. Apr 2025, at 12:17, Andy Shevchenko wrote:
> > On Tue, Apr 22, 2025 at 10:27:33AM +0200, Thorsten Blum wrote:
> >> On 22. Apr 2025, at 10:03, Andy Shevchenko wrote:
> >>> Can you use --cc OR put this line...
> >> 
> >> Yes, will do next time.
> >> 
> >>> Have you compiled this with `make W=1` with recent GCCs?
> >> 
> >> Yes, I compile-tested it with W=1 and mips64-linux-gnu-gcc 14.2.1.
> > 
> > Cool, no warnings?
> 
> No warnings, at least none related to my change or compiling
> board_bcm963xx.c

Thanks for confirming!

-- 
With Best Regards,
Andy Shevchenko



