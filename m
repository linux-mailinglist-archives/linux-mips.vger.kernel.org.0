Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3C364AA51
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbiLLWc5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbiLLWcy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:32:54 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11276BCA1
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:32:52 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id c66so15222838edf.5
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Pjg7gEEIEiqG8qk2Ag4JmG2Wml3Gf+/D4oy6vrZzZk=;
        b=xag3aT0psNGFTj6HoRP4mFN+Tv5GrB35lv/JUZKmQhtLPegCrvZwdDUSxVPaFKqFjX
         jfxG7SrIBf3aEEfd1m8fT66MnkCbuaZaWRDbvFxAxtX2CsLOnRFN2uMTh+cKrftASE6K
         nJ9u8XyOfoV4IDC8AqdJkUp9mz+OUNsGslBhJDTLNx+V7d+5LsZjZZz+AHD7q2QWRwJR
         keEvy2cYu0H9a+jJlpX+2oDA6HJNi5Nq2if1Qu4L4gxi/nnhwBoH1Jbs5CfeEDWAFasa
         ASctHEKRJFsKHmd6BVJiEYtT25v/8RODzt7/eNCOZb6fJ3puDG/7gs7xFWC7y2DfRSJV
         +vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Pjg7gEEIEiqG8qk2Ag4JmG2Wml3Gf+/D4oy6vrZzZk=;
        b=Po6iOq3r4zXAi5oCkvsjJSW8oh233K6BVwIDDNiJLmD5uFnWVTl4h7k0uKhCXwbdXX
         K+n5sfs4maAc2SmIlavN1RtfuN7nvphJsbF3fTbxHlX+ghXqOv0MJHt13jOQX6fvmh7f
         Eqr4bQqEfPACEqWQivmH+L6iFxW5lVd8OhWlw+ZMDhrgosNk6THmNu3hbEVc0sVpiH0f
         zX1zOWpPKm/99YqvRp8sNSWxQ4n0suZ5i+NUuyp7Tdlw1ccKASLBQnxe5Nhcv60sOHmL
         Aaf3mIphgplA68f66DAnZdFd2t7URFOlH+s5o5sqXja7A/NBUi4PMiTHwypthfAtTm5q
         jDbw==
X-Gm-Message-State: ANoB5plD5EgPIBihxpos/QmDqWzXvFzSmAYYIfk4jjS4zFzAaHTuF0r2
        hF3RuhF9g6flFPPptgQ/6KVmQQ==
X-Google-Smtp-Source: AA0mqf4dgq6Z+VUlK2J2S80+mq9mLtLqx77Gpw8++bCFzvwCrmOS21zVC/w8NXL3b0+mwn2Zu0jkNg==
X-Received: by 2002:aa7:db91:0:b0:461:9075:4161 with SMTP id u17-20020aa7db91000000b0046190754161mr14410616edt.15.1670884370561;
        Mon, 12 Dec 2022 14:32:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id m15-20020a50930f000000b00463597d2c25sm4368051eda.74.2022.12.12.14.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:32:50 -0800 (PST)
Message-ID: <6509898d-a16a-7202-f650-0426936ecc34@linaro.org>
Date:   Mon, 12 Dec 2022 23:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 10/19] irqdomain: Clean up irq_domain_push/pop_irq()
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-11-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-11-johan+linaro@kernel.org>
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

On 9/12/22 15:01, Johan Hovold wrote:
> The irq_domain_push_irq() interface is used to add a new (outmost) level
> to a hierarchical domain after IRQs have been allocated.
> 
> Possibly due to differing mental images of hierarchical domains, the
> names used for the irq_data variables make these functions much harder
> to understand than what they need to be.
> 
> Rename the struct irq_data pointer to the data embedded in the
> descriptor as simply 'irq_data' and refer to the data allocated by this
> interface as 'parent_irq_data' so that the names reflect how
> hierarchical domains are implemented.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   kernel/irq/irqdomain.c | 65 +++++++++++++++++++++---------------------
>   1 file changed, 32 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

