Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8F11D9A0D
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 16:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgESOgx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 10:36:53 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:54535 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgESOgx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 10:36:53 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09424746|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0516057-0.000741994-0.947652;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03296;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.HalgxFh_1589898954;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HalgxFh_1589898954)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 19 May 2020 22:36:19 +0800
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
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v8 0/6] Introduce SMP support for CI20 (based on JZ4780).
Date:   Tue, 19 May 2020 22:35:17 +0800
Message-Id: <1589898923-60048-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
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

