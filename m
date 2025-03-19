Return-Path: <linux-mips+bounces-8224-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D3A68908
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E3916955B
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96512066C9;
	Wed, 19 Mar 2025 10:04:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEA91E1DE6;
	Wed, 19 Mar 2025 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378696; cv=none; b=H46c9n+BsVWskoeUtJqcPH0igspAgnlOpx5MKiylphY6pFYjgtRl5BoTbXdy/wd8PmuzgFUfbgldaeMRiHPXMprwHeWfVGnXAauayZfmWXAixgNJP0atM+3Y4Dz3l4TTusb0bwJiWR8PysfXPthDgBBLIiXIh3UBlpUazVKduBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378696; c=relaxed/simple;
	bh=AqWl5BebVSgJmBccU42sVn3VYPNi2z9N4/IQUHI7HHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4aE2kU1oj/Np+sCIsOhRTyRFg8b6DC1QI9wbe19RvSkBDMDFp5G4fZUX3Nj9rbtm9gmWl3hX55Z+FQm/wB7OvTf2sW6x71FbjUMc9gwOx85mHWJoyGlDsBLggmW8Qe9/624JxTs25E9v2jUQG8F5lgjk+NSUo687wn7qdq5JJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tupfX-0002zG-00; Wed, 19 Mar 2025 10:24:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B34B4C03B4; Wed, 19 Mar 2025 10:24:36 +0100 (CET)
Date: Wed, 19 Mar 2025 10:24:36 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix Macro name
Message-ID: <Z9qNVEOej1oxevox@alpha.franken.de>
References: <20250227183628.7915-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227183628.7915-1-abhishektamboli9@gmail.com>

On Fri, Feb 28, 2025 at 12:06:28AM +0530, Abhishek Tamboli wrote:
> Add missing underscore in PCI_CFGA_BUS macro definition for consistency.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219744
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  arch/mips/include/asm/mach-rc32434/pci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/mach-rc32434/pci.h b/arch/mips/include/asm/mach-rc32434/pci.h
> index 3eb767c8a4ee..e17ce82d02ba 100644
> --- a/arch/mips/include/asm/mach-rc32434/pci.h
> +++ b/arch/mips/include/asm/mach-rc32434/pci.h
> @@ -167,7 +167,7 @@ struct pci_msu {
>  #define PCI_CFGA_DEV		0x0000f800
>  #define PCI_CFGA_DEV_INTERN	0
>  #define PCI_CFGA_BUS_BIT	16
> -#define PCI CFGA_BUS		0x00ff0000
> +#define PCI_CFGA_BUS		0x00ff0000
>  #define PCI_CFGA_BUS_TYPE0	0
>  #define PCI_CFGA_EN		(1 << 31)
> 
> --
> 2.34.1

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

