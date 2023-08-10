Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CD0777B52
	for <lists+linux-mips@lfdr.de>; Thu, 10 Aug 2023 16:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbjHJOwo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Aug 2023 10:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235693AbjHJOwn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Aug 2023 10:52:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05152698
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 07:52:42 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe5c0e5747so5978885e9.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691679161; x=1692283961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wmFzgys+fG86GOwSLjlxHgcLHOZs0taRkUS+3cjf1s=;
        b=dken7PPjyePX2UeV3WdsN6Rl1tP0hhBp1msbLw05B+Ii5AZoBWo1DbpJ1sZGiEQ6uv
         2B3AEsgsESyXM0VYOg1AicGppziPaNyPXJsGiuoZrluPSxZr6BJTdtp/6R9qVy4TcciI
         tca+/nZxMJLPl9630ZACoJeze7A4W7HEZF7TbEjVOWhSNcpLRlN5HJEs1lVG//jKepv6
         V7UTVkdJIoisBTrXyIlXE50u54hZZw27YBSlJyu1tEJbFZ1maq0ZB0OhK9YI5M6yiCmu
         TOZ+t5l3WKwSIch4ZnkfWCKF73G6rSIX6fz33XprTEakgWCgCJN7OK4NWokTuSS/EYjd
         OmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691679161; x=1692283961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wmFzgys+fG86GOwSLjlxHgcLHOZs0taRkUS+3cjf1s=;
        b=JdD856E4zU9qCsxhYokz5cbJBQUBmrNsjr//Ag13dxeGLTZyVWyDXbJFeoGagoiQ4i
         V6fE2e6GWbLLT4ktl94gJZpiSz15uy3K+dIUhJDVz8jfHSzc9OeqnM6vgkWcBzy8iC0U
         odksn9Rdw36F+Dy35Yu84SoHMxNbVJW8DZTbzQJ6GoKGs9FNEMrmZxTPenl5Dp1qLX+v
         V6d4CN7gBk1PfOGoSiJRty02Vug5hHIJge+9eo+wtZkbYgMkZmulH8NeilNg3o98Fh5B
         fypbA7b0V8VwFL6TODFQIVvXUXF49Q2E6uGb9Z4Ut68WTF2SRToFBoTCWoVGiHqMOzcP
         Gw6Q==
X-Gm-Message-State: AOJu0Yw8GVaeBdAhqU6lxGMmctf1HhMYRB1DHg8P2/xuIusKwcQvAkky
        rN5hCgIGChYiSZIzcJWIt7Wl4A==
X-Google-Smtp-Source: AGHT+IEa21aQMJBqztFQX4tPGw+QlIky3bj+sx2xpJLrr+IhzZjIow7I0jriTjEB9DbnxDcD8X8hFw==
X-Received: by 2002:a1c:7208:0:b0:3fe:1fd9:bedf with SMTP id n8-20020a1c7208000000b003fe1fd9bedfmr1894009wmc.11.1691679161298;
        Thu, 10 Aug 2023 07:52:41 -0700 (PDT)
Received: from [192.168.69.115] (tre93-h02-176-184-7-255.dsl.sta.abo.bbox.fr. [176.184.7.255])
        by smtp.gmail.com with ESMTPSA id m12-20020a5d4a0c000000b00317e9c05d35sm2422070wrq.85.2023.08.10.07.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 07:52:40 -0700 (PDT)
Message-ID: <d5cf16c2-793c-691d-265d-4687c8b29105@linaro.org>
Date:   Thu, 10 Aug 2023 16:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] irqchip: mips-gic: mark gic_irq_domain_free() static
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        wangjianli <wangjianli@cdjrlc.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230810123404.1222332-1-arnd@kernel.org>
 <20230810123404.1222332-2-arnd@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230810123404.1222332-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/8/23 14:33, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This function is only used locally and should be static to avoid a warning:
> 
> drivers/irqchip/irq-mips-gic.c:560:6: error: no previous prototype for 'gic_irq_domain_free' [-Werror=missing-prototypes]
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/irqchip/irq-mips-gic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


