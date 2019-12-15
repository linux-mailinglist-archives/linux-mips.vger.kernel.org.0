Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C11DB11F8EE
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 17:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfLOQVn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 11:21:43 -0500
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:52956 "EHLO
        out28-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfLOQVn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 11:21:43 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1772895|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0837881-0.00162941-0.914583;DS=CONTINUE|ham_system_inform|0.0392732-0.000340861-0.960386;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03311;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GHgOK.D_1576426866;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHgOK.D_1576426866)
          by smtp.aliyun-inc.com(10.147.41.143);
          Mon, 16 Dec 2019 00:21:13 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, linus.walleij@linaro.org
Subject: [PATCH v8 0/5] Fix bugs in X1000/X1500 and add X1830 pinctrl driver v8
Date:   Mon, 16 Dec 2019 00:20:59 +0800
Message-Id: <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v7->v8:
Separate the part of introduce reg_offset in [4/4] in v7 into [3/5] in v8.

周琰杰 (Zhou Yanjie) (5):
  pinctrl: Ingenic: Fix bugs in X1000 and X1500.
  pinctrl: Ingenic: Add missing parts for X1000 and X1500.
  pinctrl: Ingenic: Introduce reg_offset and use it instead hard code.
  dt-bindings: pinctrl: Add bindings for Ingenic X1830.
  pinctrl: Ingenic: Add pinctrl driver for X1830.

 .../bindings/pinctrl/ingenic,pinctrl.txt           |   8 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 456 ++++++++++++++++++---
 2 files changed, 395 insertions(+), 69 deletions(-)

-- 
2.7.4

