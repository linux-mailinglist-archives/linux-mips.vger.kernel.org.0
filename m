Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F522752ED
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 10:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIWIGx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 04:06:53 -0400
Received: from [115.28.160.31] ([115.28.160.31]:55524 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726291AbgIWIGx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 04:06:53 -0400
Received: from ld50.lan (unknown [101.224.80.228])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 08CC660100;
        Wed, 23 Sep 2020 15:59:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1600847973; bh=RdT/3QOG4Br9OgJLFVu9nGJQehN8zMNkVAYZ9cEb2xg=;
        h=From:To:Cc:Subject:Date:From;
        b=gM2oT93cKTV5EFiY9DCYSYfRA/vzPssIaScwJ//frSh91UVYedZzyvp6Y2t/UQv+x
         fA1nv7bPiP827YA2AUdUjd2jZSn6JExF6ouSCa0g72ZURPnvBqA3jFErtiLp4SoFqG
         9r1EKYA6RUHlb5ZEVFx5fqktr8mftanikRbmbXL8=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Wed, 23 Sep 2020 15:58:41 +0800
Message-Id: <20200923075845.360974-1-git@xen0n.name>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series adds support for the RTC module found on various
Loongson systems with the Loongson-2K SoC or the LS7A bridge chip.
The driver is rewritten from an out-of-tree version to meet mainline
standards. I write kernel code as a hobby, though, so there might still
be overlooked issues. Any suggestions are welcome.

Note when applying this series: the 3rd patch depends on
commit 262623961478836b from the mips-next tree, so the series should
preferably go in via mips-next. Otherwise the patch will conflict in the
merge window anyway.

WANG Xuerui (4):
  rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
  dt-bindings: rtc: Add bindings for LS2X RTC
  MIPS: Loongson64: DTS: Add RTC support to LS7A
  MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   5 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ls2x.c                        | 225 ++++++++++++++++++
 6 files changed, 245 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c

-- 
2.28.0

