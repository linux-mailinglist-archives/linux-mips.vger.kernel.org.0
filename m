Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200141E598B
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 09:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgE1HqR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 03:46:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:42141 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgE1HqR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 03:46:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jeDF0-0000aG-00; Thu, 28 May 2020 09:46:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CE484C059F; Thu, 28 May 2020 09:44:31 +0200 (CEST)
Date:   Thu, 28 May 2020 09:44:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        kbuild test robot <lkp@intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: DTS: Fix build errors used with various configs
Message-ID: <20200528074431.GA10708@alpha.franken.de>
References: <1590631141-23904-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590631141-23904-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 09:59:01AM +0800, Tiezhu Yang wrote:
> If CONFIG_MIPS_MALTA is not set but CONFIG_LEGACY_BOARD_SEAD3 is set,
> the subdir arch/mips/boot/dts/mti will not be built, so the sead3.dts
> which depends on CONFIG_LEGACY_BOARD_SEAD3 in this subdir is also not
> built, and then there exists the following build error, fix it.
> 
>   LD      .tmp_vmlinux.kallsyms1
> arch/mips/generic/board-sead3.o:(.mips.machines.init+0x4): undefined reference to `__dtb_sead3_begin'
> Makefile:1106: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
> 
> Additionally, add CONFIG_FIT_IMAGE_FDT_BOSTON check for subdir img to
> fix the following build error when CONFIG_MACH_PISTACHIO is not set but
> CONFIG_FIT_IMAGE_FDT_BOSTON is set.
> 
> FATAL ERROR: Couldn't open "boot/dts/img/boston.dtb": No such file or directory
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 41528ba6afe6 ("MIPS: DTS: Only build subdir of current platform")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/boot/dts/Makefile | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
