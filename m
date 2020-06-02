Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F851EC1D9
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jun 2020 20:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgFBSea (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jun 2020 14:34:30 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:39726 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgFBSea (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jun 2020 14:34:30 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.423545|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0053971-0.000669327-0.993934;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.HhFRbbV_1591122856;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HhFRbbV_1591122856)
          by smtp.aliyun-inc.com(10.147.41.187);
          Wed, 03 Jun 2020 02:34:26 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, robh+dt@kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v2 0/1] Document Ingenic SoCs binding.
Date:   Wed,  3 Jun 2020 02:33:53 +0800
Message-Id: <20200602183354.39707-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the available properties for the SoC root node and the
CPU nodes of the devicetree for the Ingenic XBurst SoCs.

v1->v2:
1.Remove unnecessary "items".
2.Add "clocks" as suggested by Paul Cercueil.

周琰杰 (Zhou Yanjie) (1):
  dt-bindings: MIPS: Document Ingenic SoCs binding.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

-- 
2.11.0

