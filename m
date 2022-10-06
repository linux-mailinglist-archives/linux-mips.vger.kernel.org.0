Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A16875F6528
	for <lists+linux-mips@lfdr.de>; Thu,  6 Oct 2022 13:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiJFLYh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Oct 2022 07:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbiJFLYg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Oct 2022 07:24:36 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A559C7D8
        for <linux-mips@vger.kernel.org>; Thu,  6 Oct 2022 04:24:32 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so334250pjl.0
        for <linux-mips@vger.kernel.org>; Thu, 06 Oct 2022 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gifUoQyfVTXvnnQQZh1oWpKlxTHHKz89exGeUTeQCgY=;
        b=I9/uekaTCfNqct8MRMa71R4UDbUIZ60d5bOtbyLOtdRG8I4j2l8lOmzJG8s8kHVfo7
         26GbsFGbr5BPp/080q8VQnSNmOQxXZ8cVKDrkWbjcT2NDujSQ1juq9BFqPLTXBVo4tvv
         8GtXFGm6HF2QHk94HC4vAEZcMjRCj4HUp8/iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gifUoQyfVTXvnnQQZh1oWpKlxTHHKz89exGeUTeQCgY=;
        b=pTqfg6+0MhHJHC/eIIcZIpgTUp1bcelZCcadfIhFuVXEBehanLFx65/aKzUuSBglJ9
         wUg0QzYzIKzEUYKvlY7yFYmNsuZXp0/9nvlraBkLyxqA78PnMSNFQVwXvjhsvZpYYnsp
         /4+70haYd1doOqH1gzihOmS8z8vFbF/bz31xk2SGa8FVYxorLm+Xw0+X+TiZkDd1Yprl
         9n8cHZ86GFvFuRu0X96U3xrA0H7xUyP54DkG+bAiwZbOz/PJzhQSNlIcOr6sfdsiBEqa
         PW5CC7QlzlfRWvWgfdI2QPVdu3m3rsG/6m9b12b+MiiYyAT9AWcP7/P12QzOpSrsR6OP
         0rtg==
X-Gm-Message-State: ACrzQf3/Gwot3+PYprra/Xiigo54db13yDFgirJQuhaNHrDLm3aFFQLp
        fn+4KQGam/o5O/Jkj3dNN6wjAg==
X-Google-Smtp-Source: AMsMyM4DTXSuwWoCLlXovcwc/x6uo9Idhp/68xT7ggbYA4Dd9EH7xp97S9pCeMvAeF4ogys57Bg93Q==
X-Received: by 2002:a17:90a:9381:b0:20a:79b7:766a with SMTP id q1-20020a17090a938100b0020a79b7766amr10340400pjo.33.1665055471047;
        Thu, 06 Oct 2022 04:24:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id n9-20020a17090a160900b001f319e9b9e5sm2646443pja.16.2022.10.06.04.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 04:24:30 -0700 (PDT)
Message-ID: <615c8c6d-3eab-0474-2c2c-6442052c0eee@fungible.com>
Date:   Thu, 6 Oct 2022 13:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v8 1/2] dt-bindings: mips: add CPU bindings for MIPS
 architecture
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
 <20221006042945.1038594-2-sergio.paracuellos@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>
In-Reply-To: <20221006042945.1038594-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/10/22 06:29, Sergio Paracuellos wrote:
> Add the yaml binding for available CPUs in MIPS architecture.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>   .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
>   .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
>   .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
>   3 files changed, 115 insertions(+), 77 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
>   create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
>   delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

Reviewed-by: Philippe Mathieu-Daudé <philmd@fungible.com>
