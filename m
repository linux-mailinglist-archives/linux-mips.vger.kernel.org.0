Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7D8323833
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 09:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbhBXH7t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 02:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbhBXH72 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 02:59:28 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B00C061574;
        Tue, 23 Feb 2021 23:58:47 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id l13so960339wmg.5;
        Tue, 23 Feb 2021 23:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:date:references
         :to:in-reply-to:message-id;
        bh=x1jxjjLDASCMlTc1udMdVoMLB+6UDTS14GcvKV5F870=;
        b=EUJXnHT4N8+s9AlEtT4XP7Nbn+2XCqpqJSey5pyJ7c9VV4a7B6dzMa1Z3pIbeexsVu
         r26rT5BkAGT2MX9LvmqggEIpuowICAfVB4KlVVinNS+NU8TWQTRNCGUnFtPnU3cvYgWb
         hoDNT35+2z8u7x6GnnPFvn1mKCRc41Zs9+zFrGYHU2YAveemABnOmEQ8Dw5iGkjc309A
         YkxtZYKH9HlLkaNL4UxNkdtz9cjU3I6YqQB5ha7cOohLLw8sQUiUahszhwamCANvGA92
         ApqJjJNMmF0657q3o8XcvFyo4Fe2uZHSu1V6TNaQ2JZdL7JvvYvVO+wT++AUc57jJ4Ng
         i/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:date:references:to:in-reply-to:message-id;
        bh=x1jxjjLDASCMlTc1udMdVoMLB+6UDTS14GcvKV5F870=;
        b=sXZp7xCZCeSHIYEYi0HH2YGgEaEl6zHAE5JcTjpsLOo9/H3oEPSJIIzDl0EeYRaOPN
         4RA1mHSKgxo4MUGfQSjugNwU9nJ66evqLnSP0UPlL+gkeFzqa1y3s6vsHSsA7obBYUQS
         Ee6gthmhdpxQ/UDV12fAo1GLK0LoQtH175l2WrMsXhq4ca5tS7Lac5H7+grSJjctvOPm
         Cij98uGN2QrAKTXHkM8Woq1sEdFPd8E8ZBm1Jiy4gt+FFK4Tn+Bh7xNr7d6UI5tKzW+q
         0JjVC6TOkfi1053aNxhiQDSrsE07U1rlewlqnCJnFjGBsNnMhtzfohjPKxp0838JIgRR
         50qA==
X-Gm-Message-State: AOAM533HZB0YzlXr6YVTOE5ZtL/gMVyDmpwoQDNWyd/2wn5yxDJ81lSL
        aLBp+xpyPHNY4l01Gmn+qkgKrwmApOCuHk7/
X-Google-Smtp-Source: ABdhPJwocmDHjsMb/bjg/PqDqbyy7KyVYGgYrogiTBCQkLsjFb0n1e/uOT81cP3Yjm50WxCfDzr4Kg==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr2421297wmk.70.1614153526385;
        Tue, 23 Feb 2021 23:58:46 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id t23sm1531021wmn.13.2021.02.23.23.58.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 23:58:45 -0800 (PST)
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 0/2] irqchip: add support for BCM6345 interrupt
 controller
Date:   Wed, 24 Feb 2021 08:58:44 +0100
References: <20210223204340.312-1-noltari@gmail.com>
 <20210224075640.20465-1-noltari@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
In-Reply-To: <20210224075640.20465-1-noltari@gmail.com>
Message-Id: <D10F711C-ECEF-4F8B-AA0A-7DACFFDD1FEB@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is supposed to be v3=E2=80=A6
Sorry for that. Should I resend?

> El 24 feb 2021, a las 8:56, =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> escribi=C3=B3:
>=20
> This interrupt controller is present on bcm63xx SoCs in order to =
generate
> interrupts based on GPIO status changes.
>=20
> v3: pass dt_binding_check.
> v2: fix documentation title typo.
>=20
> =C3=81lvaro Fern=C3=A1ndez Rojas (2):
>  dt-bindings: interrupt-controller: document BCM6345 external =
interrupt
>    controller
>  irqchip: add support for BCM6345 external interrupt controller
>=20
> .../brcm,bcm6345-ext-intc.yaml                |  78 +++++
> drivers/irqchip/Kconfig                       |   4 +
> drivers/irqchip/Makefile                      |   1 +
> drivers/irqchip/irq-bcm6345-ext.c             | 271 ++++++++++++++++++
> 4 files changed, 354 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-in=
tc.yaml
> create mode 100644 drivers/irqchip/irq-bcm6345-ext.c
>=20
> --=20
> 2.20.1
>=20

