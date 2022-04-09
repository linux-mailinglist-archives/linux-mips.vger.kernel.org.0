Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944EC4FA712
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234649AbiDILP1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234286AbiDILP0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:15:26 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8456B3D1D0
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:13:19 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id g18so151578wrb.10
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TuErQkuuEOn8WB2O6luQVNrNid4jGQ5GmHFTv2toygQ=;
        b=UevEA2bHk+RlaXpKoOQS6U5rDandt76o4X1EA2r1oGvu1CSddUA/WAKRoQrX2lrMv8
         sMHaGhMTuX5RYKsApTv77kh6iaGtVWywJ/P+nN0rD3RcoDYn5w5lwf8VJdoBorFAslXz
         Reb97s6TjVI6L0RZkVuF11BidYlSpYAersuVnW4n+wWNod5+40uBh98kPU2If71tN141
         GeRykuhDPSM2RdMTqL9By3vd89mO4jBoCDbLhoCDSFU8ZK2zFBDpGG0vmOFRZM9X+sk5
         CIVk4uXeeL1rJzTzkQhwWLxmdZ1MgysRPCiXg1m8IQzwo+JW+JhnfABGjtMPxx+LLZbD
         6goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TuErQkuuEOn8WB2O6luQVNrNid4jGQ5GmHFTv2toygQ=;
        b=AGGCTQFFUNQSgqqq92oMB9lZvUuxMFJA2u1Nx6PKOvMUNB8EpbSJHwLSCrpw5mMPeO
         k/gezNjOH2WqmQTpm3yLZPjA5X8r++1lx6dQknQkHTRHNgt72GKBV/nNDVjH/W4oy9X3
         HAWfQY1f4GXWSSm2v+87gCsb27Ch473YAyPQfQxM4Pv3nUUUVjf2UGcueCqTooWTVnQZ
         sWdY1ZODX12pND4guvu32YkHwCfRWZAOpdJ3rI3u6xqfBDT+DEigdnXTf3ykVJg/vJ0J
         SIxKdPbup5y1WZZQY8kGIXM9iY57EABDTWcLljVBQjBjMwnjFd2z4Ah5lc6mpE5ixVzE
         A/Qw==
X-Gm-Message-State: AOAM5335d5q7oBx7HSo51HsnvJO3QI2jZwRo+aMk0nfU4MCeZOSXS6J8
        VdiDq4uAobca174Lr2pvmzni0w==
X-Google-Smtp-Source: ABdhPJyrcbW/Mtbb4wdNurtcN0Yq1yspudDmZbQ0PZ3Ft3My8q+TafmaVYwLRl8VkABsFidZNsdYqQ==
X-Received: by 2002:adf:ebd0:0:b0:1e3:f9b:7b77 with SMTP id v16-20020adfebd0000000b001e30f9b7b77mr17496157wrn.691.1649502798058;
        Sat, 09 Apr 2022 04:13:18 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id p18-20020adfba92000000b001e4ae791663sm21646403wrg.62.2022.04.09.04.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:13:17 -0700 (PDT)
Message-ID: <e905896e-335d-a88a-1961-d17b92e46585@linaro.org>
Date:   Sat, 9 Apr 2022 13:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/18] MIPS: DTS: jz4780: fix pinctrl as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <1941bc4ed553b27f399ad00ea61ff2b0237d14e3.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1941bc4ed553b27f399ad00ea61ff2b0237d14e3.1649443080.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/04/2022 20:37, H. Nikolaus Schaller wrote:
> arch/mips/boot/dts/ingenic/ci20.dtb: pin-controller@10010000: $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> 	From schema: Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 5f44cf004d473..b5299eaffb84a 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -155,7 +155,7 @@ rtc_dev: rtc@10003000 {
>  		clock-names = "rtc";
>  	};
>  
> -	pinctrl: pin-controller@10010000 {
> +	pinctrl: pinctrl@10010000 {

Do it once for all DTSes, not one file at a time. There are four more
places with this.

Best regards,
Krzysztof
