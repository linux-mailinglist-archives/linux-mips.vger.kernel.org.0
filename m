Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F981D2B8D
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 11:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgENJfu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 05:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725935AbgENJft (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 05:35:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F883C061A0C
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 02:35:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so2792840ljj.1
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T86/hv0y7BAgJ75aFy/dvx0cbN3V70JUKhyVGv5v+SE=;
        b=eVtu+uah7Sf+JulgCzgHMXNss1swnlz1dhsc2qk9bjYnlevMZ0Tnj2eYpa8hHrTzkd
         6YButrHIwOq+lsJPkmHfVfVwRMgwIX5UorYguxKvabgoMe1OF3+PMQwWLDeA8s0T7+QO
         3vQaApFX54tXuP3hZeUESmbXg2y/UFMt8DamklMimJAWNmyZcrJWf/KD9+UZ5tRfQkAX
         ISuRybvMkN+11K0+x3ND7PB9Zxipow7EHzXneIVyDDPsXP6kw6am0RzMJ4Xzg6DAwjLB
         ZP7/lN8WCPgm4qUPZwcXVBRxxwWWWHmR1BCRQpnAPw9bRhFLE11N/TxB7uux6suO1JzV
         gIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T86/hv0y7BAgJ75aFy/dvx0cbN3V70JUKhyVGv5v+SE=;
        b=fVzqmuj/sQUBF2yDlHbS2ivrc/663pRo4Sqe9wevYEreSgptZA87Ulj1jcNmD+wJEq
         nFbawvumpBOfFfJRsluW3zpPiI2o+klvYUvxnrt9b+RL0UyTWQPFEcuWSPO8RtcnOpt+
         9rCJSyD6ClbtYeSQHrcOnwfvxopq7WUj0nl/csfdepkp9slI6f8IKDVGieuFWpVuLdyB
         TbyiMPFjMhifVbDNurcgJxJD1DTGPHLKdgsALkhvU8G3deF48YGSWiD0joeGObNpD3uj
         QN7G3Ccc4KvsaGdUlAWzeAu94WMbzT1f0om7fqe+4tUQ9g6yFmg9dvpVDZb8mdY9mCCD
         ExZA==
X-Gm-Message-State: AOAM532H2CjVWEwk5+dMu443lRmLtrUeSFwkSWujikGV4drQeRkAIiXq
        Emp3y0Q6KTtsSUz6aLdtvOohcw==
X-Google-Smtp-Source: ABdhPJx5l4XNtKpw1qvszJmMsFRAuhj3l7wewTDsFC78z5yMXn6Qvi1+jRmRVAuRQbmOCJlRc4GnpQ==
X-Received: by 2002:a2e:9905:: with SMTP id v5mr2251265lji.237.1589448946762;
        Thu, 14 May 2020 02:35:46 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:428e:17ae:1023:2fd9:377b:94c8? ([2a00:1fa0:428e:17ae:1023:2fd9:377b:94c8])
        by smtp.gmail.com with ESMTPSA id q21sm1792342lfe.0.2020.05.14.02.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 02:35:46 -0700 (PDT)
Subject: Re: [PATCH] MIPS: update tlb even if pte entry has no change
To:     Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1589422677-11455-1-git-send-email-maobibo@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b46f4ac1-9738-6037-d60a-faebf2b4365c@cogentembedded.com>
Date:   Thu, 14 May 2020 12:35:35 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1589422677-11455-1-git-send-email-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14.05.2020 5:17, Bibo Mao wrote:

> From: bibo mao <maobibo@loongson.cn>
> 
> If there are two threads reading the same memory and tlb miss happens,
> one thread fills pte entry, the other reads new pte value during page fault
> handling. PTE value may be updated before page faul, so the process need

    Fault.

> need update tlb still.
> 
> Also this patch define flush_tlb_fix_spurious_fault as empty, since it not
> necessary to flush the page for all CPUs
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
[...]

MBR, Sergei
