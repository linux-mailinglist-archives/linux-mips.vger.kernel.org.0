Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCF04FFA21
	for <lists+linux-mips@lfdr.de>; Wed, 13 Apr 2022 17:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbiDMPaF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Apr 2022 11:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236487AbiDMPaC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Apr 2022 11:30:02 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB7A62CAD
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 08:27:41 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z99so2835360ede.5
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 08:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FTu8nhpVPh5fCRzBhXpfj9kU4anJdDZdibBzSiYag/s=;
        b=kQ3skXsasLue6DVfv5y0FVEuxEDxG29Y1+8D8hwBIbSTT92Og5I/A8u7aa66H86CJh
         CTIQSnSYgU4/qo9oWpjORiObR3Was1RTWBru1doFnE8zXrEMb/qKPP8eTbTHhElU0GLe
         1vvO2N+LYhMuf/VG3LHuzlUdwGL5VElXRSg6dqIEoTlptbpYL5cnHeND+lmFVatTOhI9
         bYi6Pj/EZeidXIZV3QsK6lvx1Q0PMO8pNrA5/dXuPU2Y0OKbfG+MribaoA8zWd/q6eie
         xpLB37J7pD536qO/VO+N9y84bf8yf/YSD8hbxMCZq+Pta05qyjpnFF64F/rQv2rB+NSk
         JryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FTu8nhpVPh5fCRzBhXpfj9kU4anJdDZdibBzSiYag/s=;
        b=QMBwGP827FTdxvsLRqUxvuGZ9gzklJPsrWp9iI374bephWPYzbYOt8Bb3ZsDym5QYS
         OrybA9gdyvFUbXGa8eo9HHW9vQYGuWeNxSKagarRnYValw1/RmRKL6EZh9zkw9H6sqhe
         MkLPROtDTz8+j7yNI9/Z9J8xPC2jRAjR4kYxeqFAPDT2v0Z3vYl9LskTSeyNZT9PHE2a
         RfOLbggbAkwviP467sHF/84AOf3o9P+5ckuWcp/EkGY/BOEUIqWXLNpHH2h8bH40HYTm
         Mafu3inZKNi3PHcoSLG2+mgZuhjl0mtdItFVIQNe1uz2J520QcqaJKWNBUF6jBuLDLxF
         k7HQ==
X-Gm-Message-State: AOAM531qN/1FbDUYKVgo7g+8mnL5NhAhGG58EZTdGJnXeAI27o3jTFkI
        ZWThqHqPyBKWBtKsqX4AWaM1E/wyz7ka8sRr
X-Google-Smtp-Source: ABdhPJxLBhlLRJV5EZ81MU7GCxLdWOBxTjQoEXFFGHWBBg0qfHICCPTgJ254wpt2+5hAPHYiEZitKw==
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id c16-20020a05640227d000b00419518458aemr45052546ede.314.1649863659774;
        Wed, 13 Apr 2022 08:27:39 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7cb83000000b0041b573e2654sm1300328edt.94.2022.04.13.08.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 08:27:39 -0700 (PDT)
Message-ID: <b415523c-34e3-28a1-bcce-4682e7c67e77@linaro.org>
Date:   Wed, 13 Apr 2022 17:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/14] mips: dts: ralink: mt7621: use the new compatible
 string for MT7621 pinctrl
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-10-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413060729.27639-10-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/04/2022 08:07, Arınç ÜNAL wrote:
> Use the new compatible string "ralink,mt7621-pinctrl" for the Ralink MT7621
> pinctrl subdriver on mt7621.dtsi.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 3222684915ac..ee2ec78c8952 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -151,7 +151,7 @@ spi0: spi@b00 {
>  	};
>  
>  	pinctrl: pinctrl {
> -		compatible = "ralink,rt2880-pinmux";
> +		compatible = "ralink,mt7621-pinctrl";

The change is non-bisectable and causes issues all other users of DT
(other projects, systems etc). This is discouraged in general, so you
should describe it. The commit msg lacks answer to the main question:
Why? You focused only on what you are doing, but why you are doing is
actually more important for such change.

Best regards,
Krzysztof
