Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E3D1D1DDC
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 20:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390290AbgEMSrB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 14:47:01 -0400
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:60882 "EHLO
        out28-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390215AbgEMSq7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 14:46:59 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0932661|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0516057-0.000741994-0.947652;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03309;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.HY8LAU0_1589395602;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HY8LAU0_1589395602)
          by smtp.aliyun-inc.com(10.147.44.118);
          Thu, 14 May 2020 02:46:54 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, tglx@linutronix.de,
        robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v7 0/6] Introduce SMP support for CI20 (based on JZ4780).
Date:   Thu, 14 May 2020 02:46:11 +0800
Message-Id: <1589395578-87441-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589395578-87441-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1589395578-87441-1-git-send-email-zhouyanjie@wanyeetech.com>
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
  MIPS: CI20: Modify DTS to support high resolution timer for SMP.
  clocksource: Ingenic: Add high resolution timer support for SMP.
  dt-bindings: MIPS: Document Ingenic SoCs binding.
  MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
  MIPS: CI20: Update defconfig to support SMP.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         |  57 +++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  11 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |  14 ++
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |  15 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  23 ++
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  14 ++
 arch/mips/configs/ci20_defconfig                   |   2 +
 arch/mips/include/asm/mach-jz4740/smp.h            |  87 +++++++
 arch/mips/jz4740/Kconfig                           |   2 +
 arch/mips/jz4740/Makefile                          |   5 +
 arch/mips/jz4740/prom.c                            |   4 +
 arch/mips/jz4740/smp-entry.S                       |  57 +++++
 arch/mips/jz4740/smp.c                             | 258 +++++++++++++++++++++
 arch/mips/kernel/idle.c                            |  35 ++-
 drivers/clocksource/ingenic-timer.c                | 103 ++++++--
 15 files changed, 661 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 create mode 100644 arch/mips/include/asm/mach-jz4740/smp.h
 create mode 100644 arch/mips/jz4740/smp-entry.S
 create mode 100644 arch/mips/jz4740/smp.c

-- 
2.7.4

