Return-Path: <linux-mips+bounces-4135-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3529276F7
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 15:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132901F24E8D
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 13:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAE927452;
	Thu,  4 Jul 2024 13:15:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1971ABCD6;
	Thu,  4 Jul 2024 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098916; cv=none; b=kPg/ucvxa6SoMGyLH5GlNBdS/yMYcCn6hwXyb3pf0kwTSb0RQZKaSsUL0KFx6TEhbkTNm2BaBuNKUQ9xE0syPzlnCcoMQ+35rjCqtxPKaGc2snWiIJfN3nn83gfMnRGXvQ4rlhujjhMnKiNTNCmRvLEl3QjhmBZ8JiAvFoOp2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098916; c=relaxed/simple;
	bh=Q/JhbQbqOX1FvIWnsq0qQq2hBFxOM73aUCyVvrP5e8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bASa//scIYZqDTyy9BaLKCqyCGqA6b39FEexZLET5wrptDePG8VI15ySDWnay2MCqJbLcTco3CsMTuEMeTt9xkBql05NtvuoBc4lwkhO+YQi1D45jB+sJ+wURx2M5SHmwHgRw2zt7yM1MRY69/I+QqGo5MX9yuGMF/20IcVijXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sPMIZ-0002xd-00; Thu, 04 Jul 2024 15:14:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EEE98C0120; Thu,  4 Jul 2024 15:05:21 +0200 (CEST)
Date: Thu, 4 Jul 2024 15:05:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Message-ID: <ZoaeEYdEmEBl6R7J@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-2-e332687f1692@flygoat.com>
 <ZoVoUabfZiiAXWKR@alpha.franken.de>
 <fdedcd38-4688-4938-9184-2eaa5dedeb43@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdedcd38-4688-4938-9184-2eaa5dedeb43@app.fastmail.com>

On Thu, Jul 04, 2024 at 04:08:09AM +0800, Jiaxun Yang wrote:
> 
> 
> 在2024年7月3日七月 下午11:03，Thomas Bogendoerfer写道：
> [...]
> >
> > there is no user of mips_smp_ipi_disable() (at least I didn't see one),
> > so do we need this patch at all ? Just looking like ARM or RiscV isn't
> > a justification for code churn.
> 
> Hi Thomas,
> 
> The per-cpu enablement process is necessary for IPI_MUX and
> my upcoming IPI driver.
> 
> The disablement, I'm not really sure, maybe it's a good idea to call it at
> platform's __cpu_disable to prevent spurious IPI after IRQ migration.

don't add dead code, so drop mips_smp_ipi_disable() for now.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

