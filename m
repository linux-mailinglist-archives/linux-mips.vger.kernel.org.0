Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC062A1E6A
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 15:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgKAOEE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 09:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgKAOEE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Nov 2020 09:04:04 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CC9C0617A6
        for <linux-mips@vger.kernel.org>; Sun,  1 Nov 2020 06:04:04 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 13so8797680pfy.4
        for <linux-mips@vger.kernel.org>; Sun, 01 Nov 2020 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/3KDaWEoJMgTPNftWJmVhabCVNdMwwQzZeJR77qCyyI=;
        b=ADJyj3zkFS3nEpucupXSzC0SXbgL/CYng3FbXdIbxAIVpNu5sufIGMFGAGUyiJiK/t
         5g7ZXsb87bRVMVwP3MHdnUXAB1uWEfHrcs0ai5A/vGI4Lb438xP1L8jvMCMfp+rVux4n
         goGGKKszMzrcol17MXVH5eKsWQeF5eVA391Md/IMUyZt+Fz90VaICKpzcHZ/Ngl571ks
         mmaLDv4QpVtmv8pRelmjJ6S5ar4T/Moon4ZxS9CBNAS2/M7MXwAa5Y2N66mc9OC1Xub0
         BVr+CnZJDZNE8/6AAXC/8zGmaCkEpxYjU12DG6hKeEE178pMlrwr4LNN//ocwZbrI88W
         HzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/3KDaWEoJMgTPNftWJmVhabCVNdMwwQzZeJR77qCyyI=;
        b=WWZNcNsQiPUC4EAwPeAWZxu8Jr60m3USeaAtqUhcygL3LiEe7gfxY9jpY94r9GzuBL
         2ExBp26jOOI0Ufbe15kheww6ChLHH06uLrojFzw31+ArbTmOPuaK+CDWvLgFktFFHQA4
         H4WakQ7BQS7Mq+/QJhHU4fqeymSTC5rf6Cm0xw/+Dhhos+Rq+EFmfhJZE5CzvAL3K92j
         lNAMdXdbY1aZDH9Xq75/OkGELXdgFf3xF66Kc5lUwe16pHJCVavRtqQNghgvA5L/Y4bf
         SEeVqc7Ac0oZsZEA9oURJhlhWHDkPM+driEyJE+a4Wf6UPJiLKXzHwnreqfZANuvcOUc
         Mc9w==
X-Gm-Message-State: AOAM530O2PrDZhrnfbqO1vxCaa32tXCXO9WkAqlvZgmrfzy3tp3Qip0a
        5/L3OLlQAWMrLQH3DpdTzETebFrEdRomZQ==
X-Google-Smtp-Source: ABdhPJyhBPEzZh/3LRTWRC3CK01qLc2/SkEWaX4szFKTT/Kde7haMQK7KOb12KTekBAWRbgWXSnsaA==
X-Received: by 2002:a62:fc88:0:b029:152:ebe:829 with SMTP id e130-20020a62fc880000b02901520ebe0829mr17392314pfh.23.1604239443380;
        Sun, 01 Nov 2020 06:04:03 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id lf11sm8852638pjb.57.2020.11.01.06.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 06:04:02 -0800 (PST)
Subject: Re: [PATCH] mips: add support for TIF_NOTIFY_SIGNAL
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
References: <116773a7-acc4-0f18-9249-532a844502ef@kernel.dk>
 <20201101131522.GA4111@alpha.franken.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c818c023-de40-bca7-7f33-06cc917a6d6c@kernel.dk>
Date:   Sun, 1 Nov 2020 07:04:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201101131522.GA4111@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/1/20 6:15 AM, Thomas Bogendoerfer wrote:
> On Thu, Oct 29, 2020 at 10:16:53AM -0600, Jens Axboe wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for mips.
>>
>> Cc: linux-mips@vger.kernel.org
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>> ---
>>
>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>> for details:
>>
>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>
>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>> as that will enable a set of cleanups once all of them support it. I'm
>> happy carrying this patch if need be, or it can be funelled through the
>> arch tree. Let me know.
>>
>>  arch/mips/include/asm/thread_info.h | 4 +++-
>>  arch/mips/kernel/signal.c           | 2 +-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> Acked-By: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Please take the patch into your tree.

Thanks, added your acked-by.

-- 
Jens Axboe

