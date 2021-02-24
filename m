Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8427A323637
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 04:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhBXDtp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 22:49:45 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34612 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbhBXDtp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 22:49:45 -0500
Received: by mail-ot1-f50.google.com with SMTP id b16so935469otq.1;
        Tue, 23 Feb 2021 19:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=lyGxkuMalKC+8W+NRLziWQ32HXhA0joAtN9hYUgFY0o=;
        b=ldb0ZIna83ZUfb+BghiS88W11QIGXSmFvVnzJ4GaYLp5KwZS83qAIoZ0laQuoQZ9p/
         hH96aUSGkW/8whGMRGPqIWrHRxRhb3ngxnc9BSapNl8XetXui/ohCeQcRRxzQ75BfOEb
         8XjkD6Z0CJFluppGOOoKyJNJvOI971ncUVmp2k9DGhvjlyElMP5aouXXl5IAFzdHnP4C
         Ei/2O3uMzzzgDbjQczHFQt81jNwEaFor0p62nY1uCXVjgqc5aDH6YiuLMcg6UMFaiNRF
         mUBLBqYuUHPj2K8BULAug2JeKTJOfPJDT8GLB+cRbVWEpwPCWVwEA1kbWXdbpxwNpxAs
         YRzw==
X-Gm-Message-State: AOAM533AvfeQ0OL39JAmvBe+1bYw/qsUkZd/BG1hN5M0FFZ5ABZcahkJ
        EO4icZ6KB1kmi4n1CiYPzg==
X-Google-Smtp-Source: ABdhPJx1Bs/uCnw9Gm0Twl4NIGXf/7qbIVW7DMlwqlLNxJOLmuu1Xc5Jvl6sD2Poc8Oz6j7Ok4cQUg==
X-Received: by 2002:a05:6830:c9:: with SMTP id x9mr4045956oto.295.1614138543925;
        Tue, 23 Feb 2021 19:49:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c204sm173452oib.41.2021.02.23.19.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 19:49:03 -0800 (PST)
Received: (nullmailer pid 735516 invoked by uid 1000);
        Wed, 24 Feb 2021 03:49:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210223204340.312-2-noltari@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com> <20210223204340.312-1-noltari@gmail.com> <20210223204340.312-2-noltari@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: document BCM6345 external interrupt controller
Date:   Tue, 23 Feb 2021 21:49:02 -0600
Message-Id: <1614138542.295948.735514.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Feb 2021 21:43:39 +0100, Álvaro Fernández Rojas wrote:
> Document the binding for the BCM6345 external interrupt controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  v2: fix title typo.
> 
>  .../brcm,bcm6345-ext-intc.yaml                | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml: properties:interrupt-parent: False schema does not allow {'description': 'Specifies the phandle to the parent interrupt controller this one is cascaded from.'}
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml: ignoring, error in schema: properties: interrupt-parent
warning: no schema found in file: ./Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml

See https://patchwork.ozlabs.org/patch/1443622

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

