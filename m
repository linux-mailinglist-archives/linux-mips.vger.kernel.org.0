Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC3878288A
	for <lists+linux-mips@lfdr.de>; Mon, 21 Aug 2023 14:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbjHUMGr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Aug 2023 08:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjHUMGq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Aug 2023 08:06:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27844BC
        for <linux-mips@vger.kernel.org>; Mon, 21 Aug 2023 05:06:45 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so3919539a12.0
        for <linux-mips@vger.kernel.org>; Mon, 21 Aug 2023 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692619603; x=1693224403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2S+WETvfAyrCVF8DP9tvmJJ5EWf71P/PjeMnXn7n6Lo=;
        b=AKZiy1IcmrTnS8t3Aj69f9szwT2W6buD4JdkJG4PhzNFd6RC8DEOEnJzG38wHiY0Ct
         lmbiwczvEAh2uxmGvZAgXbiZ017Oi4wm9iR7//3Zuuf7YMYcMNn1aUN82CmnWaEzEQIg
         ZhBKp2uSyMsg1I9vn/xFo1RVwdnSQA6OtyXdtESjctJucwdoOQ9sn2Nb/5uw9G7DlkqG
         qloCTWdZbnsV72yu1caka78IiEqhakoJYJKc60vARtuWBqeL7KqzEXi13BSS9L90bhTF
         angIuJ2m55GyWnP4ZlERe4CPo6mqJtDkwRVBdSh7h7nCsvmDBiJsGgxCo54DH/y+MXo6
         ou3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692619603; x=1693224403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2S+WETvfAyrCVF8DP9tvmJJ5EWf71P/PjeMnXn7n6Lo=;
        b=R3ISTtVSz3slAjnNX81QMn+16wcZlgqmbINwNK8mZ0Y6HeowMiaY8ho//DEMMn2WpK
         GL67xaVe+t9V6uCTtxFQ4BFleTBuWiygkGx8Wcja0JK1VPuEGXhfQMfW1i9kZxYYp6iP
         Ow0NreBoDUxmrT3YaNo8+ArFsEbLDretTOUZI51+699X+yMODBhN0pJlQTuZ1xRxHXjb
         1nJzwpkigmwwFq7OfpBo7YlfqdVz0nxd3a/L9EFagGZQm66oKEj9zk9iVF8cnCMr4LEB
         0m4SvOLlNMThr1kPamcS4t0Uyl0TgkMp32pLrz0nnkGVdm5W3t7eqC5feulIOubDWeVH
         iYmg==
X-Gm-Message-State: AOJu0YwWVFFOLuyjUPkERlh4f899r7/dk8JYYkT2zzO1JGCpTR41EiIP
        xkD2ThSgN602qyXXJewC+FupCw==
X-Google-Smtp-Source: AGHT+IGA3fcwCUwoHfQmYSY/wtDyAlgOxfO0or6c6j0Qcinb4t2/XgeaIcZi4syQvHqfZpMf9jNYmQ==
X-Received: by 2002:a50:fa93:0:b0:525:d95b:cd46 with SMTP id w19-20020a50fa93000000b00525d95bcd46mr4674958edr.2.1692619603593;
        Mon, 21 Aug 2023 05:06:43 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id g4-20020a056402180400b00525727db542sm5974464edy.54.2023.08.21.05.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 05:06:43 -0700 (PDT)
Message-ID: <ebad4f91-3d4e-c50f-0bde-f11f16061214@linaro.org>
Date:   Mon, 21 Aug 2023 14:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: syscon: Add compatibles for
 Loongson-1 syscon
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 <a9a7b65c-ef0b-9f66-b197-548733728d44@linaro.org>
 <CAJhJPsXEf0Yuxasq24X=x_JtUJZrNC1aowfeuu9QM2kz+A=asQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJhJPsXEf0Yuxasq24X=x_JtUJZrNC1aowfeuu9QM2kz+A=asQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/08/2023 13:00, Keguang Zhang wrote:
> On Sat, Aug 19, 2023 at 10:23 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 16/08/2023 13:13, Keguang Zhang wrote:
>>> Add Loongson LS1B and LS1C compatibles for system controller.
>>
>> I asked not to use the same compatible for different blocks. Compatible
>> is dwmac, but are you still going to use for other blocks? Please write
>> proper description of the hardware.
>>
> Sorry. I didn't make myself clear.
> The SoC only has one syscon with two registers.
> And Each register contains settings for multiple devices.
> Besides DWMAC, this syscon will be used for other devices.
> Should I keep using loongson,ls1b-syscon/loongson,ls1c-syscon?

Ah, ok, then the naming of the compatible should reflect the name of
this syscon block. If it does not have any name and it is the only
syscon, then name like "loongson,ls1b-syscon" is good. If the block has
some name - use it in compatible.

Best regards,
Krzysztof

