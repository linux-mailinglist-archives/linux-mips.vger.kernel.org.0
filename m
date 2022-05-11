Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12397523806
	for <lists+linux-mips@lfdr.de>; Wed, 11 May 2022 18:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344245AbiEKQEN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 May 2022 12:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344239AbiEKQEJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 May 2022 12:04:09 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CD619C38F
        for <linux-mips@vger.kernel.org>; Wed, 11 May 2022 09:04:08 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i19so4959893eja.11
        for <linux-mips@vger.kernel.org>; Wed, 11 May 2022 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wQ+4WhV6k9PLSLRu2ycXl8Jd/rTXVtAwxYwfDpJmHeQ=;
        b=FQkLZaRRby2FjgefqVXwZG5cd45AVoW5mBxIPs4/ACAjlfIUckJBfr7AgNJi1sA2PE
         ReehVHy+e71raZyAeffWYbk7GbIefoArYARSe77wZVjnD+2Lo9wxrNlVlhwG9W+YXezH
         UKayJlTm+Q5LNRo3yWmDq1Oe0fUV42F59X2waMA6k5OADRwy1mCKDOztRyTvlDazQtKy
         ipFNeMcr3uMJvngEOqbq68KVUZ8xU9bvzXIeGbWMwzpaDofS6Snx/XEqAJgtqn44AU6+
         aUfO0pbfTmbtc5tf0dsM3GASHxBAoc1kg8Og7SFY40rubqtkzTDwV9bZQnurARlWEfaf
         rcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wQ+4WhV6k9PLSLRu2ycXl8Jd/rTXVtAwxYwfDpJmHeQ=;
        b=SLu3EBittRL9svsteMw9wBO8BePbmpxSnJ+NfOahwR+3QR4/1qqHGYzNVOAc21OeSV
         lVMx997t3fvVUgeg8NVcGHxph2sIqdTQK4KJuV4BDRiqX3YOWXjXCS7fseWnM6WmAjqx
         y1RE0UvZ1oW7wG1gQxOUa0M10HCwsMK7eHpp6pfLTqfzVaeQ7N0P8mV8JZQh8nqG2jXW
         nrOv1CujxMEzRmpq2sMOmw0qcZsgpt6z0Az/57Gc6Mr4qn4Yn9/5UVBQZnKHj2muxq5r
         6iqw/N1lG+0zPkcD8R9t7l3+SEHgmmU8oUqE/c2VG1snpQHo7t0xuXPXOeFxIco22jXN
         7nqg==
X-Gm-Message-State: AOAM530fD4M9Hm1vdYsJX8s3k50Bo549FS/F/7Xo+MqMdzATrME6U1se
        BAY5ka5WECZZEMvxa4GxEG2Myw==
X-Google-Smtp-Source: ABdhPJyzXUV5jsqnDfWfN4VVucH3ddXpg1wmvj8zlxv9ouygUIznS3UcqdagiJVmiKJiJn3K6R3VJA==
X-Received: by 2002:a17:906:dc93:b0:6f4:6a27:41ed with SMTP id cs19-20020a170906dc9300b006f46a2741edmr25797324ejc.36.1652285047009;
        Wed, 11 May 2022 09:04:07 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f19-20020a50ee93000000b0042617ba63b1sm1325703edr.59.2022.05.11.09.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:04:06 -0700 (PDT)
Message-ID: <9dd9d22c-6933-3790-35e8-8de197d05d39@linaro.org>
Date:   Wed, 11 May 2022 18:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] MIPS: Loongson64: DTS: Add Loongson-2K1000 DTS
 related smp support
Content-Language: en-US
To:     Qing Zhang <zhangqing@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, yangtiezhu@loongson.cn
References: <20220511083007.17700-1-zhangqing@loongson.cn>
 <20220511083007.17700-2-zhangqing@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511083007.17700-2-zhangqing@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/05/2022 10:30, Qing Zhang wrote:
> Add the device tree node and connect it to the CPU nodes.

>  
> +	ipi: interrupt-controller@1fe11000 {
> +		compatible = "loongson, mmio-ipi";

No spaces in compatibles. The compatible needs bindings.


Best regards,
Krzysztof
