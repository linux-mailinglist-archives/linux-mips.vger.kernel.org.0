Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4841A50D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbhI1CDf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:03:35 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:44699 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238559AbhI1CDf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:03:35 -0400
Received: by mail-ot1-f46.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso26986555otb.11;
        Mon, 27 Sep 2021 19:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J3oyr8Rc1kp36TSH+0CGDcud7uqcMHUrHD4DOkGCZTc=;
        b=F2bBF3kM/ClPHsQ5nEhwvh7+CuicHY9Grss21Kwq7oCYRqwJa1aEEO3d6iQyi/R0Y+
         2pyDA0ImPsyjWLgvF/qkr7T8hAkWRrLQaJgLDlNwaxYfx4qelj7pJdyQ43uv1P+9iPVr
         QAUcZ+OpgTWG5zQMNDXtMdlR32+KQEmcsG7NzdzimAx6oqwb6VDSY4AmhbkKuUtVzIYO
         puJ4MFJ6HqHYMHlPDlUbL3X0rAXTHU64Dpqt80B1A6o8i0xYrk8uUOMQMAJP/ESYUluh
         kJrD+UbiuB1fvq+IO2Tj1e+gkNM5v1b9G4UPbZy4J70wLbeP916591RLQW231c+ciq+e
         /5Aw==
X-Gm-Message-State: AOAM532pdyhb+g8AjkkfSbi407xZc29wCudKzqjHw9+TgyYBF90GN7jH
        EDOTBeik3GU5ZDzb7tuacQ==
X-Google-Smtp-Source: ABdhPJxmofC2Pg+ifvC8EinsHpDoNqFoCiNiA1LchXO444Z1BqdHhhC6xPxR6t6jiRY0TbLveoQuhw==
X-Received: by 2002:a05:6830:3190:: with SMTP id p16mr2821543ots.85.1632794516215;
        Mon, 27 Sep 2021 19:01:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f3sm4232725oij.6.2021.09.27.19.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:01:55 -0700 (PDT)
Received: (nullmailer pid 84275 invoked by uid 1000);
        Tue, 28 Sep 2021 02:01:54 -0000
Date:   Mon, 27 Sep 2021 21:01:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     dri-devel@lists.freedesktop.org, Kees Cook <keescook@chromium.org>,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        letux-kernel@openphoenux.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Paul Boddie <paul@boddie.org.uk>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 03/10] dt-bindings: display: Add
 ingenic,jz4780-dw-hdmi DT Schema
Message-ID: <YVJ3khibGMFSdpN5@robh.at.kernel.org>
References: <cover.1632761067.git.hns@goldelico.com>
 <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 27 Sep 2021 18:44:21 +0200, H. Nikolaus Schaller wrote:
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
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:45:16: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 45, column 16
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 45, column 16
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533471

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
