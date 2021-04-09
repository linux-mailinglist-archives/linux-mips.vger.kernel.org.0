Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD21359825
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 10:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhDIInP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 04:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbhDIInO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 04:43:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56D7C061760;
        Fri,  9 Apr 2021 01:43:01 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j18so8485442lfg.5;
        Fri, 09 Apr 2021 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tVbQiCGoAumFz/ANTAd5bAwq76g2DUa9AH09IK05F58=;
        b=T4zdaQh0FbPDXScDng3a+4QGjODZsa8K8Oeq5eWZsQPLuQguEeR2GTmvw23SH9gDsr
         B7E2oakGIpfIUNrxozsAfr8Ljprd70jPTufvlWN9xD94dY8InQTrQcynhtC39DI7PI8E
         b1OgR/YUpeXASZ/EneDIs8JhWY1Z89vP0rGoNzuc9TLVSKxqD3e2Y6O1R85gkpxe42XR
         wZfKKqApBmP3MdKQOPqyijcrgqjrY7kGVOmYX6WPbz3+1W6DCH05MtcBLTQ2MqAW4DHl
         YYFM1odNZNeVIpSVgK98NKnHcWILKif7u4WWZz+emx5558hgDZesaV+ZllwajvKrljCW
         yKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tVbQiCGoAumFz/ANTAd5bAwq76g2DUa9AH09IK05F58=;
        b=AKDcM1jbJae/AIrYFlXapB12P+s8TRVLFAgkcaqDgwDzLuq3+/UTKxd822so29dQH/
         ix8pQznBlMCL4g12oQRiCyHHkPcgG+7dmnoUQAXJbPZSUlsqGGhQDT3U6xuLELp348Ha
         c/hGByPwrL6Pp3s0BRKujEDsiEHDwig6+HbaRfAdo6bNsvlnJ844h/bso6AEYNWRizQ+
         xO/Hmzs7rQuqdvbtnNec/TFOVs8DReSIViyGi6+QwV8GKaMibrqJjUQ5xk+aFYq6m2X8
         OQJZMi13KJaXDTf+2c+yl6LzIpgSl1OaLcIG32XsjpfwiDTFgoQU0niRepE2/ZV1dG27
         SLaA==
X-Gm-Message-State: AOAM530kwho70l5JLwJfrv1bbjNlqDUhPEppeA81l4LdfE4mkEydDsT9
        gDu4bgMsfeYHjpxHHMPP+Llr7LHASa4=
X-Google-Smtp-Source: ABdhPJzpvR4y6canpCpm2ge2noKNVujShfe2KX5MgIvfxL7unuvX24jqm/EnaGR1KtEGFSqzJfkDDg==
X-Received: by 2002:ac2:5de4:: with SMTP id z4mr9873109lfq.65.1617957780234;
        Fri, 09 Apr 2021 01:43:00 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.13])
        by smtp.gmail.com with ESMTPSA id c5sm200792lfk.141.2021.04.09.01.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 01:42:59 -0700 (PDT)
Subject: Re: [PATCH] MIPS: octeon: Add __raw_copy_[from|to|in]_user symbols
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
References: <20210408214846.50758-1-tsbogend@alpha.franken.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <1fa6ff61-25af-7d24-2d03-de03ec73e8f6@gmail.com>
Date:   Fri, 9 Apr 2021 11:42:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408214846.50758-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 09.04.2021 0:48, Thomas Bogendoerfer wrote:

> Cavium Octeon has it's own memcpy implementation and also need the change

    Its. :-)

> done in commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs").
> 
> Fixes: 04324f44cb69 ("MIPS: Remove get_fs/set_fs")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
[...]

MBR, Sergei
