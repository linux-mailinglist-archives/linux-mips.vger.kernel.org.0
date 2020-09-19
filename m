Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729EC270DA5
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 13:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgISLj5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 07:39:57 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:33436 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISLj5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 07:39:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2629207|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0103773-0.000517928-0.989105;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.IZIG6YS_1600515567;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IZIG6YS_1600515567)
          by smtp.aliyun-inc.com(10.147.40.7);
          Sat, 19 Sep 2020 19:39:54 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 0/1] Add CPU nodes for Ingenic SoCs.
Date:   Sat, 19 Sep 2020 19:38:58 +0800
Message-Id: <20200919113859.88566-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add 'cpus' node to the jz4725b.dtsi, jz4740.dtsi, jz4770.dtsi,
jz4780.dtsi, x1000.dtsi, and x1830.dtsi files. This will be
used in the SMP driver later.

周琰杰 (Zhou Yanjie) (1):
  MIPS: Ingenic: Add CPU nodes for Ingenic SoCs.

 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/jz4740.dtsi  | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi  | 15 ++++++++++++++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi  | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi   | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi   | 14 ++++++++++++++
 6 files changed, 93 insertions(+), 1 deletion(-)

-- 
2.11.0

