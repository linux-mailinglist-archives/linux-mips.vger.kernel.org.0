Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41133A3349
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhFJSki (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhFJSkg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:36 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 10E9EC061760;
        Thu, 10 Jun 2021 11:38:40 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 629DA9200B3; Thu, 10 Jun 2021 20:38:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5B8E592009B;
        Thu, 10 Jun 2021 20:38:39 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:39 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] serial: 8250: Handle custom baud rates in UPF_MAGIC_MULTIPLIER
 range
In-Reply-To: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105200232090.29169@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Handle custom baud rates requested in the UPF_MAGIC_MULTIPLIER range 
with BOTHER.  Currently matching is exact, that is if a baud rate that 
is not either of clk/4 or clk/8 is requested, then we fall through to 
the default case, which will just divide the clock rate by 16 times the 
rate requested, round it to closest integer, and possibly yield even 
worse results then if clamping to the extra baud rates was chosen.

So for example if we have the usual base rate of 115200 and request a 
rate of 230399, then the fall-through divisor calculation will yield 1, 
and consequently the baud rate of 115200 will be programmed even though 
obviously the magic rate of 230400 would be more appropriate.

Make the selection of the magic rates range-qualified then and use clk/4 
for rates from clk/6 up (assuming `serial8250_get_baud_rate' has already 
rejected any rates too far beyond clk/4), and otherwise use clk/8 for 
rates from clk/12 up, and finally fall through to the standard divisor 
calculation.  Explicitly void using the undocumented rate of 153600bps 
and stick to documented divisor values only.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 drivers/tty/serial/8250/8250_port.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

linux-serial-8250-magic-multiplier-bother.diff
Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_port.c
+++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
@@ -2515,6 +2515,7 @@ static unsigned int serial8250_do_get_di
 					      unsigned int baud,
 					      unsigned int *frac)
 {
+	upf_t magic_multiplier = port->flags & UPF_MAGIC_MULTIPLIER;
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned int quot;
 
@@ -2550,11 +2551,9 @@ static unsigned int serial8250_do_get_di
 	 * Baud Rate Generator is capable of dividing the internal PLL
 	 * clock by any divisor from 1 to 65535.
 	 */
-	if ((port->flags & UPF_MAGIC_MULTIPLIER) &&
-	    baud == (port->uartclk/4))
+	if (magic_multiplier && baud >= port->uartclk / 6)
 		quot = 0x8001;
-	else if ((port->flags & UPF_MAGIC_MULTIPLIER) &&
-		 baud == (port->uartclk/8))
+	else if (magic_multiplier && baud >= port->uartclk / 12)
 		quot = 0x8002;
 	else if (up->port.type == PORT_NPCM)
 		quot = npcm_get_divisor(up, baud);
