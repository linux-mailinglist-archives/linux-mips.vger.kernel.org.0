Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F542737F5
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 03:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbgIVBZW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 21:25:22 -0400
Received: from out28-50.mail.aliyun.com ([115.124.28.50]:49989 "EHLO
        out28-50.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgIVBZV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 21:25:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1911304|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0124073-0.000538969-0.987054;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07381;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.IaRRVwp_1600737910;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IaRRVwp_1600737910)
          by smtp.aliyun-inc.com(10.147.41.138);
          Tue, 22 Sep 2020 09:25:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        paul@crapouillou.net, paulburton@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, jiaxun.yang@flygoat.com,
        Sergey.Semin@baikalelectronics.ru, akpm@linux-foundation.org,
        rppt@kernel.org, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 0/3] Repair Ingenic SoCs L2 cache capacity detection.
Date:   Tue, 22 Sep 2020 09:24:41 +0800
Message-Id: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.The X1000E SoC has a 4-way L2 cache with a capacity of 128 KiB.
  The current code cannot detect its correctly, which will cause the
  CU1000-Neo board using the X1000E SoC to report that it has found
  a 5-way 320KiB L2 cache at boot time.
2.The JZ4775 SoC has a 4-way L2 cache with a capacity of 256 KiB.
  The current code cannot detect its correctly, which will cause the
  Mensa board using the JZ4775 SoC to report that it has found a 5-way
  320KiB L2 cache at boot time.

This series of patches is to fix this problem.

v2->v3:
Fix the warning that appears when running checkpatch, add relevant
compatible string.

周琰杰 (Zhou Yanjie) (3):
  dt-bindings: MIPS: Add X2000E based CU2000-Neo.
  MIPS: Ingenic: Add system type for new Ingenic SoCs.
  MIPS: Ingenic: Fix bugs when detecting L2 cache of JZ4775 and X1000E.

 Documentation/devicetree/bindings/mips/ingenic/devices.yaml |  5 +++++
 arch/mips/generic/board-ingenic.c                           | 12 ++++++++++++
 arch/mips/include/asm/bootinfo.h                            |  2 ++
 arch/mips/mm/sc-mips.c                                      |  2 ++
 4 files changed, 21 insertions(+)

-- 
2.11.0

