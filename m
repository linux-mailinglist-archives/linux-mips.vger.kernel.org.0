Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174291C9EE7
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 01:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgEGXHS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 19:07:18 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39192 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgEGXHS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 19:07:18 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 12EEF803087B;
        Thu,  7 May 2020 23:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id molr0_Og1NvB; Fri,  8 May 2020 02:07:13 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        <linux-mips@vger.kernel.org>, <soc@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] memory: Add Baikal-T1 L2-cache driver
Date:   Fri, 8 May 2020 02:07:02 +0300
Message-ID: <20200507230705.6468-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200306130731.938808030702@mail.baikalelectronics.ru>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Aside from PCIe/SATA/DDR/I2C/CPU-reboot specific settings the Baikal-T1
system controller provides a MIPS P5600 CM2 L2-cache tuning block.
It is responsible for the setting up the Tag/Data/WS L2-to-RAM latencies.
This small patchset provides a driver and DT-schema-based binding for the
described device. So that the latencies can be tuned up by means of
dedicated DT properties and sysfs nodes.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Note initially the driver was a part of the patchset created to reside in
the kernel soc subsystem. But after a short discussion with Arnd:
https://lkml.org/lkml/2020/3/6/422
we decided to move it here.

New vendor prefix will be added in the framework of the next patchset:
https://lkml.org/lkml/2020/5/6/1047

Changelog v2:
- Fix some commit message and Kconfig help text spelling.
- Move the driver to the memory subsystem.
- Assign dual GPL/BSD license to the DT binding.
- Use single lined copyright header in the binding.
- Discard reg property and syscon compatible string.
- Move "allOf" restrictions to the root level of the properties.
- The DT node is supposed to be a child of the Baikal-T1 system controller
  node. So regmap will be fetched from there.
- Use generic FIELD_{GET,PREP} macro.
- Remove probe-status info string printout.
- Since the driver depends on the OF config we can remove of_match_ptr()
  macro utilization.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mips@vger.kernel.org
Cc: soc@kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (2):
  dt-bindings: memory: Add Baikal-T1 L2-cache Control Block binding
  memory: Add Baikal-T1 L2-cache Control Block driver

 .../memory-controllers/baikal,bt1-l2-ctl.yaml |  59 ++++
 drivers/memory/Kconfig                        |  11 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/bt1-l2-ctl.c                   | 322 ++++++++++++++++++
 4 files changed, 393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
 create mode 100644 drivers/memory/bt1-l2-ctl.c

-- 
2.25.1

