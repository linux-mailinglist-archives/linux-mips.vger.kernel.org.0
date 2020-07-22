Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E75228F98
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 07:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgGVFVz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 01:21:55 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:56698 "EHLO
        out28-4.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVFVz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jul 2020 01:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09120598|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0403786-0.000297528-0.959324;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03268;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.I5hMDsk_1595395304;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I5hMDsk_1595395304)
          by smtp.aliyun-inc.com(10.147.41.143);
          Wed, 22 Jul 2020 13:21:49 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        paulburton@kernel.org, jiaxun.yang@flygoat.com,
        Sergey.Semin@baikalelectronics.ru, chenhc@lemote.com,
        Alexey.Malahov@baikalelectronics.ru, huanglllzu@gmail.com,
        prasannatsmkumar@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 0/1] MIPS: X2000: Add X2000 system type.
Date:   Wed, 22 Jul 2020 13:21:18 +0800
Message-Id: <20200722052119.60129-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add "PRID_COMP_INGENIC_13" and "PRID_IMP_XBURST2" for X2000.
2.Add X2000 system type for cat /proc/cpuinfo to give out X2000.

周琰杰 (Zhou Yanjie) (1):
  MIPS: X2000: Add X2000 system type.

 arch/mips/include/asm/bootinfo.h |  1 +
 arch/mips/include/asm/cpu.h      |  6 ++++--
 arch/mips/jz4740/setup.c         |  4 ++++
 arch/mips/kernel/cpu-probe.c     | 11 +++++++++++
 4 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.11.0

