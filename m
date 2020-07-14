Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4C321F1D4
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 14:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgGNMsR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 08:48:17 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33050 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgGNMsQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 08:48:16 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 75C9480045E5;
        Tue, 14 Jul 2020 12:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YWtsWr-lMKj8; Tue, 14 Jul 2020 15:48:11 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 0/4] serial: 8250_dw: Fix ref clock usage
Date:   Tue, 14 Jul 2020 15:48:03 +0300
Message-ID: <20200714124808.21493-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greg, Jiri. We've missed the last merge window. It would be pity to miss
the next one. Please review/merge in the series.

Regarding the patchset. It might be dangerous if an UART port reference
clock rate is suddenly changed. In particular the 8250 port drivers
(and AFAICS most of the tty drivers using common clock framework clocks)
rely either on the exclusive reference clock utilization or on the ref
clock rate being always constant. Needless to say that it turns out not
true and if some other service suddenly changes the clock rate behind an
UART port driver back no good can happen. So the port might not only end
up with an invalid uartclk value saved, but may also experience a
distorted output/input data since such action will effectively update the
programmed baud-clock. We discovered such problem on Baikal-T1 SoC where
two DW 8250 ports have got a shared reference clock. Allwinner SoC is
equipped with an UART, which clock is derived from the CPU PLL clock
source, so the CPU frequency change might be propagated down up to the
serial port reference clock. This patchset provides a way to fix the
problem to the 8250 serial port controllers and mostly fixes it for the
DW 8250-compatible UART. I say mostly because due to not having a facility
to pause/stop and resume/restart on-going transfers we implemented the
UART clock rate update procedure executed post factum of the actual
reference clock rate change.

In addition the patchset includes a small optimization patch. It
simplifies the DW APB UART ref clock rate setting procedure a bit.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Changelog v3:
- Refactor the original patch to adjust the UART port divisor instead of
  requesting an exclusive ref clock utilization.

Changelog v4:
- Discard commit b426bf0fb085 ("serial: 8250: Fix max baud limit in generic
  8250 port") since Greg has already merged it into the tty-next branch.
- Use EXPORT_SYMBOL_GPL() for the serial8250_update_uartclk() method.

Changelog v5:
- Refactor dw8250_clk_work_cb() function cheking the clk_get_rate()
  return value for being erroneous and exit if it is.
- Don't update p->uartclk in the port startup. It will be updated later in
  the same procedure at the set_termios() function being invoked by the
  serial_core anyway.

Changelog v6:
- Resend

Link: https://lore.kernel.org/linux-serial/20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru
Changelog v7:
- Wake the device up on the serial port divider update.

Link: https://lore.kernel.org/linux-serial/20200619200251.9066-1-Sergey.Semin@baikalelectronics.ru
Changelog v8:
- Add a new patch:
  "serial: 8250_dw: Pass the same rate to the clk round and set rate methods"

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (4):
  serial: 8250: Add 8250 port clock update method
  serial: 8250_dw: Simplify the ref clock rate setting procedure
  serial: 8250_dw: Pass the same rate to the clk round and set rate
    methods
  serial: 8250_dw: Fix common clocks usage race condition

 drivers/tty/serial/8250/8250_dw.c   | 120 ++++++++++++++++++++++++----
 drivers/tty/serial/8250/8250_port.c |  40 ++++++++++
 include/linux/serial_8250.h         |   2 +
 3 files changed, 148 insertions(+), 14 deletions(-)

-- 
2.26.2

