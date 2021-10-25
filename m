Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA4D439803
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 16:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhJYOEN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 10:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49429 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233054AbhJYOEM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 10:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635170509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5GxuWusEjMHZ4JQn5qLWUyg1MyGQPS66ltUGy4HnHFU=;
        b=EVzFm98FAVm661Q/y1/bB8DJuKwVTAIN3GUG7eH1slA/O3H3anXcnWS0gy+p40rJREVQDx
        USPiexkBba0+jUhxJqtyzciaUy0tgiQtXHNcQm7HMJfOP8oVBRpPI50scQpzCY9wZO/34z
        JAXU5sOANOMyfeNaZBEkUkVezWaR1PQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-80b_8GrOMHO4omVvJbUMPQ-1; Mon, 25 Oct 2021 10:01:46 -0400
X-MC-Unique: 80b_8GrOMHO4omVvJbUMPQ-1
Received: by mail-wr1-f70.google.com with SMTP id z8-20020adfec88000000b00168672580e0so1928562wrn.21
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 07:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5GxuWusEjMHZ4JQn5qLWUyg1MyGQPS66ltUGy4HnHFU=;
        b=23yRWocrsw+NnxyNhOq9ut9entCJ+Qx7APpYyVPAvipf0K2Pugr9HX2QNLz25wKT1w
         cG9upDIpkuLjWlE/CrX5LvxmVm7JJPuXTCxFni/+N08YyG0bIOD25Ny21SHZR2K4OZZH
         LVw3QYDSJ1XSdwve1aeGcncQNKNEHAqIOjkcJjwqX/+MDmRVtGC19SB4/x9Bf08LkY3r
         QzAuoSENGuVTMlQK0voUPXD+dJ0zamlANlfr3KuW7DviIfPlf/hFMpRI5j+UGCJ1CxKa
         5tPhKGiIDE4PYycjDBgVR1s1LVFUmVjk8enWjlrJYMOKi+lh628cuxYX3bnjcijGhH0W
         PW1Q==
X-Gm-Message-State: AOAM5334nrNKbIEGMauppDPzI/OiahpvVeKKsZgVYvIi6gHWCC5/h6KJ
        zkbnB+9Flk5ghaBBkJYmoSVjIlmj8vMMHKdQbqKfy0UdkYMbgHz5X/D1PIMNaJyzOTtvbBtVDYw
        dBoSyjq/JVtNngcBE+lHA5w==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr23589886wrr.76.1635170505444;
        Mon, 25 Oct 2021 07:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiqFlcSYWH7tg/r7nyk/acEU7XFm6PKMcaIfNQ0d2l1GPzyRzlNJCdOi1PnQIqdfTr2oUQaw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr23589820wrr.76.1635170505123;
        Mon, 25 Oct 2021 07:01:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id x2sm5765371wmj.3.2021.10.25.07.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:01:44 -0700 (PDT)
Message-ID: <18e6a656-f583-0ad4-6770-9678be3f5cf4@redhat.com>
Date:   Mon, 25 Oct 2021 16:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 24/43] KVM: VMX: Drop pointless PI.NDST update when
 blocking
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-25-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-25-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 04:12, Sean Christopherson wrote:
> Don't update Posted Interrupt's NDST, a.k.a. the target pCPU, in the
> pre-block path, as NDST is guaranteed to be up-to-date.  The comment
> about the vCPU being preempted during the update is simply wrong, as the
> update path runs with IRQs disabled (from before snapshotting vcpu->cpu,
> until after the update completes).

Right, it didn't as of commit bf9f6ac8d74969690df1485b33b7c238ca9f2269 
(when VT-d posted interrupts were introduced).

The interrupt disable/enable pair was added in the same commit that 
motivated the introduction of the sanity checks:

     commit 8b306e2f3c41939ea528e6174c88cfbfff893ce1
     Author: Paolo Bonzini <pbonzini@redhat.com>
     Date:   Tue Jun 6 12:57:05 2017 +0200

     KVM: VMX: avoid double list add with VT-d posted interrupts

     In some cases, for example involving hot-unplug of assigned
     devices, pi_post_block can forget to remove the vCPU from the
     blocked_vcpu_list.  When this happens, the next call to
     pi_pre_block corrupts the list.

     Fix this in two ways.  First, check vcpu->pre_pcpu in pi_pre_block
     and WARN instead of adding the element twice in the list.  Second,
     always do the list removal in pi_post_block if vcpu->pre_pcpu is
     set (not -1).

     The new code keeps interrupts disabled for the whole duration of
     pi_pre_block/pi_post_block.  This is not strictly necessary, but
     easier to follow.  For the same reason, PI.ON is checked only
     after the cmpxchg, and to handle it we just call the post-block
     code.  This removes duplication of the list removal code.

At the time, I didn't notice the now useless NDST update.

Paolo

> The vCPU can get preempted_before_  the update starts, but not during.
> And if the vCPU is preempted before, vmx_vcpu_pi_load() is responsible
> for updating NDST when the vCPU is scheduled back in.  In that case, the
> check against the wakeup vector in vmx_vcpu_pi_load() cannot be true as
> that would require the notification vector to have been set to the wakeup
> vector_before_  blocking.
> 
> Opportunistically switch to using vcpu->cpu for the list/lock lookups,
> which presumably used pre_pcpu only for some phantom preemption logic.

