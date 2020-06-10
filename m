Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8F81F4D7A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 08:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgFJGDQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 02:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgFJGDI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 02:03:08 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11DCC05BD1E;
        Tue,  9 Jun 2020 23:03:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so812332wrp.2;
        Tue, 09 Jun 2020 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mvokNqexRaegU1modB7NHhGEwXygj1rNSFFDdGJdwa0=;
        b=mMAGEukTDdiryhtO2yW2E65dypnqCGYbqRrs7w7rKE/V+EEhAhBM27L4eNMIGkYQqd
         EFkWD7+mPh+dpmN6keyW+8gGZxasZh2CJGRTghTOMp+Vg3YlsI1Cogf6VwyGv5oCQ9eL
         BznuKmizzvAmZpw4YFSZHDSXMvPUYArmHD50q5r79HngvZ4P/kONZDkm+6lB3b76iBEg
         6PHxDgbF93E8986oHdtewWko1O8gyekJ+/j/fd81jbb2rL0ICxOgPw3pEmMNDtPRRq+b
         xPBQOlfwnIYmoMe9wzlyZZsm+UK5bPVow+Yc+d6EA4GN/ElP4+7JDH8ZV5XqI3oi9hGG
         Sr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mvokNqexRaegU1modB7NHhGEwXygj1rNSFFDdGJdwa0=;
        b=XHP0e1LismEyuhLJjelsltEtnr4wdg4drMOJUXBAtDKNubb/NhrtgSHnyOmxIZ6LvQ
         y3dgl3nQ0zLbF5CY0uiA95x3UMS/w6w11ZiB1+XHJkubh64Tx4umeyl1GNe2ST+K7z47
         gDhi6UtNwfZDg3IF6sIzw2hGXY1p08pckvPRe0lW0bNhb1eFh9cC6EMczpevfktwy4oc
         4sbI0MYec34X7k9MFWa7EU7prG4COihkHIDr5ufReDLUXfc2cG6yQpCVItL5CxIHL4x5
         UDbmGqgZBrxaxoPKEZvKC1DgPHqK+SbrJdwv7fUBQtO9Yp9Cq543IZt7WZ45MwCm1roJ
         HTvA==
X-Gm-Message-State: AOAM532ncCz9/c/d/2Xu5UQrqoB+Nk3224fPS3riQPqxBjiYY5NiBBbk
        1HsSqze7K57R/DtLxO5yhuD+6okn06M=
X-Google-Smtp-Source: ABdhPJyWv4V1rxzPNSAS30xkqIspxg9pNDEfhvr6Do6JVCr3W3NNGdGXnItKMO7FLMOxDcCF6HDvXg==
X-Received: by 2002:a05:6000:1146:: with SMTP id d6mr1639898wrx.400.1591768984735;
        Tue, 09 Jun 2020 23:03:04 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id q5sm6449183wrm.62.2020.06.09.23.03.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 23:03:04 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/4] dt-bindings: soc: brcm: add BCM63xx power domain
 binding
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <f6cbb9bb-15df-6283-a509-ea8a8b9bdaab@gmail.com>
Date:   Wed, 10 Jun 2020 08:03:02 +0200
Cc:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC84127B-DFF6-4EE3-ABDF-BEFAD6BCDEFB@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200609105244.4014823-2-noltari@gmail.com>
 <f6cbb9bb-15df-6283-a509-ea8a8b9bdaab@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ok, I will send v2 with a separate YAML file.

> El 10 jun 2020, a las 3:15, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 6/9/2020 3:52 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain =
controller
>> to enable/disable certain components in order to save power.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> .../devicetree/bindings/mips/brcm/soc.txt       | 17 =
+++++++++++++++++
>=20
> You should probably create a YAML binding from the beginning that way
> you get validation for free. This file should ultimately be broken =
down
> into separate YAML bindings, but I Have not had the time to do that =
yet
> (you are welcome to if you feel like it).
>=20
> Other than that, the binding definition looks good to me.
> --=20
> Florian

