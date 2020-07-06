Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18515215654
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 13:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgGFL1K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jul 2020 07:27:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:31328 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgGFL1K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jul 2020 07:27:10 -0400
X-Greylist: delayed 714 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jul 2020 07:27:09 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594034828;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Jd87KhgDN1N5mm+9Hpme+FMAwh0Z56Wu1xQMCEA451s=;
        b=DeJkmDEbsPGL0LWvyFSpzMszC6apD+fvEEHB2YRYh0IIAnXJwjnkFFMDYulm90Nw90
        mF7Pg6T1fPBHJy55/doctC7nDdezDfwsHt05LCDsKV0CF/s2HO1Tu8rEp3Fn9spHFJ0E
        F2JCEfWzJYime4TPrtQWEyzOb4QzFV3Fd5k0E+5R47uR2MEixCl+y9TgNaDuCKVCKGWu
        qCheCJi+4ynwGl7kwmEQ3LJ8FipVZO+EIdAFk/+nD5hPhkMzVZiWP4kipu7W+PuCw1OR
        k+9JXALObcB/smj/OLrBZdDqkE8M9YM4Ts+c8iuFs+GHC9SbpTHQ7efqCBrh0EUBdHwl
        TL1A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PvwDCqz4U="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w66BF5pdY
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 6 Jul 2020 13:15:05 +0200 (CEST)
Subject: Re: [PATCH] MIPS: CI20: DTS: Correcting IW8103 Wifi binding
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200705103215.96672-1-agriveaux@deutnet.info>
Date:   Mon, 6 Jul 2020 13:15:04 +0200
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <457C75ED-A033-4B46-A9D9-53B510C16F37@goldelico.com>
References: <20200705103215.96672-1-agriveaux@deutnet.info>
To:     agriveaux@deutnet.info
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexandre,

> Am 05.07.2020 um 12:32 schrieb agriveaux@deutnet.info:
>=20
> From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
>=20
> Use brcm,bcm4329-fmac instead of brcm,bcm4330-fmac.
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> ---
> arch/mips/boot/dts/ingenic/ci20.dts | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts =
b/arch/mips/boot/dts/ingenic/ci20.dts
> index 75f5bfbf2c37..82a1f126b778 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -116,8 +116,8 @@
> 	pinctrl-0 =3D <&pins_mmc1>;
>=20
> 	brcmf: wifi@1 {
> -/*		reg =3D <4>;*/
> -		compatible =3D "brcm,bcm4330-fmac";
> +		reg =3D <1>;
> +		compatible =3D "brcm,bcm4329-fmac";
> 		vcc-supply =3D <&wlan0_power>;
> 		device-wakeup-gpios =3D <&gpd 9 GPIO_ACTIVE_HIGH>;
> 		shutdown-gpios =3D <&gpf 7 GPIO_ACTIVE_LOW>;

Do you have it working with a v5.8 kernel?

I don't see any activity to detect the module or load firmware.

Does it rely on some other patch?

BR and thanks,
Nikolaus

