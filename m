Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2BF3BBEA4
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 17:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhGEPMK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Jul 2021 11:12:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:41760 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231586AbhGEPMJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Jul 2021 11:12:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m0QDu-0001Ke-01; Mon, 05 Jul 2021 17:09:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2908CC07DA; Mon,  5 Jul 2021 17:08:43 +0200 (CEST)
Date:   Mon, 5 Jul 2021 17:08:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-mips@vger.kernel.org, Kyungsik Lee <kyungsik.lee@lge.com>
Subject: Re: [PATCH] mips: disable branch profiling in boot/decompress.o
Message-ID: <20210705150843.GB12584@alpha.franken.de>
References: <20210704230211.31257-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704230211.31257-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 04, 2021 at 04:02:11PM -0700, Randy Dunlap wrote:
> Use DISABLE_BRANCH_PROFILING for arch/mips/boot/compressed/decompress.o
> to prevent linkage errors.
> 
> mips64-linux-ld: arch/mips/boot/compressed/decompress.o: in function `LZ4_decompress_fast_extDict':
> decompress.c:(.text+0x8c): undefined reference to `ftrace_likely_update'
> mips64-linux-ld: decompress.c:(.text+0xf4): undefined reference to `ftrace_likely_update'
> mips64-linux-ld: decompress.c:(.text+0x200): undefined reference to `ftrace_likely_update'
> mips64-linux-ld: decompress.c:(.text+0x230): undefined reference to `ftrace_likely_update'
> mips64-linux-ld: decompress.c:(.text+0x320): undefined reference to `ftrace_likely_update'
> mips64-linux-ld: arch/mips/boot/compressed/decompress.o:decompress.c:(.text+0x3f4): more undefined references to `ftrace_likely_update' follow
> 
> Fixes: e76e1fdfa8f8 ("lib: add support for LZ4-compressed kernel")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Kyungsik Lee <kyungsik.lee@lge.com>
> ---
>  arch/mips/boot/compressed/decompress.c |    2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next (for second pull request).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
