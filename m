Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3D1326C04
	for <lists+linux-mips@lfdr.de>; Sat, 27 Feb 2021 07:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhB0Gtz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 01:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhB0Gtx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Feb 2021 01:49:53 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77267C06174A;
        Fri, 26 Feb 2021 22:49:13 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id y22-20020a1c4b160000b029010b2094f5deso562218wma.0;
        Fri, 26 Feb 2021 22:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:date:references
         :to:in-reply-to:message-id;
        bh=rvkyeJb5q0jr7Z6gx+qK+ZBArGjBdhjVlNLRJhyB0Ro=;
        b=ht/Av20SVUoSF8+iosDo1X0qtqHSiKPofYLTuzyprWa4XbAN74jabmXW4K3XzfBfIu
         p6TwrCc8Y16g7kEdaClRObLkOzo27Q334xKPOlN+lvFush6WlA6ZqtEsn/VYGyXXarKq
         TvbHBjRubhkdisIqgpS9KWQR0kTtbHs0c0tIjQ+l8ibxgY6aAWhF3LQfHhQX4HC8hTyf
         mmekTDmSiWrKLhpu+XL8P5JRVYVG2gGWv0393dETd8NVbI1uzrJB1xmefNK2IQl1RtQk
         3LEnS7mTkYTej3NdLTBPuDONFoOaKA9hKX99o7YSsbtZcxglKVSKq70wPgw/aLgoBeIA
         fwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:date:references:to:in-reply-to:message-id;
        bh=rvkyeJb5q0jr7Z6gx+qK+ZBArGjBdhjVlNLRJhyB0Ro=;
        b=GTnSyV7fhqDLHceymnzjgWmrHwiGAXHFTxPntPMbui8ubomrQw08401G8bRFvAbxJ9
         WjE49LaV6icmL/l+oBrdSGn6Qwtfwk15wDWt/NlrBRPJV5T0bg82/sOuENai63c2qK8s
         2+3q3vO1DUnULGinj+fP8Pv/FflZF/ApMAiIUXiyGYEo2Lo8e9azgiCUv/PJkJ43Y+22
         CsksBL+RTkydu6TCyuZ8Uj2+FMg+hK2MbyKjsyykFovJCS8WNJf3+VYFOhQZ5OmKZWka
         hCaEeqnqn+IUWQMgD2F7BargegxKWATuNrYrNmbVMDFJY9PX598xl4j/OYhZOt+i3XGV
         YuxQ==
X-Gm-Message-State: AOAM530TZRCLCKZ2Hpdj5rz1a1OtRIxqkb8UCOX8VkCGOEYzmuuIBe6C
        B7kZ7jP58+VWPgYoaWBvAZWTdAmppgscQQ==
X-Google-Smtp-Source: ABdhPJw724bJS+vznqBNOK4a6Ty7Yl9ETuCX91zfzUnwH8Evlh0H5k6Qzqt9vF/7F67WSN+DiPu1UA==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr5883337wmb.128.1614408551624;
        Fri, 26 Feb 2021 22:49:11 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y10sm8317211wrl.19.2021.02.26.22.49.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 22:49:11 -0800 (PST)
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 0/2] irqchip: add support for BCM6345 interrupt
 controller
Date:   Sat, 27 Feb 2021 07:49:09 +0100
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
Message-Id: <8C8FF886-6DCF-4308-B516-17BBFEBADB98@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

Apparently these patches were flagged as =E2=80=9CNot Applicable=E2=80=9D =
without an explanation. Why?
=
https://patchwork.kernel.org/project/linux-mips/patch/20210224075640.20465=
-2-noltari@gmail.com/
=
https://patchwork.kernel.org/project/linux-mips/patch/20210224075640.20465=
-3-noltari@gmail.com/

Best regards,
=C3=81lvaro.

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

