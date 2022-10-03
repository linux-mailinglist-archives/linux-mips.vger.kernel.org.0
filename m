Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC475F3910
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 00:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiJCWbE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Oct 2022 18:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbiJCWbB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Oct 2022 18:31:01 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D5256BAF;
        Mon,  3 Oct 2022 15:31:00 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id z18so7568386qvn.6;
        Mon, 03 Oct 2022 15:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NuITEX6P+MDGCLFsaWBYcW/pAivSy5wHmq9D4KKilv4=;
        b=Ghi8E9W1R28C006BusoIoDEjqvBGffxFbJWyFYF6n+u82OASnAu5m/cwu4GAQKljcw
         Poj+oljQY2Ae62b/3U1Cmg3ICWTXVS92k+WBwZktazMybPuovXeqWP/1Ra4mOnpR2bHv
         ibDcCnoUp22G/Tv7GTpPq2kC3jOAxqdULFYSZRvDPh/KgMLEXnWqXiENMuo/qVX4UhAm
         l2fsHWNUWts8t+JnzYelrbETLiAnzgyGWiVLPn5pEVV2a2yVHajR4BW4i9kGmp9VaLcf
         1PYauVCnu6itzD9t+HRDh4utjfp8WJGwKEeAuGJj38N688Tq9VttA3FoMyrMc63qV7cK
         WbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NuITEX6P+MDGCLFsaWBYcW/pAivSy5wHmq9D4KKilv4=;
        b=v996+thfxw81SezOsAwcmsg9TNS18EDoGIcJFRP6aTAftHoudBZfgTNb0g6/g0qslw
         cHPQXmIKvRFmg9g0TEs7m9hzubeY0LpPKDgAgE40d4IhEe+cq2eiH+8bx6NrUI8UN6Ai
         EmsvZk2hEztandX5tDRQprztqe9OuIsYpqXmwEA5ro4PY2Z1sfOiKUanFzRfa3axwhxw
         +GNACti+C6z7bspYn6UV8y7xefW7QdP+hb6zgQIuMViMhwme4fbx/JOHtPN4JdGyEGpa
         gd+kMGO7XYFaKIbwV4BZsu5YLS7kqVHC+dd3qESVY+A6/U+iP0/eNPoJDUElURzf9wBL
         3x0A==
X-Gm-Message-State: ACrzQf0Hm1IidGkmhVwtI642e1fd9VatHkgZMSS8DFehPYPZlYq/6bR3
        rNawYwm/UFxBpHlRVVKFthA=
X-Google-Smtp-Source: AMsMyM4Lzy6L7dC08yq6koQ2VoRbS+jFuLkfquLRlxUZ2uy3iUQA5Dn/wDCdrPGNVAKZX/fHWm87/A==
X-Received: by 2002:a0c:8c4f:0:b0:4ac:94fa:a587 with SMTP id o15-20020a0c8c4f000000b004ac94faa587mr17762289qvb.40.1664836259268;
        Mon, 03 Oct 2022 15:30:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05620a248d00b006cbe3be300esm12606433qkn.12.2022.10.03.15.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 15:30:58 -0700 (PDT)
Message-ID: <dbca5b5f-2fcc-8ef6-6081-e97c6304a7f2@gmail.com>
Date:   Mon, 3 Oct 2022 15:30:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to
 schema
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com
References: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
 <20221002091611.946210-3-sergio.paracuellos@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221002091611.946210-3-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/2/22 02:16, Sergio Paracuellos wrote:
> Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>   .../devicetree/bindings/mips/brcm/soc.yaml    | 97 +++++++++++++++++++
>   1 file changed, 97 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> new file mode 100644
> index 000000000000..a47a5bcc5e0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom cable/DSL/settop platforms
> +
> +maintainers:
> +  - Hauke Mehrtens <hauke@hauke-m.de>
> +  - Rafał Miłecki <zajec5@gmail.com>

Could you also list myself here, since well, I am still listed in 
MAINTAINERS for BMIPS, and CCing would be nice, too.

With that:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
