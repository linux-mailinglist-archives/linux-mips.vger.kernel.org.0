Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B4F172236
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 16:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730683AbgB0P0h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 10:26:37 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:34410 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbgB0P0h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 10:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582817194;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=UuGBOFWKuJoSfl7RZOJsB5BFu4+iFIJhovviL6N8jCk=;
        b=jKe/Dg6ZJx2wqkYnxvbracWksw7VjH1zi5UkIANhkiCzcfGPP73s1kC0KowuMjcPI0
        1zoWNEOqYYqyI5cMosH6KEHe+xKFizJFm/d88ODqUHzKlCsQBh15J//V/fH4CGpD0Qqg
        DKF6yLyrBZyH5uluqT/SMKf0tHHKDm/474PRrklnnlkSuEIhPtW8NAA9L4K3nwLlZOEN
        NyDynvjp6uA3Y6snbkm/tYFKZQXO1CYCeidrXd2LwVlHN3e4PBWHOktelMPvWsA0tYHz
        nmHQZNzJJ/tUMpaByFv/fIAuWhkTW026j0XURl14/5MAN2o29TA/gipyUlruQTzyw6IE
        G+6g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMhw47o15Y="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1RFQNBuB
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 27 Feb 2020 16:26:23 +0100 (CET)
Subject: Re: [PATCH v6 1/6] nvmem: add driver for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1582814861.3.2@crapouillou.net>
Date:   Thu, 27 Feb 2020 16:26:23 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <B30BD902-CF5D-421A-9BD5-5FA038895712@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com> <2a675558c6c7ba6df86669176004fe4703645793.1582715761.git.hns@goldelico.com> <1582814861.3.2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 27.02.2020 um 15:47 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le mer., f=E9vr. 26, 2020 at 12:15, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> This patch brings support for the JZ4780 efuse. Currently it only =
exposes
>> a read only access to the entire 8K bits efuse memory and nvmem =
cells.
>> To fetch for example the MAC address:
>> dd if=3D/sys/devices/platform/134100d0.efuse/jz4780-efuse0/nvmem bs=3D1=
 skip=3D34 count=3D6 status=3Dnone | xxd
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>> drivers/nvmem/Kconfig        |  12 ++
>> drivers/nvmem/Makefile       |   2 +
>> drivers/nvmem/jz4780-efuse.c | 239 =
+++++++++++++++++++++++++++++++++++
>> 3 files changed, 253 insertions(+)
>> create mode 100644 drivers/nvmem/jz4780-efuse.c
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index 35efab1ba8d9..d7b7f6d688e7 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -55,6 +55,18 @@ config NVMEM_IMX_OCOTP_SCU


>> +	clk_rate =3D clk_get_rate(efuse->clk);
>> +
>> +	efuse->dev =3D dev;
>> +
>> +	/*
>> +	 * rd_adj and rd_strobe are 4 bit values
>> +	 * conditions:
>> +	 *   bus clk_period * (rd_adj + 1) > 6.5ns
>> +	 *   bus clk_period * (rd_adj + 5 + rd_strobe) > 35ns
>> +	 *   i.e. rd_adj >=3D 6.5ns / clk_period
>> +	 *   i.e. rd_strobe >=3D 35 ns / clk_period - 5 - rd_adj + 1
>> +	 * constants:
>> +	 *   1 / 6.5ns =3D=3D 153846154 Hz
>> +	 *   1 / 35ns =3D=3D 28571429 Hz
>> +	 */
>> +
>> +	rd_adj =3D clk_rate / 153846154;
>> +	rd_strobe =3D clk_rate / 28571429 - 5 - rd_adj + 1;
>> +
>> +	if (rd_adj > BIT(4) - 1 || rd_strobe > BIT(4) - 1) {
>=20
> Just use 0xF or GENMASK(3, 0) instead of BIT(4) - 1

Or would rd_adj >=3D BIT(4) be better since this is not used as a mask?
This would also correspond to that the register is 4 bits wide.

>=20
>> +		dev_err(&pdev->dev, "Cannot set clock configuration\n");
>> +		return -EINVAL;
>=20
> You need to clk_disable_unprepare() before you return now, since the =
clock has been enabled.

Ah, ok! Forgot about that.

> I'd suggest registering a cleanup function (with =
devm_add_action_or_reset) after clk_prepare_enable() is called, then you =
don't need extra handling in the rest of the probe, and the .remove =
function (and platform_set_drvdata) can be dropped too.

Ok, this will indeed be simpler that the remove function if we take the =
error path into account.

Noted for v7.

>=20
> The rest looks pretty good.
>=20
> Cheers,
> -Paul

BR,
Nikolaus

