Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CB138C379
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 11:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236820AbhEUJmJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 May 2021 05:42:09 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:50470 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236802AbhEUJmH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 May 2021 05:42:07 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 63FC9BA13F;
        Fri, 21 May 2021 17:40:31 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P30810T139673781389056S1621590030498168_;
        Fri, 21 May 2021 17:40:30 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e63f602441e10634e28226d0f633528c>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: robh+dt@kernel.org
X-RCPT-COUNT: 9
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de
Cc:     maoxiaochuan@loongson.cn, jiaxun.yang@flygoat.com,
        zhangqing@loongson.cn, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH 0/5] mips: dts: loongson: fix DTC unit name warnings 
Date:   Fri, 21 May 2021 17:40:23 +0800
Message-Id: <cover.1621586643.git.zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

*** BLURB HERE ***

zhaoxiao (5):
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings

 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi       | 2 +-
 arch/mips/boot/dts/loongson/loongson64g-package.dtsi     | 4 ++--
 arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi                | 2 +-
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.20.1



