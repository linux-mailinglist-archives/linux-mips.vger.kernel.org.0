Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C342913969E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 17:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgAMQoT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 11:44:19 -0500
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:45419 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMQoT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 11:44:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1069409|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.492603-0.0599459-0.447451;DS=CONTINUE|ham_system_inform|0.0415556-0.000420485-0.958024;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03312;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GbRhA7M_1578933839;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GbRhA7M_1578933839)
          by smtp.aliyun-inc.com(10.147.40.233);
          Tue, 14 Jan 2020 00:44:08 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, miquel.raynal@bootlin.com, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, daniel.lezcano@linaro.org,
        ebiederm@xmission.com, keescook@chromium.org, ak@linux.intel.com,
        krzk@kernel.org, paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 0/6] Introduce SMP support for JZ4780.
Date:   Tue, 14 Jan 2020 00:43:27 +0800
Message-Id: <1578933813-80122-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <Introduce SMP support for CI20 (based on JZ4780).>
 <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce SMP support for MIPS Creator CI20, which is
based on Ingenic JZ4780 SoC.

周琰杰 (Zhou Yanjie) (6):
  MIPS: JZ4780: Introduce SMP support.
  clocksource: Ingenic: Add high resolution timer support for SMP.
  dt-bindings: MIPS: Document Ingenic SoCs binding.
  MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
  MIPS: CI20: Modify DTS to support high resolution timer for SMP.
  MIPS: CI20: Update defconfig to support SMP.

 .../bindings/mips/ingenic/ingenic,cpu.txt          |  32 +++
 .../bindings/mips/ingenic/ingenic,soc,txt          |  18 ++
 arch/mips/boot/dts/ingenic/ci20.dts                |  11 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |  14 +
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |  15 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  23 ++
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  14 +
 arch/mips/configs/ci20_defconfig                   |   2 +
 arch/mips/include/asm/mach-jz4740/jz4780-smp.h     |  91 +++++++
 arch/mips/jz4740/Kconfig                           |   3 +
 arch/mips/jz4740/Makefile                          |   5 +
 arch/mips/jz4740/prom.c                            |   4 +
 arch/mips/jz4740/smp-entry.S                       |  57 ++++
 arch/mips/jz4740/smp.c                             | 300 +++++++++++++++++++++
 arch/mips/kernel/idle.c                            |  14 +-
 drivers/clocksource/ingenic-timer.c                | 114 ++++++--
 drivers/irqchip/irq-ingenic.c                      |  21 ++
 17 files changed, 713 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt
 create mode 100644 arch/mips/include/asm/mach-jz4740/jz4780-smp.h
 create mode 100644 arch/mips/jz4740/smp-entry.S
 create mode 100644 arch/mips/jz4740/smp.c

-- 
2.7.4

