Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424D520A420
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 19:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406798AbgFYRhv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jun 2020 13:37:51 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:40688 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbgFYRhv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Jun 2020 13:37:51 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1705442|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00394338-0.000234983-0.995822;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HsRfZK5_1593106660;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HsRfZK5_1593106660)
          by smtp.aliyun-inc.com(10.147.41.231);
          Fri, 26 Jun 2020 01:37:45 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, paul@crapouillou.net, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, ak@linux.intel.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v2 0/3] Add support for Ingenic X1830 SoC and Y&A CU1830-Neo board.
Date:   Fri, 26 Jun 2020 01:37:13 +0800
Message-Id: <20200625173716.56146-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Add DT node for LED.
2.Update defconfig for LED.

周琰杰 (Zhou Yanjie) (3):
  MIPS: Ingenic: Add Ingenic X1830 support.
  dt-bindings: MIPS: Add Ingenic X1830 based boards.
  MIPS: Ingenic: Add YSH & ATIL CU Neo board support.

 .../devicetree/bindings/mips/ingenic/devices.yaml  |  12 +-
 arch/mips/boot/dts/ingenic/Makefile                |   1 +
 arch/mips/boot/dts/ingenic/cu1830-neo.dts          | 168 ++++++++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi              | 300 +++++++++++++++++++++
 arch/mips/configs/cu1830-neo_defconfig             | 123 +++++++++
 arch/mips/jz4740/Kconfig                           |  10 +
 6 files changed, 611 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/boot/dts/ingenic/cu1830-neo.dts
 create mode 100755 arch/mips/boot/dts/ingenic/x1830.dtsi
 create mode 100644 arch/mips/configs/cu1830-neo_defconfig

-- 
2.11.0



