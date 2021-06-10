Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398E53A3347
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhFJSkg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhFJSkf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:35 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD388C061574;
        Thu, 10 Jun 2021 11:38:38 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 1FBF79200BB; Thu, 10 Jun 2021 20:38:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 19DB59200B4;
        Thu, 10 Jun 2021 20:38:34 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:34 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] serial: 8250: Actually allow UPF_MAGIC_MULTIPLIER baud
 rates
In-Reply-To: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105190412280.29169@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support for magic baud rate divisors of 32770 and 32769 used with SMSC 
Super I/O chips for extra baud rates of 230400 and 460800 respectively 
where base rate is 115200[1] has been added around Linux 2.5.64, which 
predates our repo history, but the origin could be identified as commit 
2a717aad772f ("Merge with Linux 2.5.64.") with the old MIPS/Linux repo 
also at: <git://git.kernel.org/pub/scm/linux/kernel/git/ralf/linux.git>.

Code that is now in `serial8250_do_get_divisor' was added back then to 
`serial8250_get_divisor', but that code would only ever trigger if one 
of the higher baud rates was actually requested, and that cannot ever 
happen, because the earlier call to `serial8250_get_baud_rate' never 
returns them.  This is because it calls `uart_get_baud_rate' with the 
maximum requested being the base rate, that is clk/16 or 115200 for SMSC 
chips at their nominal clock rate.

Fix it then and allow UPF_MAGIC_MULTIPLIER baud rates to be selected, by 
requesting the maximum baud rate of clk/4 rather than clk/16 if the flag 
has been set.  Also correct the minimum baud rate, observing that these 
ports only support actual (non-magic) divisors of up to 32767 only.

References:

[1] "FDC37M81x, PC98/99 Compliant Enhanced Super I/O Controller with 
    Keyboard/Mouse Wake-Up", Standard Microsystems Corporation, Rev. 
    03/27/2000, Table 31 - "Baud Rates", p. 77

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
 drivers/tty/serial/8250/8250_port.c |   19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

linux-serial-8250-magic-multiplier-baud-rate.diff
Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_port.c
+++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
@@ -2659,6 +2659,21 @@ static unsigned int serial8250_get_baud_
 					     struct ktermios *old)
 {
 	unsigned int tolerance = port->uartclk / 100;
+	unsigned int min;
+	unsigned int max;
+
+	/*
+	 * Handle magic divisors for baud rates above baud_base on SMSC
+	 * Super I/O chips.  Enable custom rates of clk/4 and clk/8, but
+	 * disable divisor values beyond 32767, which are unavailable.
+	 */
+	if (port->flags & UPF_MAGIC_MULTIPLIER) {
+		min = port->uartclk / 16 / UART_DIV_MAX >> 1;
+		max = (port->uartclk + tolerance) / 4;
+	} else {
+		min = port->uartclk / 16 / UART_DIV_MAX;
+		max = (port->uartclk + tolerance) / 16;
+	}
 
 	/*
 	 * Ask the core to calculate the divisor for us.
@@ -2666,9 +2681,7 @@ static unsigned int serial8250_get_baud_
 	 * slower than nominal still match standard baud rates without
 	 * causing transmission errors.
 	 */
-	return uart_get_baud_rate(port, termios, old,
-				  port->uartclk / 16 / UART_DIV_MAX,
-				  (port->uartclk + tolerance) / 16);
+	return uart_get_baud_rate(port, termios, old, min, max);
 }
 
 /*
