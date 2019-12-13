Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3B7B11E65E
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 16:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbfLMPVi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 10:21:38 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:40797 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfLMPVh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Dec 2019 10:21:37 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2854059|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.577685-0.041398-0.380917;DS=CONTINUE|ham_regular_dialog|0.0169658-0.000813417-0.982221;FP=12603621234358998248|1|1|1|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GGSxanS_1576250475;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GGSxanS_1576250475)
          by smtp.aliyun-inc.com(10.147.40.233);
          Fri, 13 Dec 2019 23:21:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v2 0/5] clk: Ingenic: Add support for the X1830 v2
Date:   Fri, 13 Dec 2019 23:21:07 +0800
Message-Id: <1576250472-124315-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Use two fields (pll_reg & bypass_reg) instead of the 2-values
  array (reg[2]).
2.Remove the "pll_info->version" and add a "pll_info->rate_multiplier".
3.Fix the coding style and add more detailed commit message.
4.Remove [4/5] and [5/5] in v1, because some problems were found in
  subsequent tests.
5.Remove unnecessary spinlock as Paul Burton and Paul Cercueil's suggestion.
6.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
  to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
  the old mailbox is in an unstable state.

周琰杰 (Zhou Yanjie) (5):
  clk: Ingenic: Adjust cgu code to make it compatible with X1830.
  clk: Ingenic: Adjust code to make it compatible with new cgu code.
  dt-bindings: clock: Add X1830 bindings.
  clk: Ingenic: Add CGU driver for X1830.
  clk: Ingenic: Remove unnecessary spinlock when reading registers.

 .../devicetree/bindings/clock/ingenic,cgu.txt      |   1 +
 drivers/clk/ingenic/Kconfig                        |  10 +
 drivers/clk/ingenic/Makefile                       |   1 +
 drivers/clk/ingenic/cgu.c                          |  36 +--
 drivers/clk/ingenic/cgu.h                          |   8 +-
 drivers/clk/ingenic/jz4725b-cgu.c                  |   4 +-
 drivers/clk/ingenic/jz4740-cgu.c                   |   4 +-
 drivers/clk/ingenic/jz4770-cgu.c                   |   8 +-
 drivers/clk/ingenic/jz4780-cgu.c                   |   4 +-
 drivers/clk/ingenic/x1000-cgu.c                    |   8 +-
 drivers/clk/ingenic/x1830-cgu.c                    | 340 +++++++++++++++++++++
 include/dt-bindings/clock/x1830-cgu.h              |  46 +++
 12 files changed, 444 insertions(+), 26 deletions(-)
 create mode 100644 drivers/clk/ingenic/x1830-cgu.c
 create mode 100644 include/dt-bindings/clock/x1830-cgu.h

-- 
2.7.4

