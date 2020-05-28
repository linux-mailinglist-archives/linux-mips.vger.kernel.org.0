Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D75F1E63F3
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 16:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391115AbgE1O22 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 10:28:28 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:42352 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391089AbgE1O20 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 10:28:26 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9D76480307C0;
        Thu, 28 May 2020 14:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M5HIGxgo6bOD; Thu, 28 May 2020 17:28:12 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/3] hwmon: Add Baikal-T1 PVT sensor driver
Date:   Thu, 28 May 2020 17:28:05 +0300
Message-ID: <20200528142805.29115-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200528142805.29115-1-Sergey.Semin@baikalelectronics.ru>
References: <20200528142805.29115-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 SoC provides an embedded process, voltage and temperature
sensor to monitor an internal SoC environment (chip temperature, supply
voltage and process monitor) and on time detect critical situations,
which may cause the system instability and even damages. The IP-block
is based on the Analog Bits PVT sensor, but is equipped with a
dedicated control wrapper, which provides a MMIO registers-based access
to the sensor core functionality (APB3-bus based) and exposes an
additional functions like thresholds/data ready interrupts, its status
and masks, measurements timeout. All of these is used to create a hwmon
driver being added to the kernel by this commit.

The driver implements support for the hardware monitoring capabilities
of Baikal-T1 process, voltage and temperature sensors. PVT IP-core
consists of one temperature and four voltage sensors, each of which is
implemented as a dedicated hwmon channel config.

The driver can optionally provide the hwmon alarms for each sensor the
PVT controller supports. The alarms functionality is made compile-time
configurable due to the hardware interface implementation peculiarity,
which is connected with an ability to convert data from only one sensor
at a time. Additional limitation is that the controller performs the
thresholds checking synchronously with the data conversion procedure.
Due to these limitations in order to have the hwmon alarms
automatically detected the driver code must switch from one sensor to
another, read converted data and manually check the threshold status
bits. Depending on the measurements timeout settings this design may
cause additional burden on the system performance. By default if the
alarms kernel config is disabled the data conversion is performed by
the driver on demand when read operation is requested via corresponding
_input-file.

Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
Signed-off-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v2:
- Discard handwritten IO-access wrappers. Use normal readl/writel instead.
- Use generic FIELD_{GET,PREP} macros instead of handwritten ones.
- Since the driver depends on the OF config we can remove of_match_ptr()
  macro utilization.
- Don't print error-message if no platform IRQ found. Just return an error.
- Remove probe-status info string printout.

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

Changelog v4:
- Rename temp1_trim to the temp1_offset and use the standard API to
  expose the attribute.
- Rename "baikal,pvt-temp-trim-millicelsius" to
  "baikal,pvt-temp-offset-millicelsius".
- Switch "const static" order to be "static const" where it's applicable.
- Add missing headers "linux/io.h" and "linux/of.h".
- Add static qualifier to the pvt_hwmon_write() method, which has been
  missed there by mistake.
---
 Documentation/hwmon/bt1-pvt.rst |  117 ++++
 Documentation/hwmon/index.rst   |    1 +
 drivers/hwmon/Kconfig           |   25 +
 drivers/hwmon/Makefile          |    1 +
 drivers/hwmon/bt1-pvt.c         | 1146 +++++++++++++++++++++++++++++++
 drivers/hwmon/bt1-pvt.h         |  244 +++++++
 6 files changed, 1534 insertions(+)
 create mode 100644 Documentation/hwmon/bt1-pvt.rst
 create mode 100644 drivers/hwmon/bt1-pvt.c
 create mode 100644 drivers/hwmon/bt1-pvt.h

diff --git a/Documentation/hwmon/bt1-pvt.rst b/Documentation/hwmon/bt1-pvt.rst
new file mode 100644
index 000000000000..cbb0c0613132
--- /dev/null
+++ b/Documentation/hwmon/bt1-pvt.rst
@@ -0,0 +1,117 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver bt1-pvt
+=====================
+
+Supported chips:
+
+  * Baikal-T1 PVT sensor (in SoC)
+
+    Prefix: 'bt1-pvt'
+
+    Addresses scanned: -
+
+    Datasheet: Provided by BAIKAL ELECTRONICS upon request and under NDA
+
+Authors:
+    Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
+    Serge Semin <Sergey.Semin@baikalelectronics.ru>
+
+Description
+-----------
+
+This driver implements support for the hardware monitoring capabilities of the
+embedded into Baikal-T1 process, voltage and temperature sensors. PVT IP-core
+consists of one temperature and four voltage sensors, which can be used to
+monitor the chip internal environment like heating, supply voltage and
+transistors performance. The driver can optionally provide the hwmon alarms
+for each sensor the PVT controller supports. The alarms functionality is made
+compile-time configurable due to the hardware interface implementation
+peculiarity, which is connected with an ability to convert data from only one
+sensor at a time. Additional limitation is that the controller performs the
+thresholds checking synchronously with the data conversion procedure. Due to
+these in order to have the hwmon alarms automatically detected the driver code
+must switch from one sensor to another, read converted data and manually check
+the threshold status bits. Depending on the measurements timeout settings
+(update_interval sysfs node value) this design may cause additional burden on
+the system performance. So in case if alarms are unnecessary in your system
+design it's recommended to have them disabled to prevent the PVT IRQs being
+periodically raised to get the data cache/alarms status up to date. By default
+in alarm-less configuration the data conversion is performed by the driver
+on demand when read operation is requested via corresponding _input-file.
+
+Temperature Monitoring
+----------------------
+
+Temperature is measured with 10-bit resolution and reported in millidegree
+Celsius. The driver performs all the scaling by itself therefore reports true
+temperatures that don't need any user-space adjustments. While the data
+translation formulae isn't linear, which gives us non-linear discreteness,
+it's close to one, but giving a bit better accuracy for higher temperatures.
+The temperature input is mapped as follows (the last column indicates the input
+ranges)::
+
+	temp1: CPU embedded diode	-48.38C - +147.438C
+
+In case if the alarms kernel config is enabled in the driver the temperature input
+has associated min and max limits which trigger an alarm when crossed.
+
+Voltage Monitoring
+------------------
+
+The voltage inputs are also sampled with 10-bit resolution and reported in
+millivolts. But in this case the data translation formulae is linear, which
+provides a constant measurements discreteness. The data scaling is also
+performed by the driver, so returning true millivolts. The voltage inputs are
+mapped as follows (the last column indicates the input ranges)::
+
+	in0: VDD		(processor core)		0.62V - 1.168V
+	in1: Low-Vt		(low voltage threshold)		0.62V - 1.168V
+	in2: High-Vt		(high voltage threshold)	0.62V - 1.168V
+	in3: Standard-Vt	(standard voltage threshold)	0.62V - 1.168V
+
+In case if the alarms config is enabled in the driver the voltage inputs
+have associated min and max limits which trigger an alarm when crossed.
+
+Sysfs Attributes
+----------------
+
+Following is a list of all sysfs attributes that the driver provides, their
+permissions and a short description:
+
+=============================== ======= =======================================
+Name				Perm	Description
+=============================== ======= =======================================
+update_interval			RW	Measurements update interval per
+					sensor.
+temp1_type			RO	Sensor type (always 1 as CPU embedded
+					diode).
+temp1_label			RO	CPU Core Temperature sensor.
+temp1_input			RO	Measured temperature in millidegree
+					Celsius.
+temp1_min			RW	Low limit for temp input.
+temp1_max			RW	High limit for temp input.
+temp1_min_alarm			RO	Temperature input alarm. Returns 1 if
+					temperature input went below min limit,
+					0 otherwise.
+temp1_max_alarm			RO	Temperature input alarm. Returns 1 if
+					temperature input went above max limit,
+					0 otherwise.
+temp1_offset			RW	Temperature offset in millidegree
+					Celsius which is added to the
+					temperature reading by the chip. It can
+					be used to manually adjust the
+					temperature measurements within 7.130
+					degrees Celsius.
+in[0-3]_label			RO	CPU Voltage sensor (either core or
+					low/high/standard thresholds).
+in[0-3]_input			RO	Measured voltage in millivolts.
+in[0-3]_min			RW	Low limit for voltage input.
+in[0-3]_max			RW	High limit for voltage input.
+in[0-3]_min_alarm		RO	Voltage input alarm. Returns 1 if
+					voltage input went below min limit,
+					0 otherwise.
+in[0-3]_max_alarm		RO	Voltage input alarm. Returns 1 if
+					voltage input went above max limit,
+					0 otherwise.
+=============================== ======= =======================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8ef62fd39787..3f322d2f1d20 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -43,6 +43,7 @@ Hardware Monitoring Kernel Drivers
    asc7621
    aspeed-pwm-tacho
    bel-pfe
+   bt1-pvt
    coretemp
    da9052
    da9055
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4c62f900bf7e..d1c6c5d46c08 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -404,6 +404,31 @@ config SENSORS_ATXP1
 	  This driver can also be built as a module. If so, the module
 	  will be called atxp1.
 
+config SENSORS_BT1_PVT
+	tristate "Baikal-T1 Process, Voltage, Temperature sensor driver"
+	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
+	help
+	  If you say yes here you get support for Baikal-T1 PVT sensor
+	  embedded into the SoC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called bt1-pvt.
+
+config SENSORS_BT1_PVT_ALARMS
+	bool "Enable Baikal-T1 PVT sensor alarms"
+	depends on SENSORS_BT1_PVT
+	help
+	  Baikal-T1 PVT IP-block provides threshold registers for each
+	  supported sensor. But the corresponding interrupts might be
+	  generated by the thresholds comparator only in synchronization with
+	  a data conversion. Additionally there is only one sensor data can
+	  be converted at a time. All of these makes the interface impossible
+	  to be used for the hwmon alarms implementation without periodic
+	  switch between the PVT sensors. By default the data conversion is
+	  performed on demand from the user-space. If this config is enabled
+	  the data conversion will be periodically performed and the data will be
+	  saved in the internal driver cache.
+
 config SENSORS_DRIVETEMP
 	tristate "Hard disk drives with temperature sensors"
 	depends on SCSI && ATA
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b0b9c8e57176..408b86a5e71d 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
 obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
+obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
 obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
new file mode 100644
index 000000000000..1a9772fb1f73
--- /dev/null
+++ b/drivers/hwmon/bt1-pvt.c
@@ -0,0 +1,1146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 Process, Voltage, Temperature sensor driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/ktime.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/seqlock.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include "bt1-pvt.h"
+
+/*
+ * For the sake of the code simplification we created the sensors info table
+ * with the sensor names, activation modes, threshold registers base address
+ * and the thresholds bit fields.
+ */
+static const struct pvt_sensor_info pvt_info[] = {
+	PVT_SENSOR_INFO(0, "CPU Core Temperature", hwmon_temp, TEMP, TTHRES),
+	PVT_SENSOR_INFO(0, "CPU Core Voltage", hwmon_in, VOLT, VTHRES),
+	PVT_SENSOR_INFO(1, "CPU Core Low-Vt", hwmon_in, LVT, LTHRES),
+	PVT_SENSOR_INFO(2, "CPU Core High-Vt", hwmon_in, HVT, HTHRES),
+	PVT_SENSOR_INFO(3, "CPU Core Standard-Vt", hwmon_in, SVT, STHRES),
+};
+
+/*
+ * The original translation formulae of the temperature (in degrees of Celsius)
+ * to PVT data and vice-versa are following:
+ * N = 1.8322e-8*(T^4) + 2.343e-5*(T^3) + 8.7018e-3*(T^2) + 3.9269*(T^1) +
+ *     1.7204e2,
+ * T = -1.6743e-11*(N^4) + 8.1542e-8*(N^3) + -1.8201e-4*(N^2) +
+ *     3.1020e-1*(N^1) - 4.838e1,
+ * where T = [-48.380, 147.438]C and N = [0, 1023].
+ * They must be accordingly altered to be suitable for the integer arithmetics.
+ * The technique is called 'factor redistribution', which just makes sure the
+ * multiplications and divisions are made so to have a result of the operations
+ * within the integer numbers limit. In addition we need to translate the
+ * formulae to accept millidegrees of Celsius. Here what they look like after
+ * the alterations:
+ * N = (18322e-20*(T^4) + 2343e-13*(T^3) + 87018e-9*(T^2) + 39269e-3*T +
+ *     17204e2) / 1e4,
+ * T = -16743e-12*(D^4) + 81542e-9*(D^3) - 182010e-6*(D^2) + 310200e-3*D -
+ *     48380,
+ * where T = [-48380, 147438] mC and N = [0, 1023].
+ */
+static const struct pvt_poly poly_temp_to_N = {
+	.total_divider = 10000,
+	.terms = {
+		{4, 18322, 10000, 10000},
+		{3, 2343, 10000, 10},
+		{2, 87018, 10000, 10},
+		{1, 39269, 1000, 1},
+		{0, 1720400, 1, 1}
+	}
+};
+
+static const struct pvt_poly poly_N_to_temp = {
+	.total_divider = 1,
+	.terms = {
+		{4, -16743, 1000, 1},
+		{3, 81542, 1000, 1},
+		{2, -182010, 1000, 1},
+		{1, 310200, 1000, 1},
+		{0, -48380, 1, 1}
+	}
+};
+
+/*
+ * Similar alterations are performed for the voltage conversion equations.
+ * The original formulae are:
+ * N = 1.8658e3*V - 1.1572e3,
+ * V = (N + 1.1572e3) / 1.8658e3,
+ * where V = [0.620, 1.168] V and N = [0, 1023].
+ * After the optimization they looks as follows:
+ * N = (18658e-3*V - 11572) / 10,
+ * V = N * 10^5 / 18658 + 11572 * 10^4 / 18658.
+ */
+static const struct pvt_poly poly_volt_to_N = {
+	.total_divider = 10,
+	.terms = {
+		{1, 18658, 1000, 1},
+		{0, -11572, 1, 1}
+	}
+};
+
+static const struct pvt_poly poly_N_to_volt = {
+	.total_divider = 10,
+	.terms = {
+		{1, 100000, 18658, 1},
+		{0, 115720000, 1, 18658}
+	}
+};
+
+/*
+ * Here is the polynomial calculation function, which performs the
+ * redistributed terms calculations. It's pretty straightforward. We walk
+ * over each degree term up to the free one, and perform the redistributed
+ * multiplication of the term coefficient, its divider (as for the rationale
+ * fraction representation), data power and the rational fraction divider
+ * leftover. Then all of this is collected in a total sum variable, which
+ * value is normalized by the total divider before being returned.
+ */
+static long pvt_calc_poly(const struct pvt_poly *poly, long data)
+{
+	const struct pvt_poly_term *term = poly->terms;
+	long tmp, ret = 0;
+	int deg;
+
+	do {
+		tmp = term->coef;
+		for (deg = 0; deg < term->deg; ++deg)
+			tmp = mult_frac(tmp, data, term->divider);
+		ret += tmp / term->divider_leftover;
+	} while ((term++)->deg);
+
+	return ret / poly->total_divider;
+}
+
+static inline u32 pvt_update(void __iomem *reg, u32 mask, u32 data)
+{
+	u32 old;
+
+	old = readl_relaxed(reg);
+	writel((old & ~mask) | (data & mask), reg);
+
+	return old & mask;
+}
+
+/*
+ * Baikal-T1 PVT mode can be updated only when the controller is disabled.
+ * So first we disable it, then set the new mode together with the controller
+ * getting back enabled. The same concerns the temperature trim and
+ * measurements timeout. If it is necessary the interface mutex is supposed
+ * to be locked at the time the operations are performed.
+ */
+static inline void pvt_set_mode(struct pvt_hwmon *pvt, u32 mode)
+{
+	u32 old;
+
+	mode = FIELD_PREP(PVT_CTRL_MODE_MASK, mode);
+
+	old = pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_MODE_MASK | PVT_CTRL_EN,
+		   mode | old);
+}
+
+static inline u32 pvt_calc_trim(long temp)
+{
+	temp = clamp_val(temp, 0, PVT_TRIM_TEMP);
+
+	return DIV_ROUND_UP(temp, PVT_TRIM_STEP);
+}
+
+static inline void pvt_set_trim(struct pvt_hwmon *pvt, u32 trim)
+{
+	u32 old;
+
+	trim = FIELD_PREP(PVT_CTRL_TRIM_MASK, trim);
+
+	old = pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_TRIM_MASK | PVT_CTRL_EN,
+		   trim | old);
+}
+
+static inline void pvt_set_tout(struct pvt_hwmon *pvt, u32 tout)
+{
+	u32 old;
+
+	old = pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+	writel(tout, pvt->regs + PVT_TTIMEOUT);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, old);
+}
+
+/*
+ * This driver can optionally provide the hwmon alarms for each sensor the PVT
+ * controller supports. The alarms functionality is made compile-time
+ * configurable due to the hardware interface implementation peculiarity
+ * described further in this comment. So in case if alarms are unnecessary in
+ * your system design it's recommended to have them disabled to prevent the PVT
+ * IRQs being periodically raised to get the data cache/alarms status up to
+ * date.
+ *
+ * Baikal-T1 PVT embedded controller is based on the Analog Bits PVT sensor,
+ * but is equipped with a dedicated control wrapper. It exposes the PVT
+ * sub-block registers space via the APB3 bus. In addition the wrapper provides
+ * a common interrupt vector of the sensors conversion completion events and
+ * threshold value alarms. Alas the wrapper interface hasn't been fully thought
+ * through. There is only one sensor can be activated at a time, for which the
+ * thresholds comparator is enabled right after the data conversion is
+ * completed. Due to this if alarms need to be implemented for all available
+ * sensors we can't just set the thresholds and enable the interrupts. We need
+ * to enable the sensors one after another and let the controller to detect
+ * the alarms by itself at each conversion. This also makes pointless to handle
+ * the alarms interrupts, since in occasion they happen synchronously with
+ * data conversion completion. The best driver design would be to have the
+ * completion interrupts enabled only and keep the converted value in the
+ * driver data cache. This solution is implemented if hwmon alarms are enabled
+ * in this driver. In case if the alarms are disabled, the conversion is
+ * performed on demand at the time a sensors input file is read.
+ */
+
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+
+#define pvt_hard_isr NULL
+
+static irqreturn_t pvt_soft_isr(int irq, void *data)
+{
+	const struct pvt_sensor_info *info;
+	struct pvt_hwmon *pvt = data;
+	struct pvt_cache *cache;
+	u32 val, thres_sts, old;
+
+	/*
+	 * DVALID bit will be cleared by reading the data. We need to save the
+	 * status before the next conversion happens. Threshold events will be
+	 * handled a bit later.
+	 */
+	thres_sts = readl(pvt->regs + PVT_RAW_INTR_STAT);
+
+	/*
+	 * Then lets recharge the PVT interface with the next sampling mode.
+	 * Lock the interface mutex to serialize trim, timeouts and alarm
+	 * thresholds settings.
+	 */
+	cache = &pvt->cache[pvt->sensor];
+	info = &pvt_info[pvt->sensor];
+	pvt->sensor = (pvt->sensor == PVT_SENSOR_LAST) ?
+		      PVT_SENSOR_FIRST : (pvt->sensor + 1);
+
+	/*
+	 * For some reason we have to mask the interrupt before changing the
+	 * mode, otherwise sometimes the temperature mode doesn't get
+	 * activated even though the actual mode in the ctrl register
+	 * corresponds to one. Then we read the data. By doing so we also
+	 * recharge the data conversion. After this the mode corresponding
+	 * to the next sensor in the row is set. Finally we enable the
+	 * interrupts back.
+	 */
+	mutex_lock(&pvt->iface_mtx);
+
+	old = pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
+			 PVT_INTR_DVALID);
+
+	val = readl(pvt->regs + PVT_DATA);
+
+	pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
+
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, old);
+
+	mutex_unlock(&pvt->iface_mtx);
+
+	/*
+	 * We can now update the data cache with data just retrieved from the
+	 * sensor. Lock write-seqlock to make sure the reader has a coherent
+	 * data.
+	 */
+	write_seqlock(&cache->data_seqlock);
+
+	cache->data = FIELD_GET(PVT_DATA_DATA_MASK, val);
+
+	write_sequnlock(&cache->data_seqlock);
+
+	/*
+	 * While PVT core is doing the next mode data conversion, we'll check
+	 * whether the alarms were triggered for the current sensor. Note that
+	 * according to the documentation only one threshold IRQ status can be
+	 * set at a time, that's why if-else statement is utilized.
+	 */
+	if ((thres_sts & info->thres_sts_lo) ^ cache->thres_sts_lo) {
+		WRITE_ONCE(cache->thres_sts_lo, thres_sts & info->thres_sts_lo);
+		hwmon_notify_event(pvt->hwmon, info->type, info->attr_min_alarm,
+				   info->channel);
+	} else if ((thres_sts & info->thres_sts_hi) ^ cache->thres_sts_hi) {
+		WRITE_ONCE(cache->thres_sts_hi, thres_sts & info->thres_sts_hi);
+		hwmon_notify_event(pvt->hwmon, info->type, info->attr_max_alarm,
+				   info->channel);
+	}
+
+	return IRQ_HANDLED;
+}
+
+inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
+{
+	return 0644;
+}
+
+inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
+{
+	return 0444;
+}
+
+static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			 long *val)
+{
+	struct pvt_cache *cache = &pvt->cache[type];
+	unsigned int seq;
+	u32 data;
+
+	do {
+		seq = read_seqbegin(&cache->data_seqlock);
+		data = cache->data;
+	} while (read_seqretry(&cache->data_seqlock, seq));
+
+	if (type == PVT_TEMP)
+		*val = pvt_calc_poly(&poly_N_to_temp, data);
+	else
+		*val = pvt_calc_poly(&poly_N_to_volt, data);
+
+	return 0;
+}
+
+static int pvt_read_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			  bool is_low, long *val)
+{
+	u32 data;
+
+	/* No need in serialization, since it is just read from MMIO. */
+	data = readl(pvt->regs + pvt_info[type].thres_base);
+
+	if (is_low)
+		data = FIELD_GET(PVT_THRES_LO_MASK, data);
+	else
+		data = FIELD_GET(PVT_THRES_HI_MASK, data);
+
+	if (type == PVT_TEMP)
+		*val = pvt_calc_poly(&poly_N_to_temp, data);
+	else
+		*val = pvt_calc_poly(&poly_N_to_volt, data);
+
+	return 0;
+}
+
+static int pvt_write_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			   bool is_low, long val)
+{
+	u32 data, limit, mask;
+	int ret;
+
+	if (type == PVT_TEMP) {
+		val = clamp(val, PVT_TEMP_MIN, PVT_TEMP_MAX);
+		data = pvt_calc_poly(&poly_temp_to_N, val);
+	} else {
+		val = clamp(val, PVT_VOLT_MIN, PVT_VOLT_MAX);
+		data = pvt_calc_poly(&poly_volt_to_N, val);
+	}
+
+	/* Serialize limit update, since a part of the register is changed. */
+	ret = mutex_lock_interruptible(&pvt->iface_mtx);
+	if (ret)
+		return ret;
+
+	/* Make sure the upper and lower ranges don't intersect. */
+	limit = readl(pvt->regs + pvt_info[type].thres_base);
+	if (is_low) {
+		limit = FIELD_GET(PVT_THRES_HI_MASK, limit);
+		data = clamp_val(data, PVT_DATA_MIN, limit);
+		data = FIELD_PREP(PVT_THRES_LO_MASK, data);
+		mask = PVT_THRES_LO_MASK;
+	} else {
+		limit = FIELD_GET(PVT_THRES_LO_MASK, limit);
+		data = clamp_val(data, limit, PVT_DATA_MAX);
+		data = FIELD_PREP(PVT_THRES_HI_MASK, data);
+		mask = PVT_THRES_HI_MASK;
+	}
+
+	pvt_update(pvt->regs + pvt_info[type].thres_base, mask, data);
+
+	mutex_unlock(&pvt->iface_mtx);
+
+	return 0;
+}
+
+static int pvt_read_alarm(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			  bool is_low, long *val)
+{
+	if (is_low)
+		*val = !!READ_ONCE(pvt->cache[type].thres_sts_lo);
+	else
+		*val = !!READ_ONCE(pvt->cache[type].thres_sts_hi);
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *pvt_channel_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_TYPE | HWMON_T_LABEL |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_OFFSET),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM),
+	NULL
+};
+
+#else /* !CONFIG_SENSORS_BT1_PVT_ALARMS */
+
+static irqreturn_t pvt_hard_isr(int irq, void *data)
+{
+	struct pvt_hwmon *pvt = data;
+	struct pvt_cache *cache;
+	u32 val;
+
+	/*
+	 * Mask the DVALID interrupt so after exiting from the handler a
+	 * repeated conversion wouldn't happen.
+	 */
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
+		   PVT_INTR_DVALID);
+
+	/*
+	 * Nothing special for alarm-less driver. Just read the data, update
+	 * the cache and notify a waiter of this event.
+	 */
+	val = readl(pvt->regs + PVT_DATA);
+	if (!(val & PVT_DATA_VALID)) {
+		dev_err(pvt->dev, "Got IRQ when data isn't valid\n");
+		return IRQ_HANDLED;
+	}
+
+	cache = &pvt->cache[pvt->sensor];
+
+	WRITE_ONCE(cache->data, FIELD_GET(PVT_DATA_DATA_MASK, val));
+
+	complete(&cache->conversion);
+
+	return IRQ_HANDLED;
+}
+
+#define pvt_soft_isr NULL
+
+inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
+{
+	return 0;
+}
+
+inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
+{
+	return 0;
+}
+
+static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			 long *val)
+{
+	struct pvt_cache *cache = &pvt->cache[type];
+	u32 data;
+	int ret;
+
+	/*
+	 * Lock PVT conversion interface until data cache is updated. The
+	 * data read procedure is following: set the requested PVT sensor
+	 * mode, enable IRQ and conversion, wait until conversion is finished,
+	 * then disable conversion and IRQ, and read the cached data.
+	 */
+	ret = mutex_lock_interruptible(&pvt->iface_mtx);
+	if (ret)
+		return ret;
+
+	pvt->sensor = type;
+	pvt_set_mode(pvt, pvt_info[type].mode);
+
+	/*
+	 * Unmask the DVALID interrupt and enable the sensors conversions.
+	 * Do the reverse procedure when conversion is done.
+	 */
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, 0);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
+
+	wait_for_completion(&cache->conversion);
+
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
+		   PVT_INTR_DVALID);
+
+	data = READ_ONCE(cache->data);
+
+	mutex_unlock(&pvt->iface_mtx);
+
+	if (type == PVT_TEMP)
+		*val = pvt_calc_poly(&poly_N_to_temp, data);
+	else
+		*val = pvt_calc_poly(&poly_N_to_volt, data);
+
+	return 0;
+}
+
+static int pvt_read_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			  bool is_low, long *val)
+{
+	return -EOPNOTSUPP;
+}
+
+static int pvt_write_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			   bool is_low, long val)
+{
+	return -EOPNOTSUPP;
+}
+
+static int pvt_read_alarm(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
+			  bool is_low, long *val)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_channel_info *pvt_channel_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_TYPE | HWMON_T_LABEL |
+			   HWMON_T_OFFSET),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+#endif /* !CONFIG_SENSORS_BT1_PVT_ALARMS */
+
+static inline bool pvt_hwmon_channel_is_valid(enum hwmon_sensor_types type,
+					      int ch)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (ch < 0 || ch >= PVT_TEMP_CHS)
+			return false;
+		break;
+	case hwmon_in:
+		if (ch < 0 || ch >= PVT_VOLT_CHS)
+			return false;
+		break;
+	default:
+		break;
+	}
+
+	/* The rest of the types are independent from the channel number. */
+	return true;
+}
+
+static umode_t pvt_hwmon_is_visible(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int ch)
+{
+	if (!pvt_hwmon_channel_is_valid(type, ch))
+		return 0;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_type:
+		case hwmon_temp_label:
+			return 0444;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+			return pvt_limit_is_visible(ch);
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+			return pvt_alarm_is_visible(ch);
+		case hwmon_temp_offset:
+			return 0644;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			return 0444;
+		case hwmon_in_min:
+		case hwmon_in_max:
+			return pvt_limit_is_visible(PVT_VOLT + ch);
+		case hwmon_in_min_alarm:
+		case hwmon_in_max_alarm:
+			return pvt_alarm_is_visible(PVT_VOLT + ch);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int pvt_read_trim(struct pvt_hwmon *pvt, long *val)
+{
+	u32 data;
+
+	data = readl(pvt->regs + PVT_CTRL);
+	*val = FIELD_GET(PVT_CTRL_TRIM_MASK, data) * PVT_TRIM_STEP;
+
+	return 0;
+}
+
+static int pvt_write_trim(struct pvt_hwmon *pvt, long val)
+{
+	u32 trim;
+	int ret;
+
+	/*
+	 * Serialize trim update, since a part of the register is changed and
+	 * the controller is supposed to be disabled during this operation.
+	 */
+	ret = mutex_lock_interruptible(&pvt->iface_mtx);
+	if (ret)
+		return ret;
+
+	trim = pvt_calc_trim(val);
+	pvt_set_trim(pvt, trim);
+
+	mutex_unlock(&pvt->iface_mtx);
+
+	return 0;
+}
+
+static int pvt_read_timeout(struct pvt_hwmon *pvt, long *val)
+{
+	unsigned long rate;
+	ktime_t kt;
+	u32 data;
+
+	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
+	if (!rate)
+		return -ENODEV;
+
+	/*
+	 * Don't bother with mutex here, since we just read data from MMIO.
+	 * We also have to scale the ticks timeout up to compensate the
+	 * ms-ns-data translations.
+	 */
+	data = readl(pvt->regs + PVT_TTIMEOUT) + 1;
+
+	/*
+	 * Calculate ref-clock based delay (Ttotal) between two consecutive
+	 * data samples of the same sensor. So we first must calculate the
+	 * delay introduced by the internal ref-clock timer (Tref * Fclk).
+	 * Then add the constant timeout cuased by each conversion latency
+	 * (Tmin). The basic formulae for each conversion is following:
+	 *   Ttotal = Tref * Fclk + Tmin
+	 * Note if alarms are enabled the sensors are polled one after
+	 * another, so in order to have the delay being applicable for each
+	 * sensor the requested value must be equally redistirbuted.
+	 */
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+	kt = ktime_set(PVT_SENSORS_NUM * (u64)data, 0);
+	kt = ktime_divns(kt, rate);
+	kt = ktime_add_ns(kt, PVT_SENSORS_NUM * PVT_TOUT_MIN);
+#else
+	kt = ktime_set(data, 0);
+	kt = ktime_divns(kt, rate);
+	kt = ktime_add_ns(kt, PVT_TOUT_MIN);
+#endif
+
+	/* Return the result in msec as hwmon sysfs interface requires. */
+	*val = ktime_to_ms(kt);
+
+	return 0;
+}
+
+static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
+{
+	unsigned long rate;
+	ktime_t kt;
+	u32 data;
+	int ret;
+
+	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
+	if (!rate)
+		return -ENODEV;
+
+	/*
+	 * If alarms are enabled, the requested timeout must be divided
+	 * between all available sensors to have the requested delay
+	 * applicable to each individual sensor.
+	 */
+	kt = ms_to_ktime(val);
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+	kt = ktime_divns(kt, PVT_SENSORS_NUM);
+#endif
+
+	/*
+	 * Subtract a constant lag, which always persists due to the limited
+	 * PVT sampling rate. Make sure the timeout is not negative.
+	 */
+	kt = ktime_sub_ns(kt, PVT_TOUT_MIN);
+	if (ktime_to_ns(kt) < 0)
+		kt = ktime_set(0, 0);
+
+	/*
+	 * Finally recalculate the timeout in terms of the reference clock
+	 * period.
+	 */
+	data = ktime_divns(kt * rate, NSEC_PER_SEC);
+
+	/*
+	 * Update the measurements delay, but lock the interface first, since
+	 * we have to disable PVT in order to have the new delay actually
+	 * updated.
+	 */
+	ret = mutex_lock_interruptible(&pvt->iface_mtx);
+	if (ret)
+		return ret;
+
+	pvt_set_tout(pvt, data);
+
+	mutex_unlock(&pvt->iface_mtx);
+
+	return 0;
+}
+
+static int pvt_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int ch, long *val)
+{
+	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
+
+	if (!pvt_hwmon_channel_is_valid(type, ch))
+		return -EINVAL;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return pvt_read_timeout(pvt, val);
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return pvt_read_data(pvt, ch, val);
+		case hwmon_temp_type:
+			*val = 1;
+			return 0;
+		case hwmon_temp_min:
+			return pvt_read_limit(pvt, ch, true, val);
+		case hwmon_temp_max:
+			return pvt_read_limit(pvt, ch, false, val);
+		case hwmon_temp_min_alarm:
+			return pvt_read_alarm(pvt, ch, true, val);
+		case hwmon_temp_max_alarm:
+			return pvt_read_alarm(pvt, ch, false, val);
+		case hwmon_temp_offset:
+			return pvt_read_trim(pvt, val);
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return pvt_read_data(pvt, PVT_VOLT + ch, val);
+		case hwmon_in_min:
+			return pvt_read_limit(pvt, PVT_VOLT + ch, true, val);
+		case hwmon_in_max:
+			return pvt_read_limit(pvt, PVT_VOLT + ch, false, val);
+		case hwmon_in_min_alarm:
+			return pvt_read_alarm(pvt, PVT_VOLT + ch, true, val);
+		case hwmon_in_max_alarm:
+			return pvt_read_alarm(pvt, PVT_VOLT + ch, false, val);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int pvt_hwmon_read_string(struct device *dev,
+				 enum hwmon_sensor_types type,
+				 u32 attr, int ch, const char **str)
+{
+	if (!pvt_hwmon_channel_is_valid(type, ch))
+		return -EINVAL;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str = pvt_info[ch].label;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*str = pvt_info[PVT_VOLT + ch].label;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int pvt_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int ch, long val)
+{
+	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
+
+	if (!pvt_hwmon_channel_is_valid(type, ch))
+		return -EINVAL;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return pvt_write_timeout(pvt, val);
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_min:
+			return pvt_write_limit(pvt, ch, true, val);
+		case hwmon_temp_max:
+			return pvt_write_limit(pvt, ch, false, val);
+		case hwmon_temp_offset:
+			return pvt_write_trim(pvt, val);
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_min:
+			return pvt_write_limit(pvt, PVT_VOLT + ch, true, val);
+		case hwmon_in_max:
+			return pvt_write_limit(pvt, PVT_VOLT + ch, false, val);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops pvt_hwmon_ops = {
+	.is_visible = pvt_hwmon_is_visible,
+	.read = pvt_hwmon_read,
+	.read_string = pvt_hwmon_read_string,
+	.write = pvt_hwmon_write
+};
+
+static const struct hwmon_chip_info pvt_hwmon_info = {
+	.ops = &pvt_hwmon_ops,
+	.info = pvt_channel_info
+};
+
+static void pvt_clear_data(void *data)
+{
+	struct pvt_hwmon *pvt = data;
+#if !defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+	int idx;
+
+	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
+		complete_all(&pvt->cache[idx].conversion);
+#endif
+
+	mutex_destroy(&pvt->iface_mtx);
+}
+
+static struct pvt_hwmon *pvt_create_data(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pvt_hwmon *pvt;
+	int ret, idx;
+
+	pvt = devm_kzalloc(dev, sizeof(*pvt), GFP_KERNEL);
+	if (!pvt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_add_action(dev, pvt_clear_data, pvt);
+	if (ret) {
+		dev_err(dev, "Can't add PVT data clear action\n");
+		return ERR_PTR(ret);
+	}
+
+	pvt->dev = dev;
+	pvt->sensor = PVT_SENSOR_FIRST;
+	mutex_init(&pvt->iface_mtx);
+
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
+		seqlock_init(&pvt->cache[idx].data_seqlock);
+#else
+	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
+		init_completion(&pvt->cache[idx].conversion);
+#endif
+
+	return pvt;
+}
+
+static int pvt_request_regs(struct pvt_hwmon *pvt)
+{
+	struct platform_device *pdev = to_platform_device(pvt->dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(pvt->dev, "Couldn't find PVT memresource\n");
+		return -EINVAL;
+	}
+
+	pvt->regs = devm_ioremap_resource(pvt->dev, res);
+	if (IS_ERR(pvt->regs)) {
+		dev_err(pvt->dev, "Couldn't map PVT registers\n");
+		return PTR_ERR(pvt->regs);
+	}
+
+	return 0;
+}
+
+static void pvt_disable_clks(void *data)
+{
+	struct pvt_hwmon *pvt = data;
+
+	clk_bulk_disable_unprepare(PVT_CLOCK_NUM, pvt->clks);
+}
+
+static int pvt_request_clks(struct pvt_hwmon *pvt)
+{
+	int ret;
+
+	pvt->clks[PVT_CLOCK_APB].id = "pclk";
+	pvt->clks[PVT_CLOCK_REF].id = "ref";
+
+	ret = devm_clk_bulk_get(pvt->dev, PVT_CLOCK_NUM, pvt->clks);
+	if (ret) {
+		dev_err(pvt->dev, "Couldn't get PVT clocks descriptors\n");
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(PVT_CLOCK_NUM, pvt->clks);
+	if (ret) {
+		dev_err(pvt->dev, "Couldn't enable the PVT clocks\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(pvt->dev, pvt_disable_clks, pvt);
+	if (ret) {
+		dev_err(pvt->dev, "Can't add PVT clocks disable action\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void pvt_init_iface(struct pvt_hwmon *pvt)
+{
+	u32 trim, temp;
+
+	/*
+	 * Make sure all interrupts and controller are disabled so not to
+	 * accidentally have ISR executed before the driver data is fully
+	 * initialized. Clear the IRQ status as well.
+	 */
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_ALL, PVT_INTR_ALL);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+	readl(pvt->regs + PVT_CLR_INTR);
+	readl(pvt->regs + PVT_DATA);
+
+	/* Setup default sensor mode, timeout and temperature trim. */
+	pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
+	pvt_set_tout(pvt, PVT_TOUT_DEF);
+
+	trim = PVT_TRIM_DEF;
+	if (!of_property_read_u32(pvt->dev->of_node,
+	     "baikal,pvt-temp-offset-millicelsius", &temp))
+		trim = pvt_calc_trim(temp);
+
+	pvt_set_trim(pvt, trim);
+}
+
+static int pvt_request_irq(struct pvt_hwmon *pvt)
+{
+	struct platform_device *pdev = to_platform_device(pvt->dev);
+	int ret;
+
+	pvt->irq = platform_get_irq(pdev, 0);
+	if (pvt->irq < 0)
+		return pvt->irq;
+
+	ret = devm_request_threaded_irq(pvt->dev, pvt->irq,
+					pvt_hard_isr, pvt_soft_isr,
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+					IRQF_SHARED | IRQF_TRIGGER_HIGH |
+					IRQF_ONESHOT,
+#else
+					IRQF_SHARED | IRQF_TRIGGER_HIGH,
+#endif
+					"pvt", pvt);
+	if (ret) {
+		dev_err(pvt->dev, "Couldn't request PVT IRQ\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int pvt_create_hwmon(struct pvt_hwmon *pvt)
+{
+	pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev, "pvt", pvt,
+		&pvt_hwmon_info, NULL);
+	if (IS_ERR(pvt->hwmon)) {
+		dev_err(pvt->dev, "Couldn't create hwmon device\n");
+		return PTR_ERR(pvt->hwmon);
+	}
+
+	return 0;
+}
+
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+
+static void pvt_disable_iface(void *data)
+{
+	struct pvt_hwmon *pvt = data;
+
+	mutex_lock(&pvt->iface_mtx);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
+		   PVT_INTR_DVALID);
+	mutex_unlock(&pvt->iface_mtx);
+}
+
+static int pvt_enable_iface(struct pvt_hwmon *pvt)
+{
+	int ret;
+
+	ret = devm_add_action(pvt->dev, pvt_disable_iface, pvt);
+	if (ret) {
+		dev_err(pvt->dev, "Can't add PVT disable interface action\n");
+		return ret;
+	}
+
+	/*
+	 * Enable sensors data conversion and IRQ. We need to lock the
+	 * interface mutex since hwmon has just been created and the
+	 * corresponding sysfs files are accessible from user-space,
+	 * which theoretically may cause races.
+	 */
+	mutex_lock(&pvt->iface_mtx);
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, 0);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
+	mutex_unlock(&pvt->iface_mtx);
+
+	return 0;
+}
+
+#else /* !CONFIG_SENSORS_BT1_PVT_ALARMS */
+
+static int pvt_enable_iface(struct pvt_hwmon *pvt)
+{
+	return 0;
+}
+
+#endif /* !CONFIG_SENSORS_BT1_PVT_ALARMS */
+
+static int pvt_probe(struct platform_device *pdev)
+{
+	struct pvt_hwmon *pvt;
+	int ret;
+
+	pvt = pvt_create_data(pdev);
+	if (IS_ERR(pvt))
+		return PTR_ERR(pvt);
+
+	ret = pvt_request_regs(pvt);
+	if (ret)
+		return ret;
+
+	ret = pvt_request_clks(pvt);
+	if (ret)
+		return ret;
+
+	pvt_init_iface(pvt);
+
+	ret = pvt_request_irq(pvt);
+	if (ret)
+		return ret;
+
+	ret = pvt_create_hwmon(pvt);
+	if (ret)
+		return ret;
+
+	ret = pvt_enable_iface(pvt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id pvt_of_match[] = {
+	{ .compatible = "baikal,bt1-pvt" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pvt_of_match);
+
+static struct platform_driver pvt_driver = {
+	.probe = pvt_probe,
+	.driver = {
+		.name = "bt1-pvt",
+		.of_match_table = pvt_of_match
+	}
+};
+module_platform_driver(pvt_driver);
+
+MODULE_AUTHOR("Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>");
+MODULE_DESCRIPTION("Baikal-T1 PVT driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/hwmon/bt1-pvt.h b/drivers/hwmon/bt1-pvt.h
new file mode 100644
index 000000000000..5eac73e94885
--- /dev/null
+++ b/drivers/hwmon/bt1-pvt.h
@@ -0,0 +1,244 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Baikal-T1 Process, Voltage, Temperature sensor driver
+ */
+#ifndef __HWMON_BT1_PVT_H__
+#define __HWMON_BT1_PVT_H__
+
+#include <linux/completion.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/seqlock.h>
+
+/* Baikal-T1 PVT registers and their bitfields */
+#define PVT_CTRL			0x00
+#define PVT_CTRL_EN			BIT(0)
+#define PVT_CTRL_MODE_FLD		1
+#define PVT_CTRL_MODE_MASK		GENMASK(3, PVT_CTRL_MODE_FLD)
+#define PVT_CTRL_MODE_TEMP		0x0
+#define PVT_CTRL_MODE_VOLT		0x1
+#define PVT_CTRL_MODE_LVT		0x2
+#define PVT_CTRL_MODE_HVT		0x4
+#define PVT_CTRL_MODE_SVT		0x6
+#define PVT_CTRL_TRIM_FLD		4
+#define PVT_CTRL_TRIM_MASK		GENMASK(8, PVT_CTRL_TRIM_FLD)
+#define PVT_DATA			0x04
+#define PVT_DATA_VALID			BIT(10)
+#define PVT_DATA_DATA_FLD		0
+#define PVT_DATA_DATA_MASK		GENMASK(9, PVT_DATA_DATA_FLD)
+#define PVT_TTHRES			0x08
+#define PVT_VTHRES			0x0C
+#define PVT_LTHRES			0x10
+#define PVT_HTHRES			0x14
+#define PVT_STHRES			0x18
+#define PVT_THRES_LO_FLD		0
+#define PVT_THRES_LO_MASK		GENMASK(9, PVT_THRES_LO_FLD)
+#define PVT_THRES_HI_FLD		10
+#define PVT_THRES_HI_MASK		GENMASK(19, PVT_THRES_HI_FLD)
+#define PVT_TTIMEOUT			0x1C
+#define PVT_INTR_STAT			0x20
+#define PVT_INTR_MASK			0x24
+#define PVT_RAW_INTR_STAT		0x28
+#define PVT_INTR_DVALID			BIT(0)
+#define PVT_INTR_TTHRES_LO		BIT(1)
+#define PVT_INTR_TTHRES_HI		BIT(2)
+#define PVT_INTR_VTHRES_LO		BIT(3)
+#define PVT_INTR_VTHRES_HI		BIT(4)
+#define PVT_INTR_LTHRES_LO		BIT(5)
+#define PVT_INTR_LTHRES_HI		BIT(6)
+#define PVT_INTR_HTHRES_LO		BIT(7)
+#define PVT_INTR_HTHRES_HI		BIT(8)
+#define PVT_INTR_STHRES_LO		BIT(9)
+#define PVT_INTR_STHRES_HI		BIT(10)
+#define PVT_INTR_ALL			GENMASK(10, 0)
+#define PVT_CLR_INTR			0x2C
+
+/*
+ * PVT sensors-related limits and default values
+ * @PVT_TEMP_MIN: Minimal temperature in millidegrees of Celsius.
+ * @PVT_TEMP_MAX: Maximal temperature in millidegrees of Celsius.
+ * @PVT_TEMP_CHS: Number of temperature hwmon channels.
+ * @PVT_VOLT_MIN: Minimal voltage in mV.
+ * @PVT_VOLT_MAX: Maximal voltage in mV.
+ * @PVT_VOLT_CHS: Number of voltage hwmon channels.
+ * @PVT_DATA_MIN: Minimal PVT raw data value.
+ * @PVT_DATA_MAX: Maximal PVT raw data value.
+ * @PVT_TRIM_MIN: Minimal temperature sensor trim value.
+ * @PVT_TRIM_MAX: Maximal temperature sensor trim value.
+ * @PVT_TRIM_DEF: Default temperature sensor trim value (set a proper value
+ *		  when one is determined for Baikal-T1 SoC).
+ * @PVT_TRIM_TEMP: Maximum temperature encoded by the trim factor.
+ * @PVT_TRIM_STEP: Temperature stride corresponding to the trim value.
+ * @PVT_TOUT_MIN: Minimal timeout between samples in nanoseconds.
+ * @PVT_TOUT_DEF: Default data measurements timeout. In case if alarms are
+ *		  activated the PVT IRQ is enabled to be raised after each
+ *		  conversion in order to have the thresholds checked and the
+ *		  converted value cached. Too frequent conversions may cause
+ *		  the system CPU overload. Lets set the 50ms delay between
+ *		  them by default to prevent this.
+ */
+#define PVT_TEMP_MIN		-48380L
+#define PVT_TEMP_MAX		147438L
+#define PVT_TEMP_CHS		1
+#define PVT_VOLT_MIN		620L
+#define PVT_VOLT_MAX		1168L
+#define PVT_VOLT_CHS		4
+#define PVT_DATA_MIN		0
+#define PVT_DATA_MAX		(PVT_DATA_DATA_MASK >> PVT_DATA_DATA_FLD)
+#define PVT_TRIM_MIN		0
+#define PVT_TRIM_MAX		(PVT_CTRL_TRIM_MASK >> PVT_CTRL_TRIM_FLD)
+#define PVT_TRIM_TEMP		7130
+#define PVT_TRIM_STEP		(PVT_TRIM_TEMP / PVT_TRIM_MAX)
+#define PVT_TRIM_DEF		0
+#define PVT_TOUT_MIN		(NSEC_PER_SEC / 3000)
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+# define PVT_TOUT_DEF		60000
+#else
+# define PVT_TOUT_DEF		0
+#endif
+
+/*
+ * enum pvt_sensor_type - Baikal-T1 PVT sensor types (correspond to each PVT
+ *			  sampling mode)
+ * @PVT_SENSOR*: helpers to traverse the sensors in loops.
+ * @PVT_TEMP: PVT Temperature sensor.
+ * @PVT_VOLT: PVT Voltage sensor.
+ * @PVT_LVT: PVT Low-Voltage threshold sensor.
+ * @PVT_HVT: PVT High-Voltage threshold sensor.
+ * @PVT_SVT: PVT Standard-Voltage threshold sensor.
+ */
+enum pvt_sensor_type {
+	PVT_SENSOR_FIRST,
+	PVT_TEMP = PVT_SENSOR_FIRST,
+	PVT_VOLT,
+	PVT_LVT,
+	PVT_HVT,
+	PVT_SVT,
+	PVT_SENSOR_LAST = PVT_SVT,
+	PVT_SENSORS_NUM
+};
+
+/*
+ * enum pvt_clock_type - Baikal-T1 PVT clocks.
+ * @PVT_CLOCK_APB: APB clock.
+ * @PVT_CLOCK_REF: PVT reference clock.
+ */
+enum pvt_clock_type {
+	PVT_CLOCK_APB,
+	PVT_CLOCK_REF,
+	PVT_CLOCK_NUM
+};
+
+/*
+ * struct pvt_sensor_info - Baikal-T1 PVT sensor informational structure
+ * @channel: Sensor channel ID.
+ * @label: hwmon sensor label.
+ * @mode: PVT mode corresponding to the channel.
+ * @thres_base: upper and lower threshold values of the sensor.
+ * @thres_sts_lo: low threshold status bitfield.
+ * @thres_sts_hi: high threshold status bitfield.
+ * @type: Sensor type.
+ * @attr_min_alarm: Min alarm attribute ID.
+ * @attr_min_alarm: Max alarm attribute ID.
+ */
+struct pvt_sensor_info {
+	int channel;
+	const char *label;
+	u32 mode;
+	unsigned long thres_base;
+	u32 thres_sts_lo;
+	u32 thres_sts_hi;
+	enum hwmon_sensor_types type;
+	u32 attr_min_alarm;
+	u32 attr_max_alarm;
+};
+
+#define PVT_SENSOR_INFO(_ch, _label, _type, _mode, _thres)	\
+	{							\
+		.channel = _ch,					\
+		.label = _label,				\
+		.mode = PVT_CTRL_MODE_ ##_mode,			\
+		.thres_base = PVT_ ##_thres,			\
+		.thres_sts_lo = PVT_INTR_ ##_thres## _LO,	\
+		.thres_sts_hi = PVT_INTR_ ##_thres## _HI,	\
+		.type = _type,					\
+		.attr_min_alarm = _type## _min,			\
+		.attr_max_alarm = _type## _max,			\
+	}
+
+/*
+ * struct pvt_cache - PVT sensors data cache
+ * @data: data cache in raw format.
+ * @thres_sts_lo: low threshold status saved on the previous data conversion.
+ * @thres_sts_hi: high threshold status saved on the previous data conversion.
+ * @data_seqlock: cached data seq-lock.
+ * @conversion: data conversion completion.
+ */
+struct pvt_cache {
+	u32 data;
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+	seqlock_t data_seqlock;
+	u32 thres_sts_lo;
+	u32 thres_sts_hi;
+#else
+	struct completion conversion;
+#endif
+};
+
+/*
+ * struct pvt_hwmon - Baikal-T1 PVT private data
+ * @dev: device structure of the PVT platform device.
+ * @hwmon: hwmon device structure.
+ * @regs: pointer to the Baikal-T1 PVT registers region.
+ * @irq: PVT events IRQ number.
+ * @clks: Array of the PVT clocks descriptor (APB/ref clocks).
+ * @ref_clk: Pointer to the reference clocks descriptor.
+ * @iface_mtx: Generic interface mutex (used to lock the alarm registers
+ *	       when the alarms enabled, or the data conversion interface
+ *	       if alarms are disabled).
+ * @sensor: current PVT sensor the data conversion is being performed for.
+ * @cache: data cache descriptor.
+ */
+struct pvt_hwmon {
+	struct device *dev;
+	struct device *hwmon;
+
+	void __iomem *regs;
+	int irq;
+
+	struct clk_bulk_data clks[PVT_CLOCK_NUM];
+
+	struct mutex iface_mtx;
+	enum pvt_sensor_type sensor;
+	struct pvt_cache cache[PVT_SENSORS_NUM];
+};
+
+/*
+ * struct pvt_poly_term - a term descriptor of the PVT data translation
+ *			  polynomial
+ * @deg: degree of the term.
+ * @coef: multiplication factor of the term.
+ * @divider: distributed divider per each degree.
+ * @divider_leftover: divider leftover, which couldn't be redistributed.
+ */
+struct pvt_poly_term {
+	unsigned int deg;
+	long coef;
+	long divider;
+	long divider_leftover;
+};
+
+/*
+ * struct pvt_poly - PVT data translation polynomial descriptor
+ * @total_divider: total data divider.
+ * @terms: polynomial terms up to a free one.
+ */
+struct pvt_poly {
+	long total_divider;
+	struct pvt_poly_term terms[];
+};
+
+#endif /* __HWMON_BT1_PVT_H__ */
-- 
2.26.2

