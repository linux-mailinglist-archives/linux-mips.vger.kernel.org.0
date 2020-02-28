Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04B8173A13
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgB1OmS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:42:18 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:24748 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgB1OmS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582900936;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=prI0PeMixLchyFrb/KnSuAfI0TjVkeTP61TcH/1S8WU=;
        b=pyLLKGEFTok3PIQg4m4H1dK/ttNAqtPcwtgftPcYPVTRBgf6iBWYlmIrkKK1aIQ87C
        IdiCyqG6hfGP0MMvw/UI7N18aJasYfuUrHgWSzen6KLgIImn8rDXKj6sBUZKXxPxu7qX
        12ZYF9u7T4+LG0t593IkI2D4/KhP6ymBWKNUnZtNfXoGEFYvE4vfiWaT1aNNJhMrR0TB
        CmArAYBvyNRr+UX6UXcHLUX4FSxbwyhBDfgFNbkxLw9ZuyVRxrmvXSKF1WkGwKHiEBTK
        5T67G25dwod4OwkX+ourgJWaO6/AIvqXrXfPLXBIqQQxJwHer8xS1mGwmZedAEuXl3g2
        fmiw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXAcKqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SEg11Kp
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 15:42:01 +0100 (CET)
Subject: Re: [PATCH v3 5/6] MIPS: DTS: CI20: multiple DTS improvements
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1582900568.3.2@crapouillou.net>
Date:   Fri, 28 Feb 2020 15:42:01 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <6EC236FB-2F3F-4556-8711-66F5AAE2D574@goldelico.com>
References: <cover.1581884459.git.hns@goldelico.com> <01795b270ad025ffffbf80e115b3b2d138a20ffe.1581884459.git.hns@goldelico.com> <1582900568.3.2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.02.2020 um 15:36 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le dim., f=E9vr. 16, 2020 at 21:20, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> a) add DT node for SW1 as Enter button
>> The SW1 button can be used as a simple one-button keyboard
>> and is connected to PD17.
>> Note: SW1 has a second meaning to change the boot sequence
>> when pressed while powering on.
>> b) give eth0_power a defined voltage.
>> This is a 3.3V power switch (DVNET3.3V ).
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/mips/boot/dts/ingenic/ci20.dts | 14 ++++++++++++++
>> 1 file changed, 14 insertions(+)
>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts =
b/arch/mips/boot/dts/ingenic/ci20.dts
>> index 1ab55be707af..4bacefa2cfce 100644
>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>> @@ -4,6 +4,7 @@
>> #include "jz4780.dtsi"
>> #include <dt-bindings/clock/ingenic,tcu.h>
>> #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> / {
>> 	compatible =3D "img,ci20", "ingenic,jz4780";
>> @@ -25,6 +26,17 @@
>> 		       0x30000000 0x30000000>;
>> 	};
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +
>> +		sw1 {
>> +			label =3D "ci20:sw1";
>> +			linux,code =3D <KEY_ENTER>;
>=20
> Why KEY_ENTER? It would make it impossible for applications to know =
that it's actually the switch that has been pressed an not the keyboard.

Ah, ok. I didn't think about the use case that a physical keyboard is =
connected to one of the USB ports.

What else would you propose? I think your argument is for every existing =
KEY_CODE. Should we add a new one?

BR and thanks,
Nikolaus



