Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4F144B910
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 23:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241976AbhKIW6C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 17:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242526AbhKIW57 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 17:57:59 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670C1C07E15C;
        Tue,  9 Nov 2021 14:37:20 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id g19so773814pfb.8;
        Tue, 09 Nov 2021 14:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l8QpFUlcLmI2A5cdbo3MTRAgxhVYxiBLzkAZMczK+B8=;
        b=fSihPK6rmJ0moytzj8cFJ7kwXeucCdAzJVXPb5EptY6h31W346BLOHkIq+Dfld02n1
         ephtqLMWwq5WkDP1Sl5nzn/CX9Ypg9U5tT6dwyqHkgt8nBDmLZHXJKstJIXsWAyzSJte
         GcdmyKgzh7iooyVHw+dv1pgjQOWXy06tLCZMtbhWjwoNL3rSaomZg3MLq/kk0GlVYKCX
         c7oz8/qC0dW2mvPTpvxrdalVgO5LYBVErB6l1heqV/1Z90RxAV7o9ghv2G97/jtlQUmt
         OXkLT3o9vsaD4x/rHLb3ylYePPkdyuIkR1CaRHRfesgQ8WpLvapBUiOFxOuBwxovlTtR
         +ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l8QpFUlcLmI2A5cdbo3MTRAgxhVYxiBLzkAZMczK+B8=;
        b=DqeMjU7p5sJVZoCWQap/l3kCGUkxistNf2h2aNFReLrxgUywtlhUNoAnVq1XMRzEQm
         QHfhRnQHemznzG5ITaDFhwtbM9W8jiiOmjRvfqRWYBbSI3vXBG/riiA4m5KGpXxJHp0s
         NavFEUNwXKEKB4rLoELnnm3xHFWRVGhTJ9f1tA/t+VGhhQgLsO8Aah40Q3/uS15yqizJ
         xGtHLdnMHlzFtQruYyjKsLyCDKOnleavuO8ehnIZu9C8Syl5unPJXHKWOaNZaJVjw8RP
         8FYp065asTfVxmNVs6xxjmmjGraDikL4IdlTZFo9JJcWGZ4zjBWm2Esj9BUYe1Rotv6m
         CxTQ==
X-Gm-Message-State: AOAM532xJFQao+WygZQ62fWYMOyIDC4cR/o7/lAcoSrcPFjxKUfqTvGm
        grJpvirvJgSEZozXg6Mi1gQ=
X-Google-Smtp-Source: ABdhPJxlkthj+bJ3lO931HgfN/OSITzjpl8Nr4cYKMwJ8UHXArA1kYIrMrzd5bCc3/hB9xsAoO9NjA==
X-Received: by 2002:a63:117:: with SMTP id 23mr8896062pgb.183.1636497439765;
        Tue, 09 Nov 2021 14:37:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k7sm17213474pgn.47.2021.11.09.14.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 14:37:19 -0800 (PST)
Subject: Re: [PATCH v2] irqchip/irq-bcm7120-l2: add put_device() after
 of_find_device_by_node()
To:     cgel.zte@gmail.com, f.fainelli@gmail.com
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, maz@kernel.org, tglx@linutronix.de,
        ye.guojin@zte.com.cn, zealci@zte.com.cn
References: <04935513-dea8-ab98-ed97-8ef778e44318@gmail.com>
 <20211109055958.130287-1-ye.guojin@zte.com.cn>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0c14d517-1a25-fead-5fd9-9a060b772966@gmail.com>
Date:   Tue, 9 Nov 2021 14:37:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109055958.130287-1-ye.guojin@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/8/21 9:59 PM, cgel.zte@gmail.com wrote:
> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> This was found by coccicheck:
> ./drivers/irqchip/irq-bcm7120-l2.c,328,1-7,ERROR  missing put_device;
> call of_find_device_by_node on line 234, but without a corresponding
> object release within this function.
> ./drivers/irqchip/irq-bcm7120-l2.c,341,1-7,ERROR  missing put_device;
> call of_find_device_by_node on line 234, but without a corresponding
> object release within this function.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thank you
-- 
Florian
