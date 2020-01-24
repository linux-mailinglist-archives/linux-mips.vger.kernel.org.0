Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E70B1484EB
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 13:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730665AbgAXMGD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 07:06:03 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:40757 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgAXMGD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jan 2020 07:06:03 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4006393|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0419989-0.00740679-0.950594;DS=CONTINUE|ham_system_inform|0.0534944-0.164739-0.781767;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07447;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.Gh-0wLC_1579867533;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gh-0wLC_1579867533)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 24 Jan 2020 20:05:55 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
        shawnguo@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, miquel.raynal@bootlin.com,
        keescook@chromium.org, ebiederm@xmission.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        chenhc@lemote.com, jiaxun.yang@flygoat.com, paul@boddie.org.uk,
        hns@goldelico.com, mips-creator-ci20-dev@googlegroups.com,
        rick.tyliu@ingenic.com
Subject: Introduce SMP support for CI20 (based on JZ4780) v3.
Date:   Fri, 24 Jan 2020 20:05:01 +0800
Message-Id: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
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

Happy Chinese New Year! 

