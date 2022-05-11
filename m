Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A595A523817
	for <lists+linux-mips@lfdr.de>; Wed, 11 May 2022 18:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344273AbiEKQFH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 May 2022 12:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344293AbiEKQE6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 May 2022 12:04:58 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E201D676D
        for <linux-mips@vger.kernel.org>; Wed, 11 May 2022 09:04:57 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id be20so3064688edb.12
        for <linux-mips@vger.kernel.org>; Wed, 11 May 2022 09:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zhzfElQRl5MOkLkJ5Z0UWKiVUuIziFKhS18iDfIQ4VY=;
        b=nbBvrJTpjfdQgQcGrof/Mf8rRIBeGm72yj2414PXTgwzzM37ucAsLmIgO6xt2snePR
         T89cewY4ERjSp3S0c5tqD7GPbijb/WEUswgV1D6X/3+FxEnlVDUceKORFlsg5oSbLJgw
         CZMMS5dxlRh33/MGGRQrpTKYn6MtWPj9vT0hxl/cBulCMRAAbDWE+T3evOXFE1GD3nP8
         Z0gmEjsTyGW/z0kYpP4qAuPdgo7N+yUPi9/3gctg95qihtv82EinJGQKydQCo6hP4puO
         7A/w3sQ+H3gl8UskKu/ovK0sNeb8gcUKmU0Kx+BH0Z/KDljivTqLc2pc/dpwKAjY/Z3W
         Pvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zhzfElQRl5MOkLkJ5Z0UWKiVUuIziFKhS18iDfIQ4VY=;
        b=EAn7O53qCGDJvZMYJuQ457X5C14V3nXih392SEBCtjDWB8wAoYQFyAScZGa5elUt0x
         7wYWPsvS3dQhEnq+khcrAMBc+PJf7p9mOnYZ9krhrGN/BqTyPDvTFbpY5y9D3hdh2mhj
         nibpTD5gfXSN85JCwwdlV9ImztAHwLKfyRl+ErLhWp2tuW5P7JA9aX5g9zth3gczjXaX
         EIcPSo6ejoC+EUTuriT6/wgzU2qxGeFn+RbWdhq0xLbQNnWaEwbbW2VRyfpitqgL94Gf
         Y02vbMo0NwY07Ci+YyKCTLMbm+CA0vCVrKwvr9EwgdQHMXnShXSXOWWbQz5nQ96PKUPY
         hYdQ==
X-Gm-Message-State: AOAM530Fu35UR1Zk9zj4kg7lHLyfr/3SiiPOoS/HPwzQQoBiUbNQlEMH
        RByGLoWU7Q/7NFgWSXiAWay4Vw==
X-Google-Smtp-Source: ABdhPJylosVXnllzRYYq4Rr99hTBaIEh1oMCfb0vAxNTKIJltsYhWZ/ZYXhkKEM5ikATzaLSX3oMNg==
X-Received: by 2002:a05:6402:3585:b0:427:ccd4:bec3 with SMTP id y5-20020a056402358500b00427ccd4bec3mr30011053edc.2.1652285096044;
        Wed, 11 May 2022 09:04:56 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d2-20020a50fe82000000b0042617ba63cesm1345920edt.88.2022.05.11.09.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:04:55 -0700 (PDT)
Message-ID: <012b7b4d-c9a5-9656-0a21-45bb8e0c7795@linaro.org>
Date:   Wed, 11 May 2022 18:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] MIPS: Loongson64: Add Loongson-2K1000 SMP support
Content-Language: en-US
To:     Qing Zhang <zhangqing@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, yangtiezhu@loongson.cn
References: <20220511083007.17700-1-zhangqing@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511083007.17700-1-zhangqing@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/05/2022 10:30, Qing Zhang wrote:
> +		if (loongson_sysconf.nr_cpus >= NR_CPUS)
> +			break;
> +
> +		hwids[loongson_sysconf.nr_cpus] = hwid;
> +		loongson_sysconf.nr_cpus++;
> +
> +		np = of_find_compatible_node(NULL, NULL, "loongson, mmio-ipi");

Please document compatibles in the bindings.



Best regards,
Krzysztof
