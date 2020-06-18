Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C54E1FDCF6
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 03:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbgFRBWx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 21:22:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730850AbgFRBWv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jun 2020 21:22:51 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A066020B1F;
        Thu, 18 Jun 2020 01:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443370;
        bh=Eq1DcpXNBEZu/BqwZzcK+uB2YIFarNYs5ivrXYLr4uU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ESi6GQCCQBMA/Crc6rCGnoKGZO/PQsOupHh42boP8MfuWeVhEyN0U3awrkRFt6vnZ
         /fx4NxDfTFg9y5sJqfRIgVKjVgKwz0PFglKmFFAnzMrfqvM2LeLkJPPZsapHA89+Ej
         uAf45wkj0e16cTKMIw3YKM/vvxyX17Yumu4kq/W4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Long Cheng <long.cheng@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-serial@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 024/172] serial: 8250: Fix max baud limit in generic 8250 port
Date:   Wed, 17 Jun 2020 21:19:50 -0400
Message-Id: <20200618012218.607130-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

[ Upstream commit 7b668c064ec33f3d687c3a413d05e355172e6c92 ]

Standard 8250 UART ports are designed in a way so they can communicate
with baud rates up to 1/16 of a reference frequency. It's expected from
most of the currently supported UART controllers. That's why the former
version of serial8250_get_baud_rate() method called uart_get_baud_rate()
with min and max baud rates passed as (port->uartclk / 16 / UART_DIV_MAX)
and ((port->uartclk + tolerance) / 16) respectively. Doing otherwise, like
it was suggested in commit ("serial: 8250_mtk: support big baud rate."),
caused acceptance of bauds, which was higher than the normal UART
controllers actually supported. As a result if some user-space program
requested to set a baud greater than (uartclk / 16) it would have been
permitted without truncation, but then serial8250_get_divisor(baud)
(which calls uart_get_divisor() to get the reference clock divisor) would
have returned a zero divisor. Setting zero divisor will cause an
unpredictable effect varying from chip to chip. In case of DW APB UART the
communications just stop.

Lets fix this problem by getting back the limitation of (uartclk +
tolerance) / 16 maximum baud supported by the generic 8250 port. Mediatek
8250 UART ports driver developer shouldn't have touched it in the first
place  notably seeing he already provided a custom version of set_termios()
callback in that glue-driver which took into account the extended baud
rate values and accordingly updated the standard and vendor-specific
divisor latch registers anyway.

Fixes: 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Long Cheng <long.cheng@mediatek.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Link: https://lore.kernel.org/r/20200506233136.11842-2-Sergey.Semin@baikalelectronics.ru
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/8250/8250_port.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 5a04d4ddca73..20b799219826 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2628,6 +2628,8 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
 					     struct ktermios *termios,
 					     struct ktermios *old)
 {
+	unsigned int tolerance = port->uartclk / 100;
+
 	/*
 	 * Ask the core to calculate the divisor for us.
 	 * Allow 1% tolerance at the upper limit so uart clks marginally
@@ -2636,7 +2638,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
 	 */
 	return uart_get_baud_rate(port, termios, old,
 				  port->uartclk / 16 / UART_DIV_MAX,
-				  port->uartclk);
+				  (port->uartclk + tolerance) / 16);
 }
 
 void
-- 
2.25.1

