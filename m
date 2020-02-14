Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E7E15F6C7
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 20:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388378AbgBNTYy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 14:24:54 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:30923 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387596AbgBNTYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 14:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581708292;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=e3Rzzpo7xk9J4ECQBBols/BtjcoyLgBQyjDXgkqJ5t4=;
        b=HyTL905JWDg18FcLUhGZaD6IAYx04+ukXS4utjVBqPnjC+/y79E4ifypPUQuC9Bx+J
        70AhaGRU6tBq7262beAjkmzKV0nEsRlMOOL4WgsZfylOHSLC3hj1wemzoj3vcmX0PPMT
        Z6M9I3s7ymOR1k2zv0mVcmEca3yrYb1iyIVGMjh8XuzoI26NkVceyQXM2Xim92CAKi6t
        PBavVX7si71PWyZ8yeb5/hp/dxdY4M6tbOK837ixoa5qrj+VTdi2+wlFLlKwXq8LYQ5R
        bE8/TKuudjGDy/h/7ZA8nJL7gW8obHPn6oxFcxIPayh8TPds7YLQHr9dgjWSZ7MKJdUF
        wFpw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PuwDOspHA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EJOlGBd
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 20:24:47 +0100 (CET)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 01/12] drm: ingenic-drm: add MODULE_DEVICE_TABLE
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1581707177.3.6@crapouillou.net>
Date:   Fri, 14 Feb 2020 20:24:45 +0100
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
Message-Id: <B5B39A33-B8C4-4503-91CB-BFB344558B5D@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com> <1b5475c88032b3851c6d33443e688b432af42a9f.1581696624.git.hns@goldelico.com> <1581707177.3.6@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 14.02.2020 um 20:06 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Please rebase this patch on top of drm-misc-next and send it apart - =
it should go through the DRM tree.
>=20
>=20
> Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> Add MODULE_DEVICE_TABLE so that the driver can load by
>> matching the device tree if compiled as module.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm.c | 2 ++
>> 1 file changed, 2 insertions(+)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =
b/drivers/gpu/drm/ingenic/ingenic-drm.c
>> index 6d47ef7b148c..d8617096dd8e 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>> @@ -844,6 +844,8 @@ static const struct of_device_id =
ingenic_drm_of_match[] =3D {
>> 	{ /* sentinel */ },
>> };
>> +MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
>=20
> Also please remove the blank line above MODULE_DEVICE_TABLE.
>=20
> Cheers,
> -Paul

Ok.

BR and thanks,
Nikolaus

>=20
>> +
>> static struct platform_driver ingenic_drm_driver =3D {
>> 	.driver =3D {
>> 		.name =3D "ingenic-drm",
>> --
>> 2.23.0
>=20
>=20

