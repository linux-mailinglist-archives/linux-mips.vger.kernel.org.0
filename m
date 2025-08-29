Return-Path: <linux-mips+bounces-10821-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96BB3B8E1
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EB891C88670
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E99930FF2B;
	Fri, 29 Aug 2025 10:31:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8263081D0;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463487; cv=none; b=MjQ1LXCrco8726R5zgDxfMyJCwZRlR0nvnUTB8Ce5rpYP3KOH0obAqm6AAAp0nVuC60Od+WaCy229nR3sCvdaJqZYujXq/Xnewlpawy1o3QrPhtCf+5UMU7VWlmF4D+4Uu8Ll1wta1JGnUfPGuiaIv6/CqBDtt0XXhnhmGrXsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463487; c=relaxed/simple;
	bh=BQH469dsO96mQDynpxqz0O1Bu5LtXeS2jU9VvrD7CUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un6bkDzUbq84E6Ht2u++tHjwStmS52lYVts+AMi6+JgZqjRpRMBxyJ8NouK+G8dwB49T55Lgm9kUCsTN6+YQ+xfVvPzlzS5DTC06QfriLCQHCCMZ+NQj6ef2fwzyaVXpJssuCxHgSEXrtq3vHYWYtJ76YDxFDS1CknsnT4GspGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004G6-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 61C93C0D9C; Fri, 29 Aug 2025 12:26:13 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:26:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] MIPS: arc: Replace deprecated strcpy() with memcpy()
Message-ID: <aLGARYWeCQxyvS1F@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-5-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:15PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use memcpy() instead.
> 
> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
> warning.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/fw/arc/cmdline.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/mips/fw/arc/cmdline.c b/arch/mips/fw/arc/cmdline.c
> index 155c5e911723..86b0e377b713 100644
> --- a/arch/mips/fw/arc/cmdline.c
> +++ b/arch/mips/fw/arc/cmdline.c
> @@ -42,12 +42,13 @@ static char __init *move_firmware_args(int argc, LONG *argv, char *cp)
>  {
>  	char *s;
>  	int actr, i;
> +	size_t len;
>  
>  	actr = 1; /* Always ignore argv[0] */
>  
>  	while (actr < argc) {
> -		for(i = 0; i < ARRAY_SIZE(used_arc); i++) {
> -			int len = strlen(used_arc[i][0]);
> +		for (i = 0; i < ARRAY_SIZE(used_arc); i++) {
> +			len = strlen(used_arc[i][0]);
>  
>  			if (!strncmp(prom_argv(actr), used_arc[i][0], len)) {
>  			/* Ok, we want it. First append the replacement... */
> @@ -57,8 +58,9 @@ static char __init *move_firmware_args(int argc, LONG *argv, char *cp)
>  				s = strchr(prom_argv(actr), '=');
>  				if (s) {
>  					s++;
> -					strcpy(cp, s);
> -					cp += strlen(s);
> +					len = strlen(s);
> +					memcpy(cp, s, len + 1);
> +					cp += len;
>  				}
>  				*cp++ = ' ';
>  				break;
> @@ -74,6 +76,7 @@ void __init prom_init_cmdline(int argc, LONG *argv)
>  {
>  	char *cp;
>  	int actr, i;
> +	size_t len;
>  
>  	actr = 1; /* Always ignore argv[0] */
>  
> @@ -86,14 +89,15 @@ void __init prom_init_cmdline(int argc, LONG *argv)
>  
>  	while (actr < argc) {
>  		for (i = 0; i < ARRAY_SIZE(ignored); i++) {
> -			int len = strlen(ignored[i]);
> -
> +			len = strlen(ignored[i]);
>  			if (!strncmp(prom_argv(actr), ignored[i], len))
>  				goto pic_cont;
>  		}
> +
>  		/* Ok, we want it. */
> -		strcpy(cp, prom_argv(actr));
> -		cp += strlen(prom_argv(actr));
> +		len = strlen(prom_argv(actr));
> +		memcpy(cp, prom_argv(actr), len + 1);
> +		cp += len;
>  		*cp++ = ' ';
>  
>  	pic_cont:
> @@ -105,6 +109,6 @@ void __init prom_init_cmdline(int argc, LONG *argv)
>  	*cp = '\0';
>  
>  #ifdef DEBUG_CMDLINE
> -	printk(KERN_DEBUG "prom cmdline: %s\n", arcs_cmdline);
> +	pr_debug("prom cmdline: %s\n", arcs_cmdline);
>  #endif
>  }
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

