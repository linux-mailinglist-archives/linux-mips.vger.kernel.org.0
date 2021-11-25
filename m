Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C32545E271
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 22:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245216AbhKYVba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 16:31:30 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:33636 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239140AbhKYV33 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Nov 2021 16:29:29 -0500
Received: by mail-oi1-f174.google.com with SMTP id q25so15040301oiw.0;
        Thu, 25 Nov 2021 13:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ATQGc9kY+JyWouwzNMT+5eMUiqUTPfsc2py8BE07UUU=;
        b=VmA0E8Q6aYSEoMl42Szarzh8brIt4SGgMMcFZHUE93NyO9fUcJc96+i3PiAytaJidB
         85QsXrkTuc+J6r1ONAkAbgRfr+YPAMENnagI0Oz1/ILdy00ez6PBmT2w0nD2dnVwWZDF
         mvSBQtYWAhErlF5OmyObR7+nd209JsfaiF05Y6zwLjA1HZe9zNhyKiG0XEgwofN5vslR
         Zm44PHq9NCtExA25pmWNDge4FZ7if7OOdTmEpssPrQiDls1Xz7C6m8o/y7pWTdG+4vfs
         +2yiGKN74e8oIKY3LEKGynGPIYX7JzTYzhdh7t+YqbjO/FAVcJnSEfAIRru2AFudtqJ1
         iKrQ==
X-Gm-Message-State: AOAM5304DY9im8G/sQeuY2dW3CpRq/RjuCowH7lw7RKO/IvChcP8BadM
        xFtPS7LtMGJGeJx62nHx7A==
X-Google-Smtp-Source: ABdhPJzoE1mjv1m+nj0OMQrJ0pG7JCaWF1N2WspnzxdZpkiI3QMzNDqnQA1Na6SgHhWlX8psmy9F2w==
X-Received: by 2002:a05:6808:f8e:: with SMTP id o14mr18906207oiw.33.1637875576978;
        Thu, 25 Nov 2021 13:26:16 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s26sm931393oiw.19.2021.11.25.13.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:26:15 -0800 (PST)
Received: (nullmailer pid 2858309 invoked by uid 1000);
        Thu, 25 Nov 2021 21:26:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Kees Cook <keescook@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Brown <broonie@kernel.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
References: <cover.1637789354.git.hns@goldelico.com> <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
Subject: Re: [PATCH v9 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
Date:   Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.255498.2858308.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 24 Nov 2021 22:29:09 +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 +++++++++++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1559375

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

