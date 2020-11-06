Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C252A941B
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 11:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgKFKYk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 05:24:40 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:42834 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgKFKYk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 05:24:40 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 12F243B0CC7
        for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2020 10:09:16 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2C44FFF80F;
        Fri,  6 Nov 2020 10:08:53 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/9] MIPS: Add support for more mscc SoCs: Luton, Serval and Jaguar2
Date:   Fri,  6 Nov 2020 11:08:39 +0100
Message-Id: <20201106100849.969240-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Ocelot SoC belongs to a larger family of SoCs called VCoreIII. Luton,
Serval and Jaguar2 are part of this family and are added with this
series.

To be able to run a linux kernel the irqchip support and the pinctrl
support are needed. Two series of patches adding this support has been
posted to their subsystem. However there is no build dependency
between them.

Gregory

Gregory CLEMENT (9):
  dt-bindings: mips: Add Luton
  dt-bindings: mips: Add Serval and Jaguar2
  MIPS: mscc: Prepare configuration to handle more SoCs
  MIPS: mscc: Fix configuration name for ocelot legacy boards
  MIPS: mscc: Add luton dtsi
  MIPS: mscc: Add luton PC0B91 device tree
  MIPS: mscc: build FIT image for Luton
  MIPS: mscc: Add jaguar2 support
  MIPS: mscc: Add serval support

 .../devicetree/bindings/mips/mscc.txt         |   2 +-
 arch/mips/boot/dts/Makefile                   |   2 +-
 arch/mips/boot/dts/mscc/Makefile              |  11 +-
 arch/mips/boot/dts/mscc/jaguar2.dtsi          | 167 +++++++++++
 arch/mips/boot/dts/mscc/jaguar2_common.dtsi   |  25 ++
 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts    | 273 ++++++++++++++++++
 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts    | 109 +++++++
 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts    |  59 ++++
 arch/mips/boot/dts/mscc/luton.dtsi            | 116 ++++++++
 arch/mips/boot/dts/mscc/luton_pcb091.dts      |  30 ++
 arch/mips/boot/dts/mscc/serval.dtsi           | 153 ++++++++++
 arch/mips/boot/dts/mscc/serval_common.dtsi    | 127 ++++++++
 arch/mips/boot/dts/mscc/serval_pcb105.dts     |  17 ++
 arch/mips/boot/dts/mscc/serval_pcb106.dts     |  17 ++
 arch/mips/generic/Kconfig                     |  37 ++-
 arch/mips/generic/Platform                    |   3 +
 arch/mips/generic/board-jaguar2.its.S         |  40 +++
 arch/mips/generic/board-luton.its.S           |  23 ++
 arch/mips/generic/board-serval.its.S          |  24 ++
 19 files changed, 1228 insertions(+), 7 deletions(-)
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_common.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
 create mode 100644 arch/mips/boot/dts/mscc/luton.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/luton_pcb091.dts
 create mode 100644 arch/mips/boot/dts/mscc/serval.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/serval_common.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/serval_pcb105.dts
 create mode 100644 arch/mips/boot/dts/mscc/serval_pcb106.dts
 create mode 100644 arch/mips/generic/board-jaguar2.its.S
 create mode 100644 arch/mips/generic/board-luton.its.S
 create mode 100644 arch/mips/generic/board-serval.its.S

-- 
2.28.0

