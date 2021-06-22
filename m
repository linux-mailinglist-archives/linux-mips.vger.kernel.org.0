Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD53B09A8
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 17:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhFVP6Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 11:58:16 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:44284 "EHLO
        out28-149.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhFVP6P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 11:58:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2170169|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0649628-0.00117631-0.933861;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047202;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KWKjI6A_1624377348;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KWKjI6A_1624377348)
          by smtp.aliyun-inc.com(10.147.41.178);
          Tue, 22 Jun 2021 23:55:56 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v2 0/3] Misc Ingenic patches.
Date:   Tue, 22 Jun 2021 23:55:35 +0800
Message-Id: <1624377338-75384-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some misc patches that don't really have any relation
between themselves.

周琰杰 (Zhou Yanjie) (3):
  MIPS: X1830: Respect cell count of common properties.
  MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
  MIPS: CI20: Add second percpu timer for SMP.

 arch/mips/boot/dts/ingenic/ci20.dts   | 21 +++++++++++----------
 arch/mips/boot/dts/ingenic/x1000.dtsi |  7 +++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi | 16 +++++++++++-----
 3 files changed, 29 insertions(+), 15 deletions(-)

-- 
2.7.4

