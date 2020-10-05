Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCE02836EB
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 15:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgJENvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 09:51:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45874 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgJENvf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 09:51:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id f37so5100671otf.12;
        Mon, 05 Oct 2020 06:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+6o6Nhko1kPIF7bb/D566IYk+rcVxOYL8hgnCF/Sb70=;
        b=DaAkYm0CJSY7TCSDZMLTV4oBOMz7tDNwhndSc62/UDi98M7mza9Sf5eNr+ts8PVGqN
         cfAdnBo6cjTB5LF7N+SBpQs7II8Z1g9TrgnVWKzaIbw6ZOcA6O4ereX99cHvbCwbGPDf
         A1zZnoOMiw3C6z8ejpEvmDsfyW1kr8iNXQ+qTf0sAzZm7UdivxkXMpFO10BynEHVhXX0
         InmcCqOk+D0/V+RceP78ujyTKLVfk1jtWCFGW6EULJ0iOORGWYsCs2q/mq6EDTHUudSd
         sbdSq/uhyJ03xo99pKMCJTmeCRJ09BdcxfE2S7hdD3LwV2HIDUsIBPbFxOFMOHHfLW/n
         RS3w==
X-Gm-Message-State: AOAM532URfwEiDMJxNT1aippfUJjJmGgc8BqQObtn5oO31bxb/VBvdAf
        ZKBcle5o+TFkX3Kl0uLDD79oIPhEjO/h
X-Google-Smtp-Source: ABdhPJzAwIYiizyypF4j0t0rpTJ8sI9zgsna996D0Xvsy6AB7FQrOTjn13rToJHrnoBBPZBd3LbU1Q==
X-Received: by 2002:a9d:71ca:: with SMTP id z10mr11677488otj.307.1601905894166;
        Mon, 05 Oct 2020 06:51:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m22sm2883051otf.52.2020.10.05.06.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:51:33 -0700 (PDT)
Received: (nullmailer pid 82320 invoked by uid 1000);
        Mon, 05 Oct 2020 13:51:32 -0000
Date:   Mon, 5 Oct 2020 08:51:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-stm32@st-md-mailman.stormreply.com,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201005135132.GA81148@bogus>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 01 Oct 2020 01:46:32 +0200, Alexander Dahl wrote:
> The example was adapted in the following ways:
> 
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules
> 
> License was discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
> 
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-pwm.yaml


See https://patchwork.ozlabs.org/patch/1374765

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

