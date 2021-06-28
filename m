Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFA93B670C
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 18:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhF1Qy3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 12:54:29 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51242 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S231932AbhF1Qy2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 12:54:28 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4948E600FB;
        Tue, 29 Jun 2021 00:46:07 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1624898767; bh=K00bWN9N6quhHB2UCZGpFJGeUMBWxcPISNFhcBwXLFM=;
        h=From:To:Cc:Subject:Date:From;
        b=DKx/F2t66nx50RoHm8ZkKuY2ERNnc0P6pMlJng2PWpm3NnPflmWVUx08MMRZFxzJs
         GGJB1f/h5EbojfBOS20gScM6QpLWkIB7W45xsKm/k4AKyHnKBeew3ftY5f/Cgi7vNa
         J3ezTpaJzFprKeIVPDgFBVLoTdpafHcw3o9SJZoQ=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/6] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Tue, 29 Jun 2021 00:45:46 +0800
Message-Id: <20210628164552.1006079-1-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Here is the 4th revision of the series; the review mail got lost in my
inbox so this is a bit late, sorry for the delay!

The previous revision is tested on Loongson-2K by Jiaxun Yang, and this
revision contains no functional changes so should work on 2K too. I compiled
and tested this revision on a Loongson-3A4000 & LS7A system.

This patch series adds support for the RTC module found on various
Loongson systems with the Loongson-2K SoC or the LS7A bridge chip.
The driver is rewritten from an out-of-tree version to meet mainline
standards. I write kernel code as a hobby, though, so there might still
be overlooked issues. Any suggestions are welcome.

This series is based on next-20210628, but should apply cleanly on rtc-next
too.

v4:
- Rebased on top of next-20210628
- Added Jiaxun's Tested-by tag for Loongson-2K
- Addressed all review comments from v3
  - Rewritten field operations with FIELD_GET/FIELD_PREP
  - Removed all error logs
  - Removed unnecessary spinlocking (RTC core already protects against
    concurrent device file operations)

v3:
- Fixed compile error not discovered after rebase (blame sleep
  deprivation)
- Tested on Loongson-3A4000 (still need testing on Loongson-2K)

v2:
- Rebased on top of latest linux-next
- Updated Huacai's e-mail address to the kernel.org one
- Added collected tags
- Added adaptation for newly upstreamed Loongson-2K platforms

WANG Xuerui (6):
  rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
  dt-bindings: rtc: Add bindings for LS2X RTC
  MIPS: Loongson64: DTS: Add RTC support to LS7A
  MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
  MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   5 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   5 +
 arch/mips/configs/loongson2k_defconfig        |   1 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/rtc/Kconfig                           |  11 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ls2x.c                        | 184 ++++++++++++++++++
 8 files changed, 210 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c


base-commit: 3579aa488520feeda433ceca23ef4704bf8cd280
-- 
2.30.1

