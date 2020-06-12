Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FB01F749F
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2020 09:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFLHab (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Jun 2020 03:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgFLHab (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Jun 2020 03:30:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E69C03E96F;
        Fri, 12 Jun 2020 00:30:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l10so8633007wrr.10;
        Fri, 12 Jun 2020 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DReOUYdztPylpdjVRQA5TEUDA2odSY681B+OMP5uRTY=;
        b=rWeAMX7RKAcqCkHAbOibmoOM7VAOP8tPjp/cnq3Xnm+09GzicRN0Mru1XrfP6VF7+4
         MuzWGXkqGUP2OIoC4rxD7rHykF0TeMPD+pwqnYdkFZDrF0mxNuCjk0N4zJO3aDeP6qzM
         LoIcXPj9LBjbfSqLe/JyIr+jryIFqtw1Uxm2AbgqbNVp0+LyB0vYqfP6kJXle6+m/Xyj
         5Je5+fu/D7jGXvQhE7w3k0pXFw7iqBYFSaOUd7IhkY7XuCeKwOF6Kmkj67atoUT4onb5
         /hcVeY0u5sUBlzdFebIuketD3Uf93uvh9n1PoQILyMTOqA5dGTL/oBNq3Q1H8paDM6qF
         dW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DReOUYdztPylpdjVRQA5TEUDA2odSY681B+OMP5uRTY=;
        b=Zlu0s9bPE4pUz2g3Cx1w33IfpHPBR/kO7f0dA/Z/sBA5CA1bBNLf9UFzpJYi61APrO
         lqtIoNFuRygHJ7awP2felNb8FrSJcK+CoCmtrmUue/MNQoMT6UJjXDwf91sEualK2iVq
         4k8vEgh6glNOCn4vPBrTsVxUb4XOEfrpZM+wVrrFfOntfjJEA5xpoiyiQmVgjqjwboPS
         kIHeaNCDa3poweR+ymUdd/QsjqFuUx2OF/L8JmStwCxgn5/ho0WrRxLRGNGfN/sDZCV9
         FHoUl9zDnLhRBHt72D2Dd1mMTAaLxKvAWIrcmnHn8DocQoDqOGJTGz0Kt4+ikYw98kZY
         HEcA==
X-Gm-Message-State: AOAM533rwaTovOhJsU2vEIwNa9LaPV43WWw/VJgX58Eema7pOA4K3RBi
        25qw0CPzd8a3V8sazsQUsgA=
X-Google-Smtp-Source: ABdhPJzSOGqZUhra7OujKz+a5rzpu134zvWIrWQQMC++N7mcobmm3qvAGTAzVuouU50UY9fb0qddZA==
X-Received: by 2002:a05:6000:1104:: with SMTP id z4mr13360063wrw.272.1591947029285;
        Fri, 12 Jun 2020 00:30:29 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t188sm7596560wmt.27.2020.06.12.00.30.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 00:30:28 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200612090252.02581c21@xps13>
Date:   Fri, 12 Jun 2020 09:30:27 +0200
Cc:     Florian Fainelli <f.fainelli@gmail.com>, tsbogend@alpha.franken.de,
        bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
        vigneshr@ti.com, Jonas Gorski <jonas.gorski@gmail.com>,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CBDB2BF7-07CB-4231-B200-86DE2BFE86A0@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com> <20200611095540.250184d2@xps13>
 <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
 <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
 <7DC0E349-1319-47FE-8565-9B30C190EACB@gmail.com>
 <20200612090252.02581c21@xps13>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miqu=C3=A8l,

> El 12 jun 2020, a las 9:02, Miquel Raynal <miquel.raynal@bootlin.com> =
escribi=C3=B3:
>=20
> Hi =C3=81lvaro,
>=20
> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Thu, 11 =
Jun 2020
> 18:14:20 +0200:
>=20
>> Hi Florian,
>>=20
>>> El 11 jun 2020, a las 17:42, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>>>=20
>>>=20
>>>=20
>>> On 6/11/2020 8:16 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote: =20
>>>> Hi Miquel,
>>>>=20
>>>>> El 11 jun 2020, a las 9:55, Miquel Raynal =
<miquel.raynal@bootlin.com> escribi=C3=B3:
>>>>>=20
>>>>> Hi =C3=81lvaro,
>>>>>=20
>>>>> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Mon, =
 8 Jun 2020
>>>>> 18:06:49 +0200:
>>>>>=20
>>>>>> Instead of trying to parse CFE version string, which is =
customized by some
>>>>>> vendors, let's just check that "CFE1" was passed on argument 3.
>>>>>>=20
>>>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com>
>>>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>>>> ---
>>>>>> v2: use CFE_EPTSEAL definition and avoid using an additional =
funtion.
>>>>>>=20
>>>>>> drivers/mtd/parsers/bcm63xxpart.c | 29 =
++++-------------------------
>>>>>> 1 file changed, 4 insertions(+), 25 deletions(-)
>>>>>>=20
>>>>>> diff --git a/drivers/mtd/parsers/bcm63xxpart.c =
b/drivers/mtd/parsers/bcm63xxpart.c
>>>>>> index 78f90c6c18fd..493a75b2f266 100644
>>>>>> --- a/drivers/mtd/parsers/bcm63xxpart.c
>>>>>> +++ b/drivers/mtd/parsers/bcm63xxpart.c
>>>>>> @@ -22,6 +22,9 @@
>>>>>> #include <linux/mtd/partitions.h>
>>>>>> #include <linux/of.h>
>>>>>>=20
>>>>>> +#include <asm/bootinfo.h>
>>>>>> +#include <asm/fw/cfe/cfe_api.h> =20
>>>>>=20
>>>>> Are you sure both includes are needed? =20
>>>>=20
>>>> asm/bootinfo.h is needed for fw_arg3 and asm/fw/cfe/cfe_api.h is =
needed for CFE_EPTSEAL.
>>>>=20
>>>>>=20
>>>>> I don't think it is a good habit to include asm/ headers, are you =
sure
>>>>> there is not another header doing it just fine? =20
>>>>=20
>>>> Both are needed unless you want to add another definition of =
CFE_EPTSEAL value.
>>>> There are currently two CFE magic definitions, the one in =
asm/fw/cfe/cfe_api.h and another one in bcm47xxpart.c:
>>>> =
https://github.com/torvalds/linux/blob/master/arch/mips/include/asm/fw/cfe=
/cfe_api.h#L28
>>>> =
https://github.com/torvalds/linux/blob/master/drivers/mtd/parsers/bcm47xxp=
art.c#L33 =20
>>>=20
>>> The caveat with that approach is that this reduces the compilation
>>> surface to MIPS and BMIPS_GENERIC and BCM63XX only, which is a bit
>>> small. If we could move the CFE definitions to a shared header, and
>>> consolidate the value used by bcm47xxpart.c as well, that would =
allow us
>>> to build the bcm63xxpart.c file with COMPILE_TEST on other
>>> architectures. This does not really have functional value, but for
>>> maintainers like Miquel, it allows them to quickly test their entire
>>> drivers/mtd/ directory. =20
>>=20
>> I don=E2=80=99t think fw_arg3 available on non mips archs, is it?
>> I=E2=80=99m happy to move it to a shared header (which would be a =
good location for this?), but if I=E2=80=99m right it would still be =
restricted to MIPS.
>=20
> Restricting a definition to MIPS, even if it makes sense for you is
> very limiting for me. I need to be able to build as much drivers as I
> can from my laptop and verify they at least compile correctly. If I =
need
> a MIPS toolchain, an ARC toolchain, a PowerPC, an ARM, an ARM64 and
> whatever other funky toolchain to do just that in X steps: it's very
> painful. We have been adding COMPILE_TEST dependencies on as much
> drivers as we could and we want to continue moving forward. Using such
> include would need to drop the COMPILE_TEST condition from Kconfig and
> this is not something I am willing to do.

I totally understand and agree with your point, but I still think that =
there could be a solution which would be valid for both of us.

>=20
> Thanks for your understanding :)

The current way of detecting CFE isn=E2=80=99t the proper one.
Thank you for understanding that too.

> Miqu=C3=A8l

Best regards,
=C3=81lvaro.


