Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BEF15F6DE
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 20:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388273AbgBNTbM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 14:31:12 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:32422 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387557AbgBNTbM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 14:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581708670;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=CVamlJG5fFjEwwaf0KaFiIJGPYXsc97AfdP/JIkpP98=;
        b=hd9pQmVxPYo6GGmsFtVIYtEPovhIn2hqTkzjf1g/alpjX/e5JEX/LCs+GQcuNZwwLP
        Ys6kFE0D+GSHA72pYWeNf2kPkZQ+B715u34dT9zC8FO4Kavj+Wr+f1vWJXxq06/iRumO
        FnHPuL12zH+H4X0032iISB1VuzgsfiMaYuF/+rImXKRSwuzkI78fakF+Lx3/xrBnoOeY
        50Byx06/9b1IN4U6n26nObzmvDhLv8a8f0pSjEUVgwJcHfiA74S5SqnWRRgR3uz3J9By
        HRZ3aY5lvScQsy6W+wEItIAdkPWqXAqM/mBTscVcIFuwNofMTj1OKR7PbJe6KC2izHxK
        VJvQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PuwDOspHA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EJV0GDZ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 20:31:00 +0100 (CET)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 03/12] MIPS: CI20: defconfig: configure for supporting modules
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1581707415.3.7@crapouillou.net>
Date:   Fri, 14 Feb 2020 20:30:59 +0100
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD9439FF-9DEF-4B9A-8A01-F11B626708C1@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com> <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com> <1581707415.3.7@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 14.02.2020 um 20:10 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Patches 03-12 only touch the same two files - ci20.dts and =
ci20_defconfig.
>=20
> Unless someone strongly disagrees, I'd suggest to squash all patches =
that touch each file together (except the ones with a Fixes tag), I =
don't think we really need that much granularity here.

It comes more from having developed these things quite independently and =
only collected for submission...

One patch I don't know how to handle: "MIPS: DTS: CI20: add DT node for =
IR sensor".
It is from 2015 and has a different author (some Alex Smith but the mail =
address seems to be broken).
This information and attribution will be lost if we squash them.

But I can do for V3 and will also fix the fixes tags by adding cc: =
stable :)

BR and thanks,
Nikolaus


>=20
> -Paul
>=20
>=20
> Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> Not all drivers need to be compiled into the kernel.
>> Support building and loading of kernel modules.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/mips/configs/ci20_defconfig | 1 +
>> 1 file changed, 1 insertion(+)
>> diff --git a/arch/mips/configs/ci20_defconfig =
b/arch/mips/configs/ci20_defconfig
>> index be41df2a81fb..e0d3c9d4c2ae 100644
>> --- a/arch/mips/configs/ci20_defconfig
>> +++ b/arch/mips/configs/ci20_defconfig
>> @@ -1,4 +1,5 @@
>> # CONFIG_LOCALVERSION_AUTO is not set
>> +CONFIG_MODULES=3Dy
>> CONFIG_KERNEL_XZ=3Dy
>> CONFIG_SYSVIPC=3Dy
>> CONFIG_POSIX_MQUEUE=3Dy
>> --
>> 2.23.0
>=20
>=20

