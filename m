Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0A81CCA4B
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2020 12:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEJKcx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 06:32:53 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46388 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgEJKcx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 06:32:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0BBDD8030875;
        Sun, 10 May 2020 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GiZSJdxToDOn; Sun, 10 May 2020 13:32:49 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] hwmon: Add Baikal-T1 SoC Process, Voltage and Temp sensor support
Date:   Sun, 10 May 2020 13:32:09 +0300
Message-ID: <20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200306132611.103408030701@mail.baikalelectronics.ru>
References: <20200306132611.103408030701@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to keep track of Baikal-T1 SoC power consumption and make sure
the chip heating is within the normal temperature limits, there is
a dedicated hardware monitor sensor embedded into the SoC. It is based
on the Analog Bits PVT sensor but equipped with a vendor-specific control
wrapper, which ease an access to the sensors functionality. Fist of all it
provides an accessed to the sampled Temperature, Voltage and
Low/Standard/High Voltage thresholds. In addition the wrapper generates
an interrupt in case if one enabled for alarm thresholds or data ready
event. All of these functionality is implemented in the Baikal-T1 PVT
driver submitted within this patchset. Naturally there is also a patch,
which creates a corresponding yaml-based dt-binding file for the sensor.

This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Note new vendor prefix for Baikal-T1 PVT device will be added in the
framework of the next patchset:
https://lkml.org/lkml/2020/5/6/1047

Changelog v2:
- Don't use a multi-arg clock phandle reference in the examples dt-bindings
  property. Thus reundant include pre-processor statement can be removed.
- Rearrange the SoBs with adding Maxim' co-development tag.
- Lowercase the node-name in the dt-schema example.
- Add dual license header to the dt-bindings file.
- Replace "additionalProperties: false" property with
  "unevaluatedProperties: false".
- Discard label definition from the binding example.
- Discard handwritten IO-access wrappers. Use normal readl/writel instead.
- Use generic FIELD_{GET,PREP} macros instead of handwritten ones.
- Since the driver depends on the OF config we can remove of_match_ptr()
  macro utilization.
- Don't print error-message if no platform IRQ found. Just return an error.
- Remove probe-status info string printout.
- Our corporate email server doesn't change Message-Id anymore, so the patchset
  is resubmitted being in the cover-letter-threaded format.

Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
Signed-off-by: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (2):
  dt-bindings: hwmon: Add Baikal-T1 PVT sensor binding
  hwmon: Add Baikal-T1 PVT sensor driver

 .../bindings/hwmon/baikal,bt1-pvt.yaml        |   95 ++
 Documentation/hwmon/bt1-pvt.rst               |  113 ++
 drivers/hwmon/Kconfig                         |   29 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/bt1-pvt.c                       | 1154 +++++++++++++++++
 drivers/hwmon/bt1-pvt.h                       |  237 ++++
 6 files changed, 1629 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
 create mode 100644 Documentation/hwmon/bt1-pvt.rst
 create mode 100644 drivers/hwmon/bt1-pvt.c
 create mode 100644 drivers/hwmon/bt1-pvt.h

-- 
2.25.1

