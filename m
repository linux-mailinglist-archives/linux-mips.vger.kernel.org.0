Return-Path: <linux-mips+bounces-9301-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295CAD97CD
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 23:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 308774A0B7D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 21:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F262265626;
	Fri, 13 Jun 2025 21:53:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA126B748
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 21:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749851621; cv=none; b=M8L6i5AWSLjJDxBWFhBYyX0KPoAH/nn4mx1w8fGRRHSdCJHZyPmTbS6r3Pnft5IzLFD+UpHoJrhsXXAvG7kn5wegLVBzzRXoHlR14Xmc5qkQcSaP1cBUUy41GWynSzIqiYMhIAKlz49vi/HbiOGnit8yuzzNw4qHMjfUHewgYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749851621; c=relaxed/simple;
	bh=pqrsu9Rk23bn+FnyFGlSR9nDXVGagaQEyjCqJLSTHGI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb9WULXNq9n+e01pfKrXtPn0ZjjnDDayKSoSiMjwy6F44saaFQZ/jJkRyZ3nW18WoyGTIwwGEosZ0s+O+sYsY8qNL+VIRJ/ObXw8V+fqoqlax1EK7M/JIKLjepsFcUHgZkgZy6Hhpzi7XurqveCXKn/zywc9OQToH5nYEVac6CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id acff03e0-48a0-11f0-a97f-005056bdfda7;
	Sat, 14 Jun 2025 00:52:18 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Jun 2025 00:52:18 +0300
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aEydkh4EkKu6w2NJ@surfacebook.localdomain>
References: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
 <aEv_y5Lfe3Dul48I@smile.fi.intel.com>
 <aEwMFVSPzc-mV1ve@alpha.franken.de>
 <aEweZReuPzQ_hq8L@smile.fi.intel.com>
 <aEwy2Ud08nHHAdED@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEwy2Ud08nHHAdED@alpha.franken.de>

Fri, Jun 13, 2025 at 04:16:57PM +0200, Thomas Bogendoerfer kirjoitti:
> On Fri, Jun 13, 2025 at 03:49:41PM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 13, 2025 at 01:31:33PM +0200, Thomas Bogendoerfer wrote:
> > > On Fri, Jun 13, 2025 at 01:39:07PM +0300, Andy Shevchenko wrote:
> > > > On Sat, May 31, 2025 at 10:43:46PM +0300, Andy Shevchenko wrote:

...

> > > > I think we can take it via GPIO tree if there is no reply.
> > > 
> > > please do
> > 
> > Acked-by?
> 
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thank you! Bart, seems we are all set to route this via GPIO tree. Do you have
any objections?

-- 
With Best Regards,
Andy Shevchenko



