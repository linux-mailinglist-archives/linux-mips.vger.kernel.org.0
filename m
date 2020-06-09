Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AE01F3EF7
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 17:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730717AbgFIPOI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 11:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730436AbgFIPOH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 11:14:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1461CC05BD1E;
        Tue,  9 Jun 2020 08:14:07 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so21769308wrt.5;
        Tue, 09 Jun 2020 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=X7mlTDwQ6+p5MYv0bHUHt/egFgOWZQLtAR3nHiaWIwU=;
        b=GG5jWooOcAQkNTeAPuyKWbI01TMiq/4C4rQErVii4COMwg+ZNuElAsKC20KVt34Bcv
         aR4yl/D6QPdvzRfCFRp1x6+XCePKrCEzjwxX2hCkK9QC8sq5iyrCXKfpfAjkAlUgzFLU
         fBacG/itsgQO5T5HWQQZLxPPMcAKm3RgDDa0qPS0wdDKWIdwcQvoLNZTCpYkqyb2LOST
         1H9TtirrcwQQjJ5k2qc10/GwbGcj80DqfI/LP1z9aJ1uGs4B3kMqQ5sS0Wpo8kLw3UG5
         rVB+gbDry3b/P1vSzX+Bndl5M6KvUdM21jxJGd28zqS+syvGhiYXbY47SFf+0UC0O193
         U40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=X7mlTDwQ6+p5MYv0bHUHt/egFgOWZQLtAR3nHiaWIwU=;
        b=r9Q9m86E0mHDrO5sxrqRtPOMSMq3T/7Gzr6yD67ncXzIi+xe3JgQ4qfhG8vKjTR79S
         rQXIj3cZ4H3vS2i7xqWtOdWBXvbQ+qjPNo3Jn8sO0T0Q3WvVh79Pzbt2P8cL/T+65vgZ
         IytnkBylxC605nFM7PW0NQhALfk/hceG6HS6rRSQ7HvmDR58G2bvOOSL2auoZsnCvZGV
         qlNNI5lT5L2Fi0l3u6YNSJhIc5AeV/yBljfQGAtO7/aD1j1tzMWEZ40kG2U65p68RntI
         rw1tksEoyOsQWZbCGfKUxLjvmmtMB2R7j6J0Yj2PnvXK/DznGLn1aezxY62Zje8SPyC+
         rERA==
X-Gm-Message-State: AOAM531nHpcU6tlorgImgUydwToCtrKzeQZdVMOSsXTB0Jc50bMYmK2c
        k4Is0NKBVDtuHnizxrk4j98=
X-Google-Smtp-Source: ABdhPJwQpkMLSfl8xli+xJLnxxfKBKaQ18eLIxG1Kh0B2CCr63Y+ExyzL+lJyG5Gu2bjWNEd1Y+Pww==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr5299037wrw.277.1591715645605;
        Tue, 09 Jun 2020 08:14:05 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id u12sm3779466wrq.90.2020.06.09.08.14.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 08:14:04 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 3/7] reset: add BCM6345 reset controller driver
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <341e8482c6bd06267633160d7358fa8331bef515.camel@pengutronix.de>
Date:   Tue, 9 Jun 2020 17:14:02 +0200
Cc:     robh+dt@kernel.org, tsbogend@alpha.franken.de,
        Florian Fainelli <f.fainelli@gmail.com>,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <729976E9-CAF7-47B6-8783-5FD3D85F9EFD@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609134232.4084718-4-noltari@gmail.com>
 <341e8482c6bd06267633160d7358fa8331bef515.camel@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Philipp,

> El 9 jun 2020, a las 17:06, Philipp Zabel <p.zabel@pengutronix.de> =
escribi=C3=B3:
>=20
> Hi =C3=81lvaro,
>=20
> On Tue, 2020-06-09 at 15:42 +0200, =C3=81lvaro Fern=C3=A1ndez Rojas =
wrote:
>> Add support for resetting blocks through the Linux reset controller
>> subsystem for BCM63xx SoCs.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> drivers/reset/Kconfig         |   7 ++
>> drivers/reset/Makefile        |   1 +
>> drivers/reset/reset-bcm6345.c | 149 =
++++++++++++++++++++++++++++++++++
>> 3 files changed, 157 insertions(+)
>> create mode 100644 drivers/reset/reset-bcm6345.c
>>=20
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index d9efbfd29646..9f1da978cef6 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -41,6 +41,13 @@ config RESET_BERLIN
>> 	help
>> 	  This enables the reset controller driver for Marvell Berlin =
SoCs.
>>=20
>> +config RESET_BCM6345
>> +	bool "BCM6345 Reset Controller"
>> +	depends on BMIPS_GENERIC || COMPILE_TEST
>> +	default BMIPS_GENERIC
>> +	help
>> +	  This enables the reset controller driver for BCM6345 SoCs.
>> +
>> config RESET_BRCMSTB
>> 	tristate "Broadcom STB reset controller"
>> 	depends on ARCH_BRCMSTB || COMPILE_TEST
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 249ed357c997..e642aae42f0f 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_TEGRA) +=3D tegra/
>> obj-$(CONFIG_RESET_A10SR) +=3D reset-a10sr.o
>> obj-$(CONFIG_RESET_ATH79) +=3D reset-ath79.o
>> obj-$(CONFIG_RESET_AXS10X) +=3D reset-axs10x.o
>> +obj-$(CONFIG_RESET_BCM6345) +=3D reset-bcm6345.o
>> obj-$(CONFIG_RESET_BERLIN) +=3D reset-berlin.o
>> obj-$(CONFIG_RESET_BRCMSTB) +=3D reset-brcmstb.o
>> obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb-rescal.o
>> diff --git a/drivers/reset/reset-bcm6345.c =
b/drivers/reset/reset-bcm6345.c
>> new file mode 100644
>> index 000000000000..088b7fdb896b
>> --- /dev/null
>> +++ b/drivers/reset/reset-bcm6345.c
>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * BCM6345 Reset Controller Driver
>> + *
>> + * Copyright (C) 2020 =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com>
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#define BCM6345_RESET_NUM		32
>> +#define BCM6345_RESET_SLEEP_MIN_US	10000
>> +#define BCM6345_RESET_SLEEP_MAX_US	20000
>> +
>> +struct bcm6345_reset {
>> +	struct reset_controller_dev rcdev;
>> +	void __iomem *base;
>> +	spinlock_t lock;
>> +};
>> +
>> +static int bcm6345_reset_update(struct bcm6345_reset *bcm6345_reset,
>> +				unsigned long id, bool assert)
>> +{
>> +	uint32_t val;
>> +
>> +	val =3D __raw_readl(bcm6345_reset->base);
>> +	if (assert)
>> +		val &=3D ~BIT(id);
>> +	else
>> +		val |=3D BIT(id);
>> +	__raw_writel(val, bcm6345_reset->base);
>> +
>> +	return 0;
>> +}
>> +
>> +static int bcm6345_reset_assert(struct reset_controller_dev *rcdev,
>> +				unsigned long id)
>> +{
>> +	struct bcm6345_reset *bcm6345_reset =3D
>> +		container_of(rcdev, struct bcm6345_reset, rcdev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
>> +	bcm6345_reset_update(bcm6345_reset, id, true);
>> +	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int bcm6345_reset_deassert(struct reset_controller_dev =
*rcdev,
>> +				  unsigned long id)
>> +{
>> +	struct bcm6345_reset *bcm6345_reset =3D
>> +		container_of(rcdev, struct bcm6345_reset, rcdev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
>> +	bcm6345_reset_update(bcm6345_reset, id, false);
>> +	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int bcm6345_reset_reset(struct reset_controller_dev *rcdev,
>> +			       unsigned long id)
>> +{
>> +	struct bcm6345_reset *bcm6345_reset =3D
>> +		container_of(rcdev, struct bcm6345_reset, rcdev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
>> +	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
>> +		     BCM6345_RESET_SLEEP_MAX_US);
>=20
> What is the purpose of sleeping before reset assertion?

None, I must have introduced that for testing something and then I =
forgot to remove it. Sorry for that...

>=20
> If you can do without this, with I think this driver could be made to
> use reset-simple.

Yes, but only if I can add reset support with a configurable sleep range =
to reset-simple. Is this possible?

>=20
> regards
> Philipp

Best regards,
=C3=81lvaro.

