Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113A045C9DB
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 17:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348556AbhKXQZu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 24 Nov 2021 11:25:50 -0500
Received: from mail-pl1-f177.google.com ([209.85.214.177]:42912 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348588AbhKXQZQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 11:25:16 -0500
Received: by mail-pl1-f177.google.com with SMTP id u17so2248322plg.9;
        Wed, 24 Nov 2021 08:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lQ05ml1LhHBnkHYimEBs2VQYL5tQ4v6fk2Yd4f3PjAE=;
        b=oO/qd7wUX++F60l0KvXxtXDSIrtX5t9LmM4AKELX8mMGAeRt5fY2zmat2q6qOm1FIa
         lH4dfpw8oVprUIwih4xJJMhgfnq74jZfI3d9t6+WXC+RnphMsLl2BgKvfqfaCZKB1MmW
         +0Y0xDDftTkN55tCFrEWgbFFemai2WTdfZPLy3OJBX+2PcSkB1jeQ4fpt3N5CHd6Wza7
         UxwqLKGz/DaJ8xcrcXtA8FYf+7DjDn4H4LEvjZ9VbMeq4z97VCIUVSpWaNQxGKJv7kLu
         j5ALuEZVZNAqY/RhDBUAk9nDypu0ogp9uI2COwLf8+3YxvC5FoTtlWI1QK65bKUUu0Pm
         C2RA==
X-Gm-Message-State: AOAM530K+hAeP0UBWwFAXSgs/77vcG06NTX2ciKy5K3MCAWuXtdYsLnU
        C7bI+deHUQ1vT1nyPCC1XRVrMouQVhgOUn8B
X-Google-Smtp-Source: ABdhPJyZo36kJnYK81XdBcpFk6ST+VZoL1h8pbUFAL4ps8XnxAiYyNI3l1R5IU2WSi31chNyIdNiBQ==
X-Received: by 2002:a17:90b:4b4e:: with SMTP id mi14mr10711375pjb.122.1637770926302;
        Wed, 24 Nov 2021 08:22:06 -0800 (PST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id lp12sm210276pjb.24.2021.11.24.08.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:22:06 -0800 (PST)
Received: by mail-pf1-f173.google.com with SMTP id 8so3151883pfo.4;
        Wed, 24 Nov 2021 08:22:05 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr24702645vsl.35.1637770914816;
 Wed, 24 Nov 2021 08:21:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637691240.git.hns@goldelico.com> <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net> <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
In-Reply-To: <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 17:21:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
Message-ID: <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
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

On Wed, Nov 24, 2021 at 5:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > Am 23.11.2021 um 21:10 schrieb Paul Cercueil <paul@crapouillou.net>:
> > Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
> >> +    assigned-clock-rates = <48000000>, <0>, <54000000>, <0>, <27000000>;
> >> };
> >> &tcu {
> >> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
> >>              bias-disable;
> >>      };
> >> +    pins_hdmi_ddc: hdmi_ddc {
> >> +            function = "hdmi-ddc";
> >> +            groups = "hdmi-ddc";
> >> +            bias-disable;
> >> +    };
> >> +
> >> +    /* switch to PF25 as gpio driving DDC_SDA low */
> >> +    pins_hdmi_ddc_unwedge: hdmi_ddc {
> >> +            function = "hdmi-ddc";
> >> +            groups = "hdmi-ddc";
> >> +            bias-disable;
> >> +    };
> >
> > Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You could just use the former and pass it to both pinctrl-0 and pinctrl-1.
>
> This was forgotten to remove. We do not make use of the unwedge feature because I could not find out how to use pinctrl to switch this to gpio25 and drive it low.

Using gpio-hog?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
