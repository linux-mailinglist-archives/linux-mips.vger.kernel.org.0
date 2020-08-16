Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C642A245700
	for <lists+linux-mips@lfdr.de>; Sun, 16 Aug 2020 11:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbgHPJOY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Aug 2020 05:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgHPJOT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Aug 2020 05:14:19 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5427EC061756;
        Sun, 16 Aug 2020 02:14:19 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h8so6869842lfp.9;
        Sun, 16 Aug 2020 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nRS8xy5KKg0A2EpBRik99wB7d/R4SGiRprYQmWpyF1s=;
        b=vZgeWM7CAbMoPShoNYwcwmY+D+CRzk0TTYeUrwgRwDSgkKpZYlzzWhMZDqxK/fldpl
         LNcHzOafvZYPl0vPNHbfBJCtmk4fnK/fFItxBaVJ+vpEcIkHcsmy/E6Yjo7ZKSLBKLze
         Dxjh5rkPKGGNhS4jt0dXxxo2ZL4dxL3W7HMz7QZRG8h5o9YBe5JeRmg+mfdt6UU4eOaW
         H/fQQlEYJvkaUeeGpZJ5/ObGvfypm1LdqKuP6V9+ABrOHSi09fa8lQ9BOcq/124Ppvjw
         SRyUYu0gy5+RCBVLJaf9NLUdi23nd6722KZqjOloUzSO1eqKH1ozeOpFJ7HYVpycISf5
         yNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nRS8xy5KKg0A2EpBRik99wB7d/R4SGiRprYQmWpyF1s=;
        b=WW4kdnyZahE6rXt4nAdM9dP2c+jmCMjLH4tlD9ULfpm74k+i2+uaYEIFy7WG/P5w7f
         0e2RxC+/wRHawLHey9RrpFx1lgDI93elGDEhUA+DOAzN6zfbG5yL7nSPycFyayJh1/0A
         aOfYdOGOr+XMPVi02pDh/e5yU5SdYhZPjwBB8L+MWxCe4ZR9BixCdQuDvq1fqxzi3mxR
         EL67+7ZJ5npDNaRicSaTp1ZYyYhZu+f0sReMV5CY9Bbh27zw/25m/Sd1dQDm//0y5QB4
         1vFjcqM2r2QN8lG50xvA9uI6APo987JhWfwMYeJNUVDpgkDWCL3txhEQioHp+c+Um3wq
         8E+w==
X-Gm-Message-State: AOAM533SGJLgxt819gew9rJJmA6D9H/5utzriN3ygA9Tqw/UnLc89AEr
        ZSIXDps7u4LyYTmWkLt2dDs=
X-Google-Smtp-Source: ABdhPJwND0zaoVDdKIx0jNVy/P2lKu5tpQxf5ND88STVv9awwnNTneuyGWdsx4IOe1WiLO1HhovsMA==
X-Received: by 2002:ac2:5cbb:: with SMTP id e27mr4974671lfq.121.1597569257570;
        Sun, 16 Aug 2020 02:14:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48c0:b4a0:8928:3616:29ff:cdbc? ([2a00:1fa0:48c0:b4a0:8928:3616:29ff:cdbc])
        by smtp.gmail.com with ESMTPSA id 1sm3401731ljr.6.2020.08.16.02.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 02:14:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] MIPS: DTS: img: marduk: Add Cascoda CA8210 6LoWPAN
To:     Hauke Mehrtens <hauke@hauke-m.de>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu
References: <20200815163514.11631-1-hauke@hauke-m.de>
 <20200815163514.11631-2-hauke@hauke-m.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <b6267d62-af3b-4d29-51b0-3a61d0fd2679@gmail.com>
Date:   Sun, 16 Aug 2020 12:14:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200815163514.11631-2-hauke@hauke-m.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 15.08.2020 19:35, Hauke Mehrtens wrote:

> Add Cascoda CA8210 6LoWPAN controller to device tree.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>   arch/mips/boot/dts/img/pistachio_marduk.dts | 22 +++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
> index ea11a21b133b..633a41954cc0 100644
> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
> @@ -75,6 +75,28 @@
>   	VDD-supply = <&internal_dac_supply>;
>   };
>   
> +&spfi0 {
> +	status = "okay";
> +	pinctrl-0 = <&spim0_pins>, <&spim0_cs0_alt_pin>, <&spim0_cs2_alt_pin>, <&spim0_cs3_alt_pin>, <&spim0_cs4_alt_pin>;
> +	pinctrl-names = "default";
> +
> +	cs-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>, <&gpio0 2 GPIO_ACTIVE_HIGH>,
> +			<&gpio1 12 GPIO_ACTIVE_HIGH>, <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +
> +	ca8210: ca8210@0 {

    The device nodes are supposed to have the generic names...

> +		status = "okay";
> +		compatible = "cascoda,ca8210";
> +		reg = <0>;
> +		spi-max-frequency = <4000000>;

    Only 4MHz?

> +		spi-cpol;
> +		reset-gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
> +		irq-gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
> +		extclock-enable;
> +		extclock-freq = <16000000>;
> +		extclock-gpio = <2>;

    Hm, strange spec for a GPIO prop, shouldn't they all be alike?

> +	};
> +};
> +
>   &spfi1 {
>   	status = "okay";
>   

MBR, Sergei
