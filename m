Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097C21DC443
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgEUAx6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:53:58 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33434 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgEUAx6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:53:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 70BB3803078F;
        Thu, 21 May 2020 00:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Yuu6eoyPKelo; Thu, 21 May 2020 03:53:54 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/7] dt-bindings: timer: Move snps,dw-apb-timer DT schema from rtc
Date:   Thu, 21 May 2020 03:53:15 +0300
Message-ID: <20200521005321.12129-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This binding file doesn't belong to the rtc seeing it's a pure timer
with no rtc facilities like days/months/years counting and alarms.
So move the YAML-file to the Documentation/devicetree/bindings/timer/
directory.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org
---
 .../devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml (96%)

diff --git a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
rename to Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index 002fe1ee709b..5d300efdf0ca 100644
--- a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/rtc/snps,dw-apb-timer.yaml#
+$id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Synopsys DesignWare APB Timer
-- 
2.25.1

