Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8326864AA7A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbiLLWmg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbiLLWmT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:42:19 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539921B9C5
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:42:17 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id vv4so32076580ejc.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlcpoCSFPycnYPmcGjwQP3wltEsXbaHWAE6UH218S8g=;
        b=FUdJ5iTV1wYlEPR+1XZCG3Ze2S2IQEsI5yy7xhuu1azTqEO17S0DnhSvgijzz1AR1n
         LcXDvZNQOsxlUF8JFRRDX8tOYCxZsQXKxw4ORzmpuoPpJYxXQGa07AxKq23taOF8CWQt
         40QexUNFijWSeTCM8qCQeLCabVEsXCPTnLyWvXxzhPUHd69QWIgqMJ47sj2oxTJnWKOX
         u2/HkQabYHcjUHpevpqDQj2TqTK/eRAeeD0AQIkiheOKts8LrHRld0rg9JzLwUwhfdUq
         RSIsqs7C52c7j9Y8g6go6JfsUJgJBG7KtupNldSVqDE5lDiDzGB3OrKtUcSJUfveexms
         7yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlcpoCSFPycnYPmcGjwQP3wltEsXbaHWAE6UH218S8g=;
        b=NPwpXVem1CvUatcrBsD66T6pq8IkruSHEotu7qf578ct8cb7KDqkIg9HT5PSRw/nmM
         SOhvAzKkomtZ8E2CKdJ5v+ziNR/I55g7qauWdVl1FCnY7/KtYuXcx1vAyY8dgRQMX1x6
         LvZrLtJBbjCzN8UTz6AO1pWtvnZaVgHUgSQCW8n/xG1uW19JjJImy8pxa5OsdfT2rTH4
         xFAAebpmCCP0+Yd42eV5sd5xDPmgveSRflEs3YgOnqh/qUSOkReCRfDSkP17HWaqEj1C
         FT6j1lL3bC+u41R7xmptaPCRvf5QqIQodrceIqC20ERD7m1HMifMEu1oK6dvUilEZnBK
         fXow==
X-Gm-Message-State: ANoB5pkg6/hpJ8iNhglFC0wYa0kaczn98c6pUwpkCimdOUya28k/vn6Q
        r4CSsLFNzpfbUdVJY0Uq3oSq+Q==
X-Google-Smtp-Source: AA0mqf5l76qni16j551VG+b2MdxVUOqtepQUhGMJeiqEJErxWA7l1xKG54dbvHn24mWxkOT/334hmw==
X-Received: by 2002:a17:906:b150:b0:7a6:b59c:1e1b with SMTP id bt16-20020a170906b15000b007a6b59c1e1bmr16197244ejb.29.1670884935913;
        Mon, 12 Dec 2022 14:42:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906200900b007c09a304eb5sm3711593ejo.201.2022.12.12.14.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:42:15 -0800 (PST)
Message-ID: <dc0a6798-a9f4-3b1f-e7e3-ac0bcd7e1ecf@linaro.org>
Date:   Mon, 12 Dec 2022 23:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 14/19] irqchip/gic-v2m: Use
 irq_domain_create_hierarchy()
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-15-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-15-johan+linaro@kernel.org>
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
>   drivers/irqchip/irq-gic-v2m.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

