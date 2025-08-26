Return-Path: <linux-mips+bounces-10620-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4254AB36437
	for <lists+linux-mips@lfdr.de>; Tue, 26 Aug 2025 15:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A966E1BC3444
	for <lists+linux-mips@lfdr.de>; Tue, 26 Aug 2025 13:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A6E3019A3;
	Tue, 26 Aug 2025 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1UNRZ3G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DC2FC870;
	Tue, 26 Aug 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756214943; cv=none; b=u/y4WqKv7XLONbVqDYhkYvV8rOg/7PzL9PG2pwPnTEe7O1ozGyknLGZfDXRgSas8l9RSCK7sFzvgU45VtG8N6LafSiSVCv9QEv2DHBILG0P65a7MVzKlx065GUtU1UWC9aR96wUZtlvi5OvmAWisRFt/63VzRG3EGydKrifbmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756214943; c=relaxed/simple;
	bh=WONqwahE1t7tG5WMekP4ROtP2MyOMiDAgeptG1B8c8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lploF48lp9sPxoOKG16xmtPhNIWwi2kt+e+WZEi/zlAlxF+jN5Geu6w1nrmHmnZ67Bd535t3YlrffKNmzlPc1Oq1IAnSbvknZsFeOsVg2J00+i3ZN6o+9v+4UuIzAuvzZdn4GJHyyiXkNZFFQ/BXacw7ocPUPWAwxUerBayvqFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1UNRZ3G; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756214942; x=1787750942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WONqwahE1t7tG5WMekP4ROtP2MyOMiDAgeptG1B8c8o=;
  b=O1UNRZ3GyLduNWTUh2VNNDsL/t8ugLRojJh9ACrB5lSAFx1pUoaG5Bdw
   VoNOQRVJgcUDYvB977oUiGgUbI2wA4TQF+i3F5QmGhNi2ofvglaXVaU7u
   wLiBLd5RtnuwwzpIW0QuAl+42QE1pSIuDNV6TcczeBvFHVjjmjVegW7ve
   +y0/iSZguAR8RLqsPUBh9YOVqpMqI0vZkeNkSCBMf/A6wDOZ+N9Bhefm6
   x8/4X/qdYVE+Fb8FDzj7POlu0gJZLmhezVRJvmIufgcg3M+0GQnw7umgf
   QRGSGuJNReK/zTmUPZuPBFV1k7yvY5DFuX0MllCBoq6/4f4zUm5PkXSCy
   Q==;
X-CSE-ConnectionGUID: Lz6IfiNEQh+KIFFDQJzPWw==
X-CSE-MsgGUID: 2JOhRU85RgCO5c6dQAMTPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57649656"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57649656"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:29:01 -0700
X-CSE-ConnectionGUID: yZ/HNeJPSH+ByFL3yfAtLw==
X-CSE-MsgGUID: 3/+Gz3kfTi6VujhV0pZ9kw==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:28:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqtjF-00000008mqQ-2YXp;
	Tue, 26 Aug 2025 16:28:49 +0300
Date: Tue, 26 Aug 2025 16:28:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-ID: <aK22kUhlxlyvVLax@smile.fi.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> > There are a few places in architecture code for the floppy driver
> > that may be cleaned up. Do it so.
> > 
> > Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> > 
> > Changelog v2:
> > - combined separate patches sent earlier into a series
> > - added tags (Helge, Geert)
> > - fixed typo in the commit message (Geert)

[...]

> Applied, thanks!

Ah, thanks! It's good to know you can take (and actually did that) them.

> [1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
>       commit: d74968780bf287958e2815be5f088dd6c7b7aa19
> [2/3] floppy: Replace custom SZ_64K constant
>       commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
> [3/3] floppy: Sort headers alphabetically
>       commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

-- 
With Best Regards,
Andy Shevchenko



