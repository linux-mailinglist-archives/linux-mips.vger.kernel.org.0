Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD17287A53
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 18:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgJHQtu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 12:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgJHQtu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 12:49:50 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333B2C061755;
        Thu,  8 Oct 2020 09:49:50 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h6so4801351pgk.4;
        Thu, 08 Oct 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=etkEQubuil182k3C5BVo92E36PMRBTYONF0xOmMx994=;
        b=nhUB611p0AMA34WZHbcfv4F8z/HholYpZGUj0swudfsaD8TMmDd0Lv4+Ew3zoYA0pt
         0paCTIXiHgUFBw2WsfJUjNPpXpWUhzk5ciBDBZc4aEQR1X8sgrD3JOcPQ0Xx2Q+Nmato
         B4N/wF5ixnS8rmFKUKfUbIH4Z47uAEaHIKwYBsGJBDMG/9OSEhItrS44K9Ui3Rr+cmSM
         LmF1/kS6fy26Y//OEphaSL+ZkiFChAmWWiluWLVQDcpN08F7IOLqkdxa4lZYUaUuRfRk
         C5SsexIl66MRf4Z++lTNGAJsMs+fgYNbE4OVxsc1OGrUCerfvZtLT7v6GPK9AXqO3RIb
         Xfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=etkEQubuil182k3C5BVo92E36PMRBTYONF0xOmMx994=;
        b=D1D/bvJgAC3f+ZcMPXd0yy1Oa3amKyBpA1UTj6Ov30dURHk9E3AZGdFIYpxhmaDGgB
         LoAlH60QnYf0OZYBPHwjIUKuBu+b/LrCn1lTi5RbEYIeNv/OxiKyc5cS5W0kc0lP7sH4
         7RJS+H7v6E5oFZx38mDQEMVZK+FHIXXfjQIFG6FMiLOwrS5jNZgEXC8LOQnxRu/+6s4+
         rRjkDKGt7jY5cayP0c+faTt8EaMgSdMfuyEz55bvPPzR8pdeWX/n97paetnbkqUc92uZ
         tcmb8d3MCIwF/V8eiAmg8rKZFZbB0UHnKeEZ58hVlJbaHigBIu40yv7Z8Dy+7OE4S/wE
         Wa4w==
X-Gm-Message-State: AOAM532Lyx8QsNlaHU95lBxIadnR2yqnPVGFoBz9zKgUIdQ/t6FGiIiX
        xRHACncaOgBakpg4n8SKmE8=
X-Google-Smtp-Source: ABdhPJw8oO//XgT0mpyq/nBfE7h02sQTemmm7/n2bAm2ae1eWE5Ve3E3ySf2SKmEJCqyM5W8K0cSYg==
X-Received: by 2002:a17:90a:f198:: with SMTP id bv24mr9135831pjb.230.1602175789695;
        Thu, 08 Oct 2020 09:49:49 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id q8sm7868758pfl.100.2020.10.08.09.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 09:49:48 -0700 (PDT)
To:     Serge Semin <fancer.lancer@gmail.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org>
 <20201008155454.kaal2bchjq7wusqr@mobilestation>
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <91e52fa1-ecf9-7acc-62f6-16fccfae927c@gmail.com>
Date:   Thu, 8 Oct 2020 09:49:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201008155454.kaal2bchjq7wusqr@mobilestation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/8/2020 8:54 AM, Serge Semin wrote:
> On Thu, Oct 08, 2020 at 04:30:35PM +0100, Maciej W. Rozycki wrote:
>> On Thu, 8 Oct 2020, Serge Semin wrote:
>>
>>> At least I don't see a decent reason to preserve them. The memory registration
>>> method does nearly the same sanity checks. The memory reservation function
>>> defers a bit in adding the being reserved memory first. That seems redundant,
>>> since the reserved memory won't be available for the system anyway. Do I miss
>>> something?
>>
> 
>>   At the very least it serves informational purposes as it shows up in
>> /proc/iomem.
> 
> I thought about that, but /proc/iomem prints the System RAM up. Adding the reserved
> memory regions to be just memory region first still seem redundant, since
> reserving a non-reflected in memory region most likely indicates an erroneous
> dts. I failed to find that, but do the kernel or DTC make sure that the reserved
> memory regions has actual memory behind? (At least in the framework of the
> memblock.memory vs memblock.reserved arrays or in the DT source file)

AFAICT DTC does not do any validation that regions you declare in 
/memreserve or /reserved-memory are within the 'reg' property defined 
for the /memory node. Not that it could not but that goes a little 
beyond is compiler job.

The kernel ought to be able to do that validation through memblock but 
there could be valid use cases behind declaring a reserved memory region 
that is not backed by a corresponding DRAM region. For instance if you 
hotplugged memory through the sysfs probe interface, and that memory was 
not initially declared in the Device Tree, but there were reserved 
regions within that hot-plugged range that you would have to be aware 
of, then this would break.

> 
> I also don't see the other platforms doing that, since the MIPS arch only
> redefines these methods. So if a problem of adding a reserved memory with
> possible no real memory behind exist, it should be fixed in the cross-platform
> basis, don't you think?

Would we be breaking any use case if we stopped allowing reserved region 
that are not part of DRAM being declared?
-- 
Florian
