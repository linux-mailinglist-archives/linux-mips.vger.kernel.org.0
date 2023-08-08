Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424BF7747C4
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 21:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbjHHTTM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 15:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235372AbjHHTSt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 15:18:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF2015CAE
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:41:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so94410111fa.2
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512915; x=1692117715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0zLEburh9ZFfE548pNOj7q2UOj2GGR4k/WQno4jj70=;
        b=kn7CRcOb1CEwPjPNb+vVGa27/xG8Sd+MTOM5rFyo+Z0wsIRfWpH2jiXqbGh0gH/s5t
         QcY4gyJ860wIJneeJU3dmofZp98ztc2a/Hnn3kuhgIwbJWdp1O/O83T7mnQTgk4Iw3rF
         nrulWZgZrtReNDBlFFv95DKaUvv77mF1IqjUg28u9EcmmG5993nfjLbeF6u2cV5BROrR
         M/q1mslAd+tDDAxXtWZLeKo4ztFoxAjahDfPDXD03U6An2YEBO71665NsNZCJKTPB41W
         GdDuESXTCrfMMbYoQTLcHNZrsuE8tpd7E1tNrdS9aijB1ykGgU51jB+nEJp0MsvaYnpf
         lMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512915; x=1692117715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0zLEburh9ZFfE548pNOj7q2UOj2GGR4k/WQno4jj70=;
        b=ProMX4XDzFKkywmj+fhOVVuUBoL6lm9K8wzxFo2qRYyNuC8PeGL82r1QpegQ7v0ofe
         SwO7bGQ1Ss4Ipitlp8rrr7uTWGxSV01VrJ5OoVuHprruHgkanOll9VR4c5/nMkHJJard
         lYJBiuHw2GevZwrwsY2oc1SZaCIpis1J62xpGXE8dxOLtALQv/o36sSmOQY8nRh1dUK7
         YMSzt+ctjzKnd+mQjOjhQyTS8ItpGxLKvuE1rZ2qaIrprg6bmmAH4oZjbZlVPLx7SqSJ
         0XNUuCFoi9rWiCLnpLWbc8nE1y11M0TZ6y6FAygl3lnMZmLSTk0+bcge+kQo0viS5cOJ
         sGFA==
X-Gm-Message-State: AOJu0YzPMxzLAGsR0lSR45meqBczThlvm5Q/jcPUZawfAGGcHkERh4b6
        xh7GlTh4Ytl0x1BYd115w37vK+RRyBEmEHnnnbA=
X-Google-Smtp-Source: AGHT+IENaoLogdmwEquxviK7pRALZnOeydEhILSaohDlqrXatiaCu5M9MfM3jQOl2xSE+z2HLZbssA==
X-Received: by 2002:a05:600c:2213:b0:3fe:2b76:3d7 with SMTP id z19-20020a05600c221300b003fe2b7603d7mr9376833wml.10.1691487533357;
        Tue, 08 Aug 2023 02:38:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.177.253])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c218d00b003fe2bea77ccsm13219267wme.5.2023.08.08.02.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 02:38:53 -0700 (PDT)
Message-ID: <60ac32e8-5fea-84d4-ff3f-f09e6f8ad499@linaro.org>
Date:   Tue, 8 Aug 2023 11:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] mips: replace #include <asm/export.h> with #include
 <linux/export.h>
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
References: <20230807153243.996262-1-masahiroy@kernel.org>
 <20230807153243.996262-2-masahiroy@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230807153243.996262-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/8/23 17:32, Masahiro Yamada wrote:
> Commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost")
> deprecated <asm/export.h>, which is now a wrapper of <linux/export.h>.
> 
> Replace #include <asm/export.h> with #include <linux/export.h>.
> 
> After all the <asm/export.h> lines are converted, <asm/export.h> and
> <asm-generic/export.h> will be removed.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/mips/cavium-octeon/octeon-memcpy.S | 2 +-
>   arch/mips/kernel/mcount.S               | 2 +-
>   arch/mips/kernel/r2300_fpu.S            | 2 +-
>   arch/mips/kernel/r4k_fpu.S              | 2 +-
>   arch/mips/lib/csum_partial.S            | 2 +-
>   arch/mips/lib/memcpy.S                  | 2 +-
>   arch/mips/lib/memset.S                  | 2 +-
>   arch/mips/lib/strncpy_user.S            | 2 +-
>   arch/mips/lib/strnlen_user.S            | 2 +-
>   arch/mips/mm/page-funcs.S               | 2 +-
>   arch/mips/mm/tlb-funcs.S                | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

