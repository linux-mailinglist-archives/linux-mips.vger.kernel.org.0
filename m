Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328EC32210E
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 22:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhBVVAp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 16:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBVVAp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Feb 2021 16:00:45 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F407BC061574;
        Mon, 22 Feb 2021 13:00:04 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 75so10981097pgf.13;
        Mon, 22 Feb 2021 13:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=H0Xgyt5coIH+GE4ESBF/DDHxRtz15wSekZzSGidjJ40=;
        b=Eq4HTBRkpBFEOj3x7npC7iQPImgtay3bpsDwLybwhumfoDXN1/39W57Zwn2MXDFQbX
         GaLiBMOi5hXAPjmN6ubOC5NrUg2yryw5tC49QyL7nILN4IgmjM/6X4mWpO0oX3tqffT3
         pSmeu2/1+1mrk4Jhu3fgdw3tpVwbLCi8DuDSfMRgiU8jIWXDt5k9fN6dXk0nlSC2F2fe
         1bY/HdAA7TAgNjIYmW0KHPPHJIP9X9B/MlmE9CISwGbhxbevpGQv2G1qGcHcPb7JnCIz
         HbENYeVzIPWicvLA6gPvU/EurE1uS8nMT0XuPxT9E4/VP912Wvot46qQY6hqdXK/pKf0
         VtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H0Xgyt5coIH+GE4ESBF/DDHxRtz15wSekZzSGidjJ40=;
        b=G3qHfi2Aemrz437ByYTVWSfbb+8MjP7ul2V0+xjAgp4kaE7sjIPuafvOVXnQogLdF/
         0kopzJWEAYdngz6YqrtPrOyivYYM6oDSJDzKKVNKXKsqewelwNpX0dXvck7qs3E5X4uy
         sOOtw/2wzrZGNE5bQym1a9oU7hAfsLUnQk47cn6pbmLQaQKWXKDUGdPJkLBzwxuxxxeq
         aEpMFBFfD+p959mlJiq55Fw/ogcNuqeA/yhiz3fLdCzDJuEht38nC5ivc+eJ1JrfBvc7
         Lqrpp/Jkhjy4j7P4pKYTRXMEUKfDGW0nyGRmQsaQ2WYbfbt5R96pXOYEQG0fU7a8TVmW
         784Q==
X-Gm-Message-State: AOAM533IPwmCdiZ5QrUToEAyKYfq2yDIXNL/rwRKyJKWHXcXhC13ZzXz
        Vtvh3oKXFrvJm5cOUjpQgzZ8ykrkLkU=
X-Google-Smtp-Source: ABdhPJyGj9q8+ckK9W3DAnRknkAKgAh/UnyHUCICnA8bG4DJcFr5tlE2ex5p9Rx1U60pSCZm8OYutA==
X-Received: by 2002:a63:c54c:: with SMTP id g12mr20658056pgd.449.1614027604011;
        Mon, 22 Feb 2021 13:00:04 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x12sm20587085pfp.214.2021.02.22.13.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 13:00:03 -0800 (PST)
Subject: Re: [PATCH] irqchip/bcm-6345-l1: fix SMP support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210222201332.30253-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6169cb21-538b-1066-51cb-dd362f811fa1@gmail.com>
Date:   Mon, 22 Feb 2021 13:00:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222201332.30253-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/22/2021 12:13 PM, Álvaro Fernández Rojas wrote:
> Some BCM6358 devices start with Core #1 instead of Core #0.
> Apart from that, SMP is restricted to 1 CPU since BCM6358 has a shared TLB,
> which makes it impossible for the current SMP support to start both CPUs.
> 
> The problem is that smp_processor_id() returns 0 and then cpu_logical_map()
> converts that to 1, which accesses an uninitialized position of intc->cpus[],
> resulting in a kernel panic.

Sounds like you nee to correct the way the cpu_logical_map[] is
populated then?
-- 
Florian
