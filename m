Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D571D24F8
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 03:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgENBwp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 21:52:45 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:12862 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgENBwo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 21:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589421165; x=1620957165;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=S19z5KsKCze3zWkgumRofgPmQU8kjGuHQGtAsDzsTcM=;
  b=nqFWODEuRFr3Rc4QmNDh0aUujTyPLWXowOyO+WbXu0MYu4VMF/8HaEjj
   en0nFkl0P5vQo1Xokw8NNxhbZO6WzkeMJWHK3+kfXlH9k1o4Kc7n2bK9M
   t2t8dPbkqdZwlreNlF2tfYoS8w82E6CFi5ijMJ2Qj1qo3wInjpUKTOATL
   jiRAi2ppYjKlIrroLGUoATohJqr/HDNnzZAbqYGy0QvM9ldHRrIWH+wog
   0bCfgwekIGYvm6BGd0k+LOyR9zSIoSyVhOTqzQQJSqSQmBXzBdkR1WWNl
   7OnXd90G6WM7jnT2AEgG+lsUiYQl3jV+Wd5G3yryj7EaqqiWhR+epMOwP
   A==;
IronPort-SDR: +og8+IL7fdOXLrxNXhSgvxup3QvH8BlrCCyosqfqQicFeKdIugvPjKGYd8NB+sGBSTqu30+eIX
 sIPeIwVf0wfJXLJGWxnghuQmqxu5g9L2XMg9tIkRhfTHbTtJPhOZUEWGZ50eLzQnwF6+tx30sY
 Xxq0oMUZPXmKSvO5YZ6uwk9iimimjuEZU+gq/foc4eMfANeUzwHh2/rHczv5uHV0eQ9/V/7Kdr
 eD0eYOZzLBJ76wfQcke2M+QzIbyerI70WzFxf+XntWndAP3ijctput1EAboX69npewksC8lem2
 P+U=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141981873"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 09:52:45 +0800
IronPort-SDR: eF1PUH5XnMl7lzF9nyVqVBNRk8aRnRNAiMmiVolH+xLaScQWxXtD0lg+XlAL3NAvxrw7H/uxyX
 KX6/WtFcSi3dbNLPsu59CLlfadq1GjP28=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 18:42:57 -0700
IronPort-SDR: u3w7pgiuf9s2AtyRiVomo74JnhAtQGhpwQyhaIfDiJSZNodcotGuTrvseuOtDuH8BSclPEHE93
 gwv9D7pB7Xww==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 18:52:43 -0700
Date:   Thu, 14 May 2020 02:52:40 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Joshua Kinard <kumba@gentoo.org>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
In-Reply-To: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
Message-ID: <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 13 May 2020, Joshua Kinard wrote:

> diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
> index ef3efce0094a..845b8951d74f 100644
> --- a/arch/mips/include/asm/mach-ip27/war.h
> +++ b/arch/mips/include/asm/mach-ip27/war.h
> @@ -17,7 +17,12 @@
>  #define MIPS_CACHE_SYNC_WAR		0
>  #define TX49XX_ICACHE_INDEX_INV_WAR	0
>  #define ICACHE_REFILLS_WORKAROUND_WAR	0
> -#define R10000_LLSC_WAR			1
>  #define MIPS34K_MISSED_ITLB_WAR		0
>  
> +#ifdef CONFIG_CPU_R10000
> +#define R10000_LLSC_WAR			1
> +#else
> +#define R10000_LLSC_WAR			0
> +#endif
> +

 I think it would be good not to reorder the macros (even though there's
preexisting breakage in <asm/mach-ip30/war.h>) so that all the files have
them in the same order.

  Maciej
