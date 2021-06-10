Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946563A334F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhFJSkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhFJSkq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:46 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8595DC061574;
        Thu, 10 Jun 2021 11:38:49 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id DFCCA9200C1; Thu, 10 Jun 2021 20:38:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id D97759200BC;
        Thu, 10 Jun 2021 20:38:48 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:48 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] MIPS: Malta: Enable magic multipliers for Super I/O
 UARTs
In-Reply-To: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105182249380.3032@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The SMSC FDC37M817 Super I/O chip has a configuration feature that lets 
it support special UART divisor values of 32770 and 32769 for bit rates 
of 230400 and 460800 bits per second respectively.  Our 8250 driver core 
provides support for these special divisors via the UPF_MAGIC_MULTIPLIER 
flag, and YAMON firmware unconditionally configures the Super I/O chip 
with these divisors enabled as well, so all we need to do in platform 
setup for these bit rates to work is to set the flag.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/mti-malta/malta-platform.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

linux-mips-malta-smsc-uart-magic-multiplier.diff
Index: linux-malta-cbus-uart/arch/mips/mti-malta/malta-platform.c
===================================================================
--- linux-malta-cbus-uart.orig/arch/mips/mti-malta/malta-platform.c
+++ linux-malta-cbus-uart/arch/mips/mti-malta/malta-platform.c
@@ -33,7 +33,8 @@
 	.irq		= int,						\
 	.uartclk	= 1843200,					\
 	.iotype		= UPIO_PORT,					\
-	.flags		= UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,		\
+	.flags		= UPF_BOOT_AUTOCONF | UPF_SKIP_TEST |		\
+			  UPF_MAGIC_MULTIPLIER,				\
 	.regshift	= 0,						\
 }
 
