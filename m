Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EFD1C9946
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 20:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgEGS3L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 14:29:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:25470 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgEGS3L (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 14:29:11 -0400
IronPort-SDR: ci8xYIijSYUjNrgjD8jz5lU5qf0vx/R0ftZUm48wNOnaFk07VcWZmnqhAFNuFp9XWGl9bxM/5B
 UM4bUT6FC+xA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 11:29:10 -0700
IronPort-SDR: wMCF1cDvnibopdXFyBYMTMWQUgrGoVywPKBnfFBshtu66Lml/9Uhcx1CeU2Dk+bYh/7TpE83ne
 9LAth0IHca1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; 
   d="scan'208";a="296619233"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 07 May 2020 11:29:03 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jWlGc-005H6v-15; Thu, 07 May 2020 21:29:06 +0300
Date:   Thu, 7 May 2020 21:29:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Long Cheng <long.cheng@mediatek.com>,
        Maxime Ripard <mripard@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] serial: 8250_dw: Fix ref clock usage
Message-ID: <20200507182906.GC185537@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 02:31:31AM +0300, Serge Semin wrote:
> It might be dangerous if an UART port reference clock rate is suddenly
> changed. In particular the 8250 port drivers (and AFAICS most of the tty
> drivers using common clock framework clocks) rely either on the
> exclusive reference clock utilization or on the ref clock rate being
> always constant. Needless to say that it turns out not true and if some
> other service suddenly changes the clock rate behind an UART port driver
> back it's no good. So the port might not only end up with an invalid
> uartclk value saved, but may also experience a distorted output/input
> data since such action will effectively update the programmed baud-clock.
> We discovered such problem on Baikal-T1 SoC where two DW 8250 ports have
> got a shared reference clock. Allwinner SoC is equipped with an UART,
> which clock is derived from the CPU PLL clock source, so the CPU frequency
> change might be propagated down up to the serial port reference clock.
> This patchset provides a way to fix the problem to the 8250 serial port
> controllers and mostly fixes it for the DW 8250-compatible UART. I say
> mostly because due to not having a facility to pause/stop and resume/
> restart on-going transfers we implemented the UART clock rate update
> procedure executed post factum of the actual reference clock rate change.
> 
> In addition the patchset includes a few fixes we discovered when were
> working the issue. First one concerns the maximum baud rate setting used
> to determine a serial port baud based on the current UART port clock rate.
> Another one simplifies the ref clock rate setting procedure a bit.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4

Thanks!

I will look at them later, but first impression that the first approach narrowed
to the certain SoC (by matching compatible string) looks better solution for
time being.

> Changelog v3:
> - Refactor the original patch to adjust the UART port divisor instead of
>   requesting an exclusive ref clock utilization.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Long Cheng <long.cheng@mediatek.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (4):
>   serial: 8250: Fix max baud limit in generic 8250 port
>   serial: 8250: Add 8250 port clock update method
>   serial: 8250_dw: Simplify the ref clock rate setting procedure
>   serial: 8250_dw: Fix common clocks usage race condition
> 
>  drivers/tty/serial/8250/8250_dw.c   | 125 +++++++++++++++++++++++++---
>  drivers/tty/serial/8250/8250_port.c |  42 +++++++++-
>  include/linux/serial_8250.h         |   2 +
>  3 files changed, 156 insertions(+), 13 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


