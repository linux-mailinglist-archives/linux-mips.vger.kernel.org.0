Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8BA44D8B1
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 15:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhKKPAV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Nov 2021 10:00:21 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:43860 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhKKPAS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Nov 2021 10:00:18 -0500
Received: by mail-oi1-f173.google.com with SMTP id o4so11993075oia.10;
        Thu, 11 Nov 2021 06:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=qNEjXj/HNgs612CxAaN/7ARospzmOAVl901gKnKjQak=;
        b=agx4kR2N42ii7BrWCYeLhZB/Lc27yIGBhp+LkFP32xzdzlCwNzuAjsFTd6IMVNikVP
         PVreo8LU/0QkIZeI743xIg6B9V2q3uwnH8P1duwhmmX5ljwZeTA+meLMmlDoo1FS37tX
         GAqkpOPPumzmYzVRy7898E0xxxsopmcnd35pFxjp0qh35dFRNNmCSr5V3dbmEZ09uKcN
         cM2bXjm28orj+x+xJMpVa0jfbMVamja5TUv+OPzQXjV3415pMh2jgwJp03AOvYRWX5Rr
         2d8Y6FdDeFRNa1XwIkPh9Duc2ygWWHQrpF8dq/p6OLpUCdW/Nlu+AsyYoFApkKBDExGl
         SDsA==
X-Gm-Message-State: AOAM5312JPnPyyxHxGqWsj9K9Qx0ep3rPJPYEnsSmWooafVyhDCQZL1t
        UCH++jTjqJwjK0Blg0DxdA==
X-Google-Smtp-Source: ABdhPJwLcneflSvlTMqVQa7wx8N++jT4UqWGoLvdDyD7I/PEJOPtmHneR0Q6RSCyi4LFQ9/yRsBRiw==
X-Received: by 2002:a54:4616:: with SMTP id p22mr19795772oip.96.1636642649070;
        Thu, 11 Nov 2021 06:57:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 187sm680123oig.19.2021.11.11.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 06:57:28 -0800 (PST)
Received: (nullmailer pid 3774080 invoked by uid 1000);
        Thu, 11 Nov 2021 14:57:26 -0000
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        David Airlie <airlied@linux.ie>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        Kees Cook <keescook@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        letux-kernel@openphoenux.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <70f2abb5277369721cb352eb50daa407bee3fd04.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com> <70f2abb5277369721cb352eb50daa407bee3fd04.1636573413.git.hns@goldelico.com>
Subject: Re: [PATCH v6 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
Date:   Thu, 11 Nov 2021 08:57:26 -0600
Message-Id: <1636642646.871896.3774079.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 Nov 2021 20:43:28 +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 76 +++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:36:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dt.yaml: hdmi@10180000: 'clock-names', 'ddc-i2c-bus', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553577

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

