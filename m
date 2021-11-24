Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E334645B256
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 03:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbhKXDCf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 22:02:35 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:34408 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240073AbhKXDCe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 22:02:34 -0500
Received: by mail-il1-f172.google.com with SMTP id i9so1105210ilu.1;
        Tue, 23 Nov 2021 18:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+gtitLZL9HaFjBnuPU8p8wXrV+klALlrvYaIvtVGr1Y=;
        b=cYDJL8G38so23QzibdEquW3xzB3iVnK4+6kTDlhC2TaGwUdbgVPRbPIFEYZ6LVAAwp
         MuYcnKJU2ZYUTDAYJecAeFhfu929G3+vQ0RjYVYHRR1HJ4U5Bu1+qttAcrS4U0+ShXhZ
         89UW7l7wAQVBbG6dR3OEdUnRt0Ig4yaT5P55TVkSvQjqkzR1hf/vFlkQ62nChsIjWSG/
         j+2+ymzB8wN1cdoELyVGJRDLB6HyhrSLAf/GMfcJ2uvsRmML3F2NNB97+xE2U6o5EMzI
         it1s6PyZR8eaQFuon6RT3A1YeqtiIxRTkuxrBHi8LDcMqgrddzN16ORvPEAlAUDshse0
         qwuQ==
X-Gm-Message-State: AOAM531S1UjNZuzM0o6SavjuY2cqap92KMW5nx2SQvlJN4Dq4ocRDIHZ
        wQUR3qRUZcQKxlLiFiebhw==
X-Google-Smtp-Source: ABdhPJzWFPJVuLsBwNvWGvgriFboFDA1jNooS4EMQoSZqSMvlnmGGtbVzE1Y5g9KLh7fDXTK9fj/ug==
X-Received: by 2002:a92:d643:: with SMTP id x3mr10412541ilp.107.1637722765084;
        Tue, 23 Nov 2021 18:59:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l9sm8990629ilh.82.2021.11.23.18.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 18:59:24 -0800 (PST)
Received: (nullmailer pid 888169 invoked by uid 1000);
        Wed, 24 Nov 2021 02:59:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-mips@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        letux-kernel@openphoenux.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kees Cook <keescook@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Harry Wentland <harry.wentland@amd.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org
In-Reply-To: <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com> <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
Subject: Re: [PATCH v8 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
Date:   Tue, 23 Nov 2021 19:59:21 -0700
Message-Id: <1637722761.010276.888168.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Nov 2021 19:13:56 +0100, H. Nikolaus Schaller wrote:
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
./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml:36:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml: 'unevaluatedPropertes' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: A schema with a "$ref" to another schema either can define all properties used and use "additionalProperties" or can use "unevaluatedProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dts:19:18: fatal error: dt-bindings/clock/jz4780-cgu.h: No such file or directory
   19 |         #include <dt-bindings/clock/jz4780-cgu.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558736

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

