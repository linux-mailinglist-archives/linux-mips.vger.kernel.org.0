Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB62A32317B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 20:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhBWTfA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 14:35:00 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:39687 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbhBWTe6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 14:34:58 -0500
Received: by mail-ot1-f46.google.com with SMTP id h22so8466195otr.6;
        Tue, 23 Feb 2021 11:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=T8E7934aIPHB6mtxl6xXtzB4FrnNLcQJIHRrXAiFI0I=;
        b=NEokTrUK5GqVLQzJHC3ZIRsTsdm2+EuujLUnZlrLz4qpugd9JCNH+f5+wW4+9r0XP+
         G00jFx3CiqOQodVOR2TRVI6xq3jfRg6aig+phXm0azwQfRS4znTW7m3OsRrWDBGroxmp
         86+Q57Dynn76fetNz2pYWBlhZfvs180BInUhrZim8WWx3u9gt3/czG7mdZy92quIFGXL
         KowzVmJ/ORV4qk7jVIaupEa2uWn8sNh+WkpeZe1XUGW92FtWRVZMU2Yf32eZqwbaZMZw
         z86Cc9Eed5k+TxSMdtlDs+HF80mvmgnebBj0+/MbAP7xNaydnNeQzTfig2kOTmTMZnK9
         3LSw==
X-Gm-Message-State: AOAM5328AL3UbGAgJb3K80xcVymMv/wf/qPo7zBiAbaAO9SkI60awQi1
        77IrniJM6xIiz4ZWXEIQvrKwHouJ1A==
X-Google-Smtp-Source: ABdhPJyykKxgNSiM9MYHc77xPLzAhw2bKZ5r1F5zv+PuiZsNRrVqKXkRizpkg0vvdsajYEIH+Vb/wQ==
X-Received: by 2002:a05:6830:2390:: with SMTP id l16mr11741286ots.43.1614108857104;
        Tue, 23 Feb 2021 11:34:17 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m11sm4509766oih.34.2021.02.23.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 11:34:16 -0800 (PST)
Received: (nullmailer pid 4116109 invoked by uid 1000);
        Tue, 23 Feb 2021 19:34:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org
In-Reply-To: <20210223180840.28771-2-noltari@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com> <20210223180840.28771-2-noltari@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: document BCM6345 external interrupt controller
Date:   Tue, 23 Feb 2021 13:34:10 -0600
Message-Id: <1614108850.569087.4116108.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Feb 2021 19:08:39 +0100, Álvaro Fernández Rojas wrote:
> Document the binding for the BCM6345 external interrupt controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../brcm,bcm6345-ext-intc.yaml                | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml: properties:interrupt-parent: False schema does not allow {'description': 'Specifies the phandle to the parent interrupt controller this one is cascaded from.'}
./Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/interrupt-controller/brcm,bcm6345-ext-intc.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml: ignoring, error in schema: properties: interrupt-parent
warning: no schema found in file: ./Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml

See https://patchwork.ozlabs.org/patch/1443597

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

