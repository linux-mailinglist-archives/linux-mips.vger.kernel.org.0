Return-Path: <linux-mips+bounces-12477-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B38CBF39D
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 18:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04C58302D295
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1D72C0F9A;
	Mon, 15 Dec 2025 17:18:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7FB30DD22;
	Mon, 15 Dec 2025 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765819120; cv=none; b=U0fOTSU1xeUkx7s3svLt+7e7KSW2eeLXQqpTahBZHlS5iUxFne4eZ9v73osOvTuVJ3AlnvFT7s4iStFo/dSl6Sl4aysRat65zgap9KMS8doUDt+ZqCqGWiylfYOq4/u24vcH2cOUNJ0Lz5SEILCM1F+YKKVKvZC17TwcbjTtyB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765819120; c=relaxed/simple;
	bh=db2VVQs3dRMlF7Uetw6hK9XZa6LQ54LWidtipvEMZp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHoqGPBB39koReObj+aNDJy4+hZ3kJ0ezC8qQ1PAg7QsaMvUy9oWb2eCNJ78CnXBiJfuVtTTJR7jY1pRyw5TnThOm8ksw8VbJ0P/kGsVkD8Oi7ZgsDBaCtvWFxGrBXfW/en5dyC4lYeLr+5FRX2BMvV/FfhGaOZCqiA4N+u7YRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vVCDP-0007vy-00; Mon, 15 Dec 2025 18:18:31 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 56755C06A7; Mon, 15 Dec 2025 18:17:37 +0100 (CET)
Date: Mon, 15 Dec 2025 18:17:37 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: FlorianSchandinat@gmx.de, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix a reference leak bug in ip22_check_gio()
Message-ID: <aUBCsTeplCT6oNO-@alpha.franken.de>
References: <20251204103618.89502-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204103618.89502-1-haoxiang_li2024@163.com>

On Thu, Dec 04, 2025 at 06:36:18PM +0800, Haoxiang Li wrote:
> If gio_device_register fails, gio_dev_put() is required to
> drop the gio_dev device reference.
> 
> Fixes: e84de0c61905 ("MIPS: GIO bus support for SGI IP22/28")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  arch/mips/sgi-ip22/ip22-gio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
> index 5893ea4e382c..19b70928d6dc 100644
> --- a/arch/mips/sgi-ip22/ip22-gio.c
> +++ b/arch/mips/sgi-ip22/ip22-gio.c
> @@ -372,7 +372,8 @@ static void ip22_check_gio(int slotno, unsigned long addr, int irq)
>  		gio_dev->resource.flags = IORESOURCE_MEM;
>  		gio_dev->irq = irq;
>  		dev_set_name(&gio_dev->dev, "%d", slotno);
> -		gio_device_register(gio_dev);
> +		if (gio_device_register(gio_dev))
> +			gio_dev_put(gio_dev);
>  	} else
>  		printk(KERN_INFO "GIO: slot %d : Empty\n", slotno);
>  }
> -- 
> 2.25.1

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

