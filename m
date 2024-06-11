Return-Path: <linux-mips+bounces-3587-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234F903E80
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 16:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA40128B27B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ECA17D8BE;
	Tue, 11 Jun 2024 14:15:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3264C17D8A1;
	Tue, 11 Jun 2024 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718115303; cv=none; b=OEpz4o94Fr7GC7fCq0Gv4y0cYmkq8EpHddjTsr55wiUPFoedYWe01MCa8Q+SG149iYlIkvhK0avEzpJcjp1EQTO/bFmNn5onkKd1MWH5Jon0t5Q9lj9RuUbTjoNB/WFf6El0T1D18ttrew+mV0UkwMNobaSEc7JR3EFKw5KJjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718115303; c=relaxed/simple;
	bh=S7HvbhMJrqKrjrCA9+q8Ja1NL2gugbk9fO8O7O/IQB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIBgf0RLeaG9KvVfeNTxX3WkwrssB64a+ElXDW/FmMwu13+Nm23NeP89FvhRupkuWf0pd3XXQCf9ohuVl3OdWpTlVCDWucLOlzSLCFa+PfMGjWJB3XP7DeiLG8s1ZmbRZJTJBjKfDdMa2Etw28TsYLtMTxGQqao/0oF+BvfVbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH2Gu-00034G-00; Tue, 11 Jun 2024 16:14:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DBE9AC0120; Tue, 11 Jun 2024 16:12:18 +0200 (CEST)
Date: Tue, 11 Jun 2024 16:12:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Martin Schiller <ms@dev.tdt.de>
Cc: hauke@hauke-m.de, dmitry.torokhov@gmail.com, rdunlap@infradead.org,
	robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <ZmhbQgXxyhZ7shBh@alpha.franken.de>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607090400.1816612-1-ms@dev.tdt.de>

On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
> Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") not
> only switched to the gpiod API, but also inverted / changed the polarity
> of the GPIO.
> 
> According to the PCI specification, the RST# pin is an active-low
> signal. However, most of the device trees that have been widely used for
> a long time (mainly in the openWrt project) define this GPIO as
> active-high and the old driver code inverted the signal internally.
> 
> Apparently there are actually boards where the reset gpio must be
> operated inverted. For this reason, we cannot use the GPIOD_OUT_LOW/HIGH
> flag for initialization. Instead, we must explicitly set the gpio to
> value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
> may have been set.
> 
> In order to remain compatible with all these existing device trees, we
> should therefore keep the logic as it was before the commit.
> 
> Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Schiller <ms@dev.tdt.de>
> ---
>  arch/mips/pci/pci-lantiq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

