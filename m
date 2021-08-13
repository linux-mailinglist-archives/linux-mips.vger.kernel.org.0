Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328793EBD94
	for <lists+linux-mips@lfdr.de>; Fri, 13 Aug 2021 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhHMUr1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Aug 2021 16:47:27 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:41814 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbhHMUr0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Aug 2021 16:47:26 -0400
Received: by mail-oo1-f43.google.com with SMTP id f33-20020a4a89240000b029027c19426fbeso3161500ooi.8;
        Fri, 13 Aug 2021 13:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B9ZjlpepAqxi24gGPGuLYAWFUHictoqyOAnCw/D5l9g=;
        b=QpwNu4e6D2cNs+3mLGCKXznmv8+FbxZAyfBH0c4SzpwvsJFyzFoHy4gPqlo2xD458h
         6Py7ltFnOq3VkGjeRwPsTWod3DRmBtkT3W4fuch9nA8L1Hqow/OPz0DO3aqo87ih3AfT
         t6sB+TPGD4WI3syb8XGAu4yLJpqcWouQpgGxwrMCUMDSgajvdRk1CLW/MEKGvblgClRT
         BknyZV93FvVRF/5kQOGTMLPquDFOp7u1Q16f8keevRa4dk0ZGiqreVbop2XVEW3eZdkN
         i3OPmmo/obYcLnL0s3Lb1aVhJr5EJEQ4F0+MOrjLNYyhPUA3u6u6Wh2EkdmrVo3NGaof
         veMg==
X-Gm-Message-State: AOAM533zQ2my4C8oOOUMCg8eSHX19l0crYzXb3CEMUmT0FqQy3TJSIJw
        ZdLUGd1nllzfh+HHIZHAVA==
X-Google-Smtp-Source: ABdhPJy1Argzkclr6/MKlttJ/MCqekQRM+vtI1gkxyy0UK2CnCCMm06YDilB7oYoIPeq39W29GuJ8w==
X-Received: by 2002:a4a:e291:: with SMTP id k17mr3184266oot.91.1628887614278;
        Fri, 13 Aug 2021 13:46:54 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com. [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
        by smtp.gmail.com with ESMTPSA id x13sm357809otk.42.2021.08.13.13.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:46:53 -0700 (PDT)
Received: (nullmailer pid 4001992 invoked by uid 1000);
        Fri, 13 Aug 2021 20:46:51 -0000
Date:   Fri, 13 Aug 2021 15:46:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/9] dt-bindings: display: Add ingenic-jz4780-hdmi DT
 Schema
Message-ID: <YRbaO++oZiKaFDoN@robh.at.kernel.org>
References: <cover.1628399442.git.hns@goldelico.com>
 <606e22c2ef4d32d63937976860fb24f4cb39b720.1628399442.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <606e22c2ef4d32d63937976860fb24f4cb39b720.1628399442.git.hns@goldelico.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 08, 2021 at 07:10:39AM +0200, H. Nikolaus Schaller wrote:
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
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> new file mode 100644
> index 0000000000000..a545ff8704ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#

This isn't a panel...

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-hdmi
> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers

Drop. Don't need generic descriptions. Plus, this isn't an LCD 
controller.

> +
> +  reg-io-width:
> +    const: 4
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent

Drop. Don't need generic descriptions.

> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for isrf and iahb clocks
> +
> +  clock-names:
> +    items:
> +      - const: isfr
> +      - const: iahb
> +
> +  ddc-i2c-bus: true

This belongs in a connector or panel node.

> +  ports: true

You have to define what each 'port' node is and reference the graph 
schema. Given you are using 'ports', I assume there is more than 1. The 
example says not, but you need to add an output port for a connector 
node.

> +
> +required:
> +    - compatible
> +    - clocks
> +    - clock-names
> +    - ports
> +    - reg-io-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    hdmi: hdmi@10180000 {
> +        compatible = "ingenic,jz4780-hdmi";
> +        reg = <0x10180000 0x8000>;
> +        reg-io-width = <4>;
> +        ddc-i2c-bus = <&i2c4>;
> +        interrupt-parent = <&intc>;
> +        interrupts = <3>;
> +        clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +        clock-names = "isfr", "iahb";
> +
> +        ports {
> +            hdmi_in: port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                hdmi_in_lcd: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&jz4780_out_hdmi>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.31.1
> 
> 
