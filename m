Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5A71E2312
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbgEZNie (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 09:38:34 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57610 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbgEZNic (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 09:38:32 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 71D85803086B;
        Tue, 26 May 2020 13:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vb9wVfh2Lywg; Tue, 26 May 2020 16:38:27 +0300 (MSK)
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
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] hwmon: Add Baikal-T1 SoC Process, Voltage and Temp sensor support
Date:   Tue, 26 May 2020 16:38:20 +0300
Message-ID: <20200526133823.20466-1-Sergey.Semin@baikalelectronics.ru>
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

Link: https://lore.kernel.org/linux-hwmon/20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru/
Changelog v3:
- Add bt1-pvt into the Documentation/hwmon/index.rst file.
- Discard explicit "default n" from the SENSORS_BT1_PVT_ALARMS config.
- Use "depends on SENSORS_BT1_PVT" statement instead of if-endif kbuild
  config clause.
- Alphabetically order the include macro operators.
- Discard unneeded include macro in the header file.
- Use new generic interface of the hwmon alarms notifications introduced
  in the first patch (based on hwmon_notify_event()).
- Add more descriptive information regarding the temp1_trim attribute.
- Discard setting the platforms device private data by using
  platform_set_drvdata(). It's redundant since unused in the driver.
- Pass "pvt" hwmon name instead of dev_name(dev) to
  devm_hwmon_device_register_with_info().
- Add "baikal,pvt-temp-trim-millicelsius" temperature trim DT property
  support.
- Discard kernel log warnings printed from the ISR when either min or
  max threshold levels are crossed.
- Discard CONFIG_OF dependency since there is non at compile-time.

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
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Guenter Roeck (1):
  hwmon: Add notification support

Serge Semin (2):
  dt-bindings: hwmon: Add Baikal-T1 PVT sensor binding
  hwmon: Add Baikal-T1 PVT sensor driver

 .../bindings/hwmon/baikal,bt1-pvt.yaml        |  107 ++
 Documentation/hwmon/bt1-pvt.rst               |  116 ++
 Documentation/hwmon/index.rst                 |    1 +
 drivers/hwmon/Kconfig                         |   25 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/bt1-pvt.c                       | 1155 +++++++++++++++++
 drivers/hwmon/bt1-pvt.h                       |  244 ++++
 drivers/hwmon/hwmon.c                         |   69 +-
 include/linux/hwmon.h                         |    3 +
 9 files changed, 1718 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
 create mode 100644 Documentation/hwmon/bt1-pvt.rst
 create mode 100644 drivers/hwmon/bt1-pvt.c
 create mode 100644 drivers/hwmon/bt1-pvt.h

-- 
2.26.2

