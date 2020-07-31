Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661DD23400D
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 09:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731659AbgGaHgb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 03:36:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57426 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727851AbgGaHgb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 31 Jul 2020 03:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596180990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=553KQ1qNVymmVc2Jbs3bPD4YZyJND+P5R8Nz7Iw3uxY=;
        b=gWxQJWcKWMRqsEmV6rmV34vl1w/EIlulavU3LmnhHMdTMQPxUke9ZXMNPAuAmySm3V3zIg
        EP/2k9BJl035U11Pbhl7jAoN7XccsZASNfjK2NfURxAPyf7Av03NGvPqbbWsmdD+nkLSQr
        9aOyJbGcKEtDzjvBG21Y7Ph5AbfYDQs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-0xR8VgtcNlOTkXYmWVmjAQ-1; Fri, 31 Jul 2020 03:36:26 -0400
X-MC-Unique: 0xR8VgtcNlOTkXYmWVmjAQ-1
Received: by mail-wm1-f70.google.com with SMTP id z74so1888684wmc.4
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 00:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=553KQ1qNVymmVc2Jbs3bPD4YZyJND+P5R8Nz7Iw3uxY=;
        b=rQcRye4aJk+SOtHSuH/PDHKnDLCvTRvWhlA7y2CF7V1FEl7Q4zjyDge5kfcIHJKIgn
         9YSMQ7x2PC0NHo6O9xusCBBZpgNz/xiY0751beygfFqIpc00Kvu3IlfvvRJIeKArQJun
         wBM4rZ9zShz4GurWza9pehuRK0E2XsT8WyUMwCfINQPSwcnfh/7dvcFy4MokhN90J4RJ
         iDzI2BqkATJnfnYQ+fg9Eo90zHxedEFwDm0uW9AzZSPhzsdZKZShW1/YSrzSDpp4NV2E
         ilYqwgniPA2nbe1Cz15EZSXHX7K5/3P6m6S+zf5IsARcMW3QPle+bTl7cA8wscoNSNCd
         oFbA==
X-Gm-Message-State: AOAM532aAxSYUtju3SbxMZHWQ2c28fnM3KGzdEXsyxaGzbSAa0uc9SxH
        aGsv41DozSMv59HbZV9RAGVW9s9jQqnbmEtD3sbvP6xhjrJTl5VGXHz45I7qoLkO4ggDJgEIR2U
        0PLhSDegAXgRIZZsJVJb0pg==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr2180878wrv.86.1596180985662;
        Fri, 31 Jul 2020 00:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK5Kv8TZaxnsghX4+eREYu/xA6eXNCFl4Iau4DmmrIF5oz1lEHRcJA6j4qFKcbXil6qN/DmQ==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr2180862wrv.86.1596180985472;
        Fri, 31 Jul 2020 00:36:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:90a5:f767:5f9f:3445? ([2001:b07:6468:f312:90a5:f767:5f9f:3445])
        by smtp.gmail.com with ESMTPSA id t11sm11878979wrs.66.2020.07.31.00.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 00:36:24 -0700 (PDT)
Subject: Re: [PATCH -next] emulate:Fix build error
To:     Peng Wu <wupeng58@huawei.com>, tsbogend@alpha.franken.de
Cc:     chenhc@lemote.com, aleksandar.qemu.devel@gmail.com,
        colin.king@canonical.com, tianjia.zhang@linux.alibaba.com,
        huanglllzu@gmail.com, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1596179807-17713-1-git-send-email-wupeng58@huawei.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddee30c4-6190-5cbc-6340-c138bd1550b5@redhat.com>
Date:   Fri, 31 Jul 2020 09:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596179807-17713-1-git-send-email-wupeng58@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/07/20 09:16, Peng Wu wrote:
> The declaration of function kvm_mips_complete_mmio_load
> has only one formal parameter,but two parameters are passed
> when called. So, the following error is seen while building
> emulate.c
> 
> arch/mips/kvm/emulate.c: In function ‘kvm_mips_emulate_load’:
> arch/mips/kvm/emulate.c:2130:3: error: too many arguments
> to function ‘kvm_mips_complete_mmio_load’
>    kvm_mips_complete_mmio_load(vcpu, run);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from linux/include/linux/kvm_host.h:36,
>                  from linux/arch/mips/kvm/emulate.c:15:
> arch/mips/include/asm/kvm_host.h:1072:30: note: declared here
> extern enum emulation_result
> 	kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu);
> 
> Signed-off-by: Peng Wu <wupeng58@huawei.com>
> ---
>  arch/mips/kvm/emulate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 1d41965..7037823 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -2127,7 +2127,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  			run->mmio.phys_addr, run->mmio.len, run->mmio.data);
>  
>  	if (!r) {
> -		kvm_mips_complete_mmio_load(vcpu, run);
> +		kvm_mips_complete_mmio_load(vcpu);
>  		vcpu->mmio_needed = 0;
>  		return EMULATE_DONE;
>  	}
> 

This is queued already, I' will push it shortly.  Thanks!

Paolo

