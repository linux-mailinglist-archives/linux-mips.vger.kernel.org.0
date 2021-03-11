Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586BA3376F3
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 16:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234140AbhCKPWn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 10:22:43 -0500
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:37775 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbhCKPWg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 10:22:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2231162|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00557219-1.95912e-05-0.994408;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JjZCudb_1615476138;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JjZCudb_1615476138)
          by smtp.aliyun-inc.com(10.147.41.120);
          Thu, 11 Mar 2021 23:22:25 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v2 0/6] Fix bugs and add support for new Ingenic SoCs.
Date:   Thu, 11 Mar 2021 23:21:46 +0800
Message-Id: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Split [1/3] in v1 to [1/6] [2/6] [3/6] [4/6] in v2.
2.Fix the uninitialized warning.

周琰杰 (Zhou Yanjie) (6):
  pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
  pinctrl: Ingenic: Add support for read the pin configuration of X1830.
  pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
  pinctrl: Ingenic: Reformat the code.
  dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
  pinctrl: Ingenic: Add support for new Ingenic SoCs.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1423 ++++++++++++++++++--
 2 files changed, 1353 insertions(+), 93 deletions(-)

-- 
2.7.4

