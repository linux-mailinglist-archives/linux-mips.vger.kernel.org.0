Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E76D64AA67
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbiLLWha (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbiLLWh2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:37:28 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D531AF3D
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:37:27 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id u19so13531750ejm.8
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1WUetBYNThrXDEMMntbaarrvrHXdtOCNZrl+VzZKug=;
        b=MLDyN6+nAXmM5DfxUdyZTEDh+ehlVackrDG3wvmu4pfUHZC1e3K0OPopvwgJYWdzfi
         62JOtzJaSmDl4mwgpLA4cvMBEJO7YuNHGNLwoBgn4Yj6H/YxDc6t9p/XDZASeklRwy3d
         6u/7g8ow1LaKb0L6Ki2T05BkqPzRI/eaSE7YhvHHL0hSdWsA4uo4IaU6QiwGvPUh1sD8
         +FIkF1xZnv+VZ0YP3XtIlWY4bxkuYm8Rw5oV8LfsvEKo7zgOxUI2wT28cVXvbqhwOOt8
         72Jwyx6eOdFDq9BfeJ3g2+ujMrjPeQozLipLxh144VmxyZfw+G1XQHX5hBZFkwezPdBd
         yFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1WUetBYNThrXDEMMntbaarrvrHXdtOCNZrl+VzZKug=;
        b=taZvBfZshSSrqnxDzJmzqdyfxYJP8JBa7BysUNvdKAH+kZcEoGh46SJTvNlGS5XtIl
         ue0CcHAguIIuiASus9IDGfcYrb4Js0C8erdNR3ETdB2K8k06XSI6RUFN0zPjH3OR1hBt
         NunNj+CUlEy896mDZnWNSX+nWdU3aG/10i8pPAwG2nKGlgDGtrriya1QYt1MpQHkajcU
         lc08s1TAV7tMFi3YuHGb9d/lJHmpfgEZPG5Ucuebuy3GIm9zSN8183Dp8+tgwHktXIP9
         DU44Urfd/mhEY57N3xuev72/RwiHmGC7l8CpKrU1wgY8nXFNUmq2XCN+kS/LYtcaRZ81
         S86A==
X-Gm-Message-State: ANoB5pnP5lafim1m1F/0nQf741ZU4cNX0LfFQX6WfEmH1Xu74AvVmS5L
        sap3MDBZoxLM2+5FB3+ZKoeq4zqdlNvnP/IDB8A=
X-Google-Smtp-Source: AA0mqf6yIAnGdXnp7NbEFZls+vm2Dkrbeg+6w0ghEYC+eqltyfEGIj3qnM9lbsClCR58Etq25SwjSA==
X-Received: by 2002:a17:906:c083:b0:7a6:5b50:a32c with SMTP id f3-20020a170906c08300b007a65b50a32cmr17103714ejz.12.1670884645674;
        Mon, 12 Dec 2022 14:37:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id e13-20020a1709062c0d00b007c0d0dad9c6sm3718304ejh.108.2022.12.12.14.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:37:25 -0800 (PST)
Message-ID: <540c6337-235f-c4d9-f646-5e1f1c77ef55@linaro.org>
Date:   Mon, 12 Dec 2022 23:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 18/19] irqchip/mvebu-odmi: Use
 irq_domain_create_hierarchy()
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-19-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-19-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/12/22 15:01, Johan Hovold wrote:
> Use the irq_domain_create_hierarchy() helper to create the hierarchical
> domain, which both serves as documentation and avoids poking at
> irqdomain internals.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/irqchip/irq-mvebu-odmi.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

