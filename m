Return-Path: <linux-mips+bounces-10818-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFAB3B8DE
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3AEBA06417
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FCF30F537;
	Fri, 29 Aug 2025 10:31:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9F33093CE;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463486; cv=none; b=mkGmLOslkHm8ehPOYCh8IRZUmbE1+DwkoYevx8zlYa7CFrpDMj0GQQHPJ3p4GXYhNrI7UPNqK3cxFIbGMUdZk3V5283hXmjXngQz7w5ch6nepuxPSJZYwRmwLrKP5fSAt5JD/LXqoYv0nKUT7qRLi6X0g1P3E9+5yJzbvOc9/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463486; c=relaxed/simple;
	bh=VxvtKONg4OmBBNlFlOQEGAsic3ywxJZKH++Hg2cwpSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWnpWXm62yXT0vlxdgItkvR7TJVEhRalwaYiL1DeX+/BdNsWsg6T0LlkdPc5T45nigGiLXWqqKoRv8QxRHGa01zIyJBgH+zW6U7DurT99BNaD3TOsiQkvNzbtaS4U7gNkyIR69ooZDGeE83Oy+CXWKncTX3gMaggen0nIoiZjw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO3-0004Gg-00; Fri, 29 Aug 2025 12:31:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3E538C0F01; Fri, 29 Aug 2025 12:28:03 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:28:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: RB532: Replace deprecated strcpy() with memcpy()
 and strscpy()
Message-ID: <aLGAs9qSe3KSzh_P@alpha.franken.de>
References: <20250819102419.712031-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819102419.712031-2-thorsten.blum@linux.dev>

On Tue, Aug 19, 2025 at 12:24:17PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use memcpy() and strscpy() instead.
> 
> Add the local variable 'size_t len' to keep track of the string lengths
> and prefer memcpy() over strscpy() when we use the string length to
> advance the 'cp' pointer.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/rb532/prom.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
> index b88e89ec5894..8c370eb180ef 100644
> --- a/arch/mips/rb532/prom.c
> +++ b/arch/mips/rb532/prom.c
> @@ -53,6 +53,7 @@ static void __init prom_setup_cmdline(void)
>  	int prom_argc;
>  	char **prom_argv;
>  	int i;
> +	size_t len;
>  
>  	prom_argc = fw_arg0;
>  	prom_argv = (char **) fw_arg1;
> @@ -82,20 +83,20 @@ static void __init prom_setup_cmdline(void)
>  				mips_machtype = MACH_MIKROTIK_RB532;
>  		}
>  
> -		strcpy(cp, prom_argv[i]);
> -		cp += strlen(prom_argv[i]);
> +		len = strlen(prom_argv[i]);
> +		memcpy(cp, prom_argv[i], len + 1);
> +		cp += len;
>  	}
>  	*(cp++) = ' ';
>  
> -	i = strlen(arcs_cmdline);
> -	if (i > 0) {
> +	len = strlen(arcs_cmdline);
> +	if (len > 0) {
>  		*(cp++) = ' ';
> -		strcpy(cp, arcs_cmdline);
> -		cp += strlen(arcs_cmdline);
> +		memcpy(cp, arcs_cmdline, len + 1);
> +		cp += len;
>  	}
>  	cmd_line[COMMAND_LINE_SIZE - 1] = '\0';
> -
> -	strcpy(arcs_cmdline, cmd_line);
> +	strscpy(arcs_cmdline, cmd_line);
>  }
>  
>  void __init prom_init(void)
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

