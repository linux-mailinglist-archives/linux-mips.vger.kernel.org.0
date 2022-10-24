Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0397C60A903
	for <lists+linux-mips@lfdr.de>; Mon, 24 Oct 2022 15:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbiJXNOw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Oct 2022 09:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235157AbiJXNMe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Oct 2022 09:12:34 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9E015A3B
        for <linux-mips@vger.kernel.org>; Mon, 24 Oct 2022 05:24:39 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id a24so5451750qto.10
        for <linux-mips@vger.kernel.org>; Mon, 24 Oct 2022 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5D2qC8JkQWqg5OtsTeOnj08o8r3sOjBd1D5QMgS0xg8=;
        b=yYWOASGG8+yX8Jd0BSwaMrWaTQaF1idwVNY9mplB3kPADoF+qgXoP3xMZt2A9V4TMD
         U8KddUVeATgg0qHYSkx0ptmnMJq7I2xDfmVm0+IBUlBoGOikVUg9Jpwk5eMz6esfv7jd
         83x4lC2Sofq69o2tabvK/ys18bnZTnxdJABSz6ze4rVJYCwyxsa8HjsNkCqKRG0uNWvH
         N5ZJIeh9g+g1wjKWyOrYXlqKbl6NMW5lGWnwyj4Qpy1FoakM8J3AxonU/CD4QtVkm2/b
         Sfzabawmy1yKvL7B1nOt26XSLMopqoxqsGUmf+DS1zqXfy0gy4qzL4TDgyMmUgOehaeE
         ykeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5D2qC8JkQWqg5OtsTeOnj08o8r3sOjBd1D5QMgS0xg8=;
        b=t6yn10rt1E/vddW/perX3F8oqNYOM/1etoknbzfAWipZmYKcIQg3+BIC4g3QcugjWL
         wHUrfTnbR16nZr6pcBuomABFnAvjra6SD4Y7rZYXYB6Ve6/KH7tcepc3Q5AH9QYAGxjB
         9bFL2iQYsRQDd+VdJemzbR4MD6bSztasnyeRaMmg5jxuvAlIw42S3NBjXh8GJ+z5yydf
         SOBnZ1O2UHTTAGx13EUX0QjpO5qN8/UELNfbClKL1DDfs/rwmrmZrcCnJB407CnFup7t
         kTZRqleh5TojlPrmqgeKyOADLyYMIRPeVVbVa2vOsZc1Uq6/bDgdi4hyS6lc21XfdB4/
         SxMQ==
X-Gm-Message-State: ACrzQf2x4Y6g56LOIjlrigpflEolDbRriZtuwc0XRSzzUwqJGY5K8OeE
        9I0iQy50JLAG04hisRe/ciR5IQ==
X-Google-Smtp-Source: AMsMyM7WUD0Ah3DfBvBkzwZxZHjuXsIf/fAn07VWLqQ/iLKoKdePrhROBZ1MPk4ROCGiJJD/VF+9mQ==
X-Received: by 2002:ac8:5894:0:b0:39d:13b5:1afd with SMTP id t20-20020ac85894000000b0039d13b51afdmr16699085qta.127.1666614142269;
        Mon, 24 Oct 2022 05:22:22 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id y5-20020a05620a44c500b006b5e296452csm15355428qkp.54.2022.10.24.05.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:22:21 -0700 (PDT)
Message-ID: <10e29fa9-e1b5-9d3d-1dd4-8914c4444099@linaro.org>
Date:   Mon, 24 Oct 2022 08:22:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/3] dt-bindings: ingenic: Add support for the JZ4755
 CGU
Content-Language: en-US
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221024044057.4151633-1-lis8215@gmail.com>
 <20221024044057.4151633-2-lis8215@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024044057.4151633-2-lis8215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/10/2022 00:40, Siarhei Volkau wrote:
> Add documentation for the clock generation unit (CGU)
> of the JZ4755 SoC.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

