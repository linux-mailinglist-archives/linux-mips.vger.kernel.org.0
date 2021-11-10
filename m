Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2108144C7F1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 19:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhKJS5S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 13:57:18 -0500
Received: from elvis.franken.de ([193.175.24.41]:41168 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232912AbhKJSzX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Nov 2021 13:55:23 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkshy-0005Il-00; Wed, 10 Nov 2021 19:52:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DAD33C2C40; Wed, 10 Nov 2021 19:48:51 +0100 (CET)
Date:   Wed, 10 Nov 2021 19:48:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: boot/compressed/: add __bswapdi2() to target for
 ZSTD decompression
Message-ID: <20211110184851.GA13827@alpha.franken.de>
References: <20211110030944.6733-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110030944.6733-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 09, 2021 at 07:09:44PM -0800, Randy Dunlap wrote:
> For MIPS pre-boot, when CONFIG_KERNEL_ZSTD=y, the decompressor
> function uses __bswapdi2(), so this object file should be added to
> the target object file.
> 
> Fixes these build errors:
> 
> mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `xxh64':
> decompress.c:(.text+0x8be0): undefined reference to `__bswapdi2'
> mips-linux-ld: decompress.c:(.text+0x8c78): undefined reference to `__bswapdi2'
> mips-linux-ld: decompress.c:(.text+0x8d04): undefined reference to `__bswapdi2'
> mips-linux-ld: arch/mips/boot/compressed/decompress.o:decompress.c:(.text+0xa010): more undefined references to `__bswapdi2' follow
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/boot/compressed/Makefile |    6 ++++++
>  1 file changed, 6 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
