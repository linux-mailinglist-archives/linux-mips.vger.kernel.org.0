Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF07819FB
	for <lists+linux-mips@lfdr.de>; Sat, 19 Aug 2023 16:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbjHSOXp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Aug 2023 10:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233398AbjHSOXo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Aug 2023 10:23:44 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157D3B26E
        for <linux-mips@vger.kernel.org>; Sat, 19 Aug 2023 07:23:43 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so2385852a12.0
        for <linux-mips@vger.kernel.org>; Sat, 19 Aug 2023 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692455021; x=1693059821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+H6LiI1fuzN7XDYYZHmb/bhyxb5oDWpcZV5MPYgeNM=;
        b=cdwgqQ2/540qB6iDOetvo5+7VCwQmYK4ucktUn2S6tKhleFEfC1EpTZ4JYACvovMTs
         q80w44G8zoYpOEESt9mribtnkSPAHijp742ibvWl8G2spBUc7A2iyJpbe/+hSxq1JiLX
         VvttIM0PsbTvRlYBAFBKAbcmgwA9etZvKcfnollWct4wPA0vhah6KZEW2ZD6QuU7zPN2
         NWFsh418VeYs6g5dM9/AzGVVFrneFiV7dBvS2oVMsPO3IkEoH9oLi6HM9FA+Fl6QJLwC
         XmB91+4b+nQ3SNqUIn062zB3z3DnD8GY7VgF1SO/tA9mYy1gS8dq8ebRWlR97rZ67gAC
         tDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692455021; x=1693059821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+H6LiI1fuzN7XDYYZHmb/bhyxb5oDWpcZV5MPYgeNM=;
        b=TSYk8/N3J+H+Z1Cz4uR5ZqWTzCAUcK/ysn12H5gIk585udpv3vaqlO4rPgu47jeU/G
         jIuMaS5qggDzFg58P1N7AK1qn6nK8n7fUyqGICzZyUFQU9QJ7UrabIKdhhPqitk92ryk
         k8BeKRY1dwb4GuQ+Qy+uLnB9foX5je+vYq1QGobjTfcD8KrmSVOdnyx5SB8hqz0f0FDQ
         9cBczDvkkBzjiaNcyp2SiGE2X2i8VbHgNcqlEINUJA7ReaA2UpOv/QspvXxwbOdzgyql
         xLkdH+UdPiHlJEuNIx7LRGZFsotNTJcGXtXmEMxg0xwG8u6FyPDZ9l/K3s3l8bZ7Ccla
         ZHcw==
X-Gm-Message-State: AOJu0YxCLU9jvKBqMwKK0lpihCIeWgp8Ewq+YHTwgWh2wTH4EpWgNvXz
        rQbWxu4D0utrH9IuNFUw1H42Zg==
X-Google-Smtp-Source: AGHT+IHfb3IPptZFQYePiW40IL2RA9ejCLE2dfITH1lklobH/LC3t12t/Nl9vvFFC1Zf4mKowMUWvA==
X-Received: by 2002:a05:6402:1610:b0:525:70b3:72c2 with SMTP id f16-20020a056402161000b0052570b372c2mr1608371edv.14.1692455021626;
        Sat, 19 Aug 2023 07:23:41 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id m10-20020aa7c2ca000000b005257580f5ddsm2606079edp.71.2023.08.19.07.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 07:23:40 -0700 (PDT)
Message-ID: <a9a7b65c-ef0b-9f66-b197-548733728d44@linaro.org>
Date:   Sat, 19 Aug 2023 16:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: syscon: Add compatibles for
 Loongson-1 syscon
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20230816111310.1656224-1-keguang.zhang@gmail.com>
 <20230816111310.1656224-2-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230816111310.1656224-2-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/08/2023 13:13, Keguang Zhang wrote:
> Add Loongson LS1B and LS1C compatibles for system controller.

I asked not to use the same compatible for different blocks. Compatible
is dwmac, but are you still going to use for other blocks? Please write
proper description of the hardware.

> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Make the syscon compatibles more specific
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 8103154bbb52..d701fff02abe 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -49,6 +49,8 @@ properties:
>                - hisilicon,peri-subctrl
>                - hpe,gxp-sysreg
>                - intel,lgm-syscon
> +              - loongson,ls1b-dwmac-syscon
> +              - loongson,ls1c-dwmac-syscon


Best regards,
Krzysztof

