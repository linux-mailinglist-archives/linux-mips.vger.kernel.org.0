Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 986FF29FBE
	for <lists+linux-mips@lfdr.de>; Fri, 24 May 2019 22:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404182AbfEXUVG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 May 2019 16:21:06 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40465 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403845AbfEXUVF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 May 2019 16:21:05 -0400
Received: by mail-oi1-f193.google.com with SMTP id r136so7954673oie.7;
        Fri, 24 May 2019 13:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1Pcvpx47Lgpkklh1dUYuXUVnYLV0UOVqnAMU1ZWlfNU=;
        b=cSZbacRLT3THI/o2Eb0csGK2Iq6Chyy1j2hI6Y5EvKZFlhH/yICikCMVcwx+3yAmci
         kBI7cNLZp1+vDsWXz3KkwXkUy5XLO/NDZgNE4+E2AfdreShNqymnGRvMGP+TPlfE1kFU
         Brlfy/Gr0eYAzPzH8MSN18pJBmEuH1ILaDg3BhWI9G9ywz5S+q93cVC7oCI00oRnorvf
         0O9Zw1brafdYIipJtS6AGBPrbJRa5uzT35lHkS2zDi20k/izrCTZaM0quisrxrzDKbuI
         eiUdJqL8EScDza1pfwcDsLIQa39eBxcDY+I4qxActCp/WmmGGDKBlNwcH+9kSkruWLlO
         wq6g==
X-Gm-Message-State: APjAAAWoDE/y7UwrXdMYbrf9RrHchZhqFaUnAgNC+91PNutzyQxWe2lm
        vF+M4OSAcj9yL9P5ygStsA==
X-Google-Smtp-Source: APXvYqwiWbsmY0AvPIsFqEy9d5xnA4ACojgqv5dnCssQgQucS6H+KMlf712EdwupMRYpX8zpqeZlIw==
X-Received: by 2002:aca:fd45:: with SMTP id b66mr7646303oii.157.1558729264891;
        Fri, 24 May 2019 13:21:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 19sm1241172otf.72.2019.05.24.13.21.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 13:21:04 -0700 (PDT)
Date:   Fri, 24 May 2019 15:21:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mathieu Malaterre <malat@debian.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v12 03/13] dt-bindings: Add doc for the Ingenic TCU
 drivers
Message-ID: <20190524202103.GA15650@bogus>
References: <20190521145141.9813-1-paul@crapouillou.net>
 <20190521145141.9813-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521145141.9813-4-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 21, 2019 at 04:51:31PM +0200, Paul Cercueil wrote:
> Add documentation about how to properly use the Ingenic TCU
> (Timer/Counter Unit) drivers from devicetree.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v4: New patch in this series. Corresponds to V2 patches 3-4-5 with
>      added content.
>     
>     v5: - Edited PWM/watchdog DT bindings documentation to point to the new
>        document.
>      - Moved main document to
>        Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>      - Updated documentation to reflect the new devicetree bindings.
>     
>     v6: - Removed PWM/watchdog documentation files as asked by upstream
>      - Removed doc about properties that should be implicit
>      - Removed doc about ingenic,timer-channel /
>        ingenic,clocksource-channel as they are gone
>      - Fix WDT clock name in the binding doc
>      - Fix lengths of register areas in watchdog/pwm nodes
>     
>     v7: No change
>     
>     v8: - Fix address of the PWM node
>      - Added doc about system timer and clocksource children nodes
>     
>     v9: - Remove doc about system timer and clocksource children
>        nodes...
>     - Add doc about ingenic,pwm-channels-mask property
>     
>     v10: No change
>     
>     v11: Fix info about default value of ingenic,pwm-channels-mask
>     
>     v12: Drop sub-nodes for now; they will be introduced in a follow-up
>     	 patchset.

Why? I believe I acked them.

> 
>  .../devicetree/bindings/timer/ingenic,tcu.txt | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> new file mode 100644
> index 000000000000..d101cd72c9b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> @@ -0,0 +1,59 @@
> +Ingenic JZ47xx SoCs Timer/Counter Unit devicetree bindings
> +==========================================================
> +
> +For a description of the TCU hardware and drivers, have a look at
> +Documentation/mips/ingenic-tcu.txt.
> +
> +Required properties:
> +
> +- compatible: Must be one of:
> +  * "ingenic,jz4740-tcu"
> +  * "ingenic,jz4725b-tcu"
> +  * "ingenic,jz4770-tcu"
> +- reg: Should be the offset/length value corresponding to the TCU registers
> +- clocks: List of phandle & clock specifiers for clocks external to the TCU.
> +  The "pclk", "rtc" and "ext" clocks should be provided. The "tcu" clock
> +  should be provided if the SoC has it.
> +- clock-names: List of name strings for the external clocks.
> +- #clock-cells: Should be <1>;
> +  Clock consumers specify this argument to identify a clock. The valid values
> +  may be found in <dt-bindings/clock/ingenic,tcu.h>.
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value should be 1.
> +- interrupt-parent : phandle of the interrupt controller.

Drop this 'interrupt-parent' is implied and could be in a parent node.

> +- interrupts : Specifies the interrupt the controller is connected to.
> +
> +Optional properties:
> +
> +- ingenic,pwm-channels-mask: Bitmask of TCU channels reserved for PWM use.
> +  Default value is 0xfc.
> +
> +
> +Example
> +==========================================================
> +
> +#include <dt-bindings/clock/jz4770-cgu.h>
> +
> +/ {
> +	tcu: timer@10002000 {
> +		compatible = "ingenic,jz4770-tcu";
> +		reg = <0x10002000 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x10002000 0x1000>;
> +
> +		#clock-cells = <1>;
> +
> +		clocks = <&cgu JZ4770_CLK_RTC
> +			  &cgu JZ4770_CLK_EXT
> +			  &cgu JZ4770_CLK_PCLK>;
> +		clock-names = "rtc", "ext", "pclk";
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <27 26 25>;
> +	};
> +};
> -- 
> 2.21.0.593.g511ec345e18
> 
