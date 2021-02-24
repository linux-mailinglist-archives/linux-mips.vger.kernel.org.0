Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215F73237AC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 08:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234159AbhBXHJP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 02:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbhBXHJM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 02:09:12 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430D7C06178B;
        Tue, 23 Feb 2021 23:08:32 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id u125so848898wmg.4;
        Tue, 23 Feb 2021 23:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=WNJb+cFGEmltmiIpeUcE3s+DhhV7whlTmcB3qCDm1ds=;
        b=rBdGdw7+v7r8TPreyHYwHOXDmMeNiL3gsvCddNhYhtPQKaZo/YzyJ8OswpMlSJH2qU
         tb8TMNKEVwNkLJZGOfLsHROMHb/720uT4WZHRf28wuv7IiX2EXtt6QflnJLUy4PH+xMv
         VxuTAJYbJoEJGV8OKPboQ0DIJPq8MKFmg7lZf8Pst1KZH+aVLXT9FCrQ20jW3VmlhmPg
         AZ1Cuxkrw15E3+H5iywotie93+z/DizdB8EE6StWNVBuZDGy53VU/pdbEQT98rFJtedH
         B9quVIUSWc/2bgsHTeVZaZBpvthbG9borTMNjiInuecDBcbd8iEV9C5x5LQNxkfLey39
         yHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=WNJb+cFGEmltmiIpeUcE3s+DhhV7whlTmcB3qCDm1ds=;
        b=HVcWBTcE7jSqYraCuJOGtbDMuj7L5D07XK1U8h6/Gpc57aAYHmO+Dzz52yo+9ul0ff
         WjY8MREltZ7o20mDrBzGILzrAJ/3dlOW58lCNVbhhgxMZUS2b3UfeE9y3jH0b8OuUE0E
         rf2C4c34QVnwl20rwDGaQpRUhCHQu1MS8Bf8wdJBYBX9lIk1TQVsEc+qAFpYmmYLijtG
         mVkSXcb1XZ0l/wOLpWIvkGfRy5cf0vuRkulvbyQ5rfsFkfugqBYOG4b0pZ1GZnDdCr5R
         9Rds1cQGOgGCYBq9qpl7ll1bmMhpZoLVLQa9yUqkrCiDdPg5Y1GQgw/1TBjtzFZFSice
         wyFw==
X-Gm-Message-State: AOAM5320UB1t/OWRGnMUpyyJtT6ruzHb7o2ivYy7LA0MGFO5IMEGdjMv
        gdSLf6otdFhJdbKc5dq89TE=
X-Google-Smtp-Source: ABdhPJwEdmMQswHCMTHXPS5CSqlomT9/VLjXhKgVzBBGo21ZapSkST+VbNJ/yBokXNJg2BORRyVXcA==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr2039264wmj.81.1614150511056;
        Tue, 23 Feb 2021 23:08:31 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id g11sm1328847wmk.32.2021.02.23.23.08.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 23:08:30 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 2/2] irqchip: add support for BCM6345 external
 interrupt controller
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <7de8507d-82dd-291e-1f63-7c1460e6a6b2@gmail.com>
Date:   Wed, 24 Feb 2021 08:08:28 +0100
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C423E680-1741-43C0-A4DA-DCF65509C510@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com>
 <20210223204340.312-1-noltari@gmail.com>
 <20210223204340.312-3-noltari@gmail.com>
 <7de8507d-82dd-291e-1f63-7c1460e6a6b2@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

> El 24 feb 2021, a las 4:43, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 2/23/2021 12:43 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> This interrupt controller is present on bcm63xx SoCs in order to =
generate
>> interrupts based on GPIO status changes.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> ---
>=20
> [snip]
>> +static int __init bcm6345_ext_intc_of_init(struct device_node *node,
>> +					   struct device_node *parent)
>> +{
>> +	int num_irqs, ret =3D -EINVAL;
>> +	unsigned i;
>> +	void __iomem *base;
>> +	int irqs[MAX_IRQS] =3D { 0 };
>> +	u32 shift;
>> +	bool toggle_clear_on_ack =3D false;
>> +
>> +	num_irqs =3D of_irq_count(node);
>> +
>> +	if (!num_irqs || num_irqs > MAX_IRQS)
>> +		return -EINVAL;
>> +
>> +	if (of_property_read_u32(node, "brcm,field-width", &shift))
>> +		shift =3D 4;
>=20
> This property is not documented in the binding, other than that:

Nice catch, I will add it in next version.

>=20
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> --=20
> Florian

