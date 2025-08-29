Return-Path: <linux-mips+bounces-10819-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99133B3B8DD
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62FAE563576
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B836E30F7FC;
	Fri, 29 Aug 2025 10:31:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01013093BA;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463486; cv=none; b=FT/HmiX+0pBfEAN48ic7HIdqIIiX61EYPuoA+F/zFQLUOCN07En8wJ+pLyMp6wSdnLz/11zx2lx1nDHNADe3jBTcF7Cga+9xVrdzaPElXZDU2uN72YaLYMhWSA5CsjyyW3Nhbx2+41x4iuMMgiTT8c5L3w+z/46PicJQphZYbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463486; c=relaxed/simple;
	bh=8Ut3/ZnA00gLpKqollXtplPZ6JXtj1qcc8FMBuHGQeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPHD5Fk1wLftWKhEeHXsDZTNEi94Oluj2Uh4Q4rSkUar8QE60hHdEMSugquQ3KTWiNv6NE6Ibvd2cFaaeCU0990p6NQ8H+zCRTJC3p4y+p4C3Z6L4JF+FfouBixsrEnZ0sOA5Bw07+mh2Ur4Ky79lGCrzQt+zSEBtklf5ky+vw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004GJ-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4D26AC0DB7; Fri, 29 Aug 2025 12:26:54 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:26:54 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] MIPS: octeon: Replace deprecated strcpy() in
 octeon_model_get_string_buffer()
Message-ID: <aLGAbovvZFViVb1Q@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-7-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-7-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:17PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../cavium-octeon/executive/octeon-model.c    | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/mips/cavium-octeon/executive/octeon-model.c b/arch/mips/cavium-octeon/executive/octeon-model.c
> index 657dbad9644e..98996cc0857e 100644
> --- a/arch/mips/cavium-octeon/executive/octeon-model.c
> +++ b/arch/mips/cavium-octeon/executive/octeon-model.c
> @@ -25,6 +25,7 @@
>   * Contact Cavium Networks for more information
>   ***********************license end**************************************/
>  
> +#include <linux/string.h>
>  #include <asm/octeon/octeon.h>
>  
>  enum octeon_feature_bits __octeon_feature_bits __read_mostly;
> @@ -208,16 +209,16 @@ static const char *__init octeon_model_get_string_buffer(uint32_t chip_id,
>  		 */
>  		switch (chip_id & 0xf) {
>  		case 0:
> -			strcpy(pass, "1.X");
> +			strscpy(pass, "1.X");
>  			break;
>  		case 1:
> -			strcpy(pass, "2.X");
> +			strscpy(pass, "2.X");
>  			break;
>  		case 3:
> -			strcpy(pass, "3.X");
> +			strscpy(pass, "3.X");
>  			break;
>  		default:
> -			strcpy(pass, "X.X");
> +			strscpy(pass, "X.X");
>  			break;
>  		}
>  		break;
> @@ -232,13 +233,13 @@ static const char *__init octeon_model_get_string_buffer(uint32_t chip_id,
>  		 */
>  		switch (chip_id & 0xf) {
>  		case 0:
> -			strcpy(pass, "1.0");
> +			strscpy(pass, "1.0");
>  			break;
>  		case 2:
> -			strcpy(pass, "1.1");
> +			strscpy(pass, "1.1");
>  			break;
>  		default:
> -			strcpy(pass, "X.X");
> +			strscpy(pass, "X.X");
>  			break;
>  		}
>  		break;
> @@ -253,13 +254,13 @@ static const char *__init octeon_model_get_string_buffer(uint32_t chip_id,
>  		 */
>  		switch (chip_id & 0xf) {
>  		case 0:
> -			strcpy(pass, "1.0");
> +			strscpy(pass, "1.0");
>  			break;
>  		case 2:
> -			strcpy(pass, "1.1");
> +			strscpy(pass, "1.1");
>  			break;
>  		default:
> -			strcpy(pass, "X.X");
> +			strscpy(pass, "X.X");
>  			break;
>  		}
>  		break;
> @@ -273,16 +274,16 @@ static const char *__init octeon_model_get_string_buffer(uint32_t chip_id,
>  		if ((chip_id & 0xFF) < 0x8) {
>  			switch (chip_id & 0x3) {
>  			case 0:
> -				strcpy(pass, "1.0");
> +				strscpy(pass, "1.0");
>  				break;
>  			case 1:
> -				strcpy(pass, "1.1");
> +				strscpy(pass, "1.1");
>  				break;
>  			case 3:
> -				strcpy(pass, "1.2");
> +				strscpy(pass, "1.2");
>  				break;
>  			default:
> -				strcpy(pass, "1.X");
> +				strscpy(pass, "1.X");
>  				break;
>  			}
>  		}
> @@ -447,7 +448,7 @@ static const char *__init octeon_model_get_string_buffer(uint32_t chip_id,
>  	default:
>  		family = "XX";
>  		core_model = "XX";
> -		strcpy(pass, "X.X");
> +		strscpy(pass, "X.X");
>  		suffix = "XXX";
>  		break;
>  	}
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

