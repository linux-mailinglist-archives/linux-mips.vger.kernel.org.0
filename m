Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FEE2BBF4E
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 14:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgKUNei (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Nov 2020 08:34:38 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37449 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbgKUNei (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Nov 2020 08:34:38 -0500
Received: by mail-qt1-f196.google.com with SMTP id e10so1884840qte.4;
        Sat, 21 Nov 2020 05:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gVAJN3AITwJvYURT465dFmxb9SQx6ktbmJd5dcXuwwU=;
        b=CMKbWS1mofXwayy3xLImcy9SxZSrPfgyGztWxOVYfJ84BRGvpbldHdfSUmP8EkSjKW
         vr1yQCQUbRAznbnBIJTCe162gIJWx/ajZj5qjv79wJGaMnXMjW04t0YEix/al2H9uuTF
         5p8rRg7VaQRNK8xqJ3SeQUBTPWENXZrQyc2pbw/U32ymmdlDI4Xcgu7FQLJq7Mpkz0G8
         82XUwyo10bZYj+Qz8n0mcB2z3TXVufOAs8rO8QgpHEEUYzfgV1QX1ghSeq3Jh0zuPtme
         UDwABoUFO2Un5OSnuiZEc2ng7gcTmdYibl1MWgy0MAipQo9L62TTVCSwsH2xFpcjhyjO
         AQIw==
X-Gm-Message-State: AOAM531Fy3YfYEMsy20h4u84z2zkRnAJ1dEaewgLkJCKtx/1Yme1VMTA
        iG4uMYwPmqs7zSdiKjUe7Q==
X-Google-Smtp-Source: ABdhPJx5FaScR8LbbgLNVhfSP1f40wIxs3ggHXH6U2c+ZXNwF+ZKW/Qpy1J3pcV71zl1Za4iy9VZ0g==
X-Received: by 2002:aed:3207:: with SMTP id y7mr11094308qtd.217.1605965676826;
        Sat, 21 Nov 2020 05:34:36 -0800 (PST)
Received: from xps15 ([172.58.99.237])
        by smtp.gmail.com with ESMTPSA id d82sm3896505qkc.14.2020.11.21.05.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 05:34:36 -0800 (PST)
Received: (nullmailer pid 2134377 invoked by uid 1000);
        Sat, 21 Nov 2020 13:34:32 -0000
Date:   Sat, 21 Nov 2020 07:34:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: Re: [PATCH v3 2/5] dt: bindings: add mt7621-clk device tree binding
 documentation
Message-ID: <20201121133432.GA2130098@robh.at.kernel.org>
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
 <20201113154632.24973-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113154632.24973-3-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 13, 2020 at 04:46:29PM +0100, Sergio Paracuellos wrote:
> Adds device tree binding documentation for clocks in the
> MT7621 SOC.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-clk.yaml   | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> new file mode 100644
> index 000000000000..363bd9880e29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT7621 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description: |
> +  The MT7621 has a PLL controller from where the cpu clock is provided
> +  as well as derived clocks for the bus and the peripherals. It also
> +  can gate SoC device clocks.
> +
> +  Each clock is assigned an identifier and client nodes use this identifier
> +  to specify the clock which they consume.
> +
> +  All these identifiers could be found in:
> +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7621-clk
> +
> +  ralink,sysctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the syscon which is in the same address area with syscon
> +      device.
> +
> +  "#clock-cells":
> +    description:
> +      The first cell indicates the clock gate number, see [1] for available
> +      clocks.
> +    const: 1
> +
> +  clock-output-names:
> +    maxItems: 8
> +
> +required:
> +  - compatible
> +  - ralink,sysctl
> +  - '#clock-cells'
> +  - clock-output-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt7621-clk.h>
> +
> +    pll {
> +      compatible = "mediatek,mt7621-clk";
> +      ralink,sysctl = <&sysc>;

If this is the only control interface, then make this a child of 'sysc'. 
And use 'reg' if there's a dedicated range of registers.

> +      #clock-cells = <1>;
> +      clock-output-names = "xtal", "cpu", "bus",
> +                           "50m", "125m", "150m",
> +                           "250m", "270m";
> +    };
> -- 
> 2.25.1
> 
