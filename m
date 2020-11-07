Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A082AA4CA
	for <lists+linux-mips@lfdr.de>; Sat,  7 Nov 2020 12:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgKGLxb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Nov 2020 06:53:31 -0500
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:59889 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgKGLxb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 7 Nov 2020 06:53:31 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1092978|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0151795-0.000579364-0.984241;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047204;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=18;RT=18;SR=0;TI=SMTPD_---.ItnO01s_1604749999;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.ItnO01s_1604749999)
          by smtp.aliyun-inc.com(10.147.41.231);
          Sat, 07 Nov 2020 19:53:25 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, nixiaoming@huawei.com,
        paulburton@kernel.org, krzk@kernel.org, hns@goldelico.com,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 0/2] Add missing nodes and refresh defconfig for Ingenic SoCs based boards.
Date:   Sat,  7 Nov 2020 19:52:49 +0800
Message-Id: <20201107115251.86182-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add missing nodes for Ingenic SoCs and Ingenic SoCs based boards.
2.Refresh defconfig for Ingenic SoCs based boards.

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards.
  MIPS: Ingenic: Refresh defconfig for Ingenic SoCs based boards.

 arch/mips/boot/dts/ingenic/ci20.dts       | 16 +++++++++
 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 60 +++++++++++++++++++++++++++----
 arch/mips/boot/dts/ingenic/cu1830-neo.dts | 60 +++++++++++++++++++++++++++----
 arch/mips/boot/dts/ingenic/jz4780.dtsi    | 41 +++++++++++++++++++--
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 52 ++++++++++++++++++++++++++-
 arch/mips/boot/dts/ingenic/x1830.dtsi     | 54 +++++++++++++++++++++++++++-
 arch/mips/configs/ci20_defconfig          | 14 ++++++--
 arch/mips/configs/cu1000-neo_defconfig    | 28 ++++++++++++---
 arch/mips/configs/cu1830-neo_defconfig    | 32 +++++++++++++----
 9 files changed, 327 insertions(+), 30 deletions(-)

-- 
2.11.0

