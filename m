Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C6A3A3342
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhFJSk2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbhFJSkZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:25 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F1DC7C061574;
        Thu, 10 Jun 2021 11:38:28 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 56D7092009E; Thu, 10 Jun 2021 20:38:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5187F92009C;
        Thu, 10 Jun 2021 20:38:28 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:28 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] serial: 8250: Document SMSC Super I/O UART
 peculiarities
In-Reply-To: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2106092330530.5469@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Contrary to what SMSC documentation says and unlike NS16C550A UARTs the 
SMSC Super I/O IC claims compatibility with the SMSC UART implementation 
does not support dividing the internal PLL clock by any divisor from 1 
to 65535[1], with the exception of two magic divisors of 32769 and 32770 
used respectively to select the high-speed data rates of 460800bps and 
230400bps[2] if enabled on a port-by-port basis in with the Serial Port 
Mode Register in the Device Configuration Space[3][4].

Instead empirical evidence indicates that the divisor, as stored in the 
DLL and DLM register pair, has the range of 1 to 32767 only, and bit 7 
of the DLM register (bit 15 of the divisor) effectively serves as a 
selection bit for the prescaler from the base frequency of 7.3728MHz, 
either 4 if the bit is 0, or 1 if the bit is 1 and high-speed operation 
has been enabled with the Serial Port Mode Register.

So if high-speed operation has not been enabled, then say the values of 
1 and 32769 (0x8001) written into the combined DLL and DLM register pair 
both select the divisor of 1 and the baud rate of 115200bps.

[1] "FDC37M81x, PC98/99 Compliant Enhanced Super I/O Controller with
    Keyboard/Mouse Wake-Up", Standard Microsystems Corporation, Rev.
    03/27/2000, Section "Programmable Baud Rate Generator (and Divisor 
    Latches DLH, DLL)", p. 75

[2] same, Table 31 - "Baud Rates", p. 77

[3] same, Table 60 - "Serial Port 1, Logical Device 4 [Logical Device 
    Number = 0x04]", p. 153

[4] same, Table 61 - "Serial Port 2, Logical Device 5 [Logical Device 
    Number = 0x05]", p. 153

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 drivers/tty/serial/8250/8250_port.c |   31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

linux-serial-8250-magic-multiplier-doc.diff
Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_port.c
+++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
@@ -2519,9 +2519,36 @@ static unsigned int serial8250_do_get_di
 	unsigned int quot;
 
 	/*
-	 * Handle magic divisors for baud rates above baud_base on
-	 * SMSC SuperIO chips.
+	 * Handle magic divisors for baud rates above baud_base on SMSC
+	 * Super I/O chips.  We clamp custom rates from clk/6 and clk/12
+	 * up to clk/4 (0x8001) and clk/8 (0x8002) respectively.  These
+	 * magic divisors actually reprogram the baud rate generator's
+	 * reference clock derived from chips's 14.318MHz clock input.
+	 *
+	 * Documentation claims that with these magic divisors the base
+	 * frequencies of 7.3728MHz and 3.6864MHz are used respectively
+	 * for the extra baud rates of 460800bps and 230400bps rather
+	 * than the usual base frequency of 1.8462MHz.  However empirical
+	 * evidence contradicts that.
 	 *
+	 * Instead bit 7 of the DLM register (bit 15 of the divisor) is
+	 * effectively used as a clock prescaler selection bit for the
+	 * base frequency of 7.3728MHz, always used.  If set to 0, then
+	 * the base frequency is divided by 4 for use by the Baud Rate
+	 * Generator, for the usual arrangement where the value of 1 of
+	 * the divisor produces the baud rate of 115200bps.  Conversely,
+	 * if set to 1 and high-speed operation has been enabled with the
+	 * Serial Port Mode Register in the Device Configuration Space,
+	 * then the base frequency is supplied directly to the Baud Rate
+	 * Generator, so for the divisor values of 0x8001, 0x8002, 0x8003,
+	 * 0x8004, etc. the respective baud rates produced are 460800bps,
+	 * 230400bps, 153600bps, 115200bps, etc.
+	 *
+	 * In all cases only low 15 bits of the divisor are used to divide
+	 * the baud base and therefore 32767 is the maximum divisor value
+	 * possible, even though documentation says that the programmable
+	 * Baud Rate Generator is capable of dividing the internal PLL
+	 * clock by any divisor from 1 to 65535.
 	 */
 	if ((port->flags & UPF_MAGIC_MULTIPLIER) &&
 	    baud == (port->uartclk/4))
