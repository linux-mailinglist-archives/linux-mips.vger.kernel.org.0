Return-Path: <linux-mips+bounces-9607-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C78AF5876
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739B41619C8
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5584727F736;
	Wed,  2 Jul 2025 13:19:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ECD2798E2;
	Wed,  2 Jul 2025 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462357; cv=none; b=OEOpjqBjEg1XnQ7ggEoKAF+wJmctoJKmt6Hh6Z+pfHF++jL6PKt/7y3eKE5FFebZ6vJXg1LIh8NWED6Fms+rFF7Bx0AcJlVTPvGrqtefiyV4Gq/PX/bwSD1hwfTDnwPfEHBWzkh1d4/0Nh6M4DvxbPcqGoypyRoW1wmA7VzgWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462357; c=relaxed/simple;
	bh=arEQptPdUjy2HeYC99Mis10EzigyLonrqsvdli04Kvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLlvfffYAzDeL9gjkFiI214zpeDltANpa8EBNDJjOQNU9dbIOFcUXvkbfDlF8xUAPJ7kE0cvr+JVxZ3Z0wxJj8aBXR6hn7smfxpIlgUqgnNQJ+2oGoO6pR3qRaxuN4++z9KjY+3GfyeeiXJDPg/D/iTT/TzPcr0GHwOx+awEiW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwaa-00058C-00; Wed, 02 Jul 2025 14:29:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B17E2C09E4; Wed,  2 Jul 2025 14:02:12 +0200 (CEST)
Date: Wed, 2 Jul 2025 14:02:12 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MIPS: ralink: some build fixes
Message-ID: <aGUfxMuvKY_ckBQS@alpha.franken.de>
References: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>

On Wed, Jun 18, 2025 at 11:40:24PM +0800, Shiji Yang wrote:
> This patch series fixes some MIPS Ralink platform compilation issues
> founded on the OpenWrt distribution 6.12 kernel[1].
> 
> [1] https://github.com/openwrt/openwrt/pull/18654
> 
> Mieczyslaw Nalewaj (2):
>   MIPS: ralink: add missing header include
>   MIPS: pci-rt2880: make pcibios_init() static
> 
>  arch/mips/pci/pci-rt2880.c | 2 +-
>  arch/mips/ralink/irq.c     | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

