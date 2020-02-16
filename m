Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9093A1603EF
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 13:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgBPMLG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 07:11:06 -0500
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:56317 "EHLO
        out28-100.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgBPMLG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 07:11:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.279177|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0595239-0.00147149-0.939004;DS=CONTINUE|ham_system_inform|0.0152854-0.000874865-0.98384;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Gof3ya4_1581855051;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gof3ya4_1581855051)
          by smtp.aliyun-inc.com(10.147.42.22);
          Sun, 16 Feb 2020 20:10:59 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, robh+dt@kernel.org, mark.rutland@arm.com,
        ralf@linux-mips.org, paulburton@kernel.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH] Fix clock of X1000 watchdog node.
Date:   Sun, 16 Feb 2020 20:10:27 +0800
Message-Id: <1581855028-25552-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581855028-25552-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581855028-25552-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix clock of X1000's watchdog node.

周琰杰 (Zhou Yanjie) (1):
  MIPS: X1000: Fix clock of watchdog node.

 arch/mips/boot/dts/ingenic/x1000.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.7.4

