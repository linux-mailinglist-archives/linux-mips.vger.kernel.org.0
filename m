Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799C8230DFF
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 17:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730927AbgG1PhQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 11:37:16 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:42152 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbgG1PhQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 11:37:16 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 00F531FF08;
        Tue, 28 Jul 2020 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595950636; bh=TzqPA5cK+YdXdB2JFRhq4i3Z0RERIdIF9jrXnm6aed8=;
        h=From:To:Cc:Subject:Date:From;
        b=kUEIcXxrJ5i51TFqKO0kQa6VI4uQsu63fDxvZB7Wo03whQwrQNy9IdD/xOa1p3JkD
         kCqQWFqGyXzVytA4zRqp69nZZkA2dwcvg0U2XYGwj9WMM7voSsIxIcY54AcPWgKO0z
         qIUF0X6ISWdMJX4CZazm6qtnnpx4lb+NeaMeOBmxNWOWr2d6St5loUQ/pP/Q4oWGZa
         ywXMDZoKQBWTzRSob46VZuiogAlC+4pLwudWff3fQFqG1uI2O7A7ePeNrCvZoA9okI
         RLiZ04h7Rb6lbVeweb2oaNLzao4hQ8fLn8ZADxXeELAv0ZadmEoDFXXSonT2tIwIlT
         OC23x2gNeB6PQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] MIPS: Loongson64: Process ISA Node in DeviceTree
Date:   Tue, 28 Jul 2020 23:36:54 +0800
Message-Id: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This series convert reservation of Loongson64 Logic PIO into DeviceTree based
method.

It can be used to replace Huacai's
"MIPS: Loongson64: Reserve legacy MMIO space according to bridge type".

Thanks.

v2:
  - Address Rob and Huacai's review comments.
v3:
  - Address Rob, Thomas's review comments.
v4:
  - Fix typo & grammar issue according to Xuerui's suggestion.

Jiaxun Yang (5):
  of_address: Add bus type match for pci ranges parser
  MIPS: Loongson64: Process ISA Node in DeviceTree
  MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
  MIPS: Loongson64: DTS: Fix ISA and PCI I/O ranges for RS780E PCH
  MIPS: Loongson64: Add ISA node for LS7A PCH

 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  7 ++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  4 +-
 arch/mips/include/asm/io.h                    |  2 -
 arch/mips/include/asm/mach-generic/spaces.h   |  4 +
 .../mips/include/asm/mach-loongson64/spaces.h |  3 +-
 arch/mips/loongson64/init.c                   | 87 +++++++++++++------
 drivers/of/address.c                          | 29 ++++---
 include/linux/of_address.h                    |  4 +
 8 files changed, 97 insertions(+), 43 deletions(-)

-- 
2.28.0.rc1

