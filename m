Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DFD1D99F4
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 16:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgESOg0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 10:36:26 -0400
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:55666 "EHLO
        out28-77.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728647AbgESOg0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 10:36:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4271424|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0831707-0.262813-0.654016;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03297;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.HalgxFh_1589898954;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HalgxFh_1589898954)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 19 May 2020 22:36:18 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, tglx@linutronix.de,
        robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Introduce SMP support for CI20 (based on JZ4780) v8.
Date:   Tue, 19 May 2020 22:35:16 +0800
Message-Id: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
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

