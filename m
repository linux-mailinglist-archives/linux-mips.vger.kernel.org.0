Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64C51E6582
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 17:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403962AbgE1PIX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 11:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403913AbgE1PIX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 11:08:23 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7351C08C5C6;
        Thu, 28 May 2020 08:08:21 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so10666278plv.9;
        Thu, 28 May 2020 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XgjPT1CpvLdTclhvGSPDFjsGLGS7dmDrFHCixnqmkK0=;
        b=G7WZC/iUW83qSLmqcByCFOwo/48VrK/nS0OFqFnuS2jbmK33kG8l+KGRwFS4oPbr8v
         5HFB2aG+GvDp8TNYdhaZLRCBm5LsL0AYNvY1U92Oo2BMBn9tF52ZAjTcODjo6gaoR+TQ
         25KH4h7tQgCaDvgfgw5NlMjmMVPIMB0e0+y0M5XMOnmWriILvOH2Jdu0YuIZ9XYNHHXI
         q/hn1kYRA0BidbG0BBBlnFZ0eaSS5Iy+Id0EHwHmW5ESUUR4anW8P0/Mbz9Pe4QAv0xE
         Arj9qWDdRcAVe98K41ysTtCEbryeBUPFSTiLK0PvtsB44IOdRJYtazgz6163u1Yrg5EP
         YCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XgjPT1CpvLdTclhvGSPDFjsGLGS7dmDrFHCixnqmkK0=;
        b=pUiWNP98E48u3mPFnFNScF7+Hbpyl8bf7IAi80gV32XN01zLn9i130M/t20DQ6AYae
         g0PmEdIpvCTdmzVXDxiyAcvh7cc/MzPx862sUK2rZk3B+5yAfajK+7GAM8zF9zNqC0Wl
         vIR2/SumEkmVdjTWHucpLfSpier7lgXxIJTt4VyuJ8rCfMdG3NLtvo9cUJqEmFZZgSOR
         RGzQvd+hp2I3K0stf8oQ81mS6Y21Ta2iVm4TOIwisPmWSRlnKpRqpr7Z8CWVj4rrW3x4
         duP6JDwiRXyx0t9yb6Ru5/+l1pQpyEnn3c14zCjdZyBrk5nPLaDLdMfSDuM1EE63YLtl
         QiJw==
X-Gm-Message-State: AOAM530uzQFkazoSc8KydyP4feLWwjIMUuy2IU5rX8zlhpxnVL+eb7ap
        PmJE0NLKdQkNZLhfOzXt7JY=
X-Google-Smtp-Source: ABdhPJyeuHum3SRHlF90KSWyxZyc2UgOuEuCfD2Pg7fZRAbPapHyc+iQioyV7YlcooFx83CeDMv44A==
X-Received: by 2002:a17:90a:cb91:: with SMTP id a17mr4489802pju.146.1590678501376;
        Thu, 28 May 2020 08:08:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r3sm2220856pjb.20.2020.05.28.08.08.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 08:08:20 -0700 (PDT)
Date:   Thu, 28 May 2020 08:08:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] hwmon: Add Baikal-T1 SoC Process, Voltage and
 Temp sensor support
Message-ID: <20200528150818.GA163809@roeck-us.net>
References: <20200528142805.29115-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528142805.29115-1-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 05:28:02PM +0300, Serge Semin wrote:
> In order to keep track of Baikal-T1 SoC power consumption and make sure
> the chip heating is within the normal temperature limits, there is
> a dedicated hardware monitor sensor embedded into the SoC. It is based
> on the Analog Bits PVT sensor but equipped with a vendor-specific control
> wrapper, which ease an access to the sensors functionality. Fist of all it
> provides an accessed to the sampled Temperature, Voltage and
> Low/Standard/High Voltage thresholds. In addition the wrapper generates
> an interrupt in case if one enabled for alarm thresholds or data ready
> event. All of these functionality is implemented in the Baikal-T1 PVT
> driver submitted within this patchset. Naturally there is also a patch,
> which creates a corresponding yaml-based dt-binding file for the sensor.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4
> 

Series applied to hwmon-next.

Thanks,
Guenter

> Note new vendor prefix for Baikal-T1 PVT device will be added in the
> framework of the next patchset:
> https://lkml.org/lkml/2020/5/6/1047
> 
> Changelog v2:
> - Don't use a multi-arg clock phandle reference in the examples dt-bindings
>   property. Thus reundant include pre-processor statement can be removed.
> - Rearrange the SoBs with adding Maxim' co-development tag.
> - Lowercase the node-name in the dt-schema example.
> - Add dual license header to the dt-bindings file.
> - Replace "additionalProperties: false" property with
>   "unevaluatedProperties: false".
> - Discard label definition from the binding example.
> - Discard handwritten IO-access wrappers. Use normal readl/writel instead.
> - Use generic FIELD_{GET,PREP} macros instead of handwritten ones.
> - Since the driver depends on the OF config we can remove of_match_ptr()
>   macro utilization.
> - Don't print error-message if no platform IRQ found. Just return an error.
> - Remove probe-status info string printout.
> - Our corporate email server doesn't change Message-Id anymore, so the patchset
>   is resubmitted being in the cover-letter-threaded format.
> 
> Link: https://lore.kernel.org/linux-hwmon/20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru/
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
> 
> Link: https://lore.kernel.org/linux-hwmon/20200526133823.20466-1-Sergey.Semin@baikalelectronics.ru
> Changelog v4:
> - Rename temp1_trim to the temp1_offset and use the standard API to
>   expose the attribute.
> - Rename "baikal,pvt-temp-trim-millicelsius" DT property to
>   "baikal,pvt-temp-offset-millicelsius".
> - Switch "const static" order to be "static const" where it's applicable.
> - Add missing headers "linux/io.h" and "linux/of.h".
> - Add static qualifier to the pvt_hwmon_write() method, which has been
>   missed there by mistake.
> 
> Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
> Signed-off-by: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Guenter Roeck (1):
>   hwmon: Add notification support
> 
> Serge Semin (2):
>   dt-bindings: hwmon: Add Baikal-T1 PVT sensor binding
>   hwmon: Add Baikal-T1 PVT sensor driver
> 
>  .../bindings/hwmon/baikal,bt1-pvt.yaml        |  107 ++
>  Documentation/hwmon/bt1-pvt.rst               |  117 ++
>  Documentation/hwmon/index.rst                 |    1 +
>  drivers/hwmon/Kconfig                         |   25 +
>  drivers/hwmon/Makefile                        |    1 +
>  drivers/hwmon/bt1-pvt.c                       | 1146 +++++++++++++++++
>  drivers/hwmon/bt1-pvt.h                       |  244 ++++
>  drivers/hwmon/hwmon.c                         |   69 +-
>  include/linux/hwmon.h                         |    3 +
>  9 files changed, 1710 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
>  create mode 100644 Documentation/hwmon/bt1-pvt.rst
>  create mode 100644 drivers/hwmon/bt1-pvt.c
>  create mode 100644 drivers/hwmon/bt1-pvt.h
> 
> -- 
> 2.26.2
> 
