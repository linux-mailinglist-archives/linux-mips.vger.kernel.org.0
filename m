Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A216173CD7
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 17:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgB1Q0s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 11:26:48 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40010 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1Q0s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 11:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582907205; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xOb0AVoiiFlckuvxHpEhBL9Wrp4HKGY5UhYo5YdakL0=;
        b=L+RAqN9ACsoeWx1jzHdHE2acUYpgMnq8YMOrZaHk4eeqRdlvNqW9Ns96f0NkFiP6lG/Qu0
        5GZTb5K6gIvKRr1+aq4pAawcE+gxgqZxtb/6G5OCl9f7YhANfLqbVe297FNUmrzFJ48Byo
        0W9OlUBhOUDdxmv8hJ33Sv1BaXngaCc=
Date:   Fri, 28 Feb 2020 13:26:20 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 0/7] MIPS: CI20: Add efuse driver for Ingenic JZ4780
 and attach to DM9000 for stable MAC addresses
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1582907181.3.7@crapouillou.net>
In-Reply-To: <cover.1582905653.git.hns@goldelico.com>
References: <cover.1582905653.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

For the whole series:

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


Le ven., f=E9vr. 28, 2020 at 17:00, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> * fix a compiler warning/error (reported by Paul Cercueil=20
> <paul@crapouillou.net>)
> * remove clock-names from properties (suggested by Paul Cercueil=20
> <paul@crapouillou.net>)
>=20
> PATCH V7 2020-02-28 14:58:30:
> * use devm_add_action_or_reset to unprepare clock in case of error=20
> (suggested by Paul Cercueil <paul@crapouillou.net>)
> * use already existing constants to check for overflow of rd_adj and=20
> rd_strobe
> * remove clock-names from bindings example and DTS (suggested by Paul=20
> Cercueil <paul@crapouillou.net>)
> * addition for nemc driver to handle this correctly (contributed by=20
> Paul Cercueil <paul@crapouillou.net>)
> * make efuse a child node of nemc to avoid problems with overlapping
>   reg address ranges (suggested by Paul Cercueil=20
> <paul@crapouillou.net>)
>=20
> PATCH V6 2020-02-26 12:16:07:
> * add dependency on CONFIG_OF and select REGMAP_MMIO (suggested by=20
> Paul Cercueil <paul@crapouillou.net>)
> * add clk_prepare_enable() (suggested by Paul Cercueil=20
> <paul@crapouillou.net>)
> * inline jz4780_efuse_read_32bytes() since it is only used once
> * remove read optimization for full block (suggested by Paul Cercueil=20
> <paul@crapouillou.net>)
> * simplify calculations for rd_adj and rd_strobe (suggested by Paul=20
> Cercueil <paul@crapouillou.net>)
> * do calculations for rd_adj and rd_strobe in local variables
> * fix overflow check (did allow for 5 bit values although register is=20
> 4 bit wide)
> * fixes for yaml (sugested by Andreas Kemnade <andreas@kemnade.info>)
>=20
> PATCH V5 2020-02-22 11:25:35:
> * no longer RFC but PATCH
> * add yaml bindings (by Andreas Kemnade <andreas@kemnade.info>)
> * fixes to yaml (suggested by Rob Herring <robh@kernel.org>)
>=20
> RFC V4 2020-02-17 17:55:35:
> * removed read_only for nvmem config because there is no write method
> * Kconfig: replaced depends MACH_JZ4780 with MACH_INGENIC
> * run through checkpatch and fixed issues
> * made use of devm_nvram_register() and get rid of=20
> jz4780_efuse_remove()
>   (suggested by Srinivas Kandagatla <srinivas.kandagatla@linaro.org>)
> * squashed previous patch 1/9 and 2/9 into single (regmap based)=20
> driver
>=20
> RFC V3 2020-02-16 20:20:59:
>=20
> This series is based on and a follow up for
>=20
> https://lore.kernel.org/patchwork/cover/868157/
>=20
> ("[v2,0/2] Add efuse driver for Ingenic JZ4780 SoC")
>=20
> Original authors were
> PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Mathieu Malaterre <malat@debian.org>
>=20
> and there are additions / code improvements by
> H. Nikolaus Schaller <hns@goldelico.com>
> Paul Cercueil <paul@crapouillou.net>
>=20
> This setup works, if the dm9000 driver is compiled
> as a module.
>=20
> Therefore it is all RFC level. It is also not completely
> checkpatched.
>=20
>=20
> H. Nikolaus Schaller (1):
>   MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find=20
> the
>     default MAC address
>=20
> Paul Cercueil (1):
>   memory: jz4780_nemc: Only request IO memory the driver will use
>=20
> PrasannaKumar Muralidharan (5):
>   nvmem: add driver for JZ4780 efuse
>   Bindings: nvmem: add bindings for JZ4780 efuse
>   Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
>   nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
>   MIPS: DTS: JZ4780: define node for JZ4780 efuse
>=20
>  .../ABI/testing/sysfs-driver-jz4780-efuse     |  16 ++
>  .../bindings/nvmem/ingenic,jz4780-efuse.yaml  |  45 ++++
>  MAINTAINERS                                   |   5 +
>  arch/mips/boot/dts/ingenic/ci20.dts           |   3 +
>  arch/mips/boot/dts/ingenic/jz4780.dtsi        |  19 +-
>  drivers/memory/jz4780-nemc.c                  |  15 +-
>  drivers/nvmem/Kconfig                         |  12 +
>  drivers/nvmem/Makefile                        |   2 +
>  drivers/nvmem/jz4780-efuse.c                  | 239=20
> ++++++++++++++++++
>  9 files changed, 353 insertions(+), 3 deletions(-)
>  create mode 100644=20
> Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>  create mode 100644=20
> Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>  create mode 100644 drivers/nvmem/jz4780-efuse.c
>=20
> --
> 2.23.0
>=20

=

