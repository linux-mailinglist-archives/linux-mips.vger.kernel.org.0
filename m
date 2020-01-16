Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4EF13F265
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 19:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391748AbgAPSfH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 13:35:07 -0500
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:50957 "EHLO
        out28-124.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391772AbgAPRYc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 12:24:32 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.105592|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.472206-0.094855-0.432939;DS=CONTINUE|ham_system_inform|0.0665485-0.00033466-0.933117;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03308;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GdEQRsw_1579195452;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GdEQRsw_1579195452)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 17 Jan 2020 01:24:19 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mips-creator-ci20-dev@googlegroups.com, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com, hns@goldelico.com, paul@boddie.org.uk
Subject: [PATCH v2 0/6] Introduce SMP support for JZ4780.
Date:   Fri, 17 Jan 2020 01:23:43 +0800
Message-Id: <1579195429-59828-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
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

 .../bindings/mips/ingenic/ingenic,cpu.yaml         |  53 ++++
 .../bindings/mips/ingenic/ingenic,soc,yaml         |  35 +++
 arch/mips/boot/dts/ingenic/ci20.dts                |  11 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |  14 +
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |  15 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  23 ++
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  14 +
 arch/mips/configs/ci20_defconfig                   |   2 +
 arch/mips/include/asm/mach-jz4740/jz4780-smp.h     |  98 +++++++
 arch/mips/jz4740/Kconfig                           |   3 +
 arch/mips/jz4740/Makefile                          |   5 +
 arch/mips/jz4740/prom.c                            |   4 +
 arch/mips/jz4740/smp-entry.S                       |  57 ++++
 arch/mips/jz4740/smp.c                             | 305 +++++++++++++++++++++
 arch/mips/kernel/idle.c                            |  14 +-
 drivers/clocksource/ingenic-timer.c                | 201 +++++++++-----
 16 files changed, 784 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml
 create mode 100644 arch/mips/include/asm/mach-jz4740/jz4780-smp.h
 create mode 100644 arch/mips/jz4740/smp-entry.S
 create mode 100644 arch/mips/jz4740/smp.c

-- 
2.7.4

