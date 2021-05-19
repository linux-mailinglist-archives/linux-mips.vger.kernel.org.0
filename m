Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3779D388BE9
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 12:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237226AbhESKrp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 May 2021 06:47:45 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:35202 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhESKrp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 May 2021 06:47:45 -0400
X-Greylist: delayed 561 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 May 2021 06:47:44 EDT
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 02EA444A024D;
        Wed, 19 May 2021 12:37:03 +0200 (CEST)
MIME-Version: 1.0
Date:   Wed, 19 May 2021 12:37:02 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/17] dt-bindings: auxdisplay: ht16k33: Document Adafruit
 segment displays
Reply-To: robin@protonic.nl
In-Reply-To: <CAMuHMdXN9bPnEjXJUWszS5iwuVLBHJV7c+jhBU1t1EXnAnFYig@mail.gmail.com>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-3-geert@linux-m68k.org>
 <fb42abb0e79a57e2aab123468d95ff7e@protonic.nl>
 <CAMuHMdXN9bPnEjXJUWszS5iwuVLBHJV7c+jhBU1t1EXnAnFYig@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a5cf3ba594ab7ba36c1f4d5760796625@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 2021-05-18 16:35, Geert Uytterhoeven wrote:
> Hoi Robin,
> 
> On Tue, Mar 23, 2021 at 10:12 AM robin <robin@protonic.nl> wrote:
>> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
>> > The Holtek HT16K33 LED controller is not only used for driving
>> > dot-matrix displays, but also for driving segment displays.
>> >
>> > Document compatible values for the Adafruit 7-segment[1] and
>> > 14-segment[2] FeatherWing expansion boards with red displays.
>> > According
>> > to the schematics, all other Adafruit 7-segment and 14-segment display
>> > backpack and FeatherWing expansion boards (including bare boards and
>> > boards fitted with displays) are compatible with these two boards.
>> > Add a "color" property to support the different color variants.
>> >
>> > [1] https://www.adafruit.com/product/3108
>> > [2] https://www.adafruit.com/product/3130
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
>> > --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
>> > +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
>> > @@ -14,14 +14,23 @@ allOf:
>> >
>> >  properties:
>> >    compatible:
>> > -    const: holtek,ht16k33
>> > +    oneOf:
>> > +      - items:
>> > +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment
>> > FeatherWing Display (Red)
>> > +          - const: holtek,ht16k33
>> > +
>> > +      - items:
>> > +          - const: adafruit,3130  # 0.54" Quad Alphanumeric
>> > FeatherWing Display (Red)
>> > +          - const: holtek,ht16k33
>> > +
>> > +      - const: holtek,ht16k33     # Generic 16*8 LED controller with
>> > dot-matrix display
>> >
>> >    reg:
>> >      maxItems: 1
>> >
>> >    refresh-rate-hz:
>> >      maxItems: 1
>> > -    description: Display update interval in Hertz
>> > +    description: Display update interval in Hertz for dot-matrix
>> > displays
>> 
>> The above should be included in patch 16
> 
> I disagree: bindings are independent from the driver implementation.
> 
>> >    interrupts:
>> >      maxItems: 1
>> > @@ -41,10 +50,17 @@ properties:
>> >      default: 16
>> >      description: Initial brightness level
>> >
>> > +  color: true
>> > +    description:
>> > +      Color of the display.  Use one of the LED_COLOR_ID_* prefixed
>> > definitions
>> > +      from the header include/dt-bindings/leds/common.h.  The default
>> > is red.
>> > +    minimum: 0
>> > +    maximum: 9
>> > +    default: 1
>> > +
>> 
>> The above should be included in patch 17
> 
> Same here.

My thought was that one without the other makes no sense. But if it's common
practice to create a separate patch for device tree bindings (it's a 
patch-set
after all) than that's fine with me.

@Rob what do you think?

Best regards,
Met vriendelijke groet,

Robin van der Gracht
