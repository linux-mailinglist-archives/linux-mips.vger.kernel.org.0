Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24B315FFCA
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 19:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgBOS4K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 13:56:10 -0500
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:50083 "EHLO
        out28-170.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgBOS4J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 13:56:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.411617|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0490798-0.00794291-0.942977;DS=CONTINUE|ham_system_inform|0.0762816-0.232677-0.691042;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.GoTIZgt_1581792955;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoTIZgt_1581792955)
          by smtp.aliyun-inc.com(10.147.42.241);
          Sun, 16 Feb 2020 02:56:03 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com
Subject: Introduce SMP support for CI20 (based on JZ4780) v5.
Date:   Sun, 16 Feb 2020 02:55:24 +0800
Message-Id: <1581792932-108032-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce SMP support for MIPS Creator CI20, which is
based on Ingenic JZ4780 SoC.

