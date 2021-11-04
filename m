Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E5B4456F1
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 17:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbhKDQPd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Nov 2021 12:15:33 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39738 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbhKDQPc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Nov 2021 12:15:32 -0400
Received: by mail-oi1-f181.google.com with SMTP id x70so10040161oix.6;
        Thu, 04 Nov 2021 09:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=UeMVzJFBRMDuHuyk4xJTPbqY0XA7MlCtz6iKZ644t3I=;
        b=dRgYhpzxcasrwvMdqD+FC3a35Z2TvGjXRh1/q5Ea6Nut1P9b2uNYMSxaUCI+nQsp9z
         mHDLOcDMYC8+RXKMDPxJi2HAVFuE3h88YS9Ap/XSiWNfk0RpfwY0iQCe9KcxeFkcb7TO
         wYIcuoQMOqYhGmbFrYS9pbU2/8Cod2elJvg1r27k0DDV9PVhlwqVyzht4CdTvDTXpyTs
         zXvR4A0dVA6t91cg7gr1T5bDVdSPYLcmscLB0TeXuukqhcyR/MZzO3J3kkYFx4DZkfKe
         +2SSoC3rjFJRr62EzDzoJ01IqO7D11Lm0R/UBqO9ApC+RbEn5gbbEfqDDjLPgFNrzG00
         88/A==
X-Gm-Message-State: AOAM532B/2tyWGlvFk47On2IbkS8SVJtoKad1mStA4B2KxPcMleJu9Kt
        p00vYY+rysj9vXFEAfYkKQ==
X-Google-Smtp-Source: ABdhPJw5AuVRb3oHz5X0o1pLMPybA3YWnkzonaqxB1cnK+PjNMSY37icTxwEV/UdsnzY++Pnj5jiRA==
X-Received: by 2002:aca:3e86:: with SMTP id l128mr17354384oia.120.1636042373935;
        Thu, 04 Nov 2021 09:12:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i20sm1506892otp.18.2021.11.04.09.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 09:12:53 -0700 (PDT)
Received: (nullmailer pid 3458344 invoked by uid 1000);
        Thu, 04 Nov 2021 16:12:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-mips@vger.kernel.org,
        Justin Chen <justinpopo6@gmail.com>,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211103231327.385186-2-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com> <20211103231327.385186-2-f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Thu, 04 Nov 2021 11:12:52 -0500
Message-Id: <1636042372.230001.3458343.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 03 Nov 2021 16:13:21 -0700, Florian Fainelli wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ---------
>  .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1550624

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

