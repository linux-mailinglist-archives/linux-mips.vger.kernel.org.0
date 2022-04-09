Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F074FA702
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241490AbiDILJ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235646AbiDILJ5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:09:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAF7CC514
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:07:50 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r13so21903130ejd.5
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=isEupPNmUSBqHlPH1NCK5ao1OuidLb/sUUxLrv9MHTI=;
        b=Yg+Tfif591vtx/4cWHFwXnGE9qsdYtHxKVBG04wEAU/7PGQCPmBczTr9gnt7IMVdxW
         0/JXfI2y0Nc+qBv7VCgPJ5e+iIKCVz+Mn8iL+e4+dF4MQ55Fndn8t8X+lLnHW3VF9PIa
         FwNcxFkTKXbsSII2Slcu/oCVEDswTBrUtL3QtGYMmWdfY5vQ/2AgIHwDFbb4ZrOmxvMD
         GTl4dGQ7ba9bGir5ZkS1QqlstXjitjwjeM6bgKuviEm+wsIUJHgPbL/LbjdywNwOSeP2
         i5S7N/fRM0YTHH+ynLDxia0/Q0e5SCWrTP18LARONwNtkYojPCfRcdwz4TraS+jtsQtm
         /S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=isEupPNmUSBqHlPH1NCK5ao1OuidLb/sUUxLrv9MHTI=;
        b=q/uA7Vx4BGisw1WyijauZt5HTip3QrGS+xVHg/tt4E/ObwrCYJc62prtpCypj3a345
         x4H4B8MfLWlG1QG46ze+gqxFW6QXYdMB83pxrVNvHjj7ygNP60u92AR8iHre08AFvpTl
         02KIIBPF+KvmWQ5IXOmW7B1RS7tV/0go2uwfcd43XEDIPl+sOtoX6eqg8xlc/E0q7jml
         khSsoiH6Li4xNkrfB5qGC9pcliUVRaVqQwXmg/hbBqJOEIznS3fPfwO6JnZiepC6dsEZ
         06kXQPUbZ+4AYI/+/mrauo25JVijf/AEE005TuQgCt4OmAGaECOzAFy1yIhPRjMqrB7k
         3UZA==
X-Gm-Message-State: AOAM530q8+5ee+Kh2LaTwrECZieqdPzmrVgJd6Gi4TlLcveKU591NS22
        pRb6uxuQv1drrdXLOv0WDNc0vQ==
X-Google-Smtp-Source: ABdhPJz4lvDSMC+HRkp4gZ5wgA42u0MWihkT3xc5m2x0/t5mTiNwpj8pQy+egfUrQfW2Q3oRoU8iLA==
X-Received: by 2002:a17:907:1b10:b0:6e4:dae9:b8e5 with SMTP id mp16-20020a1709071b1000b006e4dae9b8e5mr22365650ejc.470.1649502468846;
        Sat, 09 Apr 2022 04:07:48 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id rk14-20020a170907214e00b006e803954400sm5248432ejb.203.2022.04.09.04.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:07:48 -0700 (PDT)
Message-ID: <24def34c-99c7-1496-127c-6c4865a5faee@linaro.org>
Date:   Sat, 9 Apr 2022 13:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/18] MIPS: DTS: jz4780: fix cgu as reported by dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <6665d5059c840a240721f9ea6ae4abc8536d0400.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6665d5059c840a240721f9ea6ae4abc8536d0400.1649443080.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/04/2022 20:37, H. Nikolaus Schaller wrote:
> arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000: $nodename:0: 'jz4780-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
> 	From schema: Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
