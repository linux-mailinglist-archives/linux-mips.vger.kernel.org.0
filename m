Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E263440EC0
	for <lists+linux-mips@lfdr.de>; Sun, 31 Oct 2021 15:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhJaOSh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Oct 2021 10:18:37 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:39650 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhJaOSg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 31 Oct 2021 10:18:36 -0400
Received: by mail-oi1-f180.google.com with SMTP id n11so13027298oig.6;
        Sun, 31 Oct 2021 07:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xC+QLTIobuHa0Z6oCpAsqleWAEnn6kGUDyvkKP96ljo=;
        b=QT8AUMPSTi/P7BL/8wU/rIAZNARhRYDx0dPdVHEDtNunXmPxfj3n9SpBC4cSq7Ukrz
         Lzjqss3kcroCEWjFR1uA5WBgeicl327D88rfZ4vRfhZ/yYThUHH46F/bpvCaMzTjAJqm
         yanZmklbHMp3cyYA2ag+DhbErH8e/AEAup+Tk048zOn/O8MezTiSFqAuSp2/sMp7bMNj
         wf6eYU4wp6qztnjLJcnaZM+qw+MblutJLUNVypgDzNMl0OW/7VNYcvoVGnegDZeR1LNY
         8a5HNbpoIKSXVyDx/3jCrxIRDAWT16kzPS6hoQ32KTXTFLfZEQJJtMR9w8y1pPytrdga
         C0ug==
X-Gm-Message-State: AOAM533PDxGzJoZ8iF5qthNBuENHw5iMA0vWOxrPGgNd71/l0uvTKje0
        JiZ4QynRKjwa8guKkO3EeA==
X-Google-Smtp-Source: ABdhPJzefT/prrdJgYTE9ha1AUY+mLo2O1FCTNvTIM/vM02p0FQa4ro2FSPdNyMBSbCws/igy2KEsg==
X-Received: by 2002:a05:6808:1187:: with SMTP id j7mr16179962oil.135.1635689764746;
        Sun, 31 Oct 2021 07:16:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l12sm3432395otf.22.2021.10.31.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 07:16:03 -0700 (PDT)
Received: (nullmailer pid 2444173 invoked by uid 1000);
        Sun, 31 Oct 2021 14:16:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Lee Jones <lee.jones@linaro.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211029202505.7106-1-zajec5@gmail.com>
References: <20211029202505.7106-1-zajec5@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Sun, 31 Oct 2021 09:16:02 -0500
Message-Id: <1635689762.721738.2444172.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 29 Oct 2021 22:25:04 +0200, Rafał Miłecki wrote:
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

See https://patchwork.ozlabs.org/patch/1548262

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

