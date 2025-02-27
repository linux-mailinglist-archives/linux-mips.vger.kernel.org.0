Return-Path: <linux-mips+bounces-8013-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E352CA479C0
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4EF13A1C2D
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 10:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A82E22A4D6;
	Thu, 27 Feb 2025 10:04:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCF821B9EE;
	Thu, 27 Feb 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650684; cv=none; b=nSFQK9QTggNbrmjcoCs9HGpzvmVbYuvY/1VneZmUPOQN4ZTq4GKGQK1lUsRDrSQjkgXVDEorrqnFRv5fDANrSjdEwkRwJV01gXj0+CFZoxB2LzK9UFq2hGds4qGzmQpxn8a0mZC8knJPGstMFKJT3pHZU1nACNzQ/YzIM7/PQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650684; c=relaxed/simple;
	bh=cuAnZJrmKQ+otBs+gYixXb6DpO7Z6ef3tS3CsIpqqQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5Uwu8VW1L1mKrbQ3d2sxR7iFuYCuMeMi2crDYHVfPeGw7ds9zHhNQKLlDeNmNJnpeKEw75T0IrlPUeWSYwrv3igMOiKe3ewLxVZJzFezwbn63l0GjXuBXcnLR3BiKxtUMpfXbUY9Ah/4meiA/cCaOV5GUXcaCHj/7OL3W+ABes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tnakv-0007xg-00; Thu, 27 Feb 2025 11:04:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C0CCCC043C; Thu, 27 Feb 2025 11:03:32 +0100 (CET)
Date: Thu, 27 Feb 2025 11:03:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, harveyhuntnexus@gmail.com,
	devicetree@vger.kernel.org, yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mips: dts: ralink: mt7628a: update system controller
 node and its consumers
Message-ID: <Z8A4dGWgGn39S0Ek@alpha.franken.de>
References: <20250224053411.924015-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224053411.924015-1-sergio.paracuellos@gmail.com>

On Mon, Feb 24, 2025 at 06:34:11AM +0100, Sergio Paracuellos wrote:
> Current MT7628A device tree file system controller node is wrong since it is
> not matching bindings. Hence, update it to match current bindings updating
> it also to use new introduced clock constants.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Hi Thomas,
> 
> This is the missing patch to be applied in the series [0] because of some
> build errors.
> 
> Changes in v4:
> - update syntax in mail file from /include/ to #include.
> - Fix build errors in 'usb-phy' node.
> 
> Thanks a lot.
> 
> Best regards,
>     Sergio Paracuellos
> 
> [0]: https://lore.kernel.org/linux-mips/CAMhs-H-8N766PMZMwmV8B3e=65pPZHA4ntnRWDMoqR-U_xULfA@mail.gmail.com/T/#mab23157e03609456bb59d3b5dfc71fe16359a419
> 
>  .../ralink/gardena_smart_gateway_mt7688.dts   |  2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi        | 40 ++++++++++++-------
>  arch/mips/boot/dts/ralink/omega2p.dts         |  2 +-
>  3 files changed, 27 insertions(+), 17 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

