Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262673D465F
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 10:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbhGXIIu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:08:50 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:41635 "EHLO
        out28-147.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234561AbhGXIIt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:08:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4749928|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0152612-0.00748325-0.977256;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KpoL-m-_1627116542;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpoL-m-_1627116542)
          by smtp.aliyun-inc.com(10.147.43.230);
          Sat, 24 Jul 2021 16:49:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, hminas@synopsys.com
Cc:     paul@crapouillou.net, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH 0/2] Add OTG support for Ingenic SoCs.
Date:   Sat, 24 Jul 2021 16:48:39 +0800
Message-Id: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add OTG support for the JZ4775 SoC, the JZ4780 SoC, the X1000
  SoC, the X1600 SoC, the X1830 SoC, and the X2000 SoC.
2.Introduce support for disable Ingenic overcurrent detection,
  once selected it enables GOTGCTL register bits VbvalidOvEn
  and VbvalidOvVal to disable the VBUS overcurrent detection.

周琰杰 (Zhou Yanjie) (2):
  dt-bindings: dwc2: Add bindings for new Ingenic SoCs.
  USB: dwc2: Add OTG support for Ingenic SoCs.

 Documentation/devicetree/bindings/usb/dwc2.yaml |  6 +++
 drivers/usb/dwc2/core.c                         |  9 +++++
 drivers/usb/dwc2/core.h                         |  5 +++
 drivers/usb/dwc2/params.c                       | 49 ++++++++++++++++++++++++-
 4 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.7.4

