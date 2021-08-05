Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3605F3E1103
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 11:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbhHEJRi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 05:17:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:46893 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232666AbhHEJRh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 05:17:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mBZV8-0005ti-01; Thu, 05 Aug 2021 11:17:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 503C5C052F; Thu,  5 Aug 2021 11:02:56 +0200 (CEST)
Date:   Thu, 5 Aug 2021 11:02:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: loongson2ef: don't build serial.o unconditionally
Message-ID: <20210805090256.GB5979@alpha.franken.de>
References: <20210805000216.31833-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805000216.31833-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 04, 2021 at 05:02:16PM -0700, Randy Dunlap wrote:
> LOONGSON_UART_BASE depends on EARLY_PRINTK || SERIAL_8250, but when
> neither of these Kconfig symbols is set, the kernel build has errors:
> 
> ../arch/mips/loongson2ef/common/serial.c: In function 'serial_init':
> ../arch/mips/loongson2ef/common/serial.c:66:25: error: 'loongson_uart_base' undeclared (first use in this function)
>    66 |                         loongson_uart_base;
> ../arch/mips/loongson2ef/common/serial.c:66:25: note: each undeclared identifier is reported only once for each function it appears in
> ../arch/mips/loongson2ef/common/serial.c:68:41: error: '_loongson_uart_base' undeclared (first use in this function)
>    68 |                         (void __iomem *)_loongson_uart_base;
> 
> Fix this by building serial.o only when one (or both) of these
> Kconfig symbols is enabled.
> 
> Tested with:
> 	(a) EARLY_PRINTK=y, SERIAL_8250 not set;
> 	(b) EARLY_PRINTK=y, SERIAL_8250=y;
> 	(c) EARLY_PRINTK=y, SERIAL_8250=m.
> 	(d) EARLY_PRINTK not set, SERIAL_8250=y;
> 	(e) EARLY_PRINTK not set, SERIAL_8250=m;
> 	(f) EARLY_PRINTK not set, SERIAL_8250 not set.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/loongson2ef/common/Makefile |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
