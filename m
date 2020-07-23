Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5EB22A978
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 09:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGWHU2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 03:20:28 -0400
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:54199 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGWHU2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jul 2020 03:20:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2752589|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.037033-0.00306303-0.959904;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03299;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.I6IjCRk_1595488814;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I6IjCRk_1595488814)
          by smtp.aliyun-inc.com(10.147.42.253);
          Thu, 23 Jul 2020 15:20:24 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        keescook@chromium.org, hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
Subject: MIPS: CI20: Update defconfig for EFUSE.
Date:   Thu, 23 Jul 2020 15:19:49 +0800
Message-Id: <20200723071950.130007-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

周琰杰 (Zhou Yanjie) (1):
  MIPS: CI20: Update defconfig for EFUSE.

 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.11.0

