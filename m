Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE6111F8D8
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 17:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfLOQVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 11:21:16 -0500
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:45368 "EHLO
        out28-171.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQVQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 11:21:16 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4172439|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.293193-0.00302139-0.703785;DS=SPAM|spam_blackmail|0.615241-0.000983383-0.383776;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16368;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GHgOK.D_1576426866;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHgOK.D_1576426866)
          by smtp.aliyun-inc.com(10.147.41.143);
          Mon, 16 Dec 2019 00:21:12 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, linus.walleij@linaro.org
Subject: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v8.
Date:   Mon, 16 Dec 2019 00:20:58 +0800
Message-Id: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v7->v8:
Separate the part of introduce reg_offset in [4/4] in v7 into [3/5] in v8.

