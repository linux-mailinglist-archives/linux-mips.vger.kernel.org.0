Return-Path: <linux-mips+bounces-8799-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 845EBA9E12A
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2704A1A82ED0
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B287524EAAB;
	Sun, 27 Apr 2025 08:48:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B60724E4BF;
	Sun, 27 Apr 2025 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743717; cv=none; b=MiVuaOER/sWUegXPcsclElohiot+7/FeoBNgXqhkJFXeb6ixX77GCk6pvdABJPdQMViHsSkcdHaOBU5IpU65GyCUufCyUavUydfDyCBKOuviz8DKLj8xPfTQXCNB2MHwofQDsLl4WBMATxiAUbbM7CDe4kGYUCuPX443YuAbQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743717; c=relaxed/simple;
	bh=6ud6kdL2TO6Kl++W7q0+GLrX/pR5QrTyRl//53T1hTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qtj5sOUohJ8GZi6ppIjQAXwISXTJPX9vmGqjxiajGgbY5uhxG5wwYlJRzLgI9nZ3BwnI+PfKvZlO8jI2cLJq8hI/iePuClJX9nI+Ux96KtqEYAgHycJ7zNlCpEOIBzCyU6y4RdlwhvMVqq2L1pT3i8zpGAvTs6RJW/UYez0Ljic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Kg-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A5064C0A20; Sun, 27 Apr 2025 09:54:09 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:54:09 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sander@svanheule.net, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: dts: realtek: Add MDIO controller
Message-ID: <aA3iofwUsgBpYlTo@alpha.franken.de>
References: <20250415205425.1491165-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415205425.1491165-1-chris.packham@alliedtelesis.co.nz>

On Wed, Apr 16, 2025 at 08:54:25AM +1200, Chris Packham wrote:
> Add a device tree node for the MDIO controller on the RTL9300 chips.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     This was originally part of a series adding the bindings and the
>     driver[1]. These were split off and have now been applied via net-next.
>     That just leaves the dts changes to come in via linux-mips.
>     
>     [1] - https://lore.kernel.org/all/20250227213248.2010986-3-chris.packham@alliedtelesis.co.nz/
> 
>  arch/mips/boot/dts/realtek/rtl930x.dtsi | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

