Return-Path: <linux-mips+bounces-7883-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16295A3F06C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 10:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E7B3A825A
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 09:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCE4202F8F;
	Fri, 21 Feb 2025 09:34:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423A5201017;
	Fri, 21 Feb 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130471; cv=none; b=p5y9wQIr183QUJylmyrfxW7KrCz+VxwhjJg6Ak59ahu1hlWseO1Qqbe0xDaqwMl9Vpr2uM0DiqDncBtcKYWAQ6FIC4j4VgcvxtpbtMIgXchFbbZ3WzSAY2qwJ3xdYQnuMHHRr1k0tkZrhSczL9cNT8fA/pKtuxFJ+DIUoSEfcEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130471; c=relaxed/simple;
	bh=9JwsObJ8lf5nxt6dAsnnfVxMbgEvP2OQHW7Q+lNShhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg7YMjZOCL6rohJFrEQl3zAnaFFtcmNwGOVyw2cBD9/THc2xV+94MffuKJPchXJLVZtUiAWXPFoklknjiMS6RqK9ZQy6lM0PC/2eHXsW6C2TmPGitXm46/V6P5MFzHL+jWm9W6ylYy/2AuK4mTA3CUGC0z8MdVx8BKfmv57emd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlPQJ-0006BX-00; Fri, 21 Feb 2025 10:34:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E2AF3C03B4; Fri, 21 Feb 2025 10:31:39 +0100 (CET)
Date: Fri, 21 Feb 2025 10:31:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: sni: Do not include <linux/fb.h>
Message-ID: <Z7hH-5EkHvm14e0G@alpha.franken.de>
References: <20250131161859.399573-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131161859.399573-1-tzimmermann@suse.de>

On Fri, Jan 31, 2025 at 05:18:47PM +0100, Thomas Zimmermann wrote:
> The MIPS architecture's source files do not require <linux/fb.h>.
> Remove the include statement.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/mips/sni/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
> index 42fdb939c88d8..03cb699372580 100644
> --- a/arch/mips/sni/setup.c
> +++ b/arch/mips/sni/setup.c
> @@ -12,7 +12,6 @@
>  #include <linux/init.h>
>  #include <linux/export.h>
>  #include <linux/console.h>
> -#include <linux/fb.h>
>  #include <linux/screen_info.h>
>  
>  #ifdef CONFIG_FW_ARC
> -- 
> 2.48.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

