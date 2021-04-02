Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0143528E5
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 11:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDBJfn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Apr 2021 05:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45011 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234991AbhDBJfn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Apr 2021 05:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617356140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pp7i/Rq4quxGmDckgflEr0uWdxRmtTCzqRhgMxNYmVI=;
        b=QwJc8X/XP04YAyJlDVJO6cE8IY6jhHnvsVxbPU5cXWcSZQ4wsogMxZUk9AnVEnj912FQvl
        kmLgdSzxb7oe19EWbm/RhVtwiBuysiDROIsX3JTnoJ72Jbrc5dzbHwfglUzRn8P8Kpa2kf
        qkOnl2Wne5+RoP47rjX7TXDwpotofSg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-2aQ6wayoNSqKK1eYfCg97Q-1; Fri, 02 Apr 2021 05:35:39 -0400
X-MC-Unique: 2aQ6wayoNSqKK1eYfCg97Q-1
Received: by mail-wr1-f71.google.com with SMTP id e10so4083266wru.13
        for <linux-mips@vger.kernel.org>; Fri, 02 Apr 2021 02:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pp7i/Rq4quxGmDckgflEr0uWdxRmtTCzqRhgMxNYmVI=;
        b=LVKQMsLwdWmJE0qM/Wna3nD2Dy1J1/2Y0fvzE1fBMYmR6SO7cz8LgwbyQN7ARcNq2z
         CMkt5VdDOsrdr6aLimNO1j94BSc1motQk0y/xh25OIAoIFk8l4OqIU/iMW4SNvYJkCOx
         2Ff2P5P2KsYjSoSbOPx+7O+EAgUZwW4+6qjZznnwHJeOZB7LWVvafrFaJAl7rwfXDq/+
         BG66hhT3mVZU30YeW72NDq+TZxo3Ys3Bp4d1mQcwJZPxs94fon/qpz2LEgMSBGOByMgB
         5DY2iseEsNGQhRt8yGeesnbTbdmJYV5eHLb0WqhY2ZXM3rXnEavIY/yc4xzrn7Az63bH
         wCAA==
X-Gm-Message-State: AOAM531Jz/2bfyT7G7yCl9X92xdBFvjQ0flnQleyGGFjVMXEt8UIt7qp
        1ygPxoc9/WNssAZXscH1W9/j3W8Fvg6DphYz2kK7pUYNl1xiJJfeqfuevh/hOvn8915CyY/5LbW
        MoyKIXZR1CT97jmEQGBNZAg==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id f10mr14051215wry.232.1617356138340;
        Fri, 02 Apr 2021 02:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3IM+fWBMIWWC0dXiX9SYqbGiBYCoQN4BHK3a4+s4pude6jmvmdlBwOmMacbQNHjcYC5pL4Q==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id f10mr14051180wry.232.1617356138121;
        Fri, 02 Apr 2021 02:35:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.gmail.com with ESMTPSA id x6sm11605403wmj.32.2021.04.02.02.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 02:35:37 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] KVM: Move MMU notifier's mmu_lock acquisition
 into common helper
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>
References: <20210402005658.3024832-1-seanjc@google.com>
 <20210402005658.3024832-8-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a30f556a-40b2-f703-f0ee-b985989ee4b7@redhat.com>
Date:   Fri, 2 Apr 2021 11:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210402005658.3024832-8-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/04/21 02:56, Sean Christopherson wrote:
> +		.handler	= (void *)kvm_null_fn,
> +		.on_lock	= kvm_dec_notifier_count,
> +		.flush_on_ret	= true,

Doesn't really matter since the handler is null, but I think it's 
cleaner to have false here.

Paolo

