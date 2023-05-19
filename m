Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBC97095C4
	for <lists+linux-mips@lfdr.de>; Fri, 19 May 2023 13:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjESLDX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 May 2023 07:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbjESLDO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 May 2023 07:03:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26C91BD7;
        Fri, 19 May 2023 04:02:42 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ad89c7a84fso34340241fa.2;
        Fri, 19 May 2023 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684494159; x=1687086159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfIfZkT5to0ygfty53KLXwdW4k+vS796D0eoWkZMOFE=;
        b=cJWVxCMNdCYmWdaRTtqzSknn8+g3xOPc15ifl9Di+TNaCKKjPV/u1S0oQdvFCl9Dsw
         Fm0NVDqXXP7zuI4XQd2Sk2lIhiTRCtS87HrCd/NcmtBEuneWoH/Xu8TkaN2Fj4irfD2i
         HZ98uf1CT0ubdZ13eS6BFDdcAG1MNPFyH/rZdlyBhI+NhZES5+at3A7xNGtPNSRVSSBC
         BG9fa5I7UiupejrHkAdkm9bJ9qeze4GavtP0PSgDfqP5GXdLGUcq0rlaEZFkcyRvn28e
         jjTdS5VG6cx9AaWBZUuM8vloMCrCs8zbYMo8caIv0uXbrYYIwya18lUnQDN/9I7981XZ
         ZbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684494159; x=1687086159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfIfZkT5to0ygfty53KLXwdW4k+vS796D0eoWkZMOFE=;
        b=Po8dL2clV/EZYzqdasyrsay2tLj264IQT+1OxXF4rSdiBAQ6UKtlajIWn+AFdAVgMV
         56LjUIjmInOxgc6x98M+9PmJGhe6B27VgMUnG9wMyM7hgdBxfy/y/vuQ6JrYgeBqGr+m
         jgP51pYXKe+dkXFramFQRYOXfbZsilQrBd89ElPYkASE3PAEDwuFpgoOqwg8QhTKXjY7
         zPtcgDhzclBYfcC9V7Bib4HX9zV+X7vFLB/yKxBSXbEPqvu1Kw93e96y0kNJWZuK9RZ1
         1d7XxDSPcnMWaYTpAiIZLkfz/EgkbeLUvg2XTqCAg9rzmI3aKtBKkviex4TtbcHnNx6b
         vMBg==
X-Gm-Message-State: AC+VfDwNbMxIwPyZVO0m3wB263pk/YEtOpanhfuuPtNjPCkIwT0pdF9A
        CZTq+ODoIq8iRrMc1EErAVg=
X-Google-Smtp-Source: ACHHUZ7kLQeM3iKsF59w4UnthlNctv6NledR+bbcU9FAxUkJ7v3813sVzksg2947S56c4oWmPuLz4w==
X-Received: by 2002:a2e:964f:0:b0:2a8:a5b7:6057 with SMTP id z15-20020a2e964f000000b002a8a5b76057mr595196ljh.50.1684494159371;
        Fri, 19 May 2023 04:02:39 -0700 (PDT)
Received: from fedora (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b004e887fd71acsm556763lfg.236.2023.05.19.04.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 04:02:38 -0700 (PDT)
Date:   Fri, 19 May 2023 14:02:34 +0300
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Andreas Klinger <ak@it-klinger.de>,
        Marcin Wojtas <mw@semihalf.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, netdev@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v5 5/8] pinctrl: ingenic: relax return value check for IRQ get
Message-ID: <9d1eae2a73143188a0b9664c1598948ccad23855.1684493615.git.mazziesaccount@gmail.com>
References: <cover.1684493615.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xqo0YRjbuJxwUqgu"
Content-Disposition: inline
In-Reply-To: <cover.1684493615.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--xqo0YRjbuJxwUqgu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

fwnode_irq_get[_byname]() were changed to not return 0 anymore.

Drop check for return value 0.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Linus Walleij <linus.walleij@linaro.org>

---
Please note, I took Linus' reply to v4 cover-letter as ack && added the
tag. Please let me know if this was not Ok.

The first patch of the series changes the fwnode_irq_get() so this depends
on the first patch of the series and should not be applied alone.
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-in=
genic.c
index 2f220a47b749..86e71ad703a5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4201,8 +4201,6 @@ static int __init ingenic_gpio_probe(struct ingenic_p=
inctrl *jzpc,
 	err =3D fwnode_irq_get(fwnode, 0);
 	if (err < 0)
 		return err;
-	if (!err)
-		return -EINVAL;
 	jzgc->irq =3D err;
=20
 	girq =3D &jzgc->gc.irq;
--=20
2.40.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--xqo0YRjbuJxwUqgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmRnV0oACgkQeFA3/03a
ocV+DQgAyRgi2TUA5N8VsK0WYaNVMX5ZtYWMl6/GMFhsZvgKTH9D07d0A2pRMi0o
EEhIqhqHVJcbHkoDw7RMwwweZXr3L+JNmP8+bJGu7a8mLW02/mKIAV8vJXOEGXFO
4DDKe9Svs1tTJctTmx5VPIpu5FEi+VFuZ2zD/VC9fzbA1f8C1PemzkPfpzv7hAZe
ScGO2OhPUJ0JcpMOkRGLGTrMojeHplQmsvmg8g+VuJV4u8mYc1o5L2wFC9ViUcEC
GkqDlT9RSne0TeQ+zYE7ZCApuN4M64QxsUhH8Htgd0V3vMgfa9ZXgXkK5tmGyF7I
++ar962pBKBsyXXQl1obZn4qW2KGzg==
=bau4
-----END PGP SIGNATURE-----

--xqo0YRjbuJxwUqgu--
