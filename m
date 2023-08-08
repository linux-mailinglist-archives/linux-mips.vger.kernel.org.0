Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F24FD774305
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjHHRzY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjHHRy5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:54:57 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58F4A5D5
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:24:44 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9a2033978so90881931fa.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511873; x=1692116673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wSCMvsrvGtP/SRB0drN+VU/GnJ3+psGhnVmypWifVc=;
        b=jWIPe1z62Bpw1snQfCKhF7FMzBI1Gds3hrcmTSP98SQrTiO+xh7eEw7hmbDzqtt1Ux
         lbkd46oDeCL0YoAtdbPhrr4xlwxBHF5Gqe6BitgDN7z6TOCn7NIOJqOMeqYBm87BdUaC
         3rXHRPpLc9WOiT/zwpeC4THmuaiaviWd5HVvp1f9TP2OkUGUBYqK1jmOGNgXqDoKBtn3
         XJufebBTEE9Pr5zbHysP/2b4vPfHui7h48VtpmWB/aZKtrT6dLWbgA3XqPyULK1BvhZr
         iiy1A6bZH0QC//ykm9f5X3qaZ6hIM59bSUafbK/l3SjiUpoL/+Lc7IO3M92ahLF0LrQ/
         1npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511873; x=1692116673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wSCMvsrvGtP/SRB0drN+VU/GnJ3+psGhnVmypWifVc=;
        b=RncWY2EiFvy3Gd0ujqXRSLqTkCY9ftY6wAXyUGo0y5XRCQhd4SwJLTiGWlCdlzaGVh
         5TP6tSODn+2wwjHVKmdUGjyzo+LEAxVJhgUaVhYcuIrXyyMetVab/QR3wfLLX98jh8IP
         V000NEiBV/SUnkm4fbyCfJH3VuHTfkiSlZIFhP93GP5Zh3VQutSEZBhzl80lCBYMncDy
         Ol1Z6tR1jNAGU4G7Qmv5XxlpVFBoWZy0IWsJwDG6RTMX5mnwIQp3/qIzYCxORrpqQe/n
         b6UuaZqnjlNeWFvoABvxHGkSsR8BjXifqCnSq8Jz2/1Rhk1k+sUj2R6VtVXE1VV4/cUg
         oBew==
X-Gm-Message-State: AOJu0Yy6lYwky3y0GosY9ZyDsE8J/Q08n1Vk/YWDrVuwUmLzo/8P7+E/
        /gQzK6PGw+eoRy4Jfw+nmosH+cK3TkvITjoIvyY=
X-Google-Smtp-Source: AGHT+IEt+Kf3mPdgxinq+Mt4SlVaTOKw94gaghcqyMPjmABWGoq+4o6zGEM2ZElSHkgdewFxWTvliA==
X-Received: by 2002:adf:ff8c:0:b0:317:df3e:13d with SMTP id j12-20020adfff8c000000b00317df3e013dmr5441304wrr.38.1691487443405;
        Tue, 08 Aug 2023 02:37:23 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.177.253])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d474a000000b003141a3c4353sm13073883wrs.30.2023.08.08.02.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 02:37:23 -0700 (PDT)
Message-ID: <cbc22d2f-726d-86fc-1f34-c529cd91fdbe@linaro.org>
Date:   Tue, 8 Aug 2023 11:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] mips: remove unneeded #include <asm/export.h>
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
References: <20230807153243.996262-1-masahiroy@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230807153243.996262-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/8/23 17:32, Masahiro Yamada wrote:
> There is no EXPORT_SYMBOL line there, hence #include <asm/export.h>
> is unneeded.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/mips/kernel/octeon_switch.S | 1 -
>   arch/mips/kernel/r2300_switch.S  | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


