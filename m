Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1CD39BD25
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 18:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFDQdq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 12:33:46 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:35052 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFDQdq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 12:33:46 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1285712|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.134015-0.0015477-0.864438;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.KNfnAp8_1622824309;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KNfnAp8_1622824309)
          by smtp.aliyun-inc.com(10.147.41.138);
          Sat, 05 Jun 2021 00:31:56 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tglx@linutronix.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
Subject: Add SMP/SMT support for sysost driver.
Date:   Sat,  5 Jun 2021 00:31:44 +0800
Message-Id: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.split changes about x1000 and array name to separate patch.
2.Fix bug in ingenic_ost_global_timer_recalc_rate().
3.Add a backpointer to the ingenic_ost structure.
4.Remove unnecessary spinlock.
5.Use "ret = ost->irq" instead "ret = -EINVAL".
6.Use "%d" instead "%x" in pr_crit().

周琰杰 (Zhou Yanjie) (2):
  clocksource: Ingenic: Rename unreasonable array names.
  clocksource: Ingenic: Add SMP/SMT support for sysost driver.

 drivers/clocksource/ingenic-sysost.c | 323 ++++++++++++++++++++++++++---------
 1 file changed, 240 insertions(+), 83 deletions(-)

-- 
2.7.4

