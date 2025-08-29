Return-Path: <linux-mips+bounces-10807-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C700B3B8C6
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80914A049CB
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6D730BBB9;
	Fri, 29 Aug 2025 10:31:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEABF3093A7;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463484; cv=none; b=eB2KnMA2t1/Gc8bqQnc1/3prSCmFH6VOx3An/zjGZzlyUvBoCFkSJJyWLf3xvreetx3ZmutviI+q52i9FccA6NHX2U0pcqzMTG47AcVK12UACxp34nEoheIXLjXJB1uMWru3AZfV4/HNx0vMtkKwFuZePKybt8tEgGWWb1KxYkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463484; c=relaxed/simple;
	bh=erCvdmuNynv/Glo8SbKw9XQtzIKpERjPcY5AltzhKks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7+TkRGKwPpbV6eAfcKOz0Omo9z8/GuUEgx6CuN1KjUG7DFU3iU7Df6bK2PSNUB86JayBqSiAdiTr/gUCkZtweRXHyMBoSw6SWndBEV4fK6aPLT4jfcas3o9LaCgQ/DmA1c/m42tCjV77xy9LHnmol0T5Y9nobBLRn3EWDXx8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004G2-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2858CC0D68; Fri, 29 Aug 2025 12:25:58 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:25:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] MIPS: txx9: Replace deprecated strcpy() with
 strscpy()
Message-ID: <aLGANory-ZVAg2_d@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-4-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:14PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/txx9/generic/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
> index 5dc867ea2c69..03f8a3a95637 100644
> --- a/arch/mips/txx9/generic/setup.c
> +++ b/arch/mips/txx9/generic/setup.c
> @@ -200,7 +200,7 @@ static void __init preprocess_cmdline(void)
>  	static char cmdline[COMMAND_LINE_SIZE] __initdata;
>  	char *s;
>  
> -	strcpy(cmdline, arcs_cmdline);
> +	strscpy(cmdline, arcs_cmdline);
>  	s = cmdline;
>  	arcs_cmdline[0] = '\0';
>  	while (s && *s) {
> @@ -270,7 +270,7 @@ void __init prom_init(void)
>  	preprocess_cmdline();
>  	select_board();
>  
> -	strcpy(txx9_system_type, txx9_board_vec->system);
> +	strscpy(txx9_system_type, txx9_board_vec->system);
>  
>  	txx9_board_vec->prom_init();
>  }
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

