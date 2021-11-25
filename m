Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808FE45D5E4
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 09:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240396AbhKYIDr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 25 Nov 2021 03:03:47 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51]:36714 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345451AbhKYIBr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Nov 2021 03:01:47 -0500
Received: by mail-pj1-f51.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so7178430pja.1;
        Wed, 24 Nov 2021 23:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hmFa3mefTALjMC6F9V0zj4TVnAlnKNwgvaukN6YZ+bY=;
        b=6oOaSLIBrSfYg6XXDdlBc/8H71sP6rSV28UNp2rpuv9vwr6lEk/x8AdsG+YcIVetn5
         cbVKyTpT6PdrlEJac7j0iwaxVnKv6ygGK1oPtwOizi+go46xdCdY7GA5tdMsYb+Yu0+x
         Im1OVZ+gMxSiwqhTaI4VvKYVW3oPRaGoKJZze5rC9BsdsujM7wjyVBta4zna+yizFCeq
         RhKbcSyFduh/pPnaQtjSSqfNhraCNjnESZ4DFVnT0O3oYG7lhvqwrkcQ7Sep69R2Iwfb
         w+TPLrCbV486KqlPD+nXpaa8it11ZybXU6j8oh/H0osvm5r6pmNI8p7qzsCfliC76rFP
         k3Ig==
X-Gm-Message-State: AOAM532mtuxhxoBjiggoE9bKX/r1qo4UKRXsp9FbW2XT0vQ48wTnJUYP
        8Esms8d/tuQuCwVgcGfeS/ahQ5OS24VxZw==
X-Google-Smtp-Source: ABdhPJx6UpZpTuEmA1rvSs1iTlDVEp8YClIaDrH4iAJJP/Mz8rgJvWCNvh6UMGjpXfyDNJll7BWmwg==
X-Received: by 2002:a17:902:a509:b0:143:7eb6:c953 with SMTP id s9-20020a170902a50900b001437eb6c953mr27631921plq.4.1637827116096;
        Wed, 24 Nov 2021 23:58:36 -0800 (PST)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id b34sm1569897pgm.64.2021.11.24.23.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 23:58:35 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id h63so4494619pgc.12;
        Wed, 24 Nov 2021 23:58:35 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr7245004vke.33.1637827104304;
 Wed, 24 Nov 2021 23:58:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637691240.git.hns@goldelico.com> <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net> <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
 <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com> <B622D2B5-D631-43F3-9D50-2B41681C78AB@goldelico.com>
In-Reply-To: <B622D2B5-D631-43F3-9D50-2B41681C78AB@goldelico.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Nov 2021 08:58:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5sjVg6BEm3zgvvsJDHJwKP1A8rh-sama8suCG5SYQyA@mail.gmail.com>
Message-ID: <CAMuHMdV5sjVg6BEm3zgvvsJDHJwKP1A8rh-sama8suCG5SYQyA@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

On Wed, Nov 24, 2021 at 5:31 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > Am 24.11.2021 um 17:21 schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
> > On Wed, Nov 24, 2021 at 5:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>> Am 23.11.2021 um 21:10 schrieb Paul Cercueil <paul@crapouillou.net>:
> >>> Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
> >>>> +    assigned-clock-rates = <48000000>, <0>, <54000000>, <0>, <27000000>;
> >>>> };
> >>>> &tcu {
> >>>> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
> >>>>             bias-disable;
> >>>>     };
> >>>> +    pins_hdmi_ddc: hdmi_ddc {
> >>>> +            function = "hdmi-ddc";
> >>>> +            groups = "hdmi-ddc";
> >>>> +            bias-disable;
> >>>> +    };
> >>>> +
> >>>> +    /* switch to PF25 as gpio driving DDC_SDA low */
> >>>> +    pins_hdmi_ddc_unwedge: hdmi_ddc {
> >>>> +            function = "hdmi-ddc";
> >>>> +            groups = "hdmi-ddc";
> >>>> +            bias-disable;
> >>>> +    };
> >>>
> >>> Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You could just use the former and pass it to both pinctrl-0 and pinctrl-1.
> >>
> >> This was forgotten to remove. We do not make use of the unwedge feature because I could not find out how to use pinctrl to switch this to gpio25 and drive it low.
> >
> > Using gpio-hog?
>
> well, AFAIR it activates the gpio permanently and is a propery of the gpio controller and not of pinmux.

Yes, hogs are permanently (ignoring DT overlay tricks).

> The driver assumes it can use pinmux state switching to drive the DDC_SDA line low on demand.

Add an optional wedge-gpios property for switching?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
