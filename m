Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41121E27EE
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 19:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgEZRH6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 13:07:58 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:51324 "EHLO
        out28-98.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbgEZRH6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 13:07:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4615953|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0129848-0.00361253-0.983403;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.HdyIWoB_1590512865;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HdyIWoB_1590512865)
          by smtp.aliyun-inc.com(10.147.43.230);
          Wed, 27 May 2020 01:07:52 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, tsbogend@alpha.franken.de, hns@goldelico.com,
        paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH 0/1] Document Ingenic SoCs binding.
Date:   Wed, 27 May 2020 01:07:21 +0800
Message-Id: <20200526170722.17206-1-zhouyanjie@wanyeetech.com>
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

周琰杰 (Zhou Yanjie) (1):
  dt-bindings: MIPS: Document Ingenic SoCs binding.

 .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

-- 
2.11.0

