Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61CF4565D4
	for <lists+linux-mips@lfdr.de>; Thu, 18 Nov 2021 23:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhKRWsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Nov 2021 17:48:16 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35610 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbhKRWsP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Nov 2021 17:48:15 -0500
Received: by mail-oi1-f181.google.com with SMTP id m6so17679317oim.2;
        Thu, 18 Nov 2021 14:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H1SS+0H0PjpsXS0zy4N6RiTgJsErytrpSg6Bdnmca1Q=;
        b=08gfUFT0tFkqq12uOi8PuCQfSn5ijIXcL8SaPFyVkD1GJSMKzk7w76Vt/3UktwgEXg
         XwS7+ZUKIWTZzdhyrigEdYoDQaTSYhvoMBSYI0I1mh/b+IQYMZ1YgDLzbyu+eIZm2P0e
         sW8FE0Fp6BYIMBvgme/T/Ae07eTj6kzpYHdk8IdwoT2Ig47N8E5/rna06WLUxrBLLkci
         SdkiYKeBizNzpzmsUEvF4iUwFltRdIzLqTZJlWuc00zQKfRja+0WH3VxoGwQ9A1yOdNE
         Ki870uJ4uuY0ORWBH9tMlWX1kGjuow5BVzkgvW8qh6qwGMqWPL4gIRvJ2WH67tBt39Ar
         HYYA==
X-Gm-Message-State: AOAM531tjkhh0b3L106mGL8X1pXxKZsQqVsDWhSEcTbttH3XUU8D9Vca
        Hsyn1EjTW9niD+HFnwmQNw==
X-Google-Smtp-Source: ABdhPJyTk374MO6gTLPWQfR9cC01JJ7y0X11rCSopQI0oasLMzQHD9V7PyGo+b/QWKjBFj+6sdRs6g==
X-Received: by 2002:a05:6808:1644:: with SMTP id az4mr569659oib.86.1637275514743;
        Thu, 18 Nov 2021 14:45:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u40sm322644oiw.56.2021.11.18.14.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:45:13 -0800 (PST)
Received: (nullmailer pid 1899744 invoked by uid 1000);
        Thu, 18 Nov 2021 22:45:12 -0000
Date:   Thu, 18 Nov 2021 16:45:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Lee Jones <lee.jones@linaro.org>,
        linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V4 RESEND 2/2] dt-bindings: mfd: add Broadcom's
 Timer-Watchdog block
Message-ID: <YZbXePINGyUMGEaD@robh.at.kernel.org>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <20211115055354.6089-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115055354.6089-2-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 15 Nov 2021 06:53:54 +0100, Rafał Miłecki wrote:
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
> RESEND: Patchwork lost 1/2, marc.info lost 2/2
> ---
>  .../devicetree/bindings/mfd/brcm,twd.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
