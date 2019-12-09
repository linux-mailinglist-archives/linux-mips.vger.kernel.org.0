Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9904E11660B
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 06:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfLIFKp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 00:10:45 -0500
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:55156 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfLIFKp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 00:10:45 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2758775|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.216612-0.00519232-0.778196;DS=CONTINUE|ham_system_inform|0.0495488-0.000247355-0.950204;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GDNCC0Y_1575868229;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GDNCC0Y_1575868229)
          by smtp.aliyun-inc.com(10.147.40.200);
          Mon, 09 Dec 2019 13:10:36 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com,
        tglx@linutronix.de, chenhc@lemote.com, tbogendoerfer@suse.de,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        jhogan@kernel.org, fancer.lancer@gmail.com, ralf@linux-mips.org,
        jiaxun.yang@flygoat.com
Subject: MIPS: X1830: Add X1830 system type. 
Date:   Mon,  9 Dec 2019 13:10:24 +0800
Message-Id: <1575868225-57755-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Add more detailed commit message.
2.Add a /* fall-through */ comment to prevent GCC from issuing a
  warning when -Wimplicit-fallthrough is used.
3.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
  to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
  the old mailbox is in an unstable state.

