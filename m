Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A744A177952
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2020 15:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgCCOku (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Mar 2020 09:40:50 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34194 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbgCCOku (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Mar 2020 09:40:50 -0500
Received: by mail-oi1-f194.google.com with SMTP id g6so3264737oiy.1;
        Tue, 03 Mar 2020 06:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pBPgC25ubKS5wPAN+uT8vJ9mnR6iCFqlpOC1P57sXK4=;
        b=b/mv7Xnf/rxY3UZFUp4Oqt0ljveaMBQnfClAIulPVvDDJEEVLbm1f3k69cEdsxjIae
         OAvdfUMoR0Mf68yaMoaVmrgCAtX5D3RAu87nNyWvsCCxXc3sOasEpqNdRhN1GTVLdwrc
         otppVsuN5amwqbajLnHPTDzw7TN0cmX41mx/zSz+F8eYNOEtMKobAm0KOSBOqBsEl4nI
         PJMQg8YePLSfFIi+2N2GBbPA+wGb15NaqotRolqcCfSnusKNU44w2aX1pLeSS2iCr5DP
         eO4ohmbduuAe2PdYByETzT8gIWq0dMSLmqSw1wieCJ6t3Q449rBJlp5yf/5qKygzhdpd
         RWPQ==
X-Gm-Message-State: ANhLgQ1HhBLyeYWFlBd1SEoSyr+JYh6+utUaZYkAkbm4wpgHZP54BvUs
        NyAiImWhNIOb5RDk1pztWw==
X-Google-Smtp-Source: ADFU+vv05XHH/grNWOM44+Loiz7eSQ7oRdXeA6SR+r3YHZMxgPfK8MbbrKBZbP66Sthy2ocwKowBzg==
X-Received: by 2002:a54:4006:: with SMTP id x6mr2678057oie.145.1583246449504;
        Tue, 03 Mar 2020 06:40:49 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a26sm6034251oid.17.2020.03.03.06.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:40:48 -0800 (PST)
Received: (nullmailer pid 5880 invoked by uid 1000);
        Tue, 03 Mar 2020 14:40:47 -0000
Date:   Tue, 3 Mar 2020 08:40:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [RFC 2/8] dt-bindings: video: Add jz4780-hdmi binding
Message-ID: <20200303144047.GA24762@bogus>
References: <cover.1582744379.git.hns@goldelico.com>
 <2d7202155bae3fa9c7097275d4c9a1ccab569aea.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d7202155bae3fa9c7097275d4c9a1ccab569aea.1582744379.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 26, 2020 at 08:12:54PM +0100, H. Nikolaus Schaller wrote:
> From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.txt  | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
> new file mode 100644
> index 000000000000..f02e59fbdd5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
> @@ -0,0 +1,41 @@
> +Device-Tree bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
> +TX controller IP with accompanying PHY IP.
> +
> +Required properties:
> + - #address-cells : should be <1>
> + - #size-cells : should be <0>

These aren't in the example.

> + - compatible : should be "ingenic,jz4780-hdmi"
> + - reg-io-width: must be <4>

If it can only be 4, then you can just assume that from the compatible.

> + - clocks: phandle to isrf and iahb clocks
> + - clock-names : must be "isrf" and "iahb"
> + - ports: Port nodes with endpoint definitions as defined in
> +   Documentation/devicetree/bindings/media/video-interfaces.txt,
> +
> +Optional properties:
> + - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing

This goes in a connector node. It's not part of the HDMI block.

That also means you need an out port to the connector.

> +
> +example:
> +
> +hdmi: hdmi@10180000 {
> +	compatible = "ingenic,jz4780-hdmi";
> +	reg = <0x10180000 0x8000>;
> +	reg-io-width = <4>;
> +	ddc-i2c-bus = <&i2c4>;
> +	interrupt-parent = <&intc>;
> +	interrupts = <3>;
> +	clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +	clock-names = "isfr", "iahb";
> +
> +	ports {
> +		hdmi_in: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			hdmi_in_lcd: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&jz4780_out_hdmi>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.23.0
> 
