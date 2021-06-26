Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF43B4CF8
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jun 2021 08:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFZGVM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Jun 2021 02:21:12 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:58676 "EHLO
        out28-170.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhFZGVM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Jun 2021 02:21:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2067372|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0264984-0.000686185-0.972815;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KYGAXY7_1624688322;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KYGAXY7_1624688322)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 26 Jun 2021 14:18:47 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v4 0/5] Misc Ingenic patches.
Date:   Sat, 26 Jun 2021 14:18:36 +0800
Message-Id: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some misc patches that don't really have any relation
between themselves.

周琰杰 (Zhou Yanjie) (5):
  MIPS: X1830: Respect cell count of common properties.
  dt-bindings: clock: Add documentation for MAC PHY control bindings.
  MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
  MIPS: CI20: Reduce clocksource to 750 kHz.
  MIPS: CI20: Add second percpu timer for SMP.

 .../devicetree/bindings/clock/ingenic,cgu.yaml     |  2 ++
 arch/mips/boot/dts/ingenic/ci20.dts                | 24 +++++++++++++---------
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  7 +++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi              | 16 ++++++++++-----
 4 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.7.4

