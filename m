Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5415CDC8E2
	for <lists+linux-mips@lfdr.de>; Fri, 18 Oct 2019 17:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391627AbfJRPh6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Oct 2019 11:37:58 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:60928 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730468AbfJRPh6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Oct 2019 11:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1571413074; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yvFr+nNghkKZwR4mawCKvHUmrMBJduw6erMI6YTlcHM=;
        b=v470AP/WoXYbHAA0MikRhd2C2Q47Jva7B2tAsqSQJh2nMYK2q/AuxV6ILjajalIe9ifrUq
        QQ5AMEkFZxjYo9B3QckbJkKJ22INg6mA+cpEFKl/QqzArCcPa/pKii/EQODfOjJpBl38Oc
        nlS76mnfHy2OQjR4ZofesDfcpS7rIQ0=
Date:   Fri, 18 Oct 2019 17:37:47 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 6/6 v2] MMC: JZ4740: Add support for LPM.
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Zhou Yanjie <zhouyanjie@zoho.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Mark Rutland <mark.rutland@arm.com>, syq@debian.org,
        Linus Walleij <linus.walleij@linaro.org>, armijn@tjaldur.nl,
        Thomas Gleixner <tglx@linutronix.de>,
        YueHaibing <yuehaibing@huawei.com>,
        Mathieu Malaterre <malat@debian.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Message-Id: <1571413067.3.0@crapouillou.net>
In-Reply-To: <CAPDyKFo9juNmf6hrcBjzOprS6GwzAPBq8y3ReGu=ry+MdxT9Bg@mail.gmail.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
        <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
        <1570857203-49192-7-git-send-email-zhouyanjie@zoho.com>
        <CAPDyKFo9juNmf6hrcBjzOprS6GwzAPBq8y3ReGu=ry+MdxT9Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Uffe,


Le ven., oct. 18, 2019 at 10:52, Ulf Hansson <ulf.hansson@linaro.org> a=20
=E9crit :
> On Sat, 12 Oct 2019 at 07:19, Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>>=20
>>  add support for low power mode of Ingenic's MMC/SD Controller.
>>=20
>>  Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>=20
> I couldn't find a proper coverletter for the series, please provide
> that next time as it really helps review. Additionally, it seems like
> you forgot to change the prefix of the patches to "mmc: jz4740" (or at
> least you chosed upper case letters), but I will take care of that
> this time. So, I have applied the series for next, thanks!
>=20
> I also have a general question. Should we perhaps rename the driver
> from jz4740_mmc.c to ingenic.c (and the file for the DT bindings, the
> Kconfig, etc), as that seems like a more appropriate name? No?

Is there a kernel policy regarding renaming drivers? Since it trashes=20
the git history. Anyway you're the subsystem maintainer so I guess=20
that's up to you. I can send a patch to rename it if you want.

Cheers,
-Paul


>=20
> Kind regards
> Uffe
>=20
>=20
>>  ---
>>   drivers/mmc/host/jz4740_mmc.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>=20
>>  diff --git a/drivers/mmc/host/jz4740_mmc.c=20
>> b/drivers/mmc/host/jz4740_mmc.c
>>  index 44a04fe..4cbe7fb 100644
>>  --- a/drivers/mmc/host/jz4740_mmc.c
>>  +++ b/drivers/mmc/host/jz4740_mmc.c
>>  @@ -43,6 +43,7 @@
>>   #define JZ_REG_MMC_RESP_FIFO   0x34
>>   #define JZ_REG_MMC_RXFIFO      0x38
>>   #define JZ_REG_MMC_TXFIFO      0x3C
>>  +#define JZ_REG_MMC_LPM         0x40
>>   #define JZ_REG_MMC_DMAC                0x44
>>=20
>>   #define JZ_MMC_STRPCL_EXIT_MULTIPLE BIT(7)
>>  @@ -102,6 +103,12 @@
>>   #define JZ_MMC_DMAC_DMA_SEL BIT(1)
>>   #define JZ_MMC_DMAC_DMA_EN BIT(0)
>>=20
>>  +#define        JZ_MMC_LPM_DRV_RISING BIT(31)
>>  +#define        JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY BIT(31)
>>  +#define        JZ_MMC_LPM_DRV_RISING_1NS_DLY BIT(30)
>>  +#define        JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY BIT(29)
>>  +#define        JZ_MMC_LPM_LOW_POWER_MODE_EN BIT(0)
>>  +
>>   #define JZ_MMC_CLK_RATE 24000000
>>=20
>>   enum jz4740_mmc_version {
>>  @@ -860,6 +867,22 @@ static int jz4740_mmc_set_clock_rate(struct=20
>> jz4740_mmc_host *host, int rate)
>>          }
>>=20
>>          writew(div, host->base + JZ_REG_MMC_CLKRT);
>>  +
>>  +       if (real_rate > 25000000) {
>>  +               if (host->version >=3D JZ_MMC_X1000) {
>>  +                       writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
>>  +                                 =20
>> JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
>>  +                                  JZ_MMC_LPM_LOW_POWER_MODE_EN,
>>  +                                  host->base + JZ_REG_MMC_LPM);
>>  +               } else if (host->version >=3D JZ_MMC_JZ4760) {
>>  +                       writel(JZ_MMC_LPM_DRV_RISING |
>>  +                                  JZ_MMC_LPM_LOW_POWER_MODE_EN,
>>  +                                  host->base + JZ_REG_MMC_LPM);
>>  +               } else if (host->version >=3D JZ_MMC_JZ4725B)
>>  +                       writel(JZ_MMC_LPM_LOW_POWER_MODE_EN,
>>  +                                  host->base + JZ_REG_MMC_LPM);
>>  +       }
>>  +
>>          return real_rate;
>>   }
>>=20
>>  --
>>  2.7.4
>>=20
>>=20

=

