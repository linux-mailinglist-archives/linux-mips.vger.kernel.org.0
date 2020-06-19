Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BF9201DD1
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 00:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgFSWLW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 18:11:22 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:48381 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728906AbgFSWLW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 18:11:22 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1879015|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00592788-0.0025966-0.991476;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16367;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HpPfw4y_1592604655;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HpPfw4y_1592604655)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sat, 20 Jun 2020 06:11:18 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com,
        tsbogend@alpha.franken.de, ak@linux.intel.com,
        keescook@chromium.org, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 0/3] Add support for Ingenic X1830 SoC and Y&A CU1830-Neo board.
Date:   Sat, 20 Jun 2020 06:10:28 +0800
Message-Id: <20200619221031.33558-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add support for Ingenic X1830 SoC.
2.Add support for CU1830-Neo development board. CU1830-Neo is a development
  board using Ingenic X1830 SoC. It comes with 128MiB of RAM. 

周琰杰 (Zhou Yanjie) (3):
  MIPS: Ingenic: Add Ingenic X1830 support.
  dt-bindings: MIPS: Add Ingenic X1830 based boards.
  MIPS: Ingenic: Add YSH & ATIL CU Neo board support.

 .../devicetree/bindings/mips/ingenic/devices.yaml  |  12 +-
 arch/mips/boot/dts/ingenic/Makefile                |   1 +
 arch/mips/boot/dts/ingenic/cu1830-neo.dts          | 160 +++++++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi              | 299 +++++++++++++++++++++
 arch/mips/configs/cu1830-neo_defconfig             | 119 ++++++++
 arch/mips/jz4740/Kconfig                           |  10 +
 6 files changed, 598 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/boot/dts/ingenic/cu1830-neo.dts
 create mode 100755 arch/mips/boot/dts/ingenic/x1830.dtsi
 create mode 100644 arch/mips/configs/cu1830-neo_defconfig

-- 
2.11.0



