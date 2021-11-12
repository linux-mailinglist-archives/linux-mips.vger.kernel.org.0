Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B599A44EF7E
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbhKLWm4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:42:56 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:42682 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhKLWm4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:42:56 -0500
Received: by mail-oi1-f174.google.com with SMTP id n66so20523300oia.9;
        Fri, 12 Nov 2021 14:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rmJiuQzRIZToiUcWk538cwOKWhZgeykKPg7h49QfG4g=;
        b=dJG9TetyGGjkbHo5Hf5tttseqgeAutds57dnzBONWX9kLWBfaan9ey1cQ4V8h8CEc7
         H6jO/7PUR9Kmx8eComA1hDQ1dVefOwQgG6aAQwErii6QKsk82q2Snu8aMDwAUxRqG1Ff
         WWNDmXeAJIy+BtCvWmKltHl4Kpxd1WTU1MPBmYjEp6BAdhbB9tlUB4FS7ONc1VpWJRNi
         X6JwaHm+xvqhooFAEakKgNUzhkWSFSym0ueXcVinRLD45VPM5lF6XECcwiY/HvV+wD8P
         dqfoaxgzlJJVdmnYqvsfVeEEOe4xczIsqAVt+DKcCO5qeYYtkIG0AXRsbGYcl6zgyxH3
         IKOg==
X-Gm-Message-State: AOAM530LytkGt11IaVZOrX2s6yu06vuyn3YhbVZuj1SiQhbvlt+MDXqn
        PSYZkXNkq98owCsr/aVgow==
X-Google-Smtp-Source: ABdhPJwpm84FTpfx+T10oga3vB5EUU+VsbE/MisRgGb7ls9UxqDJdSfpF5IUssXj+YSvwpazMm666g==
X-Received: by 2002:aca:afc6:: with SMTP id y189mr3999546oie.46.1636756804700;
        Fri, 12 Nov 2021 14:40:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f7sm1320728ooo.38.2021.11.12.14.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:40:04 -0800 (PST)
Received: (nullmailer pid 3506575 invoked by uid 1000);
        Fri, 12 Nov 2021 22:40:03 -0000
Date:   Fri, 12 Nov 2021 16:40:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Justin Chen <justinpopo6@gmail.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: watchdog: Add BCM6345 compatible to
 BCM7038 binding
Message-ID: <YY7tQzQomlq55YDz@robh.at.kernel.org>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
 <20211105154208.614260-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105154208.614260-3-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 05 Nov 2021 08:42:03 -0700, Florian Fainelli wrote:
> The BCM7038 watchdog binding is updated to include a "brcm,bcm6345-wdt"
> compatible string which is the first instance of a DSL (BCM63xx) SoC
> seeing the integration of such a watchdog timer block.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
