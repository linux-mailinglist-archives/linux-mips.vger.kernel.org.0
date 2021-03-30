Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037E634E844
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 15:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhC3NDF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 09:03:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:37666 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232129AbhC3NDC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 09:03:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRE1N-00043F-00; Tue, 30 Mar 2021 15:03:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4A4C5C1D9A; Tue, 30 Mar 2021 14:53:47 +0200 (CEST)
Date:   Tue, 30 Mar 2021 14:53:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org,
        trivial@kernel.org
Subject: Re: [PATCH v3 1/1] MIPS: kernel: setup.c: fix compilation error
Message-ID: <20210330125347.GA10767@alpha.franken.de>
References: <20210326134158.268164-1-sandberg@mailfence.com>
 <20210329123136.3717-1-sandberg@mailfence.com>
 <20210329123136.3717-2-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329123136.3717-2-sandberg@mailfence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 29, 2021 at 03:31:36PM +0300, Mauri Sandberg wrote:
> With ath79_defconfig enabling CONFIG_MIPS_ELF_APPENDED_DTB gives a
> compilation error. This patch fixes it.
> 
> Build log:
> ...
>   CC      kernel/locking/percpu-rwsem.o
> ../arch/mips/kernel/setup.c:46:39: error: conflicting types for
> '__appended_dtb'
>  const char __section(".appended_dtb") __appended_dtb[0x100000];
>                                        ^~~~~~~~~~~~~~
> In file included from ../arch/mips/kernel/setup.c:34:
> ../arch/mips/include/asm/bootinfo.h:118:13: note: previous declaration
> of '__appended_dtb' was here
>  extern char __appended_dtb[];
>              ^~~~~~~~~~~~~~
>   CC      fs/attr.o
> make[4]: *** [../scripts/Makefile.build:271: arch/mips/kernel/setup.o]
>  Error 1
> ...
> 
> Root cause seems to be:
> Fixes: b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")
> 
> Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
> Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: trivial@kernel.org
> ---
>  arch/mips/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-fixes. I dropped the Tested-by as this would imply
for me booting that kernel, which I didn't.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
