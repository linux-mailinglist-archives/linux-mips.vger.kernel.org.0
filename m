Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6461411878D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 13:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfLJMDN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 07:03:13 -0500
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:54022 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfLJMDN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 07:03:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2567402|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0330182-0.000441002-0.966541;DS=CONTINUE|ham_social|0.0819971-0.00124194-0.916761;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GEHd9lh_1575979374;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GEHd9lh_1575979374)
          by smtp.aliyun-inc.com(10.147.42.197);
          Tue, 10 Dec 2019 20:03:01 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, alexandre.belloni@bootlin.com,
        ralf@linux-mips.org, heiko@sntech.de, icenowy@aosc.io,
        ak@linux.intel.com, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, keescook@chromium.org,
        ebiederm@xmission.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board v7.
Date:   Tue, 10 Dec 2019 20:02:39 +0800
Message-Id: <1575979363-25956-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v7->v8:
1.Change "mac@134b0000" to "ethernet@134b0000", change "msc@13450000"
  to "mmc@13450000", change "msc@13460000" to "mmc@13460000".
2.Merge [5/6] in v7 to [1/4] of v8, merge [6/6] in v7 to [4/4] of v8.

