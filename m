Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58E3116D82
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 14:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfLINB0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 08:01:26 -0500
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:40089 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfLINB0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 08:01:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2142296|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0130188-0.000389158-0.986592;DS=CONTINUE|ham_news_journal|0.0957778-0.00053746-0.903685;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.GDcmOki_1575896441;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GDcmOki_1575896441)
          by smtp.aliyun-inc.com(10.147.41.138);
          Mon, 09 Dec 2019 21:00:53 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, ebiederm@xmission.com, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board v7.
Date:   Mon,  9 Dec 2019 21:00:32 +0800
Message-Id: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v6->v7:
1.Merge [05/12],[07/12],[09/12],[11/12] in v6 to [5/6] in v7.
2.Merge [06/12],[08/12],[10/12],[12/12] in v6 to [5/6] in v7.
3.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
  to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
  the old mailbox is in an unstable state.

