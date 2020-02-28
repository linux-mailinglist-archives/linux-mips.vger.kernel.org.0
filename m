Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA65B173A48
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgB1Ouf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:50:35 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:53094 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgB1Ouf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582901433; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RHir3LqvmNfiyAi6bRoLCmSaF+sDDPGvIMtqEvzKvH0=;
        b=kwGA02YkxNMcrwGROGv1/DRZtOCAdqpp3MGWdIIdQ3Yt9wlcteUh4DiLxbum49SE+uLPy4
        iFH5/56qjvo7DU/z9uirdz70W8DFpCXHvp00t2DueCYMK/RCPR7XDtA7Cw28Il7UJzFErN
        7QPo+L9egPBSSgiJmxn+slufgQm22tQ=
Date:   Fri, 28 Feb 2020 11:50:15 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 5/6] MIPS: DTS: CI20: multiple DTS improvements
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1582901415.3.5@crapouillou.net>
In-Reply-To: <6EC236FB-2F3F-4556-8711-66F5AAE2D574@goldelico.com>
References: <cover.1581884459.git.hns@goldelico.com>
        <01795b270ad025ffffbf80e115b3b2d138a20ffe.1581884459.git.hns@goldelico.com>
        <1582900568.3.2@crapouillou.net>
        <6EC236FB-2F3F-4556-8711-66F5AAE2D574@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le ven., f=E9vr. 28, 2020 at 15:42, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
>=20
>>  Am 28.02.2020 um 15:36 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Le dim., f=E9vr. 16, 2020 at 21:20, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  a) add DT node for SW1 as Enter button
>>>  The SW1 button can be used as a simple one-button keyboard
>>>  and is connected to PD17.
>>>  Note: SW1 has a second meaning to change the boot sequence
>>>  when pressed while powering on.
>>>  b) give eth0_power a defined voltage.
>>>  This is a 3.3V power switch (DVNET3.3V ).
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  arch/mips/boot/dts/ingenic/ci20.dts | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>  diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
>>> b/arch/mips/boot/dts/ingenic/ci20.dts
>>>  index 1ab55be707af..4bacefa2cfce 100644
>>>  --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>>  +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>>  @@ -4,6 +4,7 @@
>>>  #include "jz4780.dtsi"
>>>  #include <dt-bindings/clock/ingenic,tcu.h>
>>>  #include <dt-bindings/gpio/gpio.h>
>>>  +#include <dt-bindings/input/input.h>
>>>  / {
>>>  	compatible =3D "img,ci20", "ingenic,jz4780";
>>>  @@ -25,6 +26,17 @@
>>>  		       0x30000000 0x30000000>;
>>>  	};
>>>  +	gpio-keys {
>>>  +		compatible =3D "gpio-keys";
>>>  +
>>>  +		sw1 {
>>>  +			label =3D "ci20:sw1";
>>>  +			linux,code =3D <KEY_ENTER>;
>>=20
>>  Why KEY_ENTER? It would make it impossible for applications to know=20
>> that it's actually the switch that has been pressed an not the=20
>> keyboard.
>=20
> Ah, ok. I didn't think about the use case that a physical keyboard is=20
> connected to one of the USB ports.
>=20
> What else would you propose? I think your argument is for every=20
> existing KEY_CODE. Should we add a new one?

There are plenty you can use. I'd suggest KEY_F13 as it's=20
general-purpose.

-Paul

=

