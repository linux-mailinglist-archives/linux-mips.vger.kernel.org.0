Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F01170456
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 17:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgBZQ3M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 11:29:12 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34909 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgBZQ3L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 11:29:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id r16so3539674otd.2;
        Wed, 26 Feb 2020 08:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N6xzgWnvG9GnDucTt/KJELhYr9ugnkjtItBaJ6wFEc4=;
        b=pTVhMP3x3q5LmFBKPqasm+8plYmEsRVF6A4yPV5o2b/MxATb1Ijpnbw9fMXc9u5wr7
         ehjDhqcLuDuupRHanoyit+xzS9cnW2YZ9abWxHT/rDoeCeXh7+nlZl3VYrXscH9rcX0C
         FXHqX5unSbetvux4hituRtc1wfD/vrBBceHS6rOqjFqwn2HcHOMoXJv3Km41AzazWyAL
         wm+BNhMB/IyiZrT2cltjG76+YWF68ntLylWaz8gjirx1rQJuZlFh+C0ah7NK0+CVEEmk
         zNfE/ckP6Qeaidh4XSMCtNllxzcUkFxcqZjR2Rc9zh16D9OkPRtjJ3xHRCbS8XBzcxut
         cFmw==
X-Gm-Message-State: APjAAAVK5ATWX8WD9EX9toupnYNzssVVgUiuHSM1Xsqol9Tr4jxC5+Bw
        2dFlKnjHmBTVQA5SaIFwNg==
X-Google-Smtp-Source: APXvYqy6Xg9l4BYtpmsxJmpFyy0bDN/OPmMkZRktcNgKD2aLUwscbPU2kJgPRg/G/F0gCFrqE/9oIQ==
X-Received: by 2002:a9d:6a90:: with SMTP id l16mr3533796otq.353.1582734550281;
        Wed, 26 Feb 2020 08:29:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e16sm933404otp.72.2020.02.26.08.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:29:09 -0800 (PST)
Received: (nullmailer pid 24095 invoked by uid 1000);
        Wed, 26 Feb 2020 16:29:07 -0000
Date:   Wed, 26 Feb 2020 10:29:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        geert+renesas@glider.be, krzk@kernel.org, ebiederm@xmission.com,
        miquel.raynal@bootlin.com, keescook@chromium.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: Re: [PATCH v6 5/7] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200226162907.GA13489@bogus>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582215889-113034-7-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582215889-113034-7-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 21, 2020 at 12:24:47AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     Change the two Document from txt to yaml.
>     
>     v2->v3:
>     Fix formatting errors.
>     
>     v3->v4:
>     Fix bugs in the two yaml files.
>     
>     v4->v5:
>     No change.
>     
>     v5->v6:
>     Rewrite the two yaml files.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 61 ++++++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,soc.yaml         | 34 ++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> new file mode 100644
> index 00000000..ad1fd86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic XBurst family CPUs
> +
> +maintainers:
> +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Blank line here.

> +description: |

Drop the '|'.

> +  Ingenic XBurst family CPUs shall have the following properties.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +
> +      - description: Ingenic XBurst®1 CPU Core
> +        items:
> +          - const: ingenic,xburst
> +
> +      - description: Ingenic XBurst®2 CPU Core
> +        items:
> +          - const: ingenic,xburst2

enum:
  - ingenic,xburst  # Ingenic XBurst®1 CPU Core
  - ingenic,xburst2 # Ingenic XBurst®2 CPU Core

Though I don't find the description really adds much.

> +
> +  reg:
> +    description: |
> +      The number of the CPU.

Drop this.

Add:

maxItems: 1

> +
> +required:
> +  - device_type
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    cpus {
> +    	#address-cells = <1>;
> +    	#size-cells = <0>;
> +
> +    	cpu0: cpu@0 {
> +    		device_type = "cpu";
> +    		compatible = "ingenic,xburst";
> +    		reg = <0>;
> +

> +    		clocks = <&cgu JZ4780_CLK_CPU>;
> +    		clock-names = "cpu";

Not documented.

> +    	};
> +
> +    	cpu1: cpu@1 {
> +    		device_type = "cpu";
> +    		compatible = "ingenic,xburst";
> +    		reg = <1>;
> +
> +    		clocks = <&cgu JZ4780_CLK_CORE1>;
> +    		clock-names = "cpu";
> +    	};
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
> new file mode 100644
> index 00000000..8943e73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic SoCs with XBurst CPU inside.
> +
> +maintainers:
> +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Blank line.

> +description: |
> +  Ingenic SoCs with XBurst CPU inside shall have the following properties.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Ingenic JZ47 Series Mobile Application Processor
> +        items:
> +          - const: ingenic,jz4740
> +          - const: ingenic,jz4725b
> +          - const: ingenic,jz4760
> +          - const: ingenic,jz4760b
> +          - const: ingenic,jz4770
> +          - const: ingenic,jz4780

This is defining the root compatible is 6 strings. You want a enum here 
I think.

> +
> +      - description: Ingenic X Series IoT Application Processor
> +        items:
> +          - const: ingenic,x1000
> +          - const: ingenic,x1000e
> +          - const: ingenic,x1500

Same here.

Did you validate your dts file with this schema using 'make dtbs_check'?

Rob
