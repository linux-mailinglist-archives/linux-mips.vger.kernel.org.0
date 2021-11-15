Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474F244FCE4
	for <lists+linux-mips@lfdr.de>; Mon, 15 Nov 2021 03:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbhKOCNa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Nov 2021 21:13:30 -0500
Received: from mail-oo1-f45.google.com ([209.85.161.45]:44648 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbhKOCN3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Nov 2021 21:13:29 -0500
Received: by mail-oo1-f45.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so1081941ooh.11;
        Sun, 14 Nov 2021 18:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=EcWazStHMBzkeUqUKg871NcAh5km8nD2bxzBNAKhSts=;
        b=sjEr3aPBiEvX5PP+vKYRuTZ2OcFTeZazHUHB/o3jmv3xIBJ0zTsbIZWRWbg9DnvgXr
         NzhDuvQ2KWCkGqYXd99Ssyw6fqEIJNDMMgNgCGFdj/VxUH1j5DPTIFRl5tPytEpGr4xo
         poYyClwpDlqxz3Hq/G3OEwfJqyPZ6l/JhnuaeuOXJ1xWIkghA6eRVDs/tNJTKtsjWncZ
         RFcC4VJKQN8hnCrHcgx86SajoVSOW6GhJ2BJEyr+HEBerj3MgEMdgRA4fSkVt9ErCZmW
         Zk7HbvKXvU6hgQ9DiMScfJlKmDNX35tfan9wfTeolGU/YS9ci3YyCCXQup4SAnp13/kd
         yYwg==
X-Gm-Message-State: AOAM530RqRxEQk2xYpShYk2MDHo18tVAaatn3sQ8x2KQBV2NaYKDG/jr
        2vDreYTpyOnSEBVyHrRZYk+eBXnYXw==
X-Google-Smtp-Source: ABdhPJyQC8PXrpS/2xNBLC9mcCg4j3oZwxmowhchO5VctfLmSSbKl9dqq5AzmhwQB31Tgnq9HhS7Gw==
X-Received: by 2002:a4a:da1a:: with SMTP id e26mr3719912oou.79.1636942234563;
        Sun, 14 Nov 2021 18:10:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l2sm2731307otl.61.2021.11.14.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 18:10:34 -0800 (PST)
Received: (nullmailer pid 3712867 invoked by uid 1000);
        Mon, 15 Nov 2021 02:10:32 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Justin Chen <justinpopo6@gmail.com>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20211113114645.27360-2-zajec5@gmail.com>
References: <20211113114645.27360-1-zajec5@gmail.com> <20211113114645.27360-2-zajec5@gmail.com>
Subject: Re: [PATCH V4 2/2] dt-bindings: mfd: add Broadcom's Timer-Watchdog block
Date:   Sun, 14 Nov 2021 20:10:32 -0600
Message-Id: <1636942232.944025.3712866.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 13 Nov 2021 12:46:45 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a block implementing few time related functions depending on a
> (SoC specific) variant. At this point there is ready binding for a
> watchdog only. Work on remaining subblocks (e.g. "reg" based reboot) is
> in progress.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Update $id, description, compatible, example & commit message
> V3: Drop "brcm,twd" from compatible list per Rob's review
> ---
>  .../devicetree/bindings/mfd/brcm,twd.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/watchdog/brcm,bcm7038-wdt.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/mfd/brcm,twd.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/watchdog/brcm,bcm7038-wdt.yaml'
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/mfd/brcm,twd.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554679

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

