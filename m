Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668B61E79BD
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 11:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgE2JsV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 05:48:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57520 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726792AbgE2JsU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 05:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590745698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f6w/D95eveaUv1V0PC/H4Q2Slese/OFGRios5LqI3Lo=;
        b=NNRa75Reo0T7n96yVI7Ok3mL2czI6H/WaO65i3c7Hs/IqF4hu+vcux7YQq8i2UZeTrqPSN
        pE4AEGRULLd1W7LzhH5NR4Wy7/dY8dqCokBLFNTIzIaDPEakwm21vZX2gtb98FZx4MobdT
        SC8vWa6WPCTVpXrVLL0jnNssyOr3UyM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-463izAYDNnaG3DGei8uNVQ-1; Fri, 29 May 2020 05:48:17 -0400
X-MC-Unique: 463izAYDNnaG3DGei8uNVQ-1
Received: by mail-wr1-f72.google.com with SMTP id w16so811395wru.18
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 02:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f6w/D95eveaUv1V0PC/H4Q2Slese/OFGRios5LqI3Lo=;
        b=ZfKWE/zwVT4KIQ9zBT+Cm43v5i2olZ7XqkI3wANHVTCxgXOl/3Fi2fVO4NOkLP0vCQ
         kYVHs5YzBrMKJnH3x9pDXnF+txWq33ngl4jU3dc+sVEp/0ctYx+/xtzXih6x+3bw66Dk
         ptDMLDOTSlmGAmodapY1KPi+VK4rP6rsnDn7opfDMqktFKNQV0nXXdzMvkM/I9wtAj24
         2gp3VniFKPewZ1/T4XwhBSorRuhX9tVv/DHvaxIsDtAwwFR4dCTPo+p/GCMsfWYDyNPl
         SpPuXF//Xsd2DCyk6l2kJtwVbcYtesVRUZXecrip8HwG2eRDrKOYsH4rXztiwDQuGiAh
         DAmA==
X-Gm-Message-State: AOAM530b58XkX18T0Sy3hFaeI3eyGnIxZh/VL/3YPYdqtcKtOjyrp4yv
        6QSZii4G5M4BJzmVb6DqNCaUHMJ1LDYGLrkqXfoPZJSq7zOwIfCzOuLCTYdqJzZVlfZMCpi7RNY
        hnmSEAqGQ7nG2VyWYY0LqwQ==
X-Received: by 2002:a05:6000:124e:: with SMTP id j14mr7990020wrx.154.1590745695768;
        Fri, 29 May 2020 02:48:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY5u800IehczM/cQdM/5qPUlY08WZ5sRKP7f3fL0jBY9tgOmWNoklBLDcXU/RONPfyNhc2eg==
X-Received: by 2002:a05:6000:124e:: with SMTP id j14mr7990004wrx.154.1590745695574;
        Fri, 29 May 2020 02:48:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b096:1b7:7695:e4f7? ([2001:b07:6468:f312:b096:1b7:7695:e4f7])
        by smtp.gmail.com with ESMTPSA id k26sm10567358wmi.27.2020.05.29.02.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 02:48:15 -0700 (PDT)
Subject: Re: [PATCH v4 6/7] KVM: MIPS: clean up redundant 'kvm_run' parameters
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>, paulus@ozlabs.org,
        mpe@ellerman.id.au,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        cohuck@redhat.com, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        sean.j.christopherson@intel.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org, hpa@zytor.com,
        Marc Zyngier <maz@kernel.org>, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        christoffer.dall@arm.com, Peter Xu <peterx@redhat.com>,
        thuth@redhat.com, kvm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-7-tianjia.zhang@linux.alibaba.com>
 <CAAhV-H7kpKUfQoWid6GSNL5+4hTTroGyL83EaW6yZwS2+Ti9kA@mail.gmail.com>
 <37246a25-c4dc-7757-3f5c-d46870a4f186@linux.alibaba.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <30c2ac06-1a7e-2f85-fbe1-e9dc25bf2ae2@redhat.com>
Date:   Fri, 29 May 2020 11:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <37246a25-c4dc-7757-3f5c-d46870a4f186@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27/05/20 08:24, Tianjia Zhang wrote:
>>>
>>>
> 
> Hi Huacai,
> 
> These two patches(6/7 and 7/7) should be merged into the tree of the
> mips architecture separately. At present, there seems to be no good way
> to merge the whole architecture patchs.
> 
> For this series of patches, some architectures have been merged, some
> need to update the patch.

Hi Tianjia, I will take care of this during the merge window.

Thanks,

Paolo

