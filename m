Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCDEF11F855
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 16:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfLOPVy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 10:21:54 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:37789 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfLOPVx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 10:21:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3683314|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.037194-0.000191077-0.962615;DS=CONTINUE|ham_system_inform|0.267556-0.000569135-0.731875;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07389;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GHej-BA_1576423303;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHej-BA_1576423303)
          by smtp.aliyun-inc.com(10.147.42.22);
          Sun, 15 Dec 2019 23:21:49 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Add support for the X1830 v4.
Date:   Sun, 15 Dec 2019 23:21:32 +0800
Message-Id: <1576423297-12710-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v3->v4:
1.Remove the spinlock around ingenic_cgu_gate_get().
2.Merge [3/5] in v3 into [2/4] in v4.

