Return-Path: <linux-mips+bounces-14124-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACcMMQT13GkvYgkAu9opvQ
	(envelope-from <linux-mips+bounces-14124-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:52:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664A3ECC35
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EE0B30075E1
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 13:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97963C3428;
	Mon, 13 Apr 2026 13:45:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0B233D6DD;
	Mon, 13 Apr 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087923; cv=none; b=Eix2aW0vJ6IS/IBWPc4Jt5ER776YT3J9zKzE9JTXS1AA5NH3CSieiRQRFEBnR8Y7m0fi21gxUCldbOfDBRq+ESXyzbYQ1a0fcmovPp5GJTw6cgo7ycHB2SODhgGbw45OmBsrWORq2wU16n/RKYhJv4/AbObHblhkA1hOR+TAg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087923; c=relaxed/simple;
	bh=WyiUE0gUbdjjvEx1688riyxWEbMO5SIwWFq6YOC87iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o16VJ47AL/aid6Pz4kOY+lRcS0uyxmYMctpNfgpYJk/6te63R7HQV57vYcFqtQvldn1Z4uYBP0svU/Ju/qjA1Lo9ZNO+b47yP+qD8H5xqx7cvFkzCtQHi8l9fjEcoqNxCfono3hOPhofRbnNvKOuv8ldp8DWtQFA3Q1ebq/Eh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wCHbE-0004aJ-00; Mon, 13 Apr 2026 15:45:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5A4C6C0CA1; Mon, 13 Apr 2026 15:44:53 +0200 (CEST)
Date: Mon, 13 Apr 2026 15:44:53 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [resend, PATCH v2 1/1] MIPS: Alchemy: Remove unused forward
 declaration
Message-ID: <adzzVQNjjk9ZifNk@alpha.franken.de>
References: <20260320202852.3233790-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320202852.3233790-1-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.997];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-14124-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2664A3ECC35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:28:08PM +0100, Andy Shevchenko wrote:
> The 'struct gpio' is not used in the code, remove unneeded forward declaration.
> This seems to be a leftover for a 5 years.
> 
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> v2 (resend): Cc'ed to GPIO maintainers and ML
> v2: collected tags (Thomas)
> 
> Bart, it was agreed to take this patch via GPIO tree
> (that's why we have an Ack), can you apply it, please?
> 
>  arch/mips/include/asm/mach-au1x00/gpio-au1000.h | 2 --
>  arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> index d820b481ac56..e6306f6820e6 100644
> --- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> +++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> @@ -40,8 +40,6 @@
>  #define AU1000_GPIO2_INTENABLE	0x10
>  #define AU1000_GPIO2_ENABLE	0x14
>  
> -struct gpio;
> -
>  static inline int au1000_gpio1_to_irq(int gpio)
>  {
>  	return MAKE_IRQ(1, gpio - ALCHEMY_GPIO1_BASE);
> diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> index 43d44f384f97..b12f37262cfa 100644
> --- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> +++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
> @@ -12,7 +12,6 @@
>  #include <asm/io.h>
>  #include <asm/mach-au1x00/au1000.h>
>  
> -struct gpio;
>  struct gpio_chip;
>  
>  /* with the current GPIC design, up to 128 GPIOs are possible.
> -- 
> 2.50.1

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

