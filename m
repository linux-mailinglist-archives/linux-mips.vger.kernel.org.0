Return-Path: <linux-mips+bounces-8361-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C011A70DA9
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 00:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94E0019A0109
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 23:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3761DFDE;
	Tue, 25 Mar 2025 23:33:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A344154430
	for <linux-mips@vger.kernel.org>; Tue, 25 Mar 2025 23:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742945599; cv=none; b=GxIbEHjROMEHtDFCLjb8nmhRuPNGIOQAyEHFGBtDla/0Md0Q9bZnNGqPBxaiZDHFUDld7FIcicB461EOVYs+0Z41VDya3/T/pId6FStEHGVFq8f54AbakVN8yoHPdBtQQqWICX0zD3yCKmbr/AQd6Mx6TNPVPGZMmzYFeJAyCHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742945599; c=relaxed/simple;
	bh=ZnyXvaWG1+Z+ufyN9Dt7pWByS4nkdOscZDj7911wSos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1uhtp2dNQWuG5SzNtwwCyPYtjSRulMNt9wOkCkjfuXifeV/dy/AUuZUi0KYIzV5hmUMzZZa5MuRCXUDekfhDvB9X0x+8J30oal9KyWBDYA8Z/FVpFpR9fuSpKC4/ABMu0Bvmlc5fbi9F9FwjQo0scs+doEdgJimXIuaKUa1GRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1txDlh-0000Vo-00; Wed, 26 Mar 2025 00:33:13 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9E1FBC0397; Tue, 25 Mar 2025 21:38:46 +0100 (CET)
Date: Tue, 25 Mar 2025 21:38:46 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Joris Vaisvila <joey@tinyisr.com>
Cc: harveyhuntnexus@gmail.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: config: omega2+, vocore2: enable CLK_MTMIPS
Message-ID: <Z-MUVny8O-00vZ9D@alpha.franken.de>
References: <20250325200751.2763618-1-joey@tinyisr.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325200751.2763618-1-joey@tinyisr.com>

On Tue, Mar 25, 2025 at 10:07:51PM +0200, Joris Vaisvila wrote:
> This commit enables the CLK_MTMIPS driver for omega2+ and vocore2
> devices. This driver is required for these devices to boot properly.
> Without it, the devices fail to obtain the CPU clock, resulting in a
> kernel panic.
> 
> Signed-off-by: Joris Vaisvila <joey@tinyisr.com>
> ---
>  arch/mips/configs/omega2p_defconfig | 1 +
>  arch/mips/configs/vocore2_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/mips/configs/omega2p_defconfig b/arch/mips/configs/omega2p_defconfig
> index 7c1c1b974d8f..128f9abab7fc 100644
> --- a/arch/mips/configs/omega2p_defconfig
> +++ b/arch/mips/configs/omega2p_defconfig
> @@ -61,6 +61,7 @@ CONFIG_USB=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_MMC=y
> +CONFIG_CLK_MTMIPS=y
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_MEMORY=y
>  CONFIG_PHY_RALINK_USB=y
> diff --git a/arch/mips/configs/vocore2_defconfig b/arch/mips/configs/vocore2_defconfig
> index 7c8ebb1b56da..917967fed45f 100644
> --- a/arch/mips/configs/vocore2_defconfig
> +++ b/arch/mips/configs/vocore2_defconfig
> @@ -61,6 +61,7 @@ CONFIG_USB=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_MMC=y
> +CONFIG_CLK_MTMIPS=y
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_MEMORY=y
>  CONFIG_PHY_RALINK_USB=y
> -- 
> 2.48.1

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

