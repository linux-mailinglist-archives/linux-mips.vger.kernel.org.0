Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A111612679
	for <lists+linux-mips@lfdr.de>; Sun, 30 Oct 2022 01:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJ2XWM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Oct 2022 19:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJ2XWK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Oct 2022 19:22:10 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055F3D58
        for <linux-mips@vger.kernel.org>; Sat, 29 Oct 2022 16:22:10 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id b20-20020a05600c4e1400b003cc28585e2fso5993092wmq.1
        for <linux-mips@vger.kernel.org>; Sat, 29 Oct 2022 16:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhDiK7dye7eamxJrrtP8YrQ7lGawI/KZdQpXRO8QsLU=;
        b=gAmTOdKxDwAUpFmpFLHveCznZGdNV8MARmphHzegcYRqCHYxLWA2U1/4pcxAn5+iYa
         6UpM/8bGIi6vSEzL6ohGWAG3A9UoXJ5LkaTD8k9L1jGZICuT8vplrsODlnHTs8O4l5Gl
         zcXtVWic0EVUyXkc++EDE/1NpOftKm1fEzrKBrOvpcjhSvUIZE53ouwD/3Zlz0fB97Cv
         QbRDk3sBULRkPYiHiLRPQLq3XHY48s13RjLkU8lbuVv8DcXYz32LglrjuaoGbp9j6XqD
         NpEobpn+VsL2dATQSJ9BtAhz3gVQrNUlU1lK/rGrbz4Qg0T7YIm+UCvA0kSWJXTLPFgh
         ZLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhDiK7dye7eamxJrrtP8YrQ7lGawI/KZdQpXRO8QsLU=;
        b=EONteOXXjPg6hLoiAojKfwgABGfm6xGitJkA95HoIGt75qUK4pkbuNQIkT4K5aHiT0
         MnRhc2GBOlukwvM4jg+rMlpDzI/Ref48Fk5i/310HyLKhs2aUJNh0bntTS6Gj4F5SVu+
         URWO9P1ZYMI8PzaAEEIx9OdS/HfKtK5+CIfsWHIcFO1DF0obsIjZF3YIdjlNw6AwTeFV
         opmPpa+hyDEEk/dZJ2SMKSEaw9mNET9KArU4vLCuVoikh7OvIhtsgnY0HSGTOzY+JISB
         oP7zzjoH2jB7HRqvmezCNx23wYew3b9CVTV7Umwh42gw9o9LiVGtusxgSn67GK+fzQMl
         bqUQ==
X-Gm-Message-State: ACrzQf1PRSYPAU0CQ2+QRaxclRBWYV+C8/vqQhto7v6kR0wE1ibe0Irg
        JqX6QGECWBk5BMVPOsw15khVsjxQ50/blA==
X-Google-Smtp-Source: AMsMyM4GaZVwdX8Wr+Lr+kiwINE+wjQsl/HHdFQUrwrfT5IZOfjgFar3jV//xN2jNADpyKtDPmgWgw==
X-Received: by 2002:a05:600c:154a:b0:3c9:f0df:1cc with SMTP id f10-20020a05600c154a00b003c9f0df01ccmr13635104wmg.200.1667085728382;
        Sat, 29 Oct 2022 16:22:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id h5-20020adff185000000b00236863c02f5sm2568830wro.96.2022.10.29.16.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 16:22:08 -0700 (PDT)
Message-ID: <e0942c4b-8e81-5259-0c7c-97d09cc81669@linaro.org>
Date:   Sun, 30 Oct 2022 01:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] MIPS: jump_label: Fix compat branch range check
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
        ardb@kernel.org, rostedt@goodmis.org, stable@vger.kernel.org
References: <20221029203535.940231-1-jiaxun.yang@flygoat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221029203535.940231-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29/10/22 22:35, Jiaxun Yang wrote:
> Cast upper bound of branch range to long to do signed compare,
> avoid negtive offset trigger this warning.

Typo "negative".

> Fixes: 9b6584e35f40 ("MIPS: jump_label: Use compact branches for >= r6")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: stable@vger.kernel.org
> ---
>   arch/mips/kernel/jump_label.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/jump_label.c b/arch/mips/kernel/jump_label.c
> index 71a882c8c6eb..f7978d50a2ba 100644
> --- a/arch/mips/kernel/jump_label.c
> +++ b/arch/mips/kernel/jump_label.c
> @@ -56,7 +56,7 @@ void arch_jump_label_transform(struct jump_entry *e,
>   			 * The branch offset must fit in the instruction's 26
>   			 * bit field.
>   			 */
> -			WARN_ON((offset >= BIT(25)) ||
> +			WARN_ON((offset >= (long)BIT(25)) ||
>   				(offset < -(long)BIT(25)));

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

