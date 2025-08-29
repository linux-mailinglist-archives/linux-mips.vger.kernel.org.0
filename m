Return-Path: <linux-mips+bounces-10805-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD741B3B8C4
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6729C5E8426
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11DC30BB8A;
	Fri, 29 Aug 2025 10:31:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B7E309DA5;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463484; cv=none; b=gkCmncENc8uI7CXeV20Wq1xC0q/jDnP4pKjcKXxI0iabzG3qcW1LHGT+ZrNDjB5uf+Bh9LSgos42Civ9yr3Ge2JPehCI6Gw6mLp1vegKRZgCGWzSlJQKynwc7niPFrih+oGRLMIQlF60S4G1xyH1g/aKIv5Hju9B1Md/6ATESZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463484; c=relaxed/simple;
	bh=7plASZAYid0OW1+WabE17O9wn/eOweohKuNlfy/AVvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6+zWLRztNnI8OO3rYKoZEkCXmdOw2ShRPbq+0AezpVggp4WZdhOkH+GMXN/tDAew9KtVT9don61Poxh4Xh4qciOMGWk5/mZnAVTCpU+eqtblO2cX3YUobK/bNQiq2rQZlyPtB2pFQ/DRKSZzu08PriMI/widz/pWh2GJR4AkQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004Ga-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EFB10C0EEC; Fri, 29 Aug 2025 12:27:36 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:27:36 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Replace deprecated strcpy() with
 strscpy_pad()
Message-ID: <aLGAmDgmfqaSOvaB@alpha.franken.de>
References: <20250819102319.711935-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819102319.711935-2-thorsten.blum@linux.dev>

On Tue, Aug 19, 2025 at 12:23:19PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy_pad() instead.
> 
> strscpy_pad() already copies the source strings and zero-pads the tail
> of the destination buffers, making the explicit initializations to zero
> redundant. Remove them to ensure the buffers are only written to once.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/loongson64/boardinfo.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/loongson64/boardinfo.c b/arch/mips/loongson64/boardinfo.c
> index 8bb275c93ac0..827ab94b98b3 100644
> --- a/arch/mips/loongson64/boardinfo.c
> +++ b/arch/mips/loongson64/boardinfo.c
> @@ -1,17 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/kobject.h>
> +#include <linux/string.h>
>  #include <boot_param.h>
>  
>  static ssize_t boardinfo_show(struct kobject *kobj,
>  			      struct kobj_attribute *attr, char *buf)
>  {
> -	char board_manufacturer[64] = {0};
> +	char board_manufacturer[64];
>  	char *tmp_board_manufacturer = board_manufacturer;
> -	char bios_vendor[64] = {0};
> +	char bios_vendor[64];
>  	char *tmp_bios_vendor = bios_vendor;
>  
> -	strcpy(board_manufacturer, eboard->name);
> -	strcpy(bios_vendor, einter->description);
> +	strscpy_pad(board_manufacturer, eboard->name);
> +	strscpy_pad(bios_vendor, einter->description);
>  
>  	return sprintf(buf,
>  		       "Board Info\n"
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

