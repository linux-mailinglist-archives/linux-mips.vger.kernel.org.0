Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675E1270DE9
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 14:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgISMpU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 08:45:20 -0400
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:47905 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgISMpU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 08:45:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2281876|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0238255-0.00364275-0.972532;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03273;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.IZJIYjg_1600519505;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IZJIYjg_1600519505)
          by smtp.aliyun-inc.com(10.147.42.198);
          Sat, 19 Sep 2020 20:45:15 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     paulburton@kernel.org, tsbogend@alpha.franken.de,
        paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, rppt@kernel.org,
        Sergey.Semin@baikalelectronics.ru,
        Alexey.Malahov@baikalelectronics.ru, akpm@linux-foundation.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 0/2] Repair X1000E SoC L2 cache capacity detection.
Date:   Sat, 19 Sep 2020 20:44:35 +0800
Message-Id: <20200919124437.89576-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The X1000E SoC has a 4-way L2 cache with a capacity of 128 KiB.
The current code cannot detect its correctly, which will cause
the CU1000-Neo board using the X1000E SoC to report that it
has found a 5-way 320KiB L2 cache at boot time. This series
of patches is to fix this problem.

周琰杰 (Zhou Yanjie) (2):
  MIPS: X1000E: Add X1000E system type.
  MIPS: Ingenic: Fix bugs when detecting X1000E's L2 cache.

 arch/mips/generic/board-ingenic.c | 3 +++
 arch/mips/include/asm/bootinfo.h  | 1 +
 arch/mips/mm/sc-mips.c            | 1 +
 3 files changed, 5 insertions(+)

-- 
2.11.0

