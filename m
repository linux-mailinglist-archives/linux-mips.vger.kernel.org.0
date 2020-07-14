Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4915321E77B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 07:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgGNFdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 01:33:09 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:60284 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgGNFdJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 01:33:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07881087|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0154259-0.00356313-0.981011;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1QwJ79_1594704779;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1QwJ79_1594704779)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 14 Jul 2020 13:33:04 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, paulburton@kernel.org,
        paul@crapouillou.net, ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 0/5] Add support for Ingenic X1830 SoC and Y&A CU1830-Neo board.
Date:   Tue, 14 Jul 2020 13:32:24 +0800
Message-Id: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v3->v4:
1.Modify the commit message and add the change description
  for CU1000-Neo in patch [2/5].
2.The wrongly written "ingenic,x1000" in compatible is
  changed to "ingenic,x1000e" in "cu1000-neo.dts".
3.Adjust the order of nodes according to the corresponding
  address value for X1000.
4.Drop unnecessary node in "wlan_pwrseq" in "cu1000-neo.dts".
5.Add the leds node to "cu1000-neo.dts".

周琰杰 (Zhou Yanjie) (5):
  MIPS: Ingenic: Add Ingenic X1830 support.
  dt-bindings: MIPS: Add X1830 based CU1830-Neo and fix bug in
    CU1000-Neo.
  MIPS: Ingenic: Add YSH & ATIL CU Neo board support.
  MIPS: Ingenic: Fix bugs and add missing LED node for X1000.
  MIPS: CU1000-Neo: Refresh defconfig to support LED.

 .../devicetree/bindings/mips/ingenic/devices.yaml  |  12 +-
 arch/mips/boot/dts/ingenic/Makefile                |   1 +
 arch/mips/boot/dts/ingenic/cu1000-neo.dts          | 114 ++++----
 arch/mips/boot/dts/ingenic/cu1830-neo.dts          | 168 ++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi              | 126 +++++----
 arch/mips/boot/dts/ingenic/x1830.dtsi              | 300 +++++++++++++++++++++
 arch/mips/configs/cu1000-neo_defconfig             |   4 +
 arch/mips/configs/cu1830-neo_defconfig             | 123 +++++++++
 arch/mips/jz4740/Kconfig                           |  10 +
 9 files changed, 733 insertions(+), 125 deletions(-)
 create mode 100644 arch/mips/boot/dts/ingenic/cu1830-neo.dts
 create mode 100644 arch/mips/boot/dts/ingenic/x1830.dtsi
 create mode 100644 arch/mips/configs/cu1830-neo_defconfig

-- 
2.11.0

