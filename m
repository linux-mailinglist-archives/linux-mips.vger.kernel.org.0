Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6100522D397
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 03:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgGYBpo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 21:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgGYBpo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 21:45:44 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C32C0619D3;
        Fri, 24 Jul 2020 18:45:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 80E1A1FEB5;
        Sat, 25 Jul 2020 01:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595641541; bh=Muz2PBVuH9A6ao4K97AbsMazl1wb9FoYWWWK9At/vvk=;
        h=From:To:Cc:Subject:Date:From;
        b=OH5xh1gOv4u+kZXVQktiYRMMYH3AnIRLvb1IX4K31E1LqNaNwy/1tYuxV30nuc9kv
         I5C+UJn3i4dI08OHy0uJrIWryFNcTN/jhWoaGby61BJ1qTV15Bc+cI6g+Y2wuak8fp
         bTEznDKJBUnnEaKhqGBo0VsjOP1TSlO71177B8hqlFDoS5BttPIZrBap1pvmabqLfC
         iTXuSs57L9hJ71cVc5E3x7mqJEQ9tN5gcnTITUM0QNaOwEwN0Hh8kc/l0KQ5tVBGGT
         pCU5ncBOd9X8PzaJSVMeuJeODm05k9gIec2HuSQmy+zsqcKvvrCmkoMmsoWOTfLWr1
         cZxa42cQXnocg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] MIPS: Loongson64: Process ISA Node in DeviceTree
Date:   Sat, 25 Jul 2020 09:45:14 +0800
Message-Id: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
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

Jiaxun Yang (5):
  of_address: Add bus type match for pci ranges parser
  MIPS: Loongson64: Process ISA Node in DeviceTree
  MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
  MIPS: Loongson64: DTS: Fix ISA range for RS780E PCH
  MIPS: Loongson64: Add ISA node for LS7A PCH

 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  7 ++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  2 +-
 arch/mips/include/asm/io.h                    |  2 -
 arch/mips/include/asm/mach-generic/spaces.h   |  4 +
 .../mips/include/asm/mach-loongson64/spaces.h |  3 +-
 arch/mips/loongson64/init.c                   | 87 +++++++++++++------
 drivers/of/address.c                          | 29 ++++---
 include/linux/of_address.h                    |  4 +
 8 files changed, 96 insertions(+), 42 deletions(-)

-- 
2.28.0.rc1

