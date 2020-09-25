Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299EA2792ED
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 23:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgIYVGQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Sep 2020 17:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44875 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727519AbgIYVGQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Sep 2020 17:06:16 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601067975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nph2D9IVfI+xvuD8zFp+f/GwIX9O4qj0XvwXCm0EYyg=;
        b=eode0v0JDaBStoNf9D8IQ0OnSNCRb8Uc/Foqr3IlCZ9i4OIG0+GVAHcVJ88vWX0aajY1ol
        8G1SzWVlgs+DtrUdtF5Fxqe0U3WTieIaR7GqG+igy83VI/zNGsx9JHEOdTTT/q5Z9wh8lb
        vk2UGfGiigeU7ZTvOddvj4FeOE9UlpY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-t68KlsJBO5eT299OTBgnDg-1; Fri, 25 Sep 2020 17:06:13 -0400
X-MC-Unique: t68KlsJBO5eT299OTBgnDg-1
Received: by mail-wm1-f72.google.com with SMTP id s24so137629wmh.1
        for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2020 14:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nph2D9IVfI+xvuD8zFp+f/GwIX9O4qj0XvwXCm0EYyg=;
        b=TkScxKJ4s2/pDYNpB4sTDHj015MtodxCIAZl2/qQFKgjuVgGEEu0LyHD3+lrq81N2a
         MNVpbVB0iONxzUpzCk0ZZV+CejFLoMnAZovVZiWEDM7U8HahDmeIX4Gu4ByJUF2Ox1VL
         8TRuHqsoxZ8B4Gqvjp1fJbBaLr7v9QPA+2gteiFZ431q7o5qYhNhuXj5lcSMtEDE/Jct
         WiFkdqC1e89CktK1tY/7sDdQF+wwMEa5QVf1GnqqtPf4vyj3rsBvK/ddiG2VoeOyiXEU
         XJILG8DeILMjEeHM7d/vfQQo9o4lYWG/ijpJlzeyP+47meAFFekvZI/quq0gTjJ2uKnQ
         ujiQ==
X-Gm-Message-State: AOAM531QHeSOmPdfnG06bA0fQ6+1C1h3RjGeHiixmwJHUj+QkQviAnyo
        5o/RYjZ0zOeHG4U20+uKKObpxt0xO5OuHP6DTJt3rWIZEXH3BOPUuUVyanh4l2SvZxSnbdknEBc
        rU2O59s5klEPwB7XKA/cwVA==
X-Received: by 2002:adf:f207:: with SMTP id p7mr6889817wro.152.1601067972440;
        Fri, 25 Sep 2020 14:06:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+svzQTyn/sr+1A0KnMYOANfhe1Lyv2OpG+lPc9M4qsZez3YRF08veAZn1ubvdVOTuIczmeg==
X-Received: by 2002:adf:f207:: with SMTP id p7mr6889795wro.152.1601067972235;
        Fri, 25 Sep 2020 14:06:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec9b:111a:97e3:4baf? ([2001:b07:6468:f312:ec9b:111a:97e3:4baf])
        by smtp.gmail.com with ESMTPSA id t203sm255701wmg.43.2020.09.25.14.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 14:06:11 -0700 (PDT)
Subject: Re: [RFC PATCH 3/3] KVM: x86: Use KVM_BUG/KVM_BUG_ON to handle bugs
 that are fatal to the VM
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        kvm-ppc@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20200923224530.17735-1-sean.j.christopherson@intel.com>
 <20200923224530.17735-4-sean.j.christopherson@intel.com>
 <878scze4l5.fsf@vitty.brq.redhat.com> <20200924181134.GB9649@linux.intel.com>
 <87k0wichht.fsf@vitty.brq.redhat.com>
 <20200925171233.GC31528@linux.intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <731dd323-8c66-77ff-cf15-4bbdea34bcf9@redhat.com>
Date:   Fri, 25 Sep 2020 23:06:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925171233.GC31528@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/09/20 19:12, Sean Christopherson wrote:
>> Do we actually want to prevent *all* ioctls? E.g. when 'vm bugged'
>> condition is triggered userspace may want to extract some information to
>> assist debugging but even things like KVM_GET_[S]REGS will just return
>> -EIO. I'm not sure it is generally safe to enable *everything* (except
>> for KVM_RUN which should definitely be forbidden) so maybe your approach
>> is preferable.
>
> The answer to this probably depends on the answer to the first question of
> when it's appropriate to use KVM_BUG().  E.g. if we limit usage to fatal or
> dangrous cases, then blocking all ioctls() is probably the right thing do do.

I think usage should be limited to dangerous cases, basically WARN_ON
level.  However I agree with Vitaly that KVM_GET_* should be allowed.

The other question is whether to return -EIO or KVM_EXIT_INTERNAL_ERROR.
 The latter is more likely to be handled already by userspace.

Paolo

