Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87EE1E49F6
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 18:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390508AbgE0QZw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 12:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389852AbgE0QZv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 12:25:51 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B90C05BD1E;
        Wed, 27 May 2020 09:25:51 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y11so2016481plt.12;
        Wed, 27 May 2020 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cPIgw/feStnGbABPrBX7WdVJISPCqmPO558epQRrQuM=;
        b=Tndt5hkqia1IucLwLggfdmUPNOa7I7EXbqDbazST6TANHLD9EWbpSdd0D+zeVafNCq
         6qwXsON26EZVHoxEVM7nf/Qi9K0r9v25H7zUqNvoFXvNZPvIuWddejxwWt8G7WBJyD5s
         HwTNtDAEU0cIUsibrSK/ryP/oo/D2dy456v9bKxPnRKD2jwafoXYdVnHLKm86OrRCPXE
         91ZnqcQhK0stBhJ2pnp0w2GKNu699iaEyDsCBcTfZwmdf5gOZiw0dVY3dFdxPOh0zG2W
         unlHVYCiS9DMDvtx0dg7W7i2Cl0CrdScQWroAi/JaMXah//tLwGJfPxaQS2+sPSavmMW
         8uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cPIgw/feStnGbABPrBX7WdVJISPCqmPO558epQRrQuM=;
        b=G217j0lipNE+F6RbbTxFOIW6cOmhbvuiuzHiWhPT2tUmOkzT4kD+CssWrNGOgpwdiL
         WZ+F/3kP10Lk5K/DBls8DqT3scafOUSaeql5hs+k0fBVD2zMeFZiXgm9RLkIjQk1BisE
         lqV9e9p5EgOZRjc8yv8e4QTwbP5lWJ1YmjsoiLDBl1X1nWw9GQT0OQTk9bh+JuS1Cig1
         MgwmFK2PsJncYMDMah7iJx3FFYq1i5dGBgtEHGb9ErsQhvrN0WpWBnlOxFqJRulhr8xQ
         fdArNi5AtfDXYzYuuELnhIGYkUa3dpkuHiTqNrzaK+1YR+Ete89ZHExAUEN3Lzm8RAYA
         GSyw==
X-Gm-Message-State: AOAM532KGzgmGREJbeeQPBaMU75CIbkx6uZO+T8utjwb+MRgT8jyhrDN
        gS89oNEh6SbWDhOzYEq2ZRmtFRC/
X-Google-Smtp-Source: ABdhPJxbbm3v9AsOnhGQleALBClbksJOBoDhbFq9rwsnAKGMmT3lUxatRG5hH2GaBdOVaa2CgK4LDg==
X-Received: by 2002:a17:90a:7c48:: with SMTP id e8mr5966497pjl.135.1590596751048;
        Wed, 27 May 2020 09:25:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x191sm2539709pfd.37.2020.05.27.09.25.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 09:25:50 -0700 (PDT)
Date:   Wed, 27 May 2020 09:25:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: Add Baikal-T1 PVT sensor driver
Message-ID: <20200527162549.GA225240@roeck-us.net>
References: <20200526133823.20466-1-Sergey.Semin@baikalelectronics.ru>
 <20200526133823.20466-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526133823.20466-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 04:38:23PM +0300, Serge Semin wrote:
> Baikal-T1 SoC provides an embedded process, voltage and temperature
> sensor to monitor an internal SoC environment (chip temperature, supply
> voltage and process monitor) and on time detect critical situations,
> which may cause the system instability and even damages. The IP-block
> is based on the Analog Bits PVT sensor, but is equipped with a
> dedicated control wrapper, which provides a MMIO registers-based access
> to the sensor core functionality (APB3-bus based) and exposes an
> additional functions like thresholds/data ready interrupts, its status
> and masks, measurements timeout. All of these is used to create a hwmon
> driver being added to the kernel by this commit.
> 
> The driver implements support for the hardware monitoring capabilities
> of Baikal-T1 process, voltage and temperature sensors. PVT IP-core
> consists of one temperature and four voltage sensors, each of which is
> implemented as a dedicated hwmon channel config.
> 
> The driver can optionally provide the hwmon alarms for each sensor the
> PVT controller supports. The alarms functionality is made compile-time
> configurable due to the hardware interface implementation peculiarity,
> which is connected with an ability to convert data from only one sensor
> at a time. Additional limitation is that the controller performs the
> thresholds checking synchronously with the data conversion procedure.
> Due to these limitations in order to have the hwmon alarms
> automatically detected the driver code must switch from one sensor to
> another, read converted data and manually check the threshold status
> bits. Depending on the measurements timeout settings this design may
> cause additional burden on the system performance. By default if the
> alarms kernel config is disabled the data conversion is performed by
> the driver on demand when read operation is requested via corresponding
> _input-file.
> 
> Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> Signed-off-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
> 
> Changelog v2:
> - Discard handwritten IO-access wrappers. Use normal readl/writel instead.
> - Use generic FIELD_{GET,PREP} macros instead of handwritten ones.
> - Since the driver depends on the OF config we can remove of_match_ptr()
>   macro utilization.
> - Don't print error-message if no platform IRQ found. Just return an error.
> - Remove probe-status info string printout.
> 
> Changelog v3:
> - Add bt1-pvt into the Documentation/hwmon/index.rst file.
> - Discard explicit "default n" from the SENSORS_BT1_PVT_ALARMS config.
> - Use "depends on SENSORS_BT1_PVT" statement instead of if-endif kbuild
>   config clause.
> - Alphabetically order the include macro operators.
> - Discard unneeded include macro in the header file.
> - Use new generic interface of the hwmon alarms notifications introduced
>   in the first patch (based on hwmon_notify_event()).
> - Add more descriptive information regarding the temp1_trim attribute.
> - Discard setting the platforms device private data by using
>   platform_set_drvdata(). It's redundant since unused in the driver.
> - Pass "pvt" hwmon name instead of dev_name(dev) to
>   devm_hwmon_device_register_with_info().
> - Add "baikal,pvt-temp-trim-millicelsius" temperature trim DT property
>   support.
> - Discard kernel log warnings printed from the ISR when either min or
>   max threshold levels are crossed.
> - Discard CONFIG_OF dependency since there is non at compile-time.
> ---
>  Documentation/hwmon/bt1-pvt.rst |  116 ++++
>  Documentation/hwmon/index.rst   |    1 +
>  drivers/hwmon/Kconfig           |   25 +
>  drivers/hwmon/Makefile          |    1 +
>  drivers/hwmon/bt1-pvt.c         | 1155 +++++++++++++++++++++++++++++++
>  drivers/hwmon/bt1-pvt.h         |  244 +++++++
>  6 files changed, 1542 insertions(+)
>  create mode 100644 Documentation/hwmon/bt1-pvt.rst
>  create mode 100644 drivers/hwmon/bt1-pvt.c
>  create mode 100644 drivers/hwmon/bt1-pvt.h
> 
> diff --git a/Documentation/hwmon/bt1-pvt.rst b/Documentation/hwmon/bt1-pvt.rst
> new file mode 100644
> index 000000000000..f5f47891d87a
> --- /dev/null
> +++ b/Documentation/hwmon/bt1-pvt.rst
> @@ -0,0 +1,116 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver bt1-pvt
> +=====================
> +
> +Supported chips:
> +
> +  * Baikal-T1 PVT sensor (in SoC)
> +
> +    Prefix: 'bt1-pvt'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: Provided by BAIKAL ELECTRONICS upon request and under NDA
> +
> +Authors:
> +    Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> +    Serge Semin <Sergey.Semin@baikalelectronics.ru>
> +
> +Description
> +-----------
> +
> +This driver implements support for the hardware monitoring capabilities of the
> +embedded into Baikal-T1 process, voltage and temperature sensors. PVT IP-core
> +consists of one temperature and four voltage sensors, which can be used to
> +monitor the chip internal environment like heating, supply voltage and
> +transistors performance. The driver can optionally provide the hwmon alarms
> +for each sensor the PVT controller supports. The alarms functionality is made
> +compile-time configurable due to the hardware interface implementation
> +peculiarity, which is connected with an ability to convert data from only one
> +sensor at a time. Additional limitation is that the controller performs the
> +thresholds checking synchronously with the data conversion procedure. Due to
> +these in order to have the hwmon alarms automatically detected the driver code
> +must switch from one sensor to another, read converted data and manually check
> +the threshold status bits. Depending on the measurements timeout settings
> +(update_interval sysfs node value) this design may cause additional burden on
> +the system performance. So in case if alarms are unnecessary in your system
> +design it's recommended to have them disabled to prevent the PVT IRQs being
> +periodically raised to get the data cache/alarms status up to date. By default
> +in alarm-less configuration the data conversion is performed by the driver
> +on demand when read operation is requested via corresponding _input-file.
> +
> +Temperature Monitoring
> +----------------------
> +
> +Temperature is measured with 10-bit resolution and reported in millidegree
> +Celsius. The driver performs all the scaling by itself therefore reports true
> +temperatures that don't need any user-space adjustments. While the data
> +translation formulae isn't linear, which gives us non-linear discreteness,
> +it's close to one, but giving a bit better accuracy for higher temperatures.
> +The temperature input is mapped as follows (the last column indicates the input
> +ranges)::
> +
> +	temp1: CPU embedded diode	-48.38C - +147.438C
> +
> +In case if the alarms kernel config is enabled in the driver the temperature input
> +has associated min and max limits which trigger an alarm when crossed.
> +
> +Voltage Monitoring
> +------------------
> +
> +The voltage inputs are also sampled with 10-bit resolution and reported in
> +millivolts. But in this case the data translation formulae is linear, which
> +provides a constant measurements discreteness. The data scaling is also
> +performed by the driver, so returning true millivolts. The voltage inputs are
> +mapped as follows (the last column indicates the input ranges)::
> +
> +	in0: VDD		(processor core)		0.62V - 1.168V
> +	in1: Low-Vt		(low voltage threshold)		0.62V - 1.168V
> +	in2: High-Vt		(high voltage threshold)	0.62V - 1.168V
> +	in3: Standard-Vt	(standard voltage threshold)	0.62V - 1.168V
> +
> +In case if the alarms configis enabled in the driver the voltage inputs
> +have associated min and max limits which trigger an alarm when crossed.
> +
> +Sysfs Attributes
> +----------------
> +
> +Following is a list of all sysfs attributes that the driver provides, their
> +permissions and a short description:
> +
> +=============================== ======= =======================================
> +Name				Perm	Description
> +=============================== ======= =======================================
> +update_interval			RW	Measurements update interval per
> +					sensor.
> +temp1_type			RO	Sensor type (always 1 as CPU embedded
> +					diode).
> +temp1_label			RO	CPU Core Temperature sensor.
> +temp1_input			RO	Measured temperature in millidegree
> +					Celsius.
> +temp1_min			RW	Low limit for temp input.
> +temp1_max			RW	High limit for temp input.
> +temp1_min_alarm			RO	Temperature input alarm. Returns 1 if
> +					temperature input went below min limit,
> +					0 otherwise.
> +temp1_max_alarm			RO	Temperature input alarm. Returns 1 if
> +					temperature input went above max limit,
> +					0 otherwise.
> +temp1_trim			RW	Temperature sensor trimming factor in
> +					millidegree Celsius. It can be used to
> +					manually adjust the temperature
> +					measurements within 7.130 degrees
> +					Celsius.

vs. standard ABI:

temp[1-*]_offset`
                Temperature offset which is added to the temperature reading
                by the chip.

                Unit: millidegree Celsius

If you really think this is necessary, why not use the standard ABI ?

Guenter
