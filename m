Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD993315CB
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 19:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhCHSV0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 13:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhCHSVN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 13:21:13 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0543FC06174A;
        Mon,  8 Mar 2021 10:21:13 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 16so6221606pfn.5;
        Mon, 08 Mar 2021 10:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hBOkMyS1macfI4cKuiTKwW9+cz6HPPxEVuM+uYm8K2I=;
        b=ChY86Kj0kiVAvmNp/QhMzfyis9kegc+WALLTv5GsGEgF+OjuE31mz/BQtiVTFPfaKJ
         7z0++Lu+dqkex7rHWOlEqCZJlOZ3F1SaV6yO+Vmrh1JLUG7qxAFPV9CxsAJe5A5Ql073
         kspQKdLijKU1Q6kcO/ZkeiYndmgdtSn+5Cgrr2owLyVZJSBO2Zi14WZhKCnZZDW2e3pQ
         ETtIOeF1PXTKdIg638uw5NpKiFXHlv/cB2QVMLtQX2AeQLfldEe+NkPjCQjQ+UG9q/F1
         zAc22VyqZX/HdBXSsVP1F/rbCy/fyzhRi0TD7zI9hXsOuLClLFBMMLj/+ZKg+d3duCwV
         6nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hBOkMyS1macfI4cKuiTKwW9+cz6HPPxEVuM+uYm8K2I=;
        b=pLzdZGd3T6IiuVwaxUHnmloD+fVlK4vFvtYMId1qorylZAtBJVkM9XzsK7YPTvbYfc
         6xe0lRknQbX5gZnq02A+BZFm4I3ew/oAl6SFb597WyT8jLdN6B6f8U2+chlKIVLEuMRz
         yq7gpNadg16g7lccxojb/9rnO1F23KgI/9Gkr9sBKKbxwIhpJlMMybbh34HPEoi/ymd7
         PDDUAiToRziQUwjif/BMrf4xMZQxHRKqEuXgZLyZEXlvUBPGbJCzh9e1fTjUMsnS/Fk3
         FuwHSb3h/HtAwM+l21bKJADvveCpuLuZNtsGwwOXUdawKj9cyRBWNrzjy+B6UZxvTIE4
         8DUQ==
X-Gm-Message-State: AOAM531BhpSxS24abg2+ygyN9qM1T0Vi4TlmAcEOuqgsryKitpIylTkf
        ESXfwtw7RLv4/4VMyq9kOvo=
X-Google-Smtp-Source: ABdhPJxBiYtzEL/WY2aAOOJ+1e8P8oP1A7uUeTX4MIye9BbkaYL+MZielgx5wCAjI5AlqJraEHoZ7A==
X-Received: by 2002:a62:5344:0:b029:1c7:eeea:8bad with SMTP id h65-20020a6253440000b02901c7eeea8badmr116901pfb.1.1615227672523;
        Mon, 08 Mar 2021 10:21:12 -0800 (PST)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c24sm68356pjv.18.2021.03.08.10.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 10:21:12 -0800 (PST)
Subject: Re: [PATCH v3] MIPS: kernel: Reserve exception base early to prevent
 corruption
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mike Rapoport <rppt@kernel.org>, Roman Gushchin <guro@fb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20210308092447.13073-1-tsbogend@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <95d12091-d3b0-3034-98ed-9ad73ef21a3b@gmail.com>
Date:   Mon, 8 Mar 2021 10:21:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308092447.13073-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/8/21 1:24 AM, Thomas Bogendoerfer wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception space. Additional we reserve the first 4k (1k for R3k) for
> either normal exception vector space (legacy CPUs) or special vectors
> like cache exceptions.
> 
> Huge thanks to Serge for analysing and proposing a solution to this
> issue.
> 
> Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v3:
>  - always reserve the first 4k for all CPUs (1k for R3k)
> 
> Changes in v2:
>  - do only memblock reservation in reserve_exception_space()
>  - reserve 0..0x400 for all CPUs without ebase register and
>    to addtional reserve_exception_space for BMIPS CPUs

Thomas, do you mind CC'ing me for subsequent versions so you can get a
chance to have a Tested-by tag? Thank you!

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
