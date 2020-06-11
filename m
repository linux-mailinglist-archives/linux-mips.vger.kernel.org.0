Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D771F6AB5
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2020 17:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgFKPQK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Jun 2020 11:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbgFKPQJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Jun 2020 11:16:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEA6C08C5C1;
        Thu, 11 Jun 2020 08:16:09 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t18so6567628wru.6;
        Thu, 11 Jun 2020 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ekZS4aH+9SdzL+TCB6y0YZ7lKqUewvODAqRgveIbzBQ=;
        b=boniqFtwc6F5pPI2Ls4+Ba7k45IGWop1Bff1qXYj94NW5TCfQBIOcWtiS+/AR2EVJG
         7F4g67hCPrnfisVbm7XAtyEdyYCdD2qWd6u6CU3bQdl54QMFLwta81YoFrh0tI4QQdYN
         FHjtpTFxDnbjJgs+4rpqSlE7L3Bg4IENUJ2yd4pTMWCFlwjwVOfABk+hwOVHfnXTHdfI
         0iPw9nxcEiBXTChqMqbCgzyVOvfcrskmrApZyc6v7VXj5Ue8Vr16/C8e7RsHxBvh8xK9
         qDCFDJm159eyRs4whTdZpBtuaDUUXTQrNpa5zFxgqY7A4kejR/IMc4wvQkIA5IIzNvWb
         0C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ekZS4aH+9SdzL+TCB6y0YZ7lKqUewvODAqRgveIbzBQ=;
        b=OCi2xPIgKzA2OdkHRn9KqZGJuMP2xSKi2s/KJmQ3EPhUzH4oMo8b/CK8pb0Lots4If
         ECHne1GAeo44/IZTX+Ru8UgcSgt6/oL3zvi7igGnv//O6LgIaxeEaFi4/UK/pk+iPgjZ
         mxP6Tf82IeTTX+FagEprEbnan5iCdnLg49HyUOqtDka2xk5rkbIC6dIZmCjOquFqzAeE
         i89ouVgqN60eX8KyEez8VJkYXPm3e/GCBloD5s2K/fBTN+XiYEvL/Vod41PVgHtl72+V
         djcZm5mZjQg1tSnxP2cgW3v+mSy519HSXFI9HWFMbPo1H9Ghs147O9cssl+FFQcqQ19O
         QZRQ==
X-Gm-Message-State: AOAM532OTAPJB1YLH0L8jF4Ej4RC/YGbLYYwmoJzUwPK4yCPgSH7tHaQ
        OhGGh4JX2pDACwOgnCDpImCz/ohLpiw=
X-Google-Smtp-Source: ABdhPJwA+DiZuy6xl8wG41wqWju0oynDNJh6M3rEm018zeY+edIUL8WNZYWusLz93cuBSfoRG/fQhg==
X-Received: by 2002:a05:6000:1ce:: with SMTP id t14mr10050620wrx.300.1591888567919;
        Thu, 11 Jun 2020 08:16:07 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id z6sm5408008wrh.79.2020.06.11.08.16.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 08:16:07 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200611095540.250184d2@xps13>
Date:   Thu, 11 Jun 2020 17:16:04 +0200
Cc:     tsbogend@alpha.franken.de, Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
        vigneshr@ti.com, Jonas Gorski <jonas.gorski@gmail.com>,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com> <20200611095540.250184d2@xps13>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

> El 11 jun 2020, a las 9:55, Miquel Raynal <miquel.raynal@bootlin.com> =
escribi=C3=B3:
>=20
> Hi =C3=81lvaro,
>=20
> =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com> wrote on Mon,  8 =
Jun 2020
> 18:06:49 +0200:
>=20
>> Instead of trying to parse CFE version string, which is customized by =
some
>> vendors, let's just check that "CFE1" was passed on argument 3.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> ---
>> v2: use CFE_EPTSEAL definition and avoid using an additional funtion.
>>=20
>> drivers/mtd/parsers/bcm63xxpart.c | 29 ++++-------------------------
>> 1 file changed, 4 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/drivers/mtd/parsers/bcm63xxpart.c =
b/drivers/mtd/parsers/bcm63xxpart.c
>> index 78f90c6c18fd..493a75b2f266 100644
>> --- a/drivers/mtd/parsers/bcm63xxpart.c
>> +++ b/drivers/mtd/parsers/bcm63xxpart.c
>> @@ -22,6 +22,9 @@
>> #include <linux/mtd/partitions.h>
>> #include <linux/of.h>
>>=20
>> +#include <asm/bootinfo.h>
>> +#include <asm/fw/cfe/cfe_api.h>
>=20
> Are you sure both includes are needed?

asm/bootinfo.h is needed for fw_arg3 and asm/fw/cfe/cfe_api.h is needed =
for CFE_EPTSEAL.

>=20
> I don't think it is a good habit to include asm/ headers, are you sure
> there is not another header doing it just fine?

Both are needed unless you want to add another definition of CFE_EPTSEAL =
value.
There are currently two CFE magic definitions, the one in =
asm/fw/cfe/cfe_api.h and another one in bcm47xxpart.c:
=
https://github.com/torvalds/linux/blob/master/arch/mips/include/asm/fw/cfe=
/cfe_api.h#L28
=
https://github.com/torvalds/linux/blob/master/drivers/mtd/parsers/bcm47xxp=
art.c#L33

>=20
>> +
>> #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at =
least 64KiB */
>>=20
>> #define BCM963XX_CFE_MAGIC_OFFSET	0x4e0
>> @@ -32,30 +35,6 @@
>> #define STR_NULL_TERMINATE(x) \
>> 	do { char *_str =3D (x); _str[sizeof(x) - 1] =3D 0; } while (0)
>>=20
>> -static int bcm63xx_detect_cfe(struct mtd_info *master)
>> -{
>> -	char buf[9];
>> -	int ret;
>> -	size_t retlen;
>> -
>> -	ret =3D mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, =
&retlen,
>> -		       (void *)buf);
>> -	buf[retlen] =3D 0;
>> -
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (strncmp("cfe-v", buf, 5) =3D=3D 0)
>> -		return 0;
>> -
>> -	/* very old CFE's do not have the cfe-v string, so check for =
magic */
>> -	ret =3D mtd_read(master, BCM963XX_CFE_MAGIC_OFFSET, 8, &retlen,
>> -		       (void *)buf);
>> -	buf[retlen] =3D 0;
>> -
>> -	return strncmp("CFE1CFE1", buf, 8);
>> -}
>> -
>> static int bcm63xx_read_nvram(struct mtd_info *master,
>> 	struct bcm963xx_nvram *nvram)
>> {
>> @@ -138,7 +117,7 @@ static int bcm63xx_parse_cfe_partitions(struct =
mtd_info *master,
>> 	struct bcm963xx_nvram *nvram =3D NULL;
>> 	int ret;
>>=20
>> -	if (bcm63xx_detect_cfe(master))
>> +	if (fw_arg3 !=3D CFE_EPTSEAL)
>> 		return -EINVAL;
>>=20
>> 	nvram =3D vzalloc(sizeof(*nvram));

Best regards,
=C3=81lvaro.

