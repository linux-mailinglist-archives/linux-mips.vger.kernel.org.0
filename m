Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7B83BBEA5
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 17:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhGEPMK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Jul 2021 11:12:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:41757 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231477AbhGEPMJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Jul 2021 11:12:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m0QDu-0001Ke-02; Mon, 05 Jul 2021 17:09:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 95BB5C07DA; Mon,  5 Jul 2021 17:09:18 +0200 (CEST)
Date:   Mon, 5 Jul 2021 17:09:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: CONFIG_KERNEL_LZ4 needs obj/bswapsi.o
Message-ID: <20210705150918.GC12584@alpha.franken.de>
References: <20210704230238.577-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704230238.577-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 04, 2021 at 04:02:38PM -0700, Randy Dunlap wrote:
> Add obj/bswapsi.o for CONFIG_KERNEL_LZ4 to fix undefined references
> during linking.
> 
> mips64-linux-ld: arch/mips/boot/compressed/decompress.o: in function `decompress_kernel':
> decompress.c:(.text+0x34e0): undefined reference to `__bswapsi2'
> mips64-linux-ld: decompress.c:(.text+0x3504): undefined reference to `__bswapsi2'
> mips64-linux-ld: decompress.c:(.text+0x3530): undefined reference to `__bswapsi2'
> 
> #Fixes: d0nt0110kn0w ("I couldn't find where __bswapsi2 is used.")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/boot/compressed/Makefile |    1 +
>  1 file changed, 1 insertion(+)

Arnd sent a little bit different fix, which I've applied instead.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
