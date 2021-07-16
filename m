Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71C33CBC6C
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jul 2021 21:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhGPT1u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jul 2021 15:27:50 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:46848 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhGPT1u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Jul 2021 15:27:50 -0400
Received: by mail-il1-f176.google.com with SMTP id y6so9261610ilj.13;
        Fri, 16 Jul 2021 12:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fM1A08CWgTV1bBfD5qE67VlFwSFQpiAw2opTe5zweRQ=;
        b=kH2stglUMG0ubXImNfZrBAQhlNVne0/NUu9pf7J6bje3hmizpklImeEF1yCNUSr7XI
         wqJ/O0IHyJ68PZ9Xx7BLDJs7zxlkJurqPrv1RPQWeJEqx6FMv/MGR/XiT1ZbHZV06cvX
         BGhm9bT6Jv1YP1vA7orJ/2g1lcIta4qfMTR0FJ10FsY/FRIt/d307LPdbMOGZK6E8+tI
         QQPPzJTsoxgnxhdlUnWdY91I2U6eitVY64acivkzfcHbfJEiPCQT9bdG9qk510Z6oqWL
         /8jP3y/4ncesowqLpHgNU5a01zAuQOVIqCqU1crC5Biqzt1TmWcQPvJBPRmZHIG3GKuo
         fupw==
X-Gm-Message-State: AOAM533jHYhzw3tIfA7frJCWIfNQXtFIY1Z2B96pzTWvtUZKt5uwJVry
        /hPB6vNeO3z96e/j6KbMkA==
X-Google-Smtp-Source: ABdhPJzJsHWjmOLw//W3RlaIHVWLgA05B7QlnJgNCmRGCRL8qwvXsBAroLMQ1HnLflSk2Jiu4STpkg==
X-Received: by 2002:a92:de0a:: with SMTP id x10mr7526223ilm.215.1626463493993;
        Fri, 16 Jul 2021 12:24:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a9sm807689ila.23.2021.07.16.12.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:24:53 -0700 (PDT)
Received: (nullmailer pid 3838811 invoked by uid 1000);
        Fri, 16 Jul 2021 19:24:50 -0000
Date:   Fri, 16 Jul 2021 13:24:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        linux-leds@vger.kernel.org, Marek Behun <marek.behun@nic.cz>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 18/19] dt-bindings: auxdisplay: ht16k33: Document LED
 subnode
Message-ID: <20210716192450.GA3838756@robh.at.kernel.org>
References: <20210714151130.2531831-1-geert@linux-m68k.org>
 <20210714151130.2531831-19-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714151130.2531831-19-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Jul 2021 17:11:29 +0200, Geert Uytterhoeven wrote:
> Extend the Holtek HT16K33 LED controller Device Tree bindings with an
> LED subnode, conforming to the standard LED bindings.
> 
> This allows the user to exert more control, like specifying LED color,
> function, and/or trigger, to extend LED functionality beyond a simple
> display backlight.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v3:
>   - New.
> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml           | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
