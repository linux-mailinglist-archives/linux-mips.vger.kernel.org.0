Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E3811AB4F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2019 13:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfLKMvL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Dec 2019 07:51:11 -0500
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:57689 "EHLO
        out28-51.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbfLKMvK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Dec 2019 07:51:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2520508|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.170358-0.00467259-0.82497;DS=CONTINUE|ham_system_inform|0.104135-0.000732415-0.895133;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07423;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GF0GTgF_1576068628;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GF0GTgF_1576068628)
          by smtp.aliyun-inc.com(10.147.40.200);
          Wed, 11 Dec 2019 20:50:36 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        zhenwenjin@gmail.com, sernia.zhou@foxmail.com
Subject: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v7
Date:   Wed, 11 Dec 2019 20:50:21 +0800
Message-Id: <1576068625-125234-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v6->v7:
1.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
  to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
  the old mailbox is in an unstable state.
2.Add "ingenic_chip_info.reg_offset", use it instead of having
  hardcoded, and add "PZ_BASE()" / "PZ_GID2LD()" macros, use it
  with "ingenic_chip_info.reg_offset" to simplify code related
  to shadow registers.
3.Simplify the code of the "ingenic_set_bias" function.

