Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8441E1725
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 23:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbgEYV0q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 17:26:46 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:54134 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729414AbgEYV0p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 May 2020 17:26:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B79DC8030869;
        Mon, 25 May 2020 21:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id duT4R7CnwPBh; Tue, 26 May 2020 00:26:29 +0300 (MSK)
Date:   Tue, 26 May 2020 00:26:26 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Dan Robertson <dan@dlrobertson.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Beniamin Bia <beniamin.bia@analog.com>,
        Jean Delvare <jdelvare@suse.de>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: Add Baikal-T1 PVT sensor driver
Message-ID: <20200525212626.q2bfhdxu2mu5fgqx@mobilestation>
References: <20200306132611.103408030701@mail.baikalelectronics.ru>
 <20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru>
 <20200510103211.27905-3-Sergey.Semin@baikalelectronics.ru>
 <20200522141955.GA172468@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200522141955.GA172468@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 22, 2020 at 07:19:55AM -0700, Guenter Roeck wrote:
> On Sun, May 10, 2020 at 01:32:11PM +0300, Serge Semin wrote:
> > Baikal-T1 SoC provides an embedded process, voltage and temperature
> > sensor to monitor an internal SoC environment (chip temperature, supply
> > voltage and process monitor) and on time detect critical situations,
> > which may cause the system instability and even damages. The IP-block
> > is based on the Analog Bits PVT sensor, but is equipped with a
> > dedicated control wrapper, which provides a MMIO registers-based access
> > to the sensor core functionality (APB3-bus based) and exposes an
> > additional functions like thresholds/data ready interrupts, its status
> > and masks, measurements timeout. All of these is used to create a hwmon
> > driver being added to the kernel by this commit.
> > 
> > The driver implements support for the hardware monitoring capabilities
> > of Baikal-T1 process, voltage and temperature sensors. PVT IP-core
> > consists of one temperature and four voltage sensors, each of which is
> > implemented as a dedicated hwmon channel config.
> > 
> > The driver can optionally provide the hwmon alarms for each sensor the
> > PVT controller supports. The alarms functionality is made compile-time
> > configurable due to the hardware interface implementation peculiarity,
> > which is connected with an ability to convert data from only one sensor
> > at a time. Additional limitation is that the controller performs the
> > thresholds checking synchronously with the data conversion procedure.
> > Due to these limitations in order to have the hwmon alarms
> > automatically detected the driver code must switch from one sensor to
> > another, read converted data and manually check the threshold status
> > bits. Depending on the measurements timeout settings this design may
> > cause additional burden on the system performance. By default if the
> > alarms kernel config is disabled the data conversion is performed by
> > the driver on demand when read operation is requested via corresponding
> > _input-file.
> > 
> > Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> > Signed-off-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-mips@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > ---
> > 
> > Changelog v2:
> > - Discard handwritten IO-access wrappers. Use normal readl/writel instead.
> > - Use generic FIELD_{GET,PREP} macros instead of handwritten ones.
> > - Since the driver depends on the OF config we can remove of_match_ptr()
> >   macro utilization.
> > - Don't print error-message if no platform IRQ found. Just return an error.
> > - Remove probe-status info string printout.
> > ---
> >  Documentation/hwmon/bt1-pvt.rst |  113 +++
> 

> Needs to be added to index.rst.

Ok.

> 
> >  drivers/hwmon/Kconfig           |   29 +
> >  drivers/hwmon/Makefile          |    1 +
> >  drivers/hwmon/bt1-pvt.c         | 1154 +++++++++++++++++++++++++++++++
> >  drivers/hwmon/bt1-pvt.h         |  237 +++++++
> >  5 files changed, 1534 insertions(+)
> >  create mode 100644 Documentation/hwmon/bt1-pvt.rst
> >  create mode 100644 drivers/hwmon/bt1-pvt.c
> >  create mode 100644 drivers/hwmon/bt1-pvt.h
> > 
> > diff --git a/Documentation/hwmon/bt1-pvt.rst b/Documentation/hwmon/bt1-pvt.rst
> > new file mode 100644
> > index 000000000000..7ad8574bce98
> > --- /dev/null
> > +++ b/Documentation/hwmon/bt1-pvt.rst
> > @@ -0,0 +1,113 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +

[nip]

> > +Sysfs Attributes
> > +----------------
> > +
> > +Following is a list of all sysfs attributes that the driver provides, their
> > +permissions and a short description:
> > +
> > +=============================== ======= =======================================
> > +Name				Perm	Description
> > +=============================== ======= =======================================
> > +update_interval			RW	Measurements update interval per
> > +					sensor.
> > +temp1_type			RO	Sensor type (always 1 as CPU embedded
> > +					diode).
> > +temp1_label			RO	MIPS P5600 Temperature sensor.
> > +temp1_input			RO	Measured temperature in millidegree
> > +					Celsius.
> > +temp1_min			RW	Low limit for temp input.
> > +temp1_max			RW	High limit for temp input.
> > +temp1_min_alarm			RO	Temperature input alarm. Returns 1 if
> > +					temperature input went below min limit,
> > +					0 otherwise.
> > +temp1_max_alarm			RO	Temperature input alarm. Returns 1 if
> > +					temperature input went above max limit,
> > +					0 otherwise.

> > +temp1_trim			RW	Temperature sensor trimming factor
> > +					(specific to the SoC application).
> 

> This needs a much better documentation as well as explanation why it needs to be
> a sysfs attribute instead of a devicetree node (ie why it needs to be
> runtime-controlled).

Trimming factor can be used to manually tune the temperature sensor characteristics
(simple speaking shifts one with respect to the base range limits) in case if in
accordance to some more reliable source of the temperature measurements, they
don't correspond to the real core temperature.

In my opinion, it would be better to have both sysfs node and DT property. The former
will be used to select a proper value at run-time when the system engineer finds
out the temperature sensor lies regarding the real core temperature. So by
picking up a proper trim value, one will make sure the sensor shows a real
temperature in accordance with a reliable reference device measurements. Then
the later (DT property) can be used to fix the determined trim value to the
particular platform configuration in the DTS file of the corresponding board.

Additionally if there is no way to alter the DT file, but a user needs to tune
the temperature sensor measurements up, then sysfs interface will be the only
way to do so.

I can also improve the description like this:

-temp1_trim			RW	Temperature sensor trimming factor
-					(specific to the SoC application).
+temp1_trim			RW	Temperature sensor trimming factor
+					can be used to manually tune the
+					absolute temperature measurements up.

What do you think about new description and having both sysf node and DT
property to set the temperature trim value?

> 
> > +in[0-3]_label			RO	MIPS P5600 Voltage sensor (either core
> > +					or low/high/standard thresholds).
> > +in[0-3]_input			RO	Measured voltage in millivolts.
> > +in[0-3]_min			RW	Low limit for voltage input.
> > +in[0-3]_max			RW	High limit for voltage input.
> > +in[0-3]_min_alarm		RO	Voltage input alarm. Returns 1 if
> > +					voltage input went below min limit,
> > +					0 otherwise.
> > +in[0-3]_max_alarm		RO	Voltage input alarm. Returns 1 if
> > +					voltage input went above max limit,
> > +					0 otherwise.
> > +=============================== ======= =======================================
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 4c62f900bf7e..b80fc7d398c3 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -404,6 +404,35 @@ config SENSORS_ATXP1
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called atxp1.
> >  
> > +config SENSORS_BT1_PVT
> > +	tristate "Baikal-T1 Process, Voltage, Temperature sensor driver"
> > +	depends on (MIPS_BAIKAL_T1 && OF) || COMPILE_TEST
> > +	help
> > +	  If you say yes here you get support for Baikal-T1 PVT sensor
> > +	  embedded into the SoC.
> > +
> > +	  This driver can also be built as a module. If so, the module will be
> > +	  called bt1-pvt.
> > +
> > +if SENSORS_BT1_PVT
> > +
> > +config SENSORS_BT1_PVT_ALARMS
> > +	bool "Enable Baikal-T1 PVT sensor alarms"
> > +	default n
> 

> "default n" is unnecessary. Also, instead of "if SENSORS_BT1_PVT", please
> use "depends on SENSORS_BT1_PVT".

Ok.

> 
> > +	help
> > +	  Baikal-T1 PVT IP-block provides threshold registers for each
> > +	  supported sensor. But the corresponding interrupts might be
> > +	  generated by the thresholds comparator only in synchronization with
> > +	  a data conversion. Additionally there is only one sensor data can
> > +	  be converted at a time. All of these makes the interface impossible
> > +	  to be used for the hwmon alarms implementation without periodic
> > +	  switch between the PVT sensors. By default the data conversion is
> > +	  performed on demand from the user-space. If this config is enabled
> > +	  the data conversion will be periodically performed and the data will be
> > +	  saved in the internal driver cache.
> > +
> > +endif
> > +
> >  config SENSORS_DRIVETEMP
> >  	tristate "Hard disk drives with temperature sensors"
> >  	depends on SCSI && ATA
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index b0b9c8e57176..408b86a5e71d 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -53,6 +53,7 @@ obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
> >  obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
> >  obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
> >  obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
> > +obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
> >  obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
> >  obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
> >  obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
> > diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
> > new file mode 100644
> > index 000000000000..1a29fd01aa2b
> > --- /dev/null
> > +++ b/drivers/hwmon/bt1-pvt.c
> > @@ -0,0 +1,1154 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> > + *
> > + * Authors:
> > + *   Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> > + *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > + *
> > + * Baikal-T1 Process, Voltage, Temperature sensor driver
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/types.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/bitops.h>
> > +#include <linux/mutex.h>
> > +#include <linux/seqlock.h>
> > +#include <linux/completion.h>
> > +#include <linux/limits.h>
> > +#include <linux/ktime.h>
> > +#include <linux/clk.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> 

> Alphabetic order, please.

Ok.

> 
> > +
> > +#include "bt1-pvt.h"
> > +

[nip]

> > +
> > +static irqreturn_t pvt_soft_isr(int irq, void *data)
> > +{
> > +	const struct pvt_sensor_info *info;
> > +	struct pvt_hwmon *pvt = data;
> > +	struct pvt_cache *cache;
> > +	u32 val, thres_sts, old;
> > +
> > +	/*
> > +	 * DVALID bit will be cleared by reading the data. We need to save the
> > +	 * status before the next conversion happens. Threshold events will be
> > +	 * handled a bit later.
> > +	 */
> > +	thres_sts = readl(pvt->regs + PVT_RAW_INTR_STAT);
> > +
> > +	/*
> > +	 * Then lets recharge the PVT interface with the next sampling mode.
> > +	 * Lock the interface mutex to serialize trim, timeouts and alarm
> > +	 * thresholds settings.
> > +	 */
> > +	cache = &pvt->cache[pvt->sensor];
> > +	info = &pvt_info[pvt->sensor];
> > +	pvt->sensor = (pvt->sensor == PVT_SENSOR_LAST) ?
> > +		      PVT_SENSOR_FIRST : (pvt->sensor + 1);
> > +
> > +	/*
> > +	 * For some reason we have to mask the interrupt before changing the
> > +	 * mode, otherwise sometimes the temperature mode doesn't get
> > +	 * activated even though the actual mode in ctrl register correspond
> > +	 * to one. Then we read the data. By doing so we also recharge the data
> > +	 * conversion. After this the mode corresponding to the next
> > +	 * sensor in the row is set. Finally we enable the interrupts back.
> > +	 */
> > +	mutex_lock(&pvt->iface_mtx);
> > +
> > +	old = pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
> > +			 PVT_INTR_DVALID);
> > +
> > +	val = readl(pvt->regs + PVT_DATA);
> > +
> > +	pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
> > +
> > +	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, old);
> > +
> > +	mutex_unlock(&pvt->iface_mtx);
> > +
> > +	/*
> > +	 * We can now update the data cache with data just retrieved from the
> > +	 * sensor. Lock write-seqlock to make sure the reader has a coherent
> > +	 * data.
> > +	 */
> > +	write_seqlock(&cache->data_seqlock);
> > +
> > +	cache->data = FIELD_GET(PVT_DATA_DATA_MASK, val);
> > +
> > +	write_sequnlock(&cache->data_seqlock);
> > +
> > +	/*
> > +	 * While PVT core is doing the next mode data conversion, we'll check
> > +	 * whether the alarms were triggered for the current sensor. Note that
> > +	 * according to the documentation only one threshold IRQ status can be
> > +	 * set at a time, that's why if-else statement is utilized.
> > +	 */
> > +	if ((thres_sts & info->thres_sts_lo) ^ cache->thres_sts_lo) {
> > +		WRITE_ONCE(cache->thres_sts_lo, thres_sts & info->thres_sts_lo);
> > +		sysfs_notify(&pvt->hwmon->kobj, NULL, info->sysfs_min_alarm);
> > +		kobject_uevent(&pvt->hwmon->kobj, KOBJ_CHANGE);
> > +		if (cache->thres_sts_lo) {
> > +			dev_warn(pvt->dev, "%s is below the lower limit\n",
> > +				 info->label);
> > +		} else {
> > +			dev_warn(pvt->dev, "%s is back to normal\n",
> > +				 info->label);
> > +		}
> > +	} else if ((thres_sts & info->thres_sts_hi) ^ cache->thres_sts_hi) {
> > +		WRITE_ONCE(cache->thres_sts_hi, thres_sts & info->thres_sts_hi);
> > +		sysfs_notify(&pvt->hwmon->kobj, NULL, info->sysfs_max_alarm);
> > +		kobject_uevent(&pvt->hwmon->kobj, KOBJ_CHANGE);
> > +		if (cache->thres_sts_hi) {
> > +			dev_warn(pvt->dev, "%s is above the upper limit\n",
> > +				 info->label);
> > +		} else {
> > +			dev_warn(pvt->dev, "%s is back to normal\n",
> > +				 info->label);
> > +		}
> > +	}
> 
> The point of userspace notification is to let userspace deal with it.
> I do not think it is a good idea to clog the kernel log with this
> information. It may sound like a good idea, but in a system prone to
> exceeding temperature limits all that is left in the log will be
> repeated temperature warnings. Let userspace handle it, and let
> userspace decide if it wants to log the events somewhere.

Agreed. I'll remove the warnings.

> 
> Also, please have a look at https://patchwork.kernel.org/patch/11277347/
> and check if you can use it instead of creating notifications locally.

Seems reasonable. I'll apply that patch in my tree before the patches from this
series, then use the hwmon_notify_event() to notify all the required objects at
once instead of manually pushing the notification to each of them. After a smoke
tests I'll resend the series together with your patch being initial.

Note. I will have to fix the patch a bit, since:
1) It's been created a half year ago, so there are tiny merge conflicts with
kernel 5.7-rcX.
2) hwmon_notify_event() is a bit incorrect in the incrementing channel for the
hwmon_in. It's applicable for the sattr, but not for hwmon_thermal_notify().

If I find anything else, I'll add an info about it into the patch changelog.

> 
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +

[nip]

> > +
> > +static int pvt_read_timeout(struct pvt_hwmon *pvt, long *val)
> > +{
> > +	unsigned long rate;
> > +	ktime_t kt;
> > +	u32 data;
> > +
> > +	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
> 
> Is this a dynamic clock ? If not, it would be better to read its frequency once
> in the probe function

No, It's not dynamic. I can do as you say, though in fact there is no much point
in it. The clock doesn't have the  CLK_GET_RATE_NOCACHE flag set. Then calling
clk_get_rate() will have nearly the same performance as reading from the locally
defined reference clock frequency variable except a single lock/unlock preformed
and a few conditional statements. If I had CLK_GET_RATE_NOCACHE flag set, then
the clocks would have been dynamic and I would have had to use clk_get_rate()
here anyway. So caching the reference clock value in the PVT private data won't
change much, but will add a redundant abstraction.

So I have to ask back, are you really sure that moving the clk_get_rate() into the
probe will make the situation better? If you still think so and my reasoning didn't
change your mind, please say so explicitly.

> 
> > +	if (!rate)
> > +		return -ENODEV;
> 
> ... and return -ENODEV there if it is 0

Please, see my answer above.

> 
> > +
> > +	/*
> > +	 * Don't bother with mutex here, since we just read data from MMIO.
> > +	 * We also have to scale the ticks timeout up to compensate the
> > +	 * ms-ns-data translations.
> > +	 */
> > +	data = readl(pvt->regs + PVT_TTIMEOUT) + 1;
> > +
> > +	/*
> > +	 * Calculate ref-clock based delay (Ttotal) between two consecutive
> > +	 * data samples of the same sensor. So we first must calculate the
> > +	 * delay introduced by the internal ref-clock timer (Tref * Fclk).
> > +	 * Then add the constant timeout cuased by each conversion latency
> > +	 * (Tmin). The basic formulae for each conversion is following:
> > +	 *   Ttotal = Tref * Fclk + Tmin
> > +	 * Note if alarms are enabled the sensors are  polled one after
> > +	 * another, so in order to have the delay being applicable for each
> > +	 * sensor the requested value must be equally redistirbuted.
> > +	 */
> > +#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> > +	kt = ktime_set(PVT_SENSORS_NUM * (u64)data, 0);
> > +	kt = ktime_divns(kt, rate);
> > +	kt = ktime_add_ns(kt, PVT_SENSORS_NUM * PVT_TOUT_MIN);
> > +#else
> > +	kt = ktime_set(data, 0);
> > +	kt = ktime_divns(kt, rate);
> > +	kt = ktime_add_ns(kt, PVT_TOUT_MIN);
> > +#endif
> > +
> > +	/* Return the result in msec as hwmon sysfs interface requires. */
> > +	*val = ktime_to_ms(kt);
> 

> Personally I am not sure about the value of using ktime for those
> calculations, but that is your call.

ktime provides a very convenient and self-explanatory interface. So instead of
dividing, adding, multiplying, sec<->msec factoring, avoiding overflows, etc,
I can do this by using a well-defined ktime interface.

> AFAICS ktime_to_ms() rounds down,
> so I assume you understand that this can return 0.

Yeah. There is no problem with it here. It's just a value returned to the
user-space. We are also ok with getting zero from user-space, since in fact
there is always 1/3000 sec conversion lag. So even if user-space asks to set
zero update interval, it will be 333 usec and we don't get the IRQs flood.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
> > +{
> > +	unsigned long rate;
> > +	ktime_t kt;
> > +	u32 data;
> > +	int ret;
> > +
> > +	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
> > +	if (!rate)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * If alarms are enabled, the requested timeout must be divided
> > +	 * between all available sensors to have the requested delay
> > +	 * applicable to each individual sensor.
> > +	 */
> > +	kt = ms_to_ktime(val);
> > +#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> > +	kt = ktime_divns(kt, PVT_SENSORS_NUM);
> > +#endif
> > +

> > +	/*
> > +	 * Subtract a constant lag, which always persists due to the limited
> > +	 * PVT sampling rate. Make sure the timeout is non-zero.
> > +	 */
> > +	kt = ktime_sub_ns(kt, PVT_TOUT_MIN);
> > +	if (ktime_to_ns(kt) < 0)
> > +		kt = ktime_set(0, 0);
> 
> Doesn't that set the timeout to 0 ? That seems to conflict with the "non-zero"
> comment above. Should that be "not negative" ?

Right. It should have been "not negative". Thanks for noticing this.

> 
> > +
> > +	/*
> > +	 * Finally recalculate the timeout in terms of the reference clock
> > +	 * period.
> > +	 */
> > +	data = ktime_divns(kt * rate, NSEC_PER_SEC);
> > +
> > +	/*
> > +	 * Update the measurements delay, but lock the interface first, since
> > +	 * we have to disable PVT in order to have the new delay actually
> > +	 * updated.
> > +	 */
> > +	ret = mutex_lock_interruptible(&pvt->iface_mtx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pvt_set_tout(pvt, data);
> > +
> > +	mutex_unlock(&pvt->iface_mtx);
> > +
> > +	return 0;
> > +}
> > +

[nip]

> > +
> > +static void pvt_clear_data(void *data)
> > +{
> > +	struct pvt_hwmon *pvt = data;
> > +#if !defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> > +	int idx;
> > +
> > +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> > +		complete_all(&pvt->cache[idx].conversion);
> > +#endif
> > +
> > +	mutex_destroy(&pvt->iface_mtx);
> > +	platform_set_drvdata(to_platform_device(pvt->dev), NULL);
> 

> Unnecessary.

Ok.

> 
> > +}
> > +
> > +static struct pvt_hwmon *pvt_create_data(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct pvt_hwmon *pvt;
> > +	int ret, idx;
> > +
> > +	pvt = devm_kzalloc(dev, sizeof(*pvt), GFP_KERNEL);
> > +	if (!pvt)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ret = devm_add_action(dev, pvt_clear_data, pvt);
> > +	if (ret) {
> > +		dev_err(dev, "Can't add PVT data clear action\n");
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	pvt->dev = dev;
> > +	pvt->sensor = PVT_SENSOR_FIRST;
> > +	platform_set_drvdata(pdev, pvt);
> 
> I don't immediately see where this is used. Can you point to it ?

Because there is no use of it. I'll remove this setting. Thanks.

> 
> > +	mutex_init(&pvt->iface_mtx);
> > +
> > +#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> > +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> > +		seqlock_init(&pvt->cache[idx].data_seqlock);
> > +#else
> > +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> > +		init_completion(&pvt->cache[idx].conversion);
> > +#endif
> > +
> > +	return pvt;
> > +}
> > +

[nip]

> > +
> > +static int pvt_create_hwmon(struct pvt_hwmon *pvt)
> > +{
> > +	pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev,
> > +		dev_name(pvt->dev), pvt, &pvt_hwmon_info, pvt_hwmon_groups);
> 
> Is the device name guaranteed to be a valid hwmon device name ?

Hm, According to the DT convention it may have dashes, which AFAICS isn't valid
hwmon device name. I'll replace dev_name() here with a string literal like
"pvt". Is it ok to have several hwmon devices with the same name?

> 
> > +	if (IS_ERR(pvt->hwmon)) {
> > +		dev_err(pvt->dev, "Couldn't create hwmon device\n");
> > +		return PTR_ERR(pvt->hwmon);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> > +
> > +static void pvt_disable_iface(void *data)
> > +{
> > +	struct pvt_hwmon *pvt = data;
> > +
> > +	mutex_lock(&pvt->iface_mtx);
> > +	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
> > +	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
> > +		   PVT_INTR_DVALID);
> > +	mutex_unlock(&pvt->iface_mtx);
> > +}
> > +
> > +static int pvt_enable_iface(struct pvt_hwmon *pvt)
> > +{
> > +	int ret;
> > +
> > +	ret = devm_add_action(pvt->dev, pvt_disable_iface, pvt);
> > +	if (ret) {
> > +		dev_err(pvt->dev, "Can't add PVT disable interface action\n");
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * Enable sensors data conversion and IRQ. We need to lock the
> > +	 * interface mutex since hwmon has just been created and the
> > +	 * corresponding sysfs files are accessible from user-space,
> > +	 * which theoretically may cause races.
> > +	 */
> 
> What if those userspace actions make a request which requires an interrupt ?

In case if CONFIG_SENSORS_BT1_PVT_ALARMS is enabled, then there is no such
action. Though user-space may set some alarm thresholds, which could cause
immediate hwmon event raise. But even if they did the event status will
be left pending and handled after we enable the IRQs in the next lines.

If CONFIG_SENSORS_BT1_PVT_ALARMS is disabled, then the IRQs are enabled/disabled
in the pvt_read_data() directly to perform the sensor conversion.

> 
> > +	mutex_lock(&pvt->iface_mtx);
> > +	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, 0);
> > +	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
> > +	mutex_unlock(&pvt->iface_mtx);
> > +
> > +	return 0;
> > +}
> > +
> > +#else /* !CONFIG_SENSORS_BT1_PVT_ALARMS */
> > +

[nip]

> > diff --git a/drivers/hwmon/bt1-pvt.h b/drivers/hwmon/bt1-pvt.h
> > new file mode 100644
> > index 000000000000..7851ed947877
> > --- /dev/null
> > +++ b/drivers/hwmon/bt1-pvt.h
> > @@ -0,0 +1,237 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> > + *
> > + * Baikal-T1 Process, Voltage, Temperature sensor driver
> > + */
> > +#ifndef __HWMON_BT1_PVT_H__
> > +#define __HWMON_BT1_PVT_H__
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +#include <linux/mutex.h>
> > +#include <linux/seqlock.h>
> > +#include <linux/completion.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/hwmon.h>
> 
> Alphabetic order, please, and drop unnecessary includes.

Ok.

> 
> > +

[nip]

> > +
> > +/*
> > + * struct pvt_sensor_info - Baikal-T1 PVT sensor informational structure
> > + * @label: hwmon sensor label.
> > + * @mode: PVT mode corresponding to the channel.
> > + * @thres_base: upper and lower threshold values of the sensor.
> > + * @thres_sts_lo: low threshold status bitfield.
> > + * @thres_sts_hi: high threshold status bitfield.
> > + * @sysfs_min_alarm: pointer to a min-alarm sysfs filename.
> > + * @sysfs_min_alarm: pointer to a max-alarm sysfs filename.
> > + */
> > +struct pvt_sensor_info {
> > +	const char *label;
> > +	u32 mode;
> > +	unsigned long thres_base;
> > +	u32 thres_sts_lo;
> > +	u32 thres_sts_hi;
> > +	const char *sysfs_min_alarm;
> > +	const char *sysfs_max_alarm;
> > +};
> > +
> > +#define PVT_SENSOR_INFO(_label, _file, _mode, _thres)			\
> 
> _file seems to be a global define or variable, or at least checkpatch
> complains about its use.

Hm, mine didn't complain about it. Otherwise I would have fixed it in the first
place. Though I'll remove that name from here anyway, since the
hwmon_notify_event() notifier is utilized, which requires sensor type, attribute
and channel/index. Thus explicit sysfs_min_alarm and sysfs_max_alarm names
aren't needed anymore.

-Sergey

> 
> > +	{								\
> > +		.label = _label,					\
> > +		.mode = PVT_CTRL_MODE_ ##_mode,				\
> > +		.thres_base = PVT_ ##_thres,				\
> > +		.thres_sts_lo = PVT_INTR_ ##_thres## _LO,		\
> > +		.thres_sts_hi = PVT_INTR_ ##_thres## _HI,		\
> > +		.sysfs_min_alarm = _file "_min_alarm",			\
> > +		.sysfs_max_alarm = _file "_max_alarm"			\
> > +	}
> > +

[nip]

> > +
> > +#endif /* __HWMON_BT1_PVT_H__ */
