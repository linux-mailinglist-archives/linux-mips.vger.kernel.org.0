Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CE0715803
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 10:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjE3IJA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 04:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjE3IIl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 04:08:41 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62EE10A
        for <linux-mips@vger.kernel.org>; Tue, 30 May 2023 01:08:25 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-97392066d04so620749866b.3
        for <linux-mips@vger.kernel.org>; Tue, 30 May 2023 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685434104; x=1688026104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQhjJ+6D9VsTTMDieSwfWtpvTuOPCjU+h7AtDdnwYcM=;
        b=iOIgj8Tjhk5wu3ob5u7Zk7NjAWU5m8PbqRtznROJZ30GAgsI8TvPzjRkDJXGqrwZtS
         eWoGfcuKJWSR7619n9y+doXwOCHSI7JpNx4TFwD5XflWa1Dsq4d6zeVlmER1b38973x7
         Ns+Ub1NTxEe9rzfJgXNQ3+txI+Yu174kPVlGS3ODtVJ6wb3dC3MzcqBgQwu/sPFpCD2H
         d3kkGmE6v4J0404GdcV6/++laiJeQxikgDv6MNUkrDkIKMWm4ln3GT96wnMuyrbDgUOM
         bos3B1G9EkWDLcKGdRPMWvhS7Kh+afVSVY9aInTrWW/VwaVpx+O5aZrHBqQKdu91TfXt
         PmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434104; x=1688026104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQhjJ+6D9VsTTMDieSwfWtpvTuOPCjU+h7AtDdnwYcM=;
        b=CMvDeYXsb4md2kJJHXJet+LkHzEGbMTXll7rN8j0wpI89FZPGFqDK5ikwHmsBWLSIk
         bEf89asrIcHIGHEZX4HoU8+sVoFwwfKfor24h9iavSe/3mzgUwC9WBiglmxVlbX8XaIi
         gFco/k9vKb1tYilyZeP+CNO71ih5uB+L0ebp6j9l0DCCHQOzngUmcp/0cyK25M9CgKkk
         aLbRAApMeTjj0cvz0Pk18GWS8K3Ybfm5tOuusxyTtbg1XUvc4eiRMv/AnmxA+Abaotst
         bDdBoR7EIKF9DV4IaLaboD1OPTgmrcUt1wOw3Y2fZlLu7cwe6ns2HI28s++So8UwiejF
         4DNQ==
X-Gm-Message-State: AC+VfDybCdgb5gmxi/oYuUb8w3AJMG+tJmeeCHzuINa6Nt4QzVNE9d1z
        pvtPFndR+4uboeoQtlMmIDwQhg==
X-Google-Smtp-Source: ACHHUZ7zESSJK/T+t45vczioXDndjnO+H2WtnGA8SN2N6SO/FRpryfGtWVdQHvCzmNgM89NX54j1vQ==
X-Received: by 2002:a17:907:97c5:b0:970:482:9fcd with SMTP id js5-20020a17090797c500b0097004829fcdmr1740437ejc.24.1685434104165;
        Tue, 30 May 2023 01:08:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id c7-20020a170906154700b00965ec1faf27sm6926113ejd.74.2023.05.30.01.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:08:23 -0700 (PDT)
Message-ID: <2f883bad-2f8e-ef03-fc3f-c13980fb1536@linaro.org>
Date:   Tue, 30 May 2023 10:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 2/5] rtc: Remove the Loongson-1 RTC driver
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <98fc717871d3a39b18ad1a26780d0d2cf1fa0896.1684983279.git.zhoubinbin@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98fc717871d3a39b18ad1a26780d0d2cf1fa0896.1684983279.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/05/2023 14:55, Binbin Zhou wrote:
> Remove the ls1x-rtc driver as it is obsolete. We will continue to
> support the ls1x RTC in the upcoming Loongson unified RTC driver
> rtc-loongson.
> 
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: zhao zhang <zhzhl555@gmail.com>
> Cc: Yang Ling <gnaygnil@gmail.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/rtc/Kconfig    |  10 ---
>  drivers/rtc/Makefile   |   1 -
>  drivers/rtc/rtc-ls1x.c | 192 -----------------------------------------
>  3 files changed, 203 deletions(-)

Removal in one commit and adding a new driver in second is not what we
usually do. We expect code to be developed and to evolve.

Best regards,
Krzysztof

