Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561F143AA2B
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 04:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhJZCUB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 22:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhJZCUA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Oct 2021 22:20:00 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C98C061745;
        Mon, 25 Oct 2021 19:17:37 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso17680588otl.4;
        Mon, 25 Oct 2021 19:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qfRMaVYmCV2VsHs2qfoz6Q6uR7yY0g0PWaRhVOpqSeo=;
        b=VVjtniV7Faw7CQunvrciifhXoxqEAv/df8qR2jYZh9bHrwnh7iHQKd7B5naXQSWomG
         ztj35r+M5r7QG/rwhGfyg5pRMg2j4kgVoUWiyKvf3kB7Ec8QuwQaPeB8HLd93yCsAoXm
         fR8CfhJUR9vhqHzhX1uJjOX6YLyu6u5DIJVACBpZKjPfZyvFEUR0Lp8376p8fNP3bOup
         tAyvUqNk5mDwS7mt8j4nMUELZils7/1/2imc91ryCTO37IInNKOLFNZUUA0Nsz8Ivgwr
         IM9fXjcZ7B3J2CA2midAoQs4CtUiYVvE9CTNmUCvpJbfCLMe3m7DBIo1CrBicATOD/XR
         JLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qfRMaVYmCV2VsHs2qfoz6Q6uR7yY0g0PWaRhVOpqSeo=;
        b=VAcbnU2/Bn/uiD3vG2/yi+L+l8u0SrkcNfeVKm/TWBj5/k2Gdmp8NkZqiwvw8VqtaB
         dlTQ4MeDGThz8FcE4ovAMb6cSTrvWRVnH2M7f7yIzU5aQh7w4sr20APKXe8qJZeQYwRZ
         R7b1e27w78H0Z6XeCoTh0xMzW/fsJRuO8xWHWKyYRQISeUSc3lQe+JILsqoLd4Sgfp7V
         oWOjL+Rp2bx4DSeRXmlDwudsmCDd0jN/P7/EUHmxvOaWlUfsNccXJhGQ2+8GK1eaRffb
         ZYNOS1GscIs5blKUBHizYyi/tB2E3q/xcpdMkPr29OqmsTDDWl+9Hp0wDCogtIor7cQU
         JjGQ==
X-Gm-Message-State: AOAM533MiSFy8a7W8yZu7mDR3Yu6uosisVdhTktKnzG9w5Hk0XfNXm+m
        rkGLm01Ny2/F8fCUoDjmQWwUndUiEVcLEA==
X-Google-Smtp-Source: ABdhPJwPK2KtZ5BYywShbb7Q7x4TfGhDgkRXbAPfkzjbChviC/pLMRWrCP4Vh+LBVYKp0SE87OlHxA==
X-Received: by 2002:a9d:6c91:: with SMTP id c17mr16199151otr.114.1635214656820;
        Mon, 25 Oct 2021 19:17:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1? ([2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1])
        by smtp.gmail.com with ESMTPSA id m13sm3384170oou.25.2021.10.25.19.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 19:17:36 -0700 (PDT)
Message-ID: <fca3586f-bb7e-a1f7-0f02-97218afcc56d@gmail.com>
Date:   Mon, 25 Oct 2021 19:17:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/3] irqchip/mips-gic: Get rid of the reliance on
 irq_cpu_online()
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20211021170414.3341522-1-maz@kernel.org>
 <20211021170414.3341522-3-maz@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211021170414.3341522-3-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/21/2021 10:04 AM, Marc Zyngier wrote:
> The MIPS GIC driver uses irq_cpu_online() to go and program the
> per-CPU interrupts. However, this method iterates over all IRQs
> in the system, despite only 3 per-CPU interrupts being of interest.
> 
> Let's be terribly bold and do the iteration ourselves. To ensure
> mutual exclusion, hold the gic_lock spinlock that is otherwise
> taken while dealing with these interrupts.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
