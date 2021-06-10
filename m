Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D053B3A333A
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhFJSkD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhFJSkC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:02 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B630C061574;
        Thu, 10 Jun 2021 11:38:06 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 69FF29200B4; Thu, 10 Jun 2021 20:38:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 62F9D92009B;
        Thu, 10 Jun 2021 20:38:03 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:03 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] serial: 8250: Mask out floating 16/32-bit bus bits
In-Reply-To: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make sure only actual 8 bits of the IIR register are used in determining
the port type in `autoconfig'.

The `serial_in' port accessor returns the `unsigned int' type, meaning 
that with UPIO_AU, UPIO_MEM16, UPIO_MEM32, and UPIO_MEM32BE access types 
more than 8 bits of data are returned, of which the high order bits will 
often come from bus lines that are left floating in the data phase.  For 
example with the MIPS Malta board's CBUS UART, where the registers are 
aligned on 8-byte boundaries and which uses 32-bit accesses, data as 
follows is returned:

YAMON> dump -32 0xbf000900 0x40

BF000900: 1F000942 1F000942 1F000900 1F000900  ...B...B........
BF000910: 1F000901 1F000901 1F000900 1F000900  ................
BF000920: 1F000900 1F000900 1F000960 1F000960  ...........`...`
BF000930: 1F000900 1F000900 1F0009FF 1F0009FF  ................

YAMON> 

Evidently high-order 24 bits return values previously driven in the 
address phase (the 3 highest order address bits used with the command 
above are masked out in the simple virtual address mapping used here and 
come out at zeros on the external bus), a common scenario with bus lines 
left floating, due to bus capacitance.

Consequently when the value of IIR, mapped at 0x1f000910, is retrieved 
in `autoconfig', it comes out at 0x1f0009c1 and when it is right-shifted 
by 6 and then assigned to 8-bit `scratch' variable, the value calculated 
is 0x27, not one of 0, 1, 2, 3 expected in port type determination.

Fix the issue then, by assigning the value returned from `serial_in' to 
`scratch' first, which masks out 24 high-order bits retrieved, and only 
then right-shift the resulting 8-bit data quantity, producing the value 
of 3 in this case, as expected.  Fix the same issue in `serial_dl_read'.

The problem first appeared with Linux 2.6.9-rc3 which predates our repo 
history, but the origin could be identified with the old MIPS/Linux repo 
also at: <git://git.kernel.org/pub/scm/linux/kernel/git/ralf/linux.git> 
as commit e0d2356c0777 ("Merge with Linux 2.6.9-rc3."), where code in
`serial_in' was updated with this case:

+	case UPIO_MEM32:
+		return readl(up->port.membase + offset);
+

which made it produce results outside the unsigned 8-bit range for the 
first time, though obviously it is system dependent what actual values 
appear in the high order bits retrieved and it may well have been zeros 
in the relevant positions with the system the change originally was 
intended for.  It is at that point that code in `autoconf' should have 
been updated accordingly, but clearly it was overlooked.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
 drivers/tty/serial/8250/8250_port.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

linux-serial-8250-floating-bus-mask.diff
Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
===================================================================
--- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_port.c
+++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_port.c
@@ -311,7 +311,10 @@ static const struct serial8250_config ua
 /* Uart divisor latch read */
 static int default_serial_dl_read(struct uart_8250_port *up)
 {
-	return serial_in(up, UART_DLL) | serial_in(up, UART_DLM) << 8;
+	unsigned char dll = serial_in(up, UART_DLL);
+	unsigned char dlm = serial_in(up, UART_DLM);
+
+	return dll | dlm << 8;
 }
 
 /* Uart divisor latch write */
@@ -1297,9 +1300,9 @@ static void autoconfig(struct uart_8250_
 	serial_out(up, UART_LCR, 0);
 
 	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
-	scratch = serial_in(up, UART_IIR) >> 6;
+	scratch = serial_in(up, UART_IIR);
 
-	switch (scratch) {
+	switch (scratch >> 6) {
 	case 0:
 		autoconfig_8250(up);
 		break;
