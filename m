Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EFE44E929
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 15:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhKLOup (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 09:50:45 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40606 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbhKLOuo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 09:50:44 -0500
Received: by mail-ot1-f54.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so6188430otj.7;
        Fri, 12 Nov 2021 06:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MqpVUsLYNqsJjO4ImeTejjx8SUZnfDjbhJPSiiUyJOQ=;
        b=A1p7E+UYgvNA54JZTL1hP/+5/+sFOb/b2Fk0QJ/RLnZzUU0iWjaEZU56xUIOP4BVUX
         XUx1NKwBk3bN45K7/NRWrD4V5Eidlr14V/RrKdWsa0ReBYJPO+oShdGZYzX4beeO4fvI
         Kje0iB5JKToZBtuYnjVZ5qYRB0VhbA3lv+DVDb0KxInI1g4gxSTaY7GJFO5qr9cRB/Hw
         Tb9shpKUAKKq4pG/WrUzQFQZ1uttrS0SNKv1fY+M8pe7Ika9U//D7rmg5QSojxftLwOg
         dgMKSF07HFmWSlHodjeC9oi9K40VNZmsgseQtmKWDkGdey7FlzwN4IIpaYzoarCH/ZNo
         mPUg==
X-Gm-Message-State: AOAM530EBSYF6+HZUMEYAkAoGg+hRv1nySj2zKVKjAtOQLmtz/NA2gRZ
        uy/7qQGYk9Ldwi67b6NPTA==
X-Google-Smtp-Source: ABdhPJzDQAhXlkjwRvi5urW+7d003gcUAFjnSG2AHX4B3iXy467gNUrRe93n1Idba1w8d58aLwaeMw==
X-Received: by 2002:a9d:326:: with SMTP id 35mr11139198otv.41.1636728473571;
        Fri, 12 Nov 2021 06:47:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g26sm1280650ots.25.2021.11.12.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:47:52 -0800 (PST)
Received: (nullmailer pid 2736205 invoked by uid 1000);
        Fri, 12 Nov 2021 14:47:46 -0000
Date:   Fri, 12 Nov 2021 08:47:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        David Airlie <airlied@linux.ie>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v6 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
Message-ID: <YY5+kgNRlKHIGPlO@robh.at.kernel.org>
References: <cover.1636573413.git.hns@goldelico.com>
 <70f2abb5277369721cb352eb50daa407bee3fd04.1636573413.git.hns@goldelico.com>
 <1636642646.871896.3774079.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636642646.871896.3774079.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 11, 2021 at 08:57:26AM -0600, Rob Herring wrote:
> On Wed, 10 Nov 2021 20:43:28 +0100, H. Nikolaus Schaller wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> > Based on .txt binding from Zubair Lutfullah Kakakhel
> > 
> > We also add add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
> >  .../bindings/display/ingenic-jz4780-hdmi.yaml | 76 +++++++++++++++++++

This goes in display/bridge/. And use compatible string for the file 
name: ingenic,jz4780-hdmi.yaml

> >  2 files changed, 79 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:36:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dt.yaml: hdmi@10180000: 'clock-names', 'ddc-i2c-bus', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

I think you need to use 'unevaluatedPropertes' instead of 
'additionalProperties' if you are getting these properties from 
synopsys,dw-hdmi.yaml.

Rob
