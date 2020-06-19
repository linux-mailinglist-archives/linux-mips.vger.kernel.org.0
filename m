Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F52B201BEB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 22:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388832AbgFSUDP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 16:03:15 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37896 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388821AbgFSUDP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 16:03:15 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C3BBB80045E4;
        Fri, 19 Jun 2020 20:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fHwk4qyxZKn9; Fri, 19 Jun 2020 23:03:12 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 2/3] serial: 8250_dw: Simplify the ref clock rate setting procedure
Date:   Fri, 19 Jun 2020 23:02:50 +0300
Message-ID: <20200619200251.9066-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200619200251.9066-1-Sergey.Semin@baikalelectronics.ru>
References: <20200619200251.9066-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Really instead of twice checking the clk_round_rate() return value
we could do it once, and if it isn't error the clock rate can be changed.
By doing so we decrease a number of ret-value tests and remove a weird
goto-based construction implemented in the dw8250_set_termios() method.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---

Changelog v3:
- This is a new patch.
---
 drivers/tty/serial/8250/8250_dw.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index aab3cccc6789..12866083731d 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -282,20 +282,13 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 
 	clk_disable_unprepare(d->clk);
 	rate = clk_round_rate(d->clk, baud * 16);
-	if (rate < 0)
-		ret = rate;
-	else if (rate == 0)
-		ret = -ENOENT;
-	else
+	if (rate > 0) {
 		ret = clk_set_rate(d->clk, rate);
+		if (!ret)
+			p->uartclk = rate;
+	}
 	clk_prepare_enable(d->clk);
 
-	if (ret)
-		goto out;
-
-	p->uartclk = rate;
-
-out:
 	p->status &= ~UPSTAT_AUTOCTS;
 	if (termios->c_cflag & CRTSCTS)
 		p->status |= UPSTAT_AUTOCTS;
-- 
2.26.2

