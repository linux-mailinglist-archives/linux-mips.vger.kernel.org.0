Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EA72294F2
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 11:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgGVJbG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 05:31:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:45216 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGVJbG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jul 2020 05:31:06 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jyB5X-0000cS-00; Wed, 22 Jul 2020 11:30:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 09649C0873; Wed, 22 Jul 2020 11:30:24 +0200 (CEST)
Date:   Wed, 22 Jul 2020 11:30:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
Message-ID: <20200722093023.GA8813@alpha.franken.de>
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
 <20200721141742.996350-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721141742.996350-4-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 21, 2020 at 10:17:31PM +0800, Jiaxun Yang wrote:
> It can be very big on LS7A PCH systems.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/io.h                     | 3 ++-
>  arch/mips/include/asm/mach-loongson64/spaces.h | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 346fffd9e972..0072489325fa 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -50,8 +50,9 @@
>  # define __relaxed_ioswabq ioswabq
>  
>  /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
> -
> +#ifndef IO_SPACE_LIMIT
>  #define IO_SPACE_LIMIT 0xffff
> +#endif

please move this to include/asm/mach-generic/spaces.h

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
