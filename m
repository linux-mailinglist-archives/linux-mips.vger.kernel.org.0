Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6EB29ED63
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 14:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgJ2Nqf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 09:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgJ2Nqf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Oct 2020 09:46:35 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC599C0613D3;
        Thu, 29 Oct 2020 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cSTsxDYLnXEEi/bDWUeAA20te1rJNVjNLggcXmbtZpQ=; b=XhUb+9X5JMWVorM4JHpoQ7L3c
        AiUG1AryewCQipJ01tUvPuHknKuaIrwrLP6ZXuZXs/oD8Bh/wZrZovvYrMop17PDqM6/USIW2pUUD
        umeOebeU4JGnmlVdsho1/rbxzTzmR36nWoPKdVF/cS/Ixz9EubS/wlFCmkLc1s0dwgtIBpNbCTthj
        OGlL4pHZSq6Z1s4V0D/PZtQWWL1+2i5Ykl0ZKf5OlUxQUmiemIAvBUpvqt1BeXrkDiT25CoH0Xdjt
        O4P8O/bfqdcv2y8Xb1crnRD6S15I68jz5RalozAoTAaK5LcE0TRm+2WU8TO1uIelV+a0u1QGLSDt8
        gUmkphwwQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52480)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kY8G7-0004Rb-Ip; Thu, 29 Oct 2020 13:46:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kY8G6-0006AN-Hy; Thu, 29 Oct 2020 13:46:30 +0000
Date:   Thu, 29 Oct 2020 13:46:30 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201029134630.GE1559@shell.armlinux.org.uk>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
 <20201028203953.eafmzeqba76qjlf2@falbala.internal.home.lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201028203953.eafmzeqba76qjlf2@falbala.internal.home.lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 28, 2020 at 09:39:54PM +0100, Alexander Dahl wrote:
> Hello,
> 
> Peter, Russel, could you please give your Acked-by or Signed-off-by on
> this patch?  Your ack is needed, because the license is now explicitly
> set (it was not explicit before), and you were the contributors to
> this binding before the conversion to yaml.

For the license change only:

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

(Please drop the Cc attributation in the commit to
linux@armlinux.org.uk thanks.)

> 
> Thanks and Greets
> Alex
> 
> On Mon, Oct 05, 2020 at 10:34:41PM +0200, Alexander Dahl wrote:
> > The example was adapted in the following ways:
> > 
> > - make use of the now supported 'function' and 'color' properties
> > - remove pwm nodes, those are documented elsewhere
> > - align node names to new dt schema rules and dt recommendations
> > 
> > License was not explicitly set before.  The license set now is
> > recommended by DT project.
> > 
> > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > ---
> > 
> > Notes:
> >     NOTE: Due to license set/change this needs Acked-by or Signed-off-by from:
> >       * Peter Ujfalusi
> >       * Russell King
> >     
> >     That was discussed already with Peter (original author), still waiting
> >     for Acked-by though …
> >     
> >     Changelog
> >     ---------
> >     v6 -> v7:
> >       * added Reviewed-by (Krzysztof Kozlowski)
> >       * reworded commit message (suggested by Krzysztof)
> >       * added Reviewed-by (Rob Herring)
> >     
> >     v5 -> v6:
> >       * removed pwm nodes from example (Rob)
> >       * renamed led-controller node in example (Rob)
> >     
> >     v4 -> v5:
> >       * updated based on feedback by Rob Herring
> >       * removed Acked-by
> >     
> >     v3 -> v4:
> >       * added Cc to original author of the binding
> >     
> >     v2 -> v3:
> >       * changed license identifier to recommended one
> >       * added Acked-by
> >     
> >     v2:
> >       * added this patch to series (Suggested-by: Jacek Anaszewski)
> > 
> >  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
> >  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
> >  2 files changed, 70 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > deleted file mode 100644
> > index 6c6583c35f2f..000000000000
> > --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -LED connected to PWM
> > -
> > -Required properties:
> > -- compatible : should be "pwm-leds".
> > -
> > -Each LED is represented as a sub-node of the pwm-leds device.  Each
> > -node's name represents the name of the corresponding LED.
> > -
> > -LED sub-node properties:
> > -- pwms : PWM property to point to the PWM device (phandle)/port (id) and to
> > -  specify the period time to be used: <&phandle id period_ns>;
> > -- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
> > -  For the pwms and pwm-names property please refer to:
> > -  Documentation/devicetree/bindings/pwm/pwm.txt
> > -- max-brightness : Maximum brightness possible for the LED
> > -- active-low : (optional) For PWMs where the LED is wired to supply
> > -  rather than ground.
> > -- label :  (optional)
> > -  see Documentation/devicetree/bindings/leds/common.txt
> > -- linux,default-trigger :  (optional)
> > -  see Documentation/devicetree/bindings/leds/common.txt
> > -
> > -Example:
> > -
> > -twl_pwm: pwm {
> > -	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> > -	compatible = "ti,twl6030-pwm";
> > -	#pwm-cells = <2>;
> > -};
> > -
> > -twl_pwmled: pwmled {
> > -	/* provides one PWM (id 0 for Charing indicator LED) */
> > -	compatible = "ti,twl6030-pwmled";
> > -	#pwm-cells = <2>;
> > -};
> > -
> > -pwmleds {
> > -	compatible = "pwm-leds";
> > -	kpad {
> > -		label = "omap4::keypad";
> > -		pwms = <&twl_pwm 0 7812500>;
> > -		max-brightness = <127>;
> > -	};
> > -
> > -	charging {
> > -		label = "omap4:green:chrg";
> > -		pwms = <&twl_pwmled 0 7812500>;
> > -		max-brightness = <255>;
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > new file mode 100644
> > index 000000000000..fe4d5fd25913
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LEDs connected to PWM
> > +
> > +maintainers:
> > +  - Pavel Machek <pavel@ucw.cz>
> > +
> > +description:
> > +  Each LED is represented as a sub-node of the pwm-leds device.  Each
> > +  node's name represents the name of the corresponding LED.
> > +
> > +properties:
> > +  compatible:
> > +    const: pwm-leds
> > +
> > +patternProperties:
> > +  "^led(-[0-9a-f]+)?$":
> > +    type: object
> > +
> > +    $ref: common.yaml#
> > +
> > +    properties:
> > +      pwms:
> > +        maxItems: 1
> > +
> > +      pwm-names: true
> > +
> > +      max-brightness:
> > +        description:
> > +          Maximum brightness possible for the LED
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      active-low:
> > +        description:
> > +          For PWMs where the LED is wired to supply rather than ground.
> > +        type: boolean
> > +
> > +    required:
> > +      - pwms
> > +      - max-brightness
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    led-controller {
> > +        compatible = "pwm-leds";
> > +
> > +        led-1 {
> > +            label = "omap4::keypad";
> > +            pwms = <&twl_pwm 0 7812500>;
> > +            max-brightness = <127>;
> > +        };
> > +
> > +        led-2 {
> > +            color = <LED_COLOR_ID_GREEN>;
> > +            function = LED_FUNCTION_CHARGING;
> > +            pwms = <&twl_pwmled 0 7812500>;
> > +            max-brightness = <255>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.20.1
> 
> -- 
> /"\ ASCII RIBBON | »With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.«
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
