Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFEF3DE0CF
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 22:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhHBUkP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Aug 2021 16:40:15 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:34627 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhHBUkO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Aug 2021 16:40:14 -0400
Received: by mail-io1-f54.google.com with SMTP id y200so21824565iof.1;
        Mon, 02 Aug 2021 13:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nj6Jm9N6SVUKBd/sjnVXi/8OfxWj3GFkWTh+O+RuLAg=;
        b=YJI0eENtXWG+wL0zYzxja5CumtdBnmGYrpcOzj6K9EGcxZew47bTQ6bX9ZDZnqR191
         ZR188rhMTxvCJMX52AVl4SMfcpY5QfsMmlFWsseR/Ica7xopMl99F9UMn9WiFDMOB+E5
         vHr93jmeIQQfiyUcjuH9hF+Mzqv7nmEYkD8TNqXOUj0Ut/4LTTd6LyQgWbeygYOzgNnF
         TBIG0vxkClatbmvlehu0f9Xsw5ugIhLax69p9MVGyLFzNcVwq3QqXrs8/YUttFCXuIoF
         fzBN1zzBaAY3zfLXqXnr+d3XC4A/pytOOKRwtByaVzq3Qh/4TxR6hnjn466AA+wPhPEm
         Ic1A==
X-Gm-Message-State: AOAM532y4F8uA6O3KZsgN+l72Usa73oZquGZhtv9UVILu2Dw4nHrSAie
        6QQtoBuUgA/rnpl4at/ExQ==
X-Google-Smtp-Source: ABdhPJzwH2S9/6SqsfceWmX4rU5weXCh/Hzp9snIS7UOKcPEZKfbTY53XDUZfTp2RMOz+N4Tqnys9w==
X-Received: by 2002:a6b:e504:: with SMTP id y4mr92403ioc.102.1627936804271;
        Mon, 02 Aug 2021 13:40:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h15sm5938116ils.46.2021.08.02.13.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:40:03 -0700 (PDT)
Received: (nullmailer pid 1569217 invoked by uid 1000);
        Mon, 02 Aug 2021 20:40:01 -0000
Date:   Mon, 2 Aug 2021 14:40:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Behun <marek.behun@nic.cz>, devicetree@vger.kernel.org,
        Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v4 02/19] dt-bindings: auxdisplay: ht16k33: Document
 Adafruit segment displays
Message-ID: <YQhYIZTlQ/LhjHht@robh.at.kernel.org>
References: <20210727140459.3767788-1-geert@linux-m68k.org>
 <20210727140459.3767788-3-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727140459.3767788-3-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 27 Jul 2021 16:04:42 +0200, Geert Uytterhoeven wrote:
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> 
> Document compatible values for the Adafruit 7-segment[1] and
> 14-segment[2] FeatherWing expansion boards with red displays.  According
> to the schematics, all other Adafruit 7-segment and 14-segment display
> backpack and FeatherWing expansion boards (including bare boards and
> boards fitted with displays) are compatible with these two boards.
> 
> [1] https://www.adafruit.com/product/3108
> [2] https://www.adafruit.com/product/3130
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v4:
>   - Combine compatible values for 7/14 segment displays into an enum,
> 
> v3:
>   - Drop color property,
> 
> v2:
>   - Fix type of color to uint32,
>   - "refresh-rate-hz" is still required for dot-matrix displays.
> 
> Alternatives I considered:
>   1. Document the attached display type in a child node.
>      I.e. specify segment type, number of characters, and wiring.
>      Especially the latter would become really complex, due to the sheer
>      amount of possible wiring combinations.
>      Using this method, you also loose the ability to just connect a
>      display to an i2c bus, and instantiate the device from sysfs,
>      without using DT:
> 
> 	echo adafruit,3130 0x70 > /sys/class/i2c/i2c-adapter/.../new_device
> 
>   2. Document all Adafruit 7-segment and 14-segment display backpack and
>      FeatherWing expansion boards.
>      This would lead to a myriad of compatible values:
> 
>       - items:
> 	  - enum:
> 	      - adafruit,878      # 0.56" 4-Digit 7-Segment Display Backpack (Red)
> 	      - adafruit,879      # 0.56" 4-Digit 7-Segment Display Backpack (Yellow)
> 	      - adafruit,880      # 0.56" 4-Digit 7-Segment Display Backpack (Green)
> 	      - adafruit,881      # 0.56" 4-Digit 7-Segment Display Backpack (Blue)
> 	      - adafruit,1002     # 0.56" 4-Digit 7-Segment Display Backpack (White)
> 	  - const: adafruit,877   # 0.56" 4-Digit 7-Segment Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,1268     # 1.2" 4-Digit 7-Segment Display Backpack (Green)
> 	      - adafruit,1269     # 1.2" 4-Digit 7-Segment Display Backpack (Yellow)
> 	      - adafruit,1270     # 1.2" 4-Digit 7-Segment Display Backpack (Red)
> 	  - const: adafruit,1271  # 1.2" 4-Digit 7-Segment Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,1911     # 0.54" Quad Alphanumeric Display Backpack (Red)
> 	      - adafruit,1912     # 0.54" Quad Alphanumeric Display Backpack (Blue)
> 	      - adafruit,2157     # 0.54" Quad Alphanumeric Display Backpack (White)
> 	      - adafruit,2158     # 0.54" Quad Alphanumeric Display Backpack (Yellow)
> 	      - adafruit,2159     # 0.54" Quad Alphanumeric Display Backpack (Yellow-Green)
> 	      - adafruit,2160     # 0.54" Quad Alphanumeric Display Backpack (Green)
> 	  - const: adafruit,1910  # 0.54" Quad 14-segment Alphanumeric Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,3106     # 0.56" 4-Digit 7-Segment FeatherWing Display (Blue)
> 	      - adafruit,3107     # 0.56" 4-Digit 7-Segment FeatherWing Display (Green)
> 	      - adafruit,3108     # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
> 	      - adafruit,3109     # 0.56" 4-Digit 7-Segment FeatherWing Display (White)
> 	      - adafruit,3110     # 0.56" 4-Digit 7-Segment FeatherWing Display (Yellow)
> 	  - const: adafruit,3088  # 0.56" 4-Digit 7-Segment FeatherWing
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,3127     # 0.54" Quad Alphanumeric FeatherWing Display (White)
> 	      - adafruit,3128     # 0.54" Quad Alphanumeric FeatherWing Display (Blue)
> 	      - adafruit,3129     # 0.54" Quad Alphanumeric FeatherWing Display (Green)
> 	      - adafruit,3130     # 0.54" Quad Alphanumeric FeatherWing Display (Red)
> 	      - adafruit,3131     # 0.54" Quad Alphanumeric FeatherWing Display (Yellow)
> 	      - adafruit,3132     # 0.54" Quad Alphanumeric FeatherWing Display (Yellow-Green)
> 	  - const: adafruit,3089  # 0.54" Quad 14-segment Alphanumeric FeatherWing
> 	  - const: holtek,ht16k33
> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml   | 20 ++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
