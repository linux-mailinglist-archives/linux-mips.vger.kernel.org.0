Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49EE5693F04
	for <lists+linux-mips@lfdr.de>; Mon, 13 Feb 2023 08:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjBMHni (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Feb 2023 02:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjBMHni (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Feb 2023 02:43:38 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F72BEB47
        for <linux-mips@vger.kernel.org>; Sun, 12 Feb 2023 23:43:36 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so11113703wrv.7
        for <linux-mips@vger.kernel.org>; Sun, 12 Feb 2023 23:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WncHzNCIjcRzD7asQuwseiFiSKek+vLGFO0rnFKEEi8=;
        b=uN6XDCOjm5ZdbOyb5vsUqiOZNqidqI+E4JlgDjPqBPOQ0qUYBP/hQMWox752A64/0d
         TKji/Mx9+JjdM4BGEpitRNfyLugnWh+rAP+3KrAYRaUL0Xn1CGDEOvqbsGPC6Q7YuLs6
         XLllIAk35qsRSQsWQmRT8CvRrExqRirdCHcMasPkWch08MRId9Dn9ApCse3Bw5MxwT++
         peeBrKyEzjl4/qyJw3QGQVe6traTHkLa/5PaFyUEYGYi5lMT9tkW+sQl3ldUFmVUYTxU
         0tTxpBnzZuqxQfzXt1DcwzTo0Z8U5TJCLtG5jk6MeARg/QpMB8YrHkku+YZHa3shV7wm
         Y/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WncHzNCIjcRzD7asQuwseiFiSKek+vLGFO0rnFKEEi8=;
        b=zQ6/BaqnV/ngXFpLCIlCCvRz9pKOjdPEqZkdo1KH0Gtd18JNUGRZ12Cv0McmByn1t7
         dDHWd6JZpgiTHXzKxYAEsM3InazWNUSpNM5BSCIERiSXSB2fmSYCrFdQZDaaNwRPfmSk
         3xHLtViqmcDdHEsl+j7YdHbMtE1G7NJrmyabMTs6jpa0hEuU5lynD8QjlyyVS5Vc3tU9
         DzvP/dTXQZIyrwZhmLwW6sMnmgbHk5tXYFerbFVmrMnp/CP9WYPPwyjFOVE/e8FajE4C
         i43x0ODZWclDzkP6gOWSwEgG0jg1B+bme9dxASQkBKHusvRiu1/iDhmAqjL9Z5n0n/RR
         DWGg==
X-Gm-Message-State: AO0yUKVAYkTxW3o+nO0FVSsD1mtnWjHB/b+L7tZAmVJ+K1ptUu93Pajm
        PbkvaLdZ2KyAtns4w0bfvKaivuyLrWfjUmji
X-Google-Smtp-Source: AK7set9gM3U6nf6XubMsmOVtYAlQ4bJVEMUUhTbjkzZQuQBRvr4ASHMO65QFkbNJ2sG+BF21KyhkTQ==
X-Received: by 2002:a5d:6307:0:b0:2c3:e993:9d81 with SMTP id i7-20020a5d6307000000b002c3e9939d81mr22074934wru.66.1676274214913;
        Sun, 12 Feb 2023 23:43:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d6850000000b002bfbda53b98sm9812603wrw.35.2023.02.12.23.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 23:43:34 -0800 (PST)
Message-ID: <3318261e-ce1c-3a6b-f206-898bda86d0d7@linaro.org>
Date:   Mon, 13 Feb 2023 08:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] MIPS: dts: Boston: Fix dtc 'pci_device_reg' warning
Content-Language: en-US
To:     Genjian <zhanggenjian123@gmail.com>, paulburton@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Genjian Zhang <zhanggenjian@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
References: <20230213062451.1688755-1-zhanggenjian@kylinos.cn>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213062451.1688755-1-zhanggenjian@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/2/23 07:24, Genjian wrote:
> From: Genjian Zhang <zhanggenjian@kylinos.cn>
> 
> dtbs_check currently complains that:
> arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg):
> /pci@14000000/pci2_root@0,0,0: PCI unit address format error,
> expected "0,0"
> The unit-address format should be '<device>,<function>'.
> Fix the unit-address accordingly.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
> ---
>   arch/mips/boot/dts/img/boston.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


