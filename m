Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCD0224163
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 19:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGQRAW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 13:00:22 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:48346 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgGQRAV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 13:00:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1720105|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0127948-0.000455309-0.98675;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.I3U5VZp_1595005212;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I3U5VZp_1595005212)
          by smtp.aliyun-inc.com(10.147.41.121);
          Sat, 18 Jul 2020 01:00:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tsbogend@alpha.franken.de,
        robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH v7 0/5] Add support for the OST in Ingenic X1000.
Date:   Sat, 18 Jul 2020 00:59:42 +0800
Message-Id: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v6->v7:
1.Remove "default MACH_INGENIC" and make option silent.
2.Enable the corresponding driver in the platform's Kconfig.
3.Update DT of X1000 and X1830, use SYSOST instead of TCU
  to provide clocksource and clockevent.

周琰杰 (Zhou Yanjie) (5):
  dt-bindings: timer: Add Ingenic X1000 OST bindings.
  clocksource: Ingenic: Add support for the Ingenic X1000 OST.
  MIPS: Ingenic: Let the Kconfig of platform enable the clocksource
    driver.
  MIPS: X1000: Use SYSOST instead of TCU to provide clocksource.
  MIPS: X1830: Use SYSOST instead of TCU to provide clocksource.

 .../devicetree/bindings/timer/ingenic,sysost.yaml  |  63 +++
 arch/mips/boot/dts/ingenic/cu1000-neo.dts          |   9 +-
 arch/mips/boot/dts/ingenic/cu1830-neo.dts          |   9 +-
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  16 +
 arch/mips/boot/dts/ingenic/x1830.dtsi              |  16 +
 arch/mips/jz4740/Kconfig                           |   7 +
 drivers/clocksource/Kconfig                        |  15 +-
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/ingenic-sysost.c               | 539 +++++++++++++++++++++
 include/dt-bindings/clock/ingenic,sysost.h         |  12 +
 10 files changed, 672 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ingenic,sysost.yaml
 create mode 100644 drivers/clocksource/ingenic-sysost.c
 create mode 100644 include/dt-bindings/clock/ingenic,sysost.h

-- 
2.11.0

