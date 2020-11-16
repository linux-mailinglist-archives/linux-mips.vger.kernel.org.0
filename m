Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7B72B4E9F
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 18:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733131AbgKPRzv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 12:55:51 -0500
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:36623 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731834AbgKPRzv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Nov 2020 12:55:51 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1074946|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00753304-0.000259329-0.992208;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=18;RT=18;SR=0;TI=SMTPD_---.IxVP79y_1605549334;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IxVP79y_1605549334)
          by smtp.aliyun-inc.com(10.147.41.121);
          Tue, 17 Nov 2020 01:55:46 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ak@linux.intel.com, krzk@kernel.org,
        ebiederm@xmission.com, hns@goldelico.com, paulburton@kernel.org,
        nixiaoming@huawei.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v2 0/2] Add missing nodes and refresh defconfig for Ingenic SoCs based boards.
Date:   Tue, 17 Nov 2020 01:55:06 +0800
Message-Id: <20201116175508.51943-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Add the otg_power node for otg_phy's vcc_supply.
2.Move assigned-clocks in the otg node into the cgu node.
3.Move the position of the SSI node.
4.Select CONFIG_JZ4780_EFUSE as default.

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards.
  MIPS: Ingenic: Refresh defconfig for Ingenic SoCs based boards.

 arch/mips/boot/dts/ingenic/ci20.dts       | 45 +++++++++++++++++++--
 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 62 ++++++++++++++++++++++++++---
 arch/mips/boot/dts/ingenic/cu1830-neo.dts | 66 ++++++++++++++++++++++++++++---
 arch/mips/boot/dts/ingenic/jz4780.dtsi    | 45 ++++++++++++++++++++-
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 56 +++++++++++++++++++++++++-
 arch/mips/boot/dts/ingenic/x1830.dtsi     | 58 ++++++++++++++++++++++++++-
 arch/mips/configs/ci20_defconfig          | 15 ++++++-
 arch/mips/configs/cu1000-neo_defconfig    | 28 ++++++++++---
 arch/mips/configs/cu1830-neo_defconfig    | 32 +++++++++++----
 9 files changed, 374 insertions(+), 33 deletions(-)

-- 
2.11.0

