Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B5C3C922E
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 22:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhGNUjU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jul 2021 16:39:20 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:38842 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhGNUjU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jul 2021 16:39:20 -0400
Received: by mail-io1-f42.google.com with SMTP id k11so3761527ioa.5;
        Wed, 14 Jul 2021 13:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=prcLTbhG9+GxXbhkc+ztMMo3oN+J9LKObULRlgmqxUs=;
        b=NLWFhzPcuO2KYyb1RF53ex/1N1PKpgj8dzA7prF2tmKiWq2cVDvVHJ/ABCXJeChnM0
         zmB3o67GmfTxROpjIfE78G3Hcrr5TmOc0F2WDjGx/bQ6TW3GOh7y6Q2In/Wlex068nQW
         qGG4p0IcF4rrsNxNjV2Iq3rACbLwdlYs/Rn1nf5IyLLiCOoswVDFWnxkOnTyxl8XAZgg
         TtM12jz7M44igNy64yK4qaPHetOrpNSDo/HP1LN4PTImbyY21pzwzZCAmO3BlGLIPkJh
         YP6t4y+Uq5p3qJ7iW99NPHXenXihPJxgScdVxmAq6CD3g0CFHaQjMjWKg+Oac3tNGE0z
         i9/w==
X-Gm-Message-State: AOAM532FoHQm7eLD930pNSuDzwvdhTilPl5oIkubvY/vZ2obhP3W9Blm
        yg/ZKINqXliz1hsUhI37VQ==
X-Google-Smtp-Source: ABdhPJxWbHkLAryxCX3H7XhouNAbKveduQ7uh5flIR+iN7XndczrcT8vlfa7kfDrmQyngDMZiV2vKg==
X-Received: by 2002:a05:6602:25da:: with SMTP id d26mr3721iop.106.1626294986705;
        Wed, 14 Jul 2021 13:36:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h11sm1918320ilc.1.2021.07.14.13.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:36:26 -0700 (PDT)
Received: (nullmailer pid 3475862 invoked by uid 1000);
        Wed, 14 Jul 2021 20:36:24 -0000
Date:   Wed, 14 Jul 2021 14:36:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] dt-bindings: auxdisplay: ht16k33: Document
 Adafruit segment displays
Message-ID: <20210714203624.GA3466861@robh.at.kernel.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-3-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625125902.1162428-3-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 25, 2021 at 02:58:46PM +0200, Geert Uytterhoeven wrote:
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> 
> Document compatible values for the Adafruit 7-segment[1] and
> 14-segment[2] FeatherWing expansion boards with red displays.  According
> to the schematics, all other Adafruit 7-segment and 14-segment display
> backpack and FeatherWing expansion boards (including bare boards and
> boards fitted with displays) are compatible with these two boards.
> Add a "color" property to support the different color variants.
> 
> [1] https://www.adafruit.com/product/3108
> [2] https://www.adafruit.com/product/3130
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
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
>   2. Do not use the "color" property, but document all Adafruit
>      7-segment and 14-segment display backpack and FeatherWing expansion
>      boards.
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
>  .../bindings/auxdisplay/holtek,ht16k33.yaml   | 31 +++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> index 64ffff460026040f..616aca817874bdc8 100644
> --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> @@ -14,14 +14,23 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: holtek,ht16k33
> +    oneOf:
> +      - items:
> +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
> +          - const: holtek,ht16k33
> +
> +      - items:
> +          - const: adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing Display (Red)
> +          - const: holtek,ht16k33

These 2 entries can be combined. Or make the comment a 'description'.

> +
> +      - const: holtek,ht16k33     # Generic 16*8 LED controller with dot-matrix display
>  
>    reg:
>      maxItems: 1
>  
>    refresh-rate-hz:
>      maxItems: 1
> -    description: Display update interval in Hertz
> +    description: Display update interval in Hertz for dot-matrix displays
>  
>    interrupts:
>      maxItems: 1
> @@ -41,10 +50,26 @@ properties:
>      default: 16
>      description: Initial brightness level
>  
> +  color:
> +    description:
> +      Color of the display.  Use one of the LED_COLOR_ID_* prefixed definitions
> +      from the header include/dt-bindings/leds/common.h.  The default is red.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 9
> +    default: 1
> +
>  required:
>    - compatible
>    - reg
> -  - refresh-rate-hz
> +
> +if:
> +  properties:
> +    compatible:
> +      const: holtek,ht16k33

Isn't this always true?

> +then:
> +  required:
> +    - refresh-rate-hz
>  
>  additionalProperties: false
>  
> -- 
> 2.25.1
> 
> 
