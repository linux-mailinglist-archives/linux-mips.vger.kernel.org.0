Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE78334260
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 17:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhCJQD6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 11:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38714 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232727AbhCJQDt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 11:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615392228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T6LZWP2vn4gZYNN60dpd9pTIeb1KCd0er7xtszZkk6U=;
        b=bhKXKhxw+ZSn/71Tksjz1NmcU1+mwOomex78JYC/oYUjKLGc3teEQ8M2d+jR61pb6M2IGb
        OoWJjeBzLF/a5NOAqjYcvbSH26haJKbdVJR9rJVHIUIB+LHW09EOoahiJZU6YRlQFmhM5C
        VVnJ/7symILjjKRlE4F0qBcEISc1YSQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-pqtZpUk5OU-Y2CsNCMP33w-1; Wed, 10 Mar 2021 11:03:46 -0500
X-MC-Unique: pqtZpUk5OU-Y2CsNCMP33w-1
Received: by mail-ed1-f72.google.com with SMTP id h5so8610468edf.17
        for <linux-mips@vger.kernel.org>; Wed, 10 Mar 2021 08:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T6LZWP2vn4gZYNN60dpd9pTIeb1KCd0er7xtszZkk6U=;
        b=XyRZR73A+xT6FApqOwPqxgB3WWmKn3C92HWq2lWNZd78koCIoJLnGtFJhi3dkCx6ZO
         cA+t19gUaLNRXTz11nskdLhNPyCivq/xGt8LvUO2+6e2Yj2zgWbUjt04YHw07Tr6UFTq
         OsExFdwaeGY1/9DM8SgY5OGnCITkpXVB/2CcUjprhvz0EvKc6koFU8w9CNT8ARFVUrXT
         wSk5knNQcBK6ZAuWTeUm5c649+ASQqaD27f1aQr1rszR52pjLe8OMZneQ/T1yI3uWsbD
         JjL7CThucVUTBrCfkwSvQde1no8vKRnh0AVQ9k2y1JSALxFcMrbkyovgIGNUnLXgB6Op
         3EWA==
X-Gm-Message-State: AOAM531y4/pJEP0df/mQ/L5ohMRXOfP1kEUQR5YfhQIorkzWjK47AiPz
        d8ihRiO8MaoeIK1/cm1auBtisOZMjWiGDmIkjMIvGbNTPTtNl4xyF7o93z7sDYVzpYFl/tKFMSg
        eUU2Q3+j2Oj6erdwFNMDYDg==
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr4365531ejb.445.1615392225073;
        Wed, 10 Mar 2021 08:03:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1V5iKaTO/Dprgp6gE22d8iEwpMy8ZGDfQA++8bp2mD+TtXAT0OFzpxwvgV6mj5ydH3tp6rw==
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr4365501ejb.445.1615392224882;
        Wed, 10 Mar 2021 08:03:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id k9sm8884545edn.68.2021.03.10.08.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 08:03:44 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] KVM: stats: Add ioctl commands to pull statistics
 in binary format
To:     Marc Zyngier <maz@kernel.org>, Jing Zhang <jingzhangos@google.com>
Cc:     KVM <kvm@vger.kernel.org>, KVM ARM <kvmarm@lists.cs.columbia.edu>,
        Linux MIPS <linux-mips@vger.kernel.org>,
        KVM PPC <kvm-ppc@vger.kernel.org>,
        Linux S390 <linux-s390@vger.kernel.org>,
        Linux kselftest <linux-kselftest@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210310003024.2026253-1-jingzhangos@google.com>
 <20210310003024.2026253-4-jingzhangos@google.com>
 <875z1zxb11.wl-maz@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a475d935-e404-93dd-4c6d-a5f8038d8f4d@redhat.com>
Date:   Wed, 10 Mar 2021 17:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <875z1zxb11.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/03/21 16:51, Marc Zyngier wrote:
>> +	kvm_for_each_vcpu(j, vcpu, kvm) {
>> +		pdata = data + VM_STAT_COUNT;
>> +		for (i = 0; i < VCPU_STAT_COUNT; i++, pdata++)
>> +			*pdata += *((u64 *)&vcpu->stat + i);
> Do you really need the in-kernel copy? Why not directly organise the
> data structures in a way that would allow a bulk copy using
> copy_to_user()?

The result is built by summing per-vCPU counters, so that the counter 
updates are fast and do not require a lock.  So consistency basically 
cannot be guaranteed.

Paolo

