Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2727245EC0C
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 12:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhKZLDc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 06:03:32 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53669 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbhKZLBc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Nov 2021 06:01:32 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mg6JS-1mPRqu11NG-00hc4O; Fri, 26 Nov 2021 11:58:18 +0100
Received: by mail-wr1-f52.google.com with SMTP id i5so17782684wrb.2;
        Fri, 26 Nov 2021 02:58:18 -0800 (PST)
X-Gm-Message-State: AOAM532lTWW18uMulO4TPNfxUW3p3vraNx/i+VbywS8Z8qOHVsLRKxg9
        BKTNTIMVmfVZSanyg30/FY5/QeOVoex9EVXd3hI=
X-Google-Smtp-Source: ABdhPJwX3s0k8QD+uI/1PqAOw5b4MVDgteWr7uE8nc80M9yBY5OX9SZhmaIFBsI2DWHGfvRQmyEollv8KXVrpT7WJZU=
X-Received: by 2002:adf:d091:: with SMTP id y17mr13905518wrh.418.1637924297753;
 Fri, 26 Nov 2021 02:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 26 Nov 2021 11:58:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
Message-ID: <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MIPS: TXx9: Convert SPI platform data to software nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:pE6cbSM2bacaf42ItvLjuIB9GzoMfMSc94zd9I4/sz7PTlTksmI
 PvyUfgqvMksHJyL1sAbXNL41UQU++Hjkfwwj7TxprjUm4fdQ7LfBPAZF7NsrvkGZJyiRVCE
 EYt0YksbuU+nakvZWTgDolByiXJqZ99LMpnZMJrWUiep7TOyx1AXLfKB4Gd4ZC6DfksSlDM
 c3FhkN4LTKj27uL6CM7sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nouiQhqp2+Y=:XZcJ8ezBDfcaVnNtWbj6pr
 Hm5KFU8KeNEv51Wrn6esGp8aMDd1DGb7G60TVV8ld9YyS7TEoZtgOhUbmcrWogXR1wnOMHfzs
 YzZmiACv8wbudXJ61WnEWZoBg/tk/QaJsRx7pkfJ4+uFj5UAZkt+ITZrJtJZ1ABpvgN3FDgoo
 YhsiZ6A5xIVupJertAk2b09sYlSEG3ManIuSmH/a48uNDLiLeK2ByTDDCtATvoidl0U+RxfYe
 dVIXD6ZXTVQS/xvG/8v/rg1iPz7sdCHnv/IwYBd3xkdpLxt96mmpT/x6Q2GNJg3jG7PMMmIs/
 B6P5JMxQ8iVGDpk6NL5ZTDxSdNKHg7FTBQqar5fTa1AHugmnE1yK+0G2qUGhTkWVoOzfPO1j5
 V1Fg2mXNZCVq+WfkDCsjwGXIDcdH7iXDUj1UwKIPrLP/gToNhkVwvhxjRmiE7UoMmFnHkBufb
 9XWm7EMQrvBtFtWA3O3F9MlDaCqMWalkZPyIUTPcDNhAlpY9BpfrXfav5K125KcrBVLhBTTu/
 QkLe93kLZZj/E+Gcb8CzLtAOhQ12QWMnGETAIhX9ucKWeCbPgf7QIuk/YGwoiAxFbNo4LGmUd
 iXojMyXu1p/p2SEMw8k3BjDrET4hoKc5yS2C+z0GMs4Ae31yDTn2hO6WZ25tWLdneVjhxz7Kd
 APfFB0s9YwZYUTe4S6g5pGMQl7Te//iV2/guCBxQQZWhkeNhs5PGsTSju3EccufqTpO2+WHiP
 nwlqwrHkooWT0wwgsRKWOoS5r5LJ3JASPIbQU1utMuGV7XK42IyPV2mYbjBm4dwzg5wjvUlfw
 w//4RZaOocba+tzTiiQgREWFEPs1VTdA0Tkrkk7+LuG7RhuwhI=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 26, 2021 at 11:23 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> In order to get rid of legacy platform data in AT25 driver,
> convert its users to use software nodes.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks good to me, thanks for cleaning this up! I think Geert has this
hardware, adding him to Cc in case he wants to give it a spin.

       Arnd

>  arch/mips/include/asm/txx9/spi.h    |  4 ++--
>  arch/mips/txx9/generic/spi_eeprom.c | 32 +++++++++++++++++------------
>  arch/mips/txx9/rbtx4938/setup.c     |  6 +++---
>  3 files changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/arch/mips/include/asm/txx9/spi.h b/arch/mips/include/asm/txx9/spi.h
> index 0d727f354557..1ca87a516b81 100644
> --- a/arch/mips/include/asm/txx9/spi.h
> +++ b/arch/mips/include/asm/txx9/spi.h
> @@ -16,11 +16,11 @@
>  #include <linux/errno.h>
>
>  #ifdef CONFIG_SPI
> -int spi_eeprom_register(int busid, int chipid, int size);
> +int spi_eeprom_register(int busid, int chipid);
>  int spi_eeprom_read(int busid, int chipid,
>                     int address, unsigned char *buf, int len);
>  #else
> -static inline int spi_eeprom_register(int busid, int chipid, int size)
> +static inline int spi_eeprom_register(int busid, int chipid)
>  {
>         return -ENODEV;
>  }
> diff --git a/arch/mips/txx9/generic/spi_eeprom.c b/arch/mips/txx9/generic/spi_eeprom.c
> index d833dd2c9b55..cb4b4d47437e 100644
> --- a/arch/mips/txx9/generic/spi_eeprom.c
> +++ b/arch/mips/txx9/generic/spi_eeprom.c
> @@ -9,18 +9,32 @@
>   *
>   * Support for TX4938 in 2.6 - Manish Lachwani (mlachwani@mvista.com)
>   */
> +#include <linux/device.h>
> +#include <linux/export.h>
>  #include <linux/init.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
> -#include <linux/export.h>
> -#include <linux/device.h>
> +
>  #include <linux/spi/spi.h>
> -#include <linux/spi/eeprom.h>
> +
>  #include <asm/txx9/spi.h>
>
> +#define AT250X0_SIZE           128
>  #define AT250X0_PAGE_SIZE      8
>
> +static const struct property_entry spi_eeprom_properties[] = {
> +       PROPERTY_ENTRY_U32("size", AT250X0_SIZE),
> +       PROPERTY_ENTRY_U32("pagesize", AT250X0_PAGE_SIZE),
> +       PROPERTY_ENTRY_U32("address-width", 8),
> +       { }
> +};
> +
> +static const struct software_node spi_eeprom_node = {
> +       .properties = spi_eeprom_properties,
> +};
> +
>  /* register board information for at25 driver */
> -int __init spi_eeprom_register(int busid, int chipid, int size)
> +int __init spi_eeprom_register(int busid, int chipid)
>  {
>         struct spi_board_info info = {
>                 .modalias = "at25",
> @@ -28,16 +42,8 @@ int __init spi_eeprom_register(int busid, int chipid, int size)
>                 .bus_num = busid,
>                 .chip_select = chipid,
>                 /* Mode 0: High-Active, Sample-Then-Shift */
> +               .swnode = &spi_eeprom_node,
>         };
> -       struct spi_eeprom *eeprom;
> -       eeprom = kzalloc(sizeof(*eeprom), GFP_KERNEL);
> -       if (!eeprom)
> -               return -ENOMEM;
> -       strcpy(eeprom->name, "at250x0");
> -       eeprom->byte_len = size;
> -       eeprom->page_size = AT250X0_PAGE_SIZE;
> -       eeprom->flags = EE_ADDR1;
> -       info.platform_data = eeprom;
>         return spi_register_board_info(&info, 1);
>  }
>
> diff --git a/arch/mips/txx9/rbtx4938/setup.c b/arch/mips/txx9/rbtx4938/setup.c
> index e68eb2e7ce0c..136af1cace75 100644
> --- a/arch/mips/txx9/rbtx4938/setup.c
> +++ b/arch/mips/txx9/rbtx4938/setup.c
> @@ -283,9 +283,9 @@ static int __init rbtx4938_spi_init(void)
>                 .mode = SPI_MODE_1 | SPI_CS_HIGH,
>         };
>         spi_register_board_info(&srtc_info, 1);
> -       spi_eeprom_register(SPI_BUSNO, SEEPROM1_CS, 128);
> -       spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM2_CS, 128);
> -       spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM3_CS, 128);
> +       spi_eeprom_register(SPI_BUSNO,  0 + SEEPROM1_CS);
> +       spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM2_CS);
> +       spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM3_CS);
>         gpio_request(16 + SRTC_CS, "rtc-rs5c348");
>         gpio_direction_output(16 + SRTC_CS, 0);
>         gpio_request(SEEPROM1_CS, "seeprom1");
> --
> 2.33.0
>
