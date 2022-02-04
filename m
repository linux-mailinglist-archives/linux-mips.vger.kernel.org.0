Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3CB4A9EE3
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 19:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377508AbiBDSWR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 13:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237893AbiBDSWR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 13:22:17 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02ABAC061714;
        Fri,  4 Feb 2022 10:22:17 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id s13so21854351ejy.3;
        Fri, 04 Feb 2022 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=twumIFSTClgcHTdJL0227Nth7t4tlEgqpolAjlDA7EA=;
        b=HjH26UyHH7jemj9qmDHaVMixNcfaoC7p9J+uxCwZLajdGVBuxHXCojA4ncW6Dbj0px
         6Y73Y0ZErAJGilz7TALPbJyC+TdOt3fAmOr7f/xWHt74bGGJwBc3CBobfoPel4sk1e1h
         C+X/g0mBbD9B+DOrsf6QjhGUScqse3PcKE0/Xp3BWZbFzFN8j/hSDOzJdP/Wyh8M/Y6I
         rBKIyjPG9rxUpFk9QDFyhypmLN25zgyBfg/fjxwCLUBS133M+7qpImfQPPsVKugMbG5N
         C1q9kDPvkfw874Z8LxAgu6TGKaRnUzR6eLK6sJWuWfpsNS9/iPkFH5vw43je/Zyq87R9
         OQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=twumIFSTClgcHTdJL0227Nth7t4tlEgqpolAjlDA7EA=;
        b=ZqBycdUceCWEsNBTKiaoMHHbCtulbSHoo124AeDiX9/9tyUIA4G1F4K4phHPXqBiO6
         5280whKcaNOpfCDFYgMwC+gBechqGTcKI4fM/6rjzVIFgqYSQbDCANi1OOEOGPgV+8Y1
         V2LQRKlPZ595TQcgQdp6IThzFzc1iCOcDA65Y07Hrn9moDpqxg1vRkPTcoLlWgTnp+bs
         xBKn+fYIGefCVuinN1xaonoB2s029f9GRsLwoVuEbm+pEss8nWJELCSI7EL8ZLF0RUIV
         P6AceMXmIqKJkZojIUFl+fZgFvhDQ7w7wof3M4RmKLy9USfDcFSj0JJUibjI4DqUH3W3
         P7rA==
X-Gm-Message-State: AOAM532Wlv8WsD3W0e+rzO1RugZr/6IAGhG+yEroma0qfnPn/FtAcH7G
        R4VLMdkm5CExRTkx6A7nNjWdM0vKhxvmiGWjaHI=
X-Google-Smtp-Source: ABdhPJyOn0RLYwfEOQaJb+TMQN6u3fK3oeQDYMwrQybMiDVSTF8EmTuwNr+UvPC9x6ZvBx/bzru4+gRROBU/Oqd6yRk=
X-Received: by 2002:a17:907:160c:: with SMTP id hb12mr165834ejc.46.1643998935451;
 Fri, 04 Feb 2022 10:22:15 -0800 (PST)
MIME-Version: 1.0
References: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net> <20220204072141.542909-1-lis8215@gmail.com>
 <QH1S6R.BMH4KZNDZAOO3@crapouillou.net>
In-Reply-To: <QH1S6R.BMH4KZNDZAOO3@crapouillou.net>
From:   Siarhei Volkau <lis8215@gmail.com>
Date:   Fri, 4 Feb 2022 21:22:04 +0300
Message-ID: <CAKNVLfbeKhcRR1Sc780GU9XvW4ACJRHiy4EHJfsPeqB5Sj9i9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] clk: jz4725b: fix mmc0 clock gating
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=D0=BF=D1=82, 4 =D1=84=D0=B5=D0=B2=D1=80. 2022 =D0=B3. =D0=B2 14:06, Paul C=
ercueil <paul@crapouillou.net>:
>
> Hi,
>
> Le ven., f=C3=A9vr. 4 2022 at 10:21:40 +0300, Siarhei Volkau
> <lis8215@gmail.com> a =C3=A9crit :
> Can you confirm that the MMC0 controller will work even with the bit 6
> off?
>
> Do you know if the MMC0 bit has been moved elsewhere, or the MMC0
> controller is permanently enabled?
>
Do you mean when the clock is off (bit =3D=3D 1) or bit =3D=3D 0 (the clock=
 is on)?

Anyway what I tried:
I tried not enabling this clock in the UBIBoot - it just works. I guess
boot ROM enables it earlier.
But when I explicitly disable the clock it doesn't boot.
So I assume bit 6 definitely gates the MMC0
clock, as stated in the jz4725b programmer's manual.

Then I disabled MMC0 in Ubiboot to run Linux from MMC1 and tested
the audio with disabled MMC0, in dts mmc0 node was disabled as well.
With this patch applied sound works well. So I guess the bit 6 isn't
related to the I2S clocking at all.

Hope I answered your questions.

BR, Siarhei
