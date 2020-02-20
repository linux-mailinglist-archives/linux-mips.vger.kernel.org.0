Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38A7166264
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 17:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgBTQZf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 11:25:35 -0500
Received: from out28-50.mail.aliyun.com ([115.124.28.50]:51642 "EHLO
        out28-50.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgBTQZf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 11:25:35 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08671962|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.640847-0.0610775-0.298076;DS=CONTINUE|ham_system_inform|0.0567998-0.00111282-0.942087;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07440;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GqC0FCl_1582215911;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GqC0FCl_1582215911)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 21 Feb 2020 00:25:21 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        geert+renesas@glider.be, krzk@kernel.org, ebiederm@xmission.com,
        miquel.raynal@bootlin.com, keescook@chromium.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH v6 0/7] Introduce SMP support for CI20 (based on JZ4780).
Date:   Fri, 21 Feb 2020 00:24:42 +0800
Message-Id: <1582215889-113034-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce SMP support for MIPS Creator CI20, which is
based on Ingenic JZ4780 SoC.

周琰杰 (Zhou Yanjie) (7):
  clk: JZ4780: Add function for enable the second core.
  MIPS: JZ4780: Introduce SMP support.
  MIPS: CI20: Modify DTS to support high resolution timer for SMP.
  clocksource: Ingenic: Add high resolution timer support for SMP.
  dt-bindings: MIPS: Document Ingenic SoCs binding.
  MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
  MIPS: CI20: Update defconfig to support SMP.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         |  61 +++++
 .../bindings/mips/ingenic/ingenic,soc.yaml         |  34 +++
 arch/mips/boot/dts/ingenic/ci20.dts                |  13 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |  14 ++
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |  15 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  23 ++
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  14 ++
 arch/mips/configs/ci20_defconfig                   |   2 +
 arch/mips/include/asm/mach-jz4740/smp.h            |  81 +++++++
 arch/mips/jz4740/Kconfig                           |   3 +
 arch/mips/jz4740/Makefile                          |   5 +
 arch/mips/jz4740/prom.c                            |   4 +
 arch/mips/jz4740/smp-entry.S                       |  57 +++++
 arch/mips/jz4740/smp.c                             | 254 +++++++++++++++++++++
 arch/mips/kernel/idle.c                            |  36 ++-
 drivers/clk/ingenic/jz4780-cgu.c                   |  55 ++++-
 drivers/clocksource/ingenic-timer.c                | 113 +++++++--
 17 files changed, 752 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
 create mode 100644 arch/mips/include/asm/mach-jz4740/smp.h
 create mode 100644 arch/mips/jz4740/smp-entry.S
 create mode 100644 arch/mips/jz4740/smp.c

-- 
2.7.4

