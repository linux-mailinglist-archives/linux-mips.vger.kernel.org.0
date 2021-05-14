Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E97380695
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 11:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhENJ70 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 05:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48651 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231433AbhENJ7W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 May 2021 05:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620986290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1HSHT010IMW+cXEGATjDBIxbVj8q3qsIGaXIjuV1tR8=;
        b=WrQdkN72IZstlVOAt+QcfIHSbEc/PQaJ49/2R+QFNPKqUIBGmjXM7Ey2lVvqJtMdDYEXY2
        fQO5jqDlkeVywIH3D/xq1efugIeja8dAb06f9e5rFucQkw4iIHIxmAyxRphQo22NbiM4GO
        JmO26He3mVEV8WhMesVm2asc38IR2pI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-VmD4kecIN0ei3kChqNg9wA-1; Fri, 14 May 2021 05:58:09 -0400
X-MC-Unique: VmD4kecIN0ei3kChqNg9wA-1
Received: by mail-ed1-f72.google.com with SMTP id p8-20020aa7c8880000b029038ce714c8d6so1753860eds.10
        for <linux-mips@vger.kernel.org>; Fri, 14 May 2021 02:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1HSHT010IMW+cXEGATjDBIxbVj8q3qsIGaXIjuV1tR8=;
        b=CQ5QwbCmXhOFEpXCrYeylsp+zoCJIrJrar/6/BQhBcX1xEujGod5k0ax26dXh5qE1T
         fl30UHrXIkltxjLU0JftrpfPS9TTVrYBf3wVE6n0PwLVFTx3ufdFDjsmd6n5Qo4y/3ia
         TsByKmNO1ccDYEkEpWuSyxLHxWDUkNIOQXCbhHJ4Je4u7wIP7+QTtGrWJmP4I1FH1ZtB
         dIgde8hPm6hkjEmtkmHWBCTboQ5mP5p236/uivuHEo9oqTKdXaIssD0g6oN4vhk6SRcK
         bQaU6Ud08VXDjr9MDDb0G8mRFHKog27GkTG3hloQUuduIONZlR3OmwNUrwu8OeovOXDG
         CD9g==
X-Gm-Message-State: AOAM532XP7tF9ZxrbvwZG+zOiWjMHDYoZ4O062O4VNVRdNrVJ9/U63jX
        1Np7MHlBijrXQVHgB35AdPcYay2dI1MGwEayF2J58b9+xNAfpG3XzIELmusw36K8sT0/kqy9puQ
        aY/befFNoMoH6Z2/OIBmuEw==
X-Received: by 2002:a17:906:1997:: with SMTP id g23mr7843643ejd.168.1620986288203;
        Fri, 14 May 2021 02:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPiLTB37PBXo7J5oy0OsoquAD37a/9MW+Bd1U/QL7g89/MOzpV8bQHPd1pj3fSSUBuCQnGXg==
X-Received: by 2002:a17:906:1997:: with SMTP id g23mr7843628ejd.168.1620986287995;
        Fri, 14 May 2021 02:58:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id bw16sm3420965ejb.50.2021.05.14.02.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 02:58:07 -0700 (PDT)
Subject: Re: [PATCH] KVM: MIPS: Remove a "set but not used" variable
To:     Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        kernel test robot <lkp@intel.com>
References: <20210406024911.2008046-1-chenhuacai@loongson.cn>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e55e632d-a138-a6ec-d545-299ab858a163@redhat.com>
Date:   Fri, 14 May 2021 11:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406024911.2008046-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/04/21 04:49, Huacai Chen wrote:
> This fix a build warning:
> 
>     arch/mips/kvm/vz.c: In function '_kvm_vz_restore_htimer':
>>> arch/mips/kvm/vz.c:392:10: warning: variable 'freeze_time' set but not used [-Wunused-but-set-variable]
>       392 |  ktime_t freeze_time;
>           |          ^~~~~~~~~~~
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/mips/kvm/vz.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
> index d0d03bddbbba..e81dfdf7309e 100644
> --- a/arch/mips/kvm/vz.c
> +++ b/arch/mips/kvm/vz.c
> @@ -388,7 +388,6 @@ static void _kvm_vz_restore_htimer(struct kvm_vcpu *vcpu,
>   				   u32 compare, u32 cause)
>   {
>   	u32 start_count, after_count;
> -	ktime_t freeze_time;
>   	unsigned long flags;
>   
>   	/*
> @@ -396,7 +395,7 @@ static void _kvm_vz_restore_htimer(struct kvm_vcpu *vcpu,
>   	 * this with interrupts disabled to avoid latency.
>   	 */
>   	local_irq_save(flags);
> -	freeze_time = kvm_mips_freeze_hrtimer(vcpu, &start_count);
> +	kvm_mips_freeze_hrtimer(vcpu, &start_count);
>   	write_c0_gtoffset(start_count - read_c0_count());
>   	local_irq_restore(flags);
>   
> 

Queued, thanks.

Paolo

