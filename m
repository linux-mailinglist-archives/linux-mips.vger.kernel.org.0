Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06235345A7F
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 10:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhCWJNB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 05:13:01 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:60632 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhCWJMw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 05:12:52 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 8F1CE44A022C;
        Tue, 23 Mar 2021 10:12:50 +0100 (CET)
MIME-Version: 1.0
Date:   Tue, 23 Mar 2021 10:12:50 +0100
From:   robin <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] dt-bindings: auxdisplay: ht16k33: Document Adafruit
 segment displays
Reply-To: robin@protonic.nl
In-Reply-To: <20210322144848.1065067-3-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-3-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <fb42abb0e79a57e2aab123468d95ff7e@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> 
> Document compatible values for the Adafruit 7-segment[1] and
> 14-segment[2] FeatherWing expansion boards with red displays.  
> According
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
> Alternatives I considered:
>   1. Document the attached display type in a child node.
>      I.e. specify segment type, number of characters, and wiring.
>      Especially the latter would become really complex, due to the 
> sheer
>      amount of possible wiring combinations.
>      Using this method, you also loose the ability to just connect a
>      display to an i2c bus, and instantiate the device from sysfs,
>      without using DT:
> 
> 	echo adafruit,3130 0x70 > /sys/class/i2c/i2c-adapter/.../new_device
> 
>   2. Do not use the "color" property, but document all Adafruit
>      7-segment and 14-segment display backpack and FeatherWing 
> expansion
>      boards.
>      This would lead to a myriad of compatible values:
> 
>       - items:
> 	  - enum:
> 	      - adafruit,878      # 0.56" 4-Digit 7-Segment Display Backpack 
> (Red)
> 	      - adafruit,879      # 0.56" 4-Digit 7-Segment Display Backpack 
> (Yellow)
> 	      - adafruit,880      # 0.56" 4-Digit 7-Segment Display Backpack 
> (Green)
> 	      - adafruit,881      # 0.56" 4-Digit 7-Segment Display Backpack 
> (Blue)
> 	      - adafruit,1002     # 0.56" 4-Digit 7-Segment Display Backpack 
> (White)
> 	  - const: adafruit,877   # 0.56" 4-Digit 7-Segment Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,1268     # 1.2" 4-Digit 7-Segment Display Backpack 
> (Green)
> 	      - adafruit,1269     # 1.2" 4-Digit 7-Segment Display Backpack 
> (Yellow)
> 	      - adafruit,1270     # 1.2" 4-Digit 7-Segment Display Backpack 
> (Red)
> 	  - const: adafruit,1271  # 1.2" 4-Digit 7-Segment Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,1911     # 0.54" Quad Alphanumeric Display Backpack 
> (Red)
> 	      - adafruit,1912     # 0.54" Quad Alphanumeric Display Backpack 
> (Blue)
> 	      - adafruit,2157     # 0.54" Quad Alphanumeric Display Backpack 
> (White)
> 	      - adafruit,2158     # 0.54" Quad Alphanumeric Display Backpack 
> (Yellow)
> 	      - adafruit,2159     # 0.54" Quad Alphanumeric Display Backpack
> (Yellow-Green)
> 	      - adafruit,2160     # 0.54" Quad Alphanumeric Display Backpack 
> (Green)
> 	  - const: adafruit,1910  # 0.54" Quad 14-segment Alphanumeric 
> Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,3106     # 0.56" 4-Digit 7-Segment FeatherWing 
> Display (Blue)
> 	      - adafruit,3107     # 0.56" 4-Digit 7-Segment FeatherWing 
> Display (Green)
> 	      - adafruit,3108     # 0.56" 4-Digit 7-Segment FeatherWing 
> Display (Red)
> 	      - adafruit,3109     # 0.56" 4-Digit 7-Segment FeatherWing 
> Display (White)
> 	      - adafruit,3110     # 0.56" 4-Digit 7-Segment FeatherWing
> Display (Yellow)
> 	  - const: adafruit,3088  # 0.56" 4-Digit 7-Segment FeatherWing
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,3127     # 0.54" Quad Alphanumeric FeatherWing 
> Display (White)
> 	      - adafruit,3128     # 0.54" Quad Alphanumeric FeatherWing 
> Display (Blue)
> 	      - adafruit,3129     # 0.54" Quad Alphanumeric FeatherWing 
> Display (Green)
> 	      - adafruit,3130     # 0.54" Quad Alphanumeric FeatherWing 
> Display (Red)
> 	      - adafruit,3131     # 0.54" Quad Alphanumeric FeatherWing
> Display (Yellow)
> 	      - adafruit,3132     # 0.54" Quad Alphanumeric FeatherWing
> Display (Yellow-Green)
> 	  - const: adafruit,3089  # 0.54" Quad 14-segment Alphanumeric 
> FeatherWing
> 	  - const: holtek,ht16k33
> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml   | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> index 64ffff460026040f..4380a5177a67d2e2 100644
> --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> @@ -14,14 +14,23 @@ allOf:
> 
>  properties:
>    compatible:
> -    const: holtek,ht16k33
> +    oneOf:
> +      - items:
> +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment
> FeatherWing Display (Red)
> +          - const: holtek,ht16k33
> +
> +      - items:
> +          - const: adafruit,3130  # 0.54" Quad Alphanumeric
> FeatherWing Display (Red)
> +          - const: holtek,ht16k33
> +
> +      - const: holtek,ht16k33     # Generic 16*8 LED controller with
> dot-matrix display
> 
>    reg:
>      maxItems: 1
> 
>    refresh-rate-hz:
>      maxItems: 1
> -    description: Display update interval in Hertz
> +    description: Display update interval in Hertz for dot-matrix 
> displays

The above should be included in patch 16

> 
>    interrupts:
>      maxItems: 1
> @@ -41,10 +50,17 @@ properties:
>      default: 16
>      description: Initial brightness level
> 
> +  color: true
> +    description:
> +      Color of the display.  Use one of the LED_COLOR_ID_* prefixed 
> definitions
> +      from the header include/dt-bindings/leds/common.h.  The default 
> is red.
> +    minimum: 0
> +    maximum: 9
> +    default: 1
> +

The above should be included in patch 17

>  required:
>    - compatible
>    - reg
> -  - refresh-rate-hz

'refresh-rate-hz' is still a required property for the dot-matrix / 
fbdev setup.
If it can no longer be listed here than maybe its nice to mention that 
it's required
somewhere else (in it's description?).
Rob?

Groetjes / Kind regards,

Robin van der Gracht
