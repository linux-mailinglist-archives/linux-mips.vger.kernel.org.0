Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7338517795E
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2020 15:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgCCOmn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Mar 2020 09:42:43 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38525 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbgCCOmn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Mar 2020 09:42:43 -0500
Received: by mail-ot1-f67.google.com with SMTP id i14so3210698otp.5;
        Tue, 03 Mar 2020 06:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ksT/wtaEoqeTN1KHOE8aetE606Rk22N2PLcG6a01LS8=;
        b=OHqfWn4sJ0GwDENkm+gINzLclAV/AsfOYol2oVqBPlyHfgi+Cnui6fhNyVc+8Q875X
         fY5DBIjLxs3GsrRbLEX3mz72Fa9hFdp7ntrc0yQWW+5I6NpxEiIA699XDkOWcNwCTcSa
         O+UQZ1pJuFPFL7/ucWEwsJ1LSF/jaVcuSMHemCcqZz37kCjKVv+BcHhKWf/4FCr1Qjtg
         DkQiwdBeLrNmg/laFBjiIbQneLSVVCROz43IlMYZx3d7XK/alu19V/I0YKNuAZtUS/nR
         9QL8fQ1WuLtTu+dsDar8CpnxzIpuhSenrGX9uoauHndzCUqM+l9zjzbIuSrmkwERweve
         KS2A==
X-Gm-Message-State: ANhLgQ3dg8zSkgQQMQDMAuNz0GfL/D3+UOTmZhN95ZlgEOE+o1tslQqs
        ZmmpCWMleljQhSKrXJ1Grg==
X-Google-Smtp-Source: ADFU+vtZr4p2NRYC43S+DOX0tBm8RXxT6xe9atzAn2pCgAHYItWK3P3s4o97cZ5EPhX2trhg/h5qWw==
X-Received: by 2002:a05:6830:22ca:: with SMTP id q10mr3896085otc.280.1583246562491;
        Tue, 03 Mar 2020 06:42:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t193sm4828281oif.34.2020.03.03.06.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:42:41 -0800 (PST)
Received: (nullmailer pid 8497 invoked by uid 1000);
        Tue, 03 Mar 2020 14:42:40 -0000
Date:   Tue, 3 Mar 2020 08:42:40 -0600
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
Subject: Re: [RFC 1/8] dt-bindings: video: Add jz4780-lcd binding
Message-ID: <20200303144240.GB24762@bogus>
References: <cover.1582744379.git.hns@goldelico.com>
 <d7dd7c52a9f6cb4e31bce69bb6879e46bfba530c.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7dd7c52a9f6cb4e31bce69bb6879e46bfba530c.1582744379.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 26, 2020 at 08:12:53PM +0100, H. Nikolaus Schaller wrote:
> From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> Add DT bindings for the LCD controller on the jz4780 SoC
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  .../bindings/display/ingenic-jz4780-lcd.txt   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
> new file mode 100644
> index 000000000000..8512ce3f93df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
> @@ -0,0 +1,39 @@
> +Bindings for Ingenic JZ4780 LCD Controller
> +
> +LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
> +
> +Required properties:
> +- compatible: should be "ingenic,jz4780-lcd"
> +- reg: Should contain the address & size of the LCD controller registers.
> +- interrupts: Should specify the interrupt provided by parent.
> +- clocks: Should contain two clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK.
> +- clock-names : Must be "lcd_clk", "lcd_pixclk";
> +- port: A port node with endpoint definitions as defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Optional properties:
> +- interrupt-parent: phandle to parent interrupt controller

Drop this. 'interrupt-parent' is always valid and could be in a parent 
node.

> +
> +Example:
> +
> +lcd: jz4780-lcdk@0x13050000 {

Drop the '0x'.

> +	compatible = "ingenic,jz4780-lcd";
> +	reg = <0x13050000 0x1800>;
> +
> +	clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +	clock-names = "lcd_clk", "lcd_pixclk";
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <31>;
> +
> +	jz4780_lcd_out: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			jz4780_out_hdmi: endpoint@0 {
> +				reg = <0>;

Don't need an address as there's only 1 endpoint.

> +				remote-endpoint = <&hdmi_in_lcd>;
> +			};
> +		};
> +
> +};
> -- 
> 2.23.0
> 
