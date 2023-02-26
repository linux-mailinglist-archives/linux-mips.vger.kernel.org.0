Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA286A3457
	for <lists+linux-mips@lfdr.de>; Sun, 26 Feb 2023 23:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjBZWEr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Feb 2023 17:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBZWEr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Feb 2023 17:04:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B277D10A81
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 14:04:45 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h14so4353726wru.4
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 14:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSXafunZtmIEIWlDE5eKqBT8T9aqBbDgZ5Ej19LX3HU=;
        b=foTKKR6sSTgCeMvRsw/EaA6s4KLV3ATajLNAVXSnBcsBgY16VFj8Txyd7qW+xD0GcO
         RbAw1eLMkT5uOoYoGPmkdJeWg9yWE3cdLa0Xb4EtAjPKeNoruneTE7fSvowvgKNVLexK
         EruQsX/vDmKoSyaHcoL78Aweyx8cI+pUccWHBXKIPY/FcAvOgPJBbOOuy53jZFQ16a6c
         17/tB2iIXomTTa6XmawQCE9f5weU0dDPocDtx68aWRasq8g58er2UUmfK56LJLyPPNWa
         VvekMpr57dE2/9oeDSW69gWa+pwFQWdOakcYS3j1UbYSWq0fcNQwVWeNtPDu2MBJ5xRg
         0oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSXafunZtmIEIWlDE5eKqBT8T9aqBbDgZ5Ej19LX3HU=;
        b=MPrctBRaNEYC0dnzGUF02MrG6KQioRULkwDheFFhNu2cQwdfW+6G9a0762n6jaD5G9
         LQFn0Fngm8VjEzCqwlCTuMBqQwFyWwPr4IlbW6bJOIG8Ul1XgaMhcj4dv2cbF0XGibK5
         mkKbybc7cIymRKUA3uPalHG8FRCRF+aOaIgkrK1lDo9mVqKUa8jfWkh1dpFccP2ZWbkH
         rf1o8zO+OBhpLd4xwn+Y+XM6UsXnBozYQj0je9PIKRwlJ6KI8L1xlBEYqFMo0d+6Tk2t
         MSKoRMlRierL98O4GpvpU66XHsP8ooDqA3z8oN8TrWCN2tQmHmzZ7j51iizG5mUwS7rU
         i7oQ==
X-Gm-Message-State: AO0yUKVaGLJIaBPTicVlg4DYPJcRCi2adDH44dQQNvSNWWZOCbhfP7nz
        YHziKq+VvvCx6TpMJsvl5AzJ39s+9TOfCm9G
X-Google-Smtp-Source: AK7set9rdZu6+WN4vHh7T6dZmJx9zWFmzHkzBv0zEsaz1361aBObOSTcJSwiCPN5fTenMF97dNUTvA==
X-Received: by 2002:adf:db8b:0:b0:2c9:c65c:a23a with SMTP id u11-20020adfdb8b000000b002c9c65ca23amr3465818wri.28.1677449084137;
        Sun, 26 Feb 2023 14:04:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b002c794495f6fsm5204787wrx.117.2023.02.26.14.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 14:04:43 -0800 (PST)
Message-ID: <a2560752-f8b2-4b3f-7395-cc33cab7cfe0@linaro.org>
Date:   Sun, 26 Feb 2023 23:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing
 compare interrupt
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-3-jiaxun.yang@flygoat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225221008.8520-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/2/23 23:10, Jiaxun Yang wrote:
> In c0_compare_int_usable we clear compare interrupt by write value
> just read out from counter to compare register.
> 
> However sometimes if those all instructions are graduated together
> then it's possible that at the time compare register is written, the
> counter haven't progressed, thus the interrupt is triggered again.
> 
> It also applies to QEMU that instructions is execuated significantly

Typo "executed",

> faster then counter.
> 
> Offset the counter value a litlle bit to prevent that happen.

"little".

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/kernel/cevt-r4k.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 32ec67c9ab67..bbc422376e97 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -200,6 +200,8 @@ int c0_compare_int_usable(void)
>   	 */
>   	if (c0_compare_int_pending()) {
>   		cnt = read_c0_count();
> +		// Drawdown a little bit in case counter haven't progressed
> +		cnt -= COMPARE_INT_SEEN_TICKS;
>   		write_c0_compare(cnt);
>   		back_to_back_c0_hazard();
>   		while (read_c0_count() < (cnt  + COMPARE_INT_SEEN_TICKS))
> @@ -228,6 +230,7 @@ int c0_compare_int_usable(void)
>   	if (!c0_compare_int_pending())
>   		return 0;
>   	cnt = read_c0_count();
> +	cnt -= COMPARE_INT_SEEN_TICKS;
>   	write_c0_compare(cnt);
>   	back_to_back_c0_hazard();
>   	while (read_c0_count() < (cnt + COMPARE_INT_SEEN_TICKS))

