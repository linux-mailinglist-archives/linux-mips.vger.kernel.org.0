Return-Path: <linux-mips+bounces-3312-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651308CBC99
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 10:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA4F2814F0
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 08:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9087276C61;
	Wed, 22 May 2024 08:03:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6C2182DB;
	Wed, 22 May 2024 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716365038; cv=none; b=Ucv8qcirEl91gx4oSJ0vc89mx/e4VJYYBCfV6I2QFnQjl0iW+IYhX+h4IMDRZZbta5glx/a4R+IDOLFpNGsnjO5WDhmIpEt24isUexbWfpz6wdKqYqhPIkMfixUrVHQedKU1hSZ9VSknQvOLoPUqluJKwBKjb7nvr3d/JtSuL5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716365038; c=relaxed/simple;
	bh=vIdlUTx5hX/0YOhY6TTa1dkzMd8tl1BtTYdzu6Q8I8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fy6WoaI25EOA7x387y5e9sOB9PSezztx6t88wL49qBgurETIq0wIOs/sDUxfZe+Zit3i+DNPVBIcfHThjv139rjsev8ItAdw36PDMziCm8NxLwEsf1VcsVuD+2PhZx27PjizCt6qCjAnndB2PKIJnTYojZ+1fDHSdt0dRQq1QKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1s9gwl-0007gE-00; Wed, 22 May 2024 10:03:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4C2BCC0120; Wed, 22 May 2024 10:03:03 +0200 (CEST)
Date: Wed, 22 May 2024 10:03:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
Message-ID: <Zk2mt/FsgltvhVzf@alpha.franken.de>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
 <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
 <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com>

On Wed, May 22, 2024 at 08:15:22AM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年5月15日五月 下午10:28，Jiaxun Yang写道：
> [...]
> >
> > A gentle ping.
> >
> > Our reviewing capacity is quite low recently, hope everything is fine
> > with Thomas.
> 
> Another gentle-ish ping after 6.10 merge window.
> 
> This series has been floating here for so long, if I missed the merge
> window, I think I deserve a notice.

hmmm, I thought I was clear enough on version 1 of this series.

I don't want an additional printk like debug interface, There is
prom_putchar() and early printk console, which always got me past
any boot issue.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

