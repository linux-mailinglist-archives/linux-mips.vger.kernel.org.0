Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB561B93AA
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 21:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgDZThW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 15:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726188AbgDZThW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 15:37:22 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E1BC061A0F;
        Sun, 26 Apr 2020 12:37:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x4so17195877wmj.1;
        Sun, 26 Apr 2020 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gynnlawwP2L58lK7U6nOs2p5nD3J7jQ46S/46O9Sglk=;
        b=N9KWcFUX8Mo/Kasy1wW9DyZlzZceVD/CE6XLQh316tO+ezDNx6lxerDWRM/EUjewsb
         4J6UUjQVwoQZoMogoMySyTkErWUdm6SGsSbkDApKXQgCp2pamxe0toej7Q9ucGa5Gnm+
         eyeiVusmZD1eHS0aHgb+8Vd//q3bCIKayqqkJfAniMmlEtfl8hi8vOsomkq+Z51LPgD6
         42K5gO6TEH+vJnmiIm9m1+lLbqOQOEigtxE9AsFksajKLQtUPtFpwqYx2WEqqcMq2ps5
         ugdFvLiH4WejoukGnW7oEvK94R4t7p3Mv082cGW82m+xC2av6Qby6gQLO/lQbETB7Iy4
         VC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gynnlawwP2L58lK7U6nOs2p5nD3J7jQ46S/46O9Sglk=;
        b=j8LyRp1s6o0tUGvZppaRCiqPzzu+wyDjEJwH3Gmpp90icEL/kO2ZSGd7Pn653Y9EHn
         746/1VEG0TTfNWijn36nXLJu3nWhaRk87355wl8m0UQBEQBfQnM6IwHfgVv8psH7MKn3
         XqY2CNyNWFAAcm4aySZhhXpDFVuQRusHwPW8HHHgLw9I3Vv7y+MBia7WQV7/iAlPT+Hz
         VHLZj3yWjztNnLlsHLp0svH6vEROY5iwS8SFErCTvdkQsvnPq2mDVObvq3iPKWMvgcrM
         N0ahqofk+vm5e9XHkGha8BELYGNEFWy0ud7ibkdQQHCWuzpnKeiLX2Q2jV4mMjKLrKC5
         HueQ==
X-Gm-Message-State: AGi0PuZFUCn1S0WfhBmc3zHWP3D5LGJX4I4ugEiehGqkHuyRG6QhroQJ
        zumC9FZ2SyGia83KWBWg4syeIN8t
X-Google-Smtp-Source: APiQypJ4XTrddxqN2RyHulQ7/hn1xjaKln3zjHBlhZG5Q7i33l263UZT1BbEIAIIf8Ni9zos7CKCXg==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr21919075wmb.27.1587929840265;
        Sun, 26 Apr 2020 12:37:20 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:10d8:ba05:5002:2dff? ([2a02:810d:340:2e50:10d8:ba05:5002:2dff])
        by smtp.gmail.com with ESMTPSA id y10sm12138259wma.5.2020.04.26.12.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 12:37:19 -0700 (PDT)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination
 GPUs
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
From:   Philipp Rossak <embed3d@gmail.com>
Message-ID: <9d9998cc-33bf-7d8f-658b-8d6218338135@gmail.com>
Date:   Sun, 26 Apr 2020 21:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

On 24.04.20 22:34, H. Nikolaus Schaller wrote:
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
> 
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers and interrupt).
> 
> The interface also consists of clocks, reset, power but
> information from data sheets is vague and some SoC integrators
> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
> all clock, reset and power-management through registers
> outside of the sgx register block.
> 
> Therefore all these properties are optional.
> 
> Tested by make dt_binding_check
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 ++++++++++++++++++
>   1 file changed, 150 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> new file mode 100644
> index 000000000000..33a9c4c6e784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination PVR/SGX GPU
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |+
> +  This binding describes the Imagination SGX5 series of 3D accelerators which
> +  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> +
> +  For an extensive list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
> +
> +  The SGX node is usually a child node of some DT node belonging to the SoC
> +  which handles clocks, reset and general address space mapping of the SGX
> +  register area. If not, an optional clock can be specified here.
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +  compatible:
> +    oneOf:
> +      - description: SGX530-121 based SoC
> +        items:
> +          - enum:
> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
> +          - const: img,sgx530-121
> +          - const: img,sgx530
> +
> +      - description: SGX530-125 based SoC
> +        items:
> +          - enum:
> +            - ti,am3352-sgx530-125 # BeagleBone Black
> +            - ti,am3517-sgx530-125
> +            - ti,am4-sgx530-125
> +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, OpenPandora 1GHz and similar
> +            - ti,ti81xx-sgx530-125
> +          - const: ti,omap3-sgx530-125
> +          - const: img,sgx530-125
> +          - const: img,sgx530
> +
> +      - description: SGX535-116 based SoC
> +        items:
> +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
> +          - const: img,sgx535-116
> +          - const: img,sgx535
> +
> +      - description: SGX540-116 based SoC
> +        items:
> +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
> +          - const: img,sgx540-116
> +          - const: img,sgx540
> +
> +      - description: SGX540-120 based SoC
> +        items:
> +          - enum:
> +            - samsung,s5pv210-sgx540-120
> +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and similar
> +          - const: img,sgx540-120
> +          - const: img,sgx540
> +
> +      - description: SGX540-130 based SoC
> +        items:
> +          - enum:
> +            - ingenic,jz4780-sgx540-130 # CI20
> +          - const: img,sgx540-130
> +          - const: img,sgx540
> +
> +      - description: SGX544-112 based SoC
> +        items:
> +          - const: ti,omap4470-sgx544-112
> +          - const: img,sgx544-112
> +          - const: img,sgx544
> +
> +      - description: SGX544-115 based SoC
> +        items:
> +          - enum:
> +            - allwinner,sun8i-a31-sgx544-115
> +            - allwinner,sun8i-a31s-sgx544-115
those two bindings are wrong.
It should be allwinner,sun6i-a31-sgx544-115 and 
allwinner,sun6i-a31s-sgx544-115. I did a copy paste error in the patches 
that I provided for this series.


Cheers,
Philipp
