Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35AD1EA3C7
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 14:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgFAMWC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 08:22:02 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:50164 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbgFAMVh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 08:21:37 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2F3908030725;
        Mon,  1 Jun 2020 12:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AoIO7QRmanTE; Mon,  1 Jun 2020 15:21:31 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/6] bus: cdmm: Add MIPS R5 arch support
Date:   Mon, 1 Jun 2020 15:21:20 +0300
Message-ID: <20200601122121.15809-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CDMM may be available not only on MIPS R2 architectures, but also on
newer MIPS R5 chips. For instance our P5600 chip has one. Let's mark
the CDMM bus being supported for that MIPS arch too.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 6d4e4497b59b..971c07bc92d4 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -58,7 +58,7 @@ config IMX_WEIM
 
 config MIPS_CDMM
 	bool "MIPS Common Device Memory Map (CDMM) Driver"
-	depends on CPU_MIPSR2
+	depends on CPU_MIPSR2 || CPU_MIPSR5
 	help
 	  Driver needed for the MIPS Common Device Memory Map bus in MIPS
 	  cores. This bus is for per-CPU tightly coupled devices such as the
-- 
2.26.2

