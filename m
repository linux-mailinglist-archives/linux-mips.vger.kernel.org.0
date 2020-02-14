Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBDD115F18B
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 19:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389550AbgBNSDm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 13:03:42 -0500
Received: from out28-50.mail.aliyun.com ([115.124.28.50]:43659 "EHLO
        out28-50.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731643AbgBNSDl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 13:03:41 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4276498|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0431547-0.00657629-0.950269;DS=CONTINUE|ham_system_inform|0.0811337-0.248353-0.670513;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03268;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.GoAKeCh_1581703384;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoAKeCh_1581703384)
          by smtp.aliyun-inc.com(10.147.42.253);
          Sat, 15 Feb 2020 02:03:20 +0800
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
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Subject: Introduce SMP support for CI20 (based on JZ4780) v4.
Date:   Sat, 15 Feb 2020 02:02:33 +0800
Message-Id: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
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

