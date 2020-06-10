Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDB51F4DE3
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 08:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgFJGIk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 02:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgFJGIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 02:08:40 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F75DC05BD1E;
        Tue,  9 Jun 2020 23:08:40 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k26so632058wmi.4;
        Tue, 09 Jun 2020 23:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9ySIaa975PAC6SWtqNw2SdOpESGj5AY/7tdn7A1OMLM=;
        b=ThsHKuaZK7hTG+kS22bzr/wgmpJaUAMunQgbKNhSGP+maZwbhtnrujbsyi8x0IyMV7
         CvvD9LKQZpghColYBYuDIb9BetoNXlTiRlOPojgigKpYzyp9fLt+R1IaW0/TQ3PpIQV3
         I/lnaTVrQgL2zP1AZYTzR/JBNkFiz9Sf1B2SU1qq4iNmhQNFxAco/NtIu4qnDJIE8dlw
         GCDJpstesth5Uy3wdcoKIizfKiirLV/d7tcPBiyRKxFFGXX8iYCweC3rPuG2mpDGM/1W
         QUsvzNu7rKkXbqVA2qhVoSTV9hrs2PvuiiNoBZNorkA1IicZi962wrwwC8z97/M7TJv5
         +Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9ySIaa975PAC6SWtqNw2SdOpESGj5AY/7tdn7A1OMLM=;
        b=XZt+9ZUtZcndMvjCcT6o7JNxp0iGvHASi+aCAAUqMerDeiEn/sFsbVmE9CjrF0rr81
         jndHdpjVBozDrEm8URwkSld1HZvPNa9Ot13vxX9xtZEnHYgqswQHcOAfXxfOfFFPYEir
         V4P5CPRS46TmENUJdx/bhdrFLSDlQrLhlVBcPQgijw2/umJty3VmaDEhEYotkUi0IivM
         2d6OCv/Wkeh3wESGKlnXqyCeKBdUduFe5ANFewRsqaNMGzkgMxGAp7MeO4L7qPihbtjI
         9iZjnuync9lFr/TzwsUbCokg51xBGuhGhGe12IlpLKk6sw0bJHUMR/vDWmKNuexpl0mO
         CkGg==
X-Gm-Message-State: AOAM5300LYBEAxZKM3Zn63S4jIogKBVCdSqP/HIfGrgxAZNAl878Bjg3
        aoP1LasMj55AZavKpNXYA4U=
X-Google-Smtp-Source: ABdhPJyqylcMxelCT7+HonzeHNjeP5pFH+sbD8jAJOtfrtp0n/WuPTu/e5LL0clGw5QTctyyG5E54A==
X-Received: by 2002:a1c:408:: with SMTP id 8mr1448165wme.15.1591769318755;
        Tue, 09 Jun 2020 23:08:38 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id u13sm5287365wmm.6.2020.06.09.23.08.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 23:08:38 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 3/7] reset: add BCM6345 reset controller driver
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <e80e5c4c-ceef-3a62-3158-02f742bf76b7@gmail.com>
Date:   Wed, 10 Jun 2020 08:08:37 +0200
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, Jonas Gorski <jonas.gorski@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <41A1CC01-BFA0-48A1-A2EE-7917B3A1323A@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609134232.4084718-4-noltari@gmail.com>
 <341e8482c6bd06267633160d7358fa8331bef515.camel@pengutronix.de>
 <729976E9-CAF7-47B6-8783-5FD3D85F9EFD@gmail.com>
 <2a621f170574a616bcf047f6725c74552f7abbb1.camel@pengutronix.de>
 <46614E69-578A-4782-9D72-85B2D2F38FB8@gmail.com>
 <e80e5c4c-ceef-3a62-3158-02f742bf76b7@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

> El 9 jun 2020, a las 22:17, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 6/9/2020 9:41 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>>>> If you can do without this, with I think this driver could be made =
to
>>>>> use reset-simple.
>>>>=20
>>>> Yes, but only if I can add reset support with a configurable sleep =
range to reset-simple. Is this possible?
>>>=20
>>> I should have mentioned, support for this is on the reset/next =
branch:
>>>=20
>>> git://git.pengutronix.de/pza/linux.git reset/next
>>=20
>> Yes, but reset_us was only added to reset_simple_data, so there=E2=80=99=
s no way to fill that value from reset_simple_devdata or device tree, =
right?
>=20
> Not that I can see, but you could certainly extend it here:
>=20
> if (devdata) {
> 		reg_offset =3D devdata->reg_offset;
> 		if (devdata->nr_resets)
> 			data->rcdev.nr_resets =3D devdata->nr_resets;
> 		data->active_low =3D devdata->active_low;
> 		data->status_active_low =3D devdata->status_active_low;
> 	}

Yes, I would extend it there too, but I was just saying that it=E2=80=99s =
a bit strange that it was only added to reset_simple_data without any =
way to fill the value.

>=20
> and have an appropriate devdata structure be provided for your
> compatible string:
>=20
> +	{ .compatible =3D "brcm,bcm6345-reset", .data =3D =
bcm6345_reset_devdata },
> --=20
> Florian

Regards,
=C3=81lvaro.=
