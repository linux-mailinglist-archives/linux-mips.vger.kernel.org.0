Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1C24233BA
	for <lists+linux-mips@lfdr.de>; Wed,  6 Oct 2021 00:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhJEWrx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Oct 2021 18:47:53 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38541 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhJEWrw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Oct 2021 18:47:52 -0400
Received: by mail-ot1-f47.google.com with SMTP id c6-20020a9d2786000000b005471981d559so813472otb.5;
        Tue, 05 Oct 2021 15:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=7Yvv1Am41pkLFWVRRxtVFFpmmIZ/+MuvB5/QTODKe0c=;
        b=zZRvGmVXqhxnYzC1VlnglVmmpGaduPuNO3MBn8Lu2vSjztnMCMzpqWuvHUFEOJDjT0
         MsBN6NDkzodI5FVjcbcMT2Z9ieP6emQs9Q6v6wbSm5cKtzO8xcAhermkLZ/jJvj1EmXV
         3vrN3NDNo2I/+owL5Ptgstdm/0OyixGn5Gs/tZZC6GnUzLfckjYZQ/VcCeCRzxJ/jxX4
         Ji6+xbxc9TnQElCYr6wLIdLufdH3J2psaBxmVGkkdSZUkH6A1PFey1Dt8t2qTo/71SnN
         TnPV7fcnRYF1SlTcn5JkLT21Isbdk5uh5dq4LyzNwLWNbPVnbSCIhgihXNk9ShjDYz97
         zAxQ==
X-Gm-Message-State: AOAM530seIUqEFOnxrjG1yrD573c4nNtIZ0vXlmZ9plIXEh6DS8lgadV
        YPfMzWBhi/cxCaJpo5H8wA==
X-Google-Smtp-Source: ABdhPJz8rCGrSwA5JycAr4jjywMT6Q9vFnZJCvKui4nCAMdxcCRG96o4SGy+jI6iNtZhTv01VbbH+Q==
X-Received: by 2002:a9d:6d14:: with SMTP id o20mr17177311otp.57.1633473961337;
        Tue, 05 Oct 2021 15:46:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v25sm3684003oov.14.2021.10.05.15.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 15:46:00 -0700 (PDT)
Received: (nullmailer pid 106764 invoked by uid 1000);
        Tue, 05 Oct 2021 22:45:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mark Brown <broonie@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        letux-kernel@openphoenux.org, Rob Herring <robh+dt@kernel.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Kees Cook <keescook@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrzej Hajda <a.hajda@samsung.com>,
        linux-kernel@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>
In-Reply-To: <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com> <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
Date:   Tue, 05 Oct 2021 17:45:59 -0500
Message-Id: <1633473959.306315.106759.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 05 Oct 2021 14:29:15 +0200, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:39:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dt.yaml: hdmi@10180000: 'clock-names', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1536624

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

