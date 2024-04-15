Return-Path: <linux-mips+bounces-2759-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF288A4A71
	for <lists+linux-mips@lfdr.de>; Mon, 15 Apr 2024 10:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13591C20F26
	for <lists+linux-mips@lfdr.de>; Mon, 15 Apr 2024 08:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B7739847;
	Mon, 15 Apr 2024 08:36:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A79F2C868
	for <linux-mips@vger.kernel.org>; Mon, 15 Apr 2024 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170162; cv=none; b=tR2H0/ndnZp7oJTrNU6KE1MBQCMMFa2uvc76KVMKaKPdMVANf5CbZD1tta8MWMS1cBhfbpuqyyE/eXJT1ZJ4uKItFHAquHB7o+hz2zFqS8rKJwosfkMp5kwInCNqUTsF+gqKaHw6xqrYgZ+ERcxsmP42tRL05DVrVT6n5qqJ3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170162; c=relaxed/simple;
	bh=Q+I7XKw1ssXmT1ZKhaI16ik6TQ/F/lbMpDMzGvbsaiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD0BcB6SnOiRiTO3xEV9nXk350lumoW/402jls6KrKB9foUXtMKrHAenHlLkh1b6KbrG1URS7+LmsnRDkItTIDgqsrlcFxhVUjCtkk9VmXB+x8d0si8dnTUGniyC4KB7ST6nnhNG/JKhOU/bTBpVA5OE2b7qcjiY5BrqkEryDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rwHoa-0004hh-00; Mon, 15 Apr 2024 10:35:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 39646C02FE; Mon, 15 Apr 2024 10:33:27 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:33:27 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: RB532: Declare prom_setup_cmdline() and
 rb532_gpio_init() static
Message-ID: <ZhzmV0QHKRaftNx6@alpha.franken.de>
References: <20240315041043.240833-1-zhangyongzhen@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315041043.240833-1-zhangyongzhen@kylinos.cn>

On Fri, Mar 15, 2024 at 12:10:43PM +0800, Yongzhen Zhang wrote:
> early_tlb_init() and rb532_gpio_init() were local to file but not declared
> static, leading to error:
> 
> arch/mips/rb532/prom.c:49:13: error: no previous prototype for ‘prom_setup_cmdline’ [-Werror=missing-prototypes]
>    49 | void __init prom_setup_cmdline(void)
>       |             ^~~~~~~~~~~~~~~~~~
> arch/mips/rb532/gpio.c:200:12: error: no previous prototype for ‘rb532_gpio_init’ [-Werror=missing-prototypes]
>   200 | int __init rb532_gpio_init(void)
>       |            ^~~~~~~~~~~~~~~
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>  arch/mips/rb532/gpio.c | 2 +-
>  arch/mips/rb532/prom.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
> index 29c21b9d42da..ea6ebfea4a67 100644
> --- a/arch/mips/rb532/gpio.c
> +++ b/arch/mips/rb532/gpio.c
> @@ -197,7 +197,7 @@ void rb532_gpio_set_func(unsigned gpio)
>  }
>  EXPORT_SYMBOL(rb532_gpio_set_func);
>  
> -int __init rb532_gpio_init(void)
> +static int __init rb532_gpio_init(void)
>  {
>  	struct resource *r;
>  
> diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
> index b11693715547..b88e89ec5894 100644
> --- a/arch/mips/rb532/prom.c
> +++ b/arch/mips/rb532/prom.c
> @@ -46,7 +46,7 @@ static inline unsigned long tag2ul(char *arg, const char *tag)
>  	return simple_strtoul(num, 0, 10);
>  }
>  
> -void __init prom_setup_cmdline(void)
> +static void __init prom_setup_cmdline(void)
>  {
>  	static char cmd_line[COMMAND_LINE_SIZE] __initdata;
>  	char *cp, *board;
> -- 
> 2.34.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

