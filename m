Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D3A1F4DD4
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 08:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgFJGFy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 02:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgFJGFx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 02:05:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A9BC05BD1E;
        Tue,  9 Jun 2020 23:05:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l11so828024wru.0;
        Tue, 09 Jun 2020 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=HKDG3+U+6weAVeJljyO+nIelAx9xC2VwujNBg2RLPlU=;
        b=ATgZSLoLFPAgEtwbfg8ZJ/9L3MJqy4n0SOgp6B36kS28loZNkMu7LmmXT2ITJaU1oh
         Zg5WoZSzEF59bfDUioPWgBxkHNSEyXLB8XtX0gt8nFGoW1lW1rBjF2hoQNXCoVIVY9rQ
         7y7E1JnSAZzRHGq4hql5w6L5dZNz2UXh6RbGATHhqnJqf0PpPjOiepu9sfbpmqILzpAQ
         H6cgut83ghJCjSTHzLIbjlRQYKvQosFMt2cgCoLApBE/i5Stg4UbcJL8qYnq9KVBckx8
         Wrhc5ccB9tk39jpJ23xK7mAouzoVoAiriuUC7qfIHpAPNcfXN5irzyPsozvCdT0voVVd
         gINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=HKDG3+U+6weAVeJljyO+nIelAx9xC2VwujNBg2RLPlU=;
        b=ojtpo4edbL0KiHPD5yzcDVlU7OAIBM/LBmeV6zqSACEOJVPUqC7j1yDWSyEa/il2LO
         FkGmpVQuQZRumqWXinPSDGgA7+p2kxLhrS1yXa0N1A/ALu/GU1rXsMc9tVxEaL5IAR2m
         lo2s2PZfzFY5MDdgcvCxCevf5alorKXEnCiGDCmBvWJiiRCLNPKG90jrKgz4MrZ6/mWO
         f2XGchDwKD96vDCYYI0GrowXGyR3EbAMOslCVjaYD4LpHELC1F0aT88mNY6q+4lj8l2m
         +uZJwjW7lJGY6Qo2bBGEZCsAYaW7azlxxSLkI+Mep0reHdgt1JEoRdgmL5vFN0w11B4k
         GjUQ==
X-Gm-Message-State: AOAM5339lDaI+vj4+SyVBpV4E06nP4P+LsSw6VfFuaLmjb9wTFGFMkeF
        ckNe53n0ptd13G0nx2qfIls=
X-Google-Smtp-Source: ABdhPJzbenTYIclXlIlMhhjjt5TCEoJgEzUtwreeLfdI5U1aCljKdkaCwip/7tX2P79Tnz5pbTjZsQ==
X-Received: by 2002:adf:a507:: with SMTP id i7mr1840286wrb.0.1591769151744;
        Tue, 09 Jun 2020 23:05:51 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id 50sm6758395wra.1.2020.06.09.23.05.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 23:05:51 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 4/7] mips: bmips: dts: add BCM6328 reset controller
 support
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <47a8def4-a32a-04d3-e4ab-bb358f1455f5@gmail.com>
Date:   Wed, 10 Jun 2020 08:05:50 +0200
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <63C687B9-AF45-45EB-9D21-61BD0CD4ACE8@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-5-noltari@gmail.com>
 <47a8def4-a32a-04d3-e4ab-bb358f1455f5@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

> El 10 jun 2020, a las 3:08, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 6/9/2020 9:02 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> BCM6328 SoCs have a reset controller for certain components.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>=20
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>=20
> You should probably create include files under include/dt-bindings/
> which designate the various reset control bits that are valid for a
> given SoC.

I will do that in v3.

> --=20
> Florian

