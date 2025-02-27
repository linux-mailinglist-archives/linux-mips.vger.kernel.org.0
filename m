Return-Path: <linux-mips+bounces-8010-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E3A479BE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE0D188F956
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B6122A1E5;
	Thu, 27 Feb 2025 10:04:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD56224231;
	Thu, 27 Feb 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650683; cv=none; b=r3tL8lSwCpQzJIQdqxjk/FAs0R5TnW2cPlbWh50snKJWqFerM6P8kEfwnI2G7QDmtJTMp465DX1JNg6BloWYqaUvrA3f4iC1H7c7xbCCUo/I72uK/Oj+TXfE8RyfZHy9FboWTrG0hyJjovdEk4OCNoQAYDncfm2MuLXXQP5GWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650683; c=relaxed/simple;
	bh=4mzm6RixguZVPFOXrj/XJ75po2vAmeyvFNlxEUw77PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG9hoi89/b4m7skQTy+xqNSMVKQbqW1d1DMhednqCOIWxYsZp9OcF55zYhQOX6dEM3y40Xc8XX25a7TGq/b0g3c9blbLwez2j9pbE5fkGaxmWSotVodkDcxCbKNb0okHV9hSAEI9Vq38rw2QMSRlu4zb9K+8eNlxuLSKvJ017KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tnakv-0007xi-00; Thu, 27 Feb 2025 11:04:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 97ECCC04B4; Thu, 27 Feb 2025 11:04:01 +0100 (CET)
Date: Thu, 27 Feb 2025 11:04:01 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-hardening@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH]  MIPS: Loongson2ef: Replace deprecated strncpy() with
 strscpy()
Message-ID: <Z8A4kVKXXgy5KskY@alpha.franken.de>
References: <20250224215451.195727-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224215451.195727-2-thorsten.blum@linux.dev>

On Mon, Feb 24, 2025 at 10:54:50PM +0100, Thorsten Blum wrote:
> strncpy() is deprecated for NUL-terminated destination buffers. Use
> strscpy() instead and remove the manual NUL-termination.
> 
> Compile-tested only.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/loongson2ef/common/machtype.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/mips/loongson2ef/common/machtype.c b/arch/mips/loongson2ef/common/machtype.c
> index 82f6de49f20f..e635e66d2e6c 100644
> --- a/arch/mips/loongson2ef/common/machtype.c
> +++ b/arch/mips/loongson2ef/common/machtype.c
> @@ -48,8 +48,7 @@ void __init prom_init_machtype(void)
>  		return;
>  	}
>  	p += strlen("machtype=");
> -	strncpy(str, p, MACHTYPE_LEN);
> -	str[MACHTYPE_LEN] = '\0';
> +	strscpy(str, p);
>  	p = strstr(str, " ");
>  	if (p)
>  		*p = '\0';
> -- 
> 2.48.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

