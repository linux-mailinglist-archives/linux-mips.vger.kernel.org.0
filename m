Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B7245092B
	for <lists+linux-mips@lfdr.de>; Mon, 15 Nov 2021 17:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhKOQHK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Nov 2021 11:07:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45836 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236643AbhKOQHG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Nov 2021 11:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636992250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kNZ2k+Bbqs2mU+HEeYXnMycgNMTgeh9stKyx+F+r/jk=;
        b=DfYXLlX67Vjl3/N5BMWqrtFoCY+3B2q4RKbRwkGkev+VIaSMIZxzqK34jjtd56hb5yqyrE
        M6Jttaom3JZbdfBFuTfxcwGY8uwGs79TY2z/D8iTcHOFtSM+wzXfatgJ3HyR0VCW/yKes5
        gwfzgtR8k3/pEpL7GIOWjsROgifp4Ns=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-jmXc_UO-ObianKH51OrpJQ-1; Mon, 15 Nov 2021 11:04:09 -0500
X-MC-Unique: jmXc_UO-ObianKH51OrpJQ-1
Received: by mail-wr1-f72.google.com with SMTP id v17-20020adfedd1000000b0017c5e737b02so3726948wro.18
        for <linux-mips@vger.kernel.org>; Mon, 15 Nov 2021 08:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=kNZ2k+Bbqs2mU+HEeYXnMycgNMTgeh9stKyx+F+r/jk=;
        b=vU7yZs+7baB1oh8iTQ6a1oJ2HBDqhL6RmUo+qn8kltx//yteas8GPZEZdn8+ZA6F08
         by8FJV71qlXy+66/riUp2bIjOGsvIIuUSnglWRCdPqJRFDbOMEY/awUZEpPFf0BUpdHp
         wd+sNNsBSNSavsLkpHsAB2qertXW+RZcQiL9lSSxHIjjTSeGV2wn24sM7pfJeddb/jWe
         1LDTh/7zFFUy3CIH++spAZtcHnFh5XejwYaVHzRTVJOGbd1qnAZU9lmkyPQ16/07W1yL
         MSwIN6ThgXdjW5vLd6O6ANaSDOVuazgfU5Dgjg16kEa11TqrqCi6LaVdEfnj4Q+eoJ6I
         wPTA==
X-Gm-Message-State: AOAM530RYrcoVj+bn+XGh+rSs0lq7XonaC02yHYKhUz/K3fXuYMtob9F
        4b95ws6RCAk4eHBra8ajGUdE/LAYsyp+nRTqYq/P/qKZbr1bGrbui0Z9ma9wJBA6hPJ4LKSmi4L
        N+TuJnc5E1wCwQJy/cKRhYg==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr45662402wmb.191.1636992245606;
        Mon, 15 Nov 2021 08:04:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz1gqovDpiBG7rQwvXN0J5DRj1u8GplrLX76hoeAAMPE/ExRbSHuZD82FzagUh/Q8svxu6iw==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr45662049wmb.191.1636992243301;
        Mon, 15 Nov 2021 08:04:03 -0800 (PST)
Received: from fedora (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id h27sm22065673wmc.43.2021.11.15.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:04:02 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Cc:     Sean Christopherson <seanjc@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS and
 re-purpose it on x86
In-Reply-To: <ecd55383-7089-b3cd-30cc-3f9feb7eadb4@de.ibm.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <4a3c7be7-12fa-6e47-64eb-02e6c5be5dbc@redhat.com>
 <ecd55383-7089-b3cd-30cc-3f9feb7eadb4@de.ibm.com>
Date:   Mon, 15 Nov 2021 17:04:01 +0100
Message-ID: <877dd9pfri.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> Am 11.11.21 um 17:32 schrieb Paolo Bonzini:
>> On 11/11/21 17:27, Vitaly Kuznetsov wrote:
>>> This is a comtinuation of "KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS"
>>> (https://lore.kernel.org/kvm/20211111134733.86601-1-vkuznets@redhat.com=
/)
>>> work.
>>>
>>> 1) Enforce KVM_CAP_NR_VCPUS <=3D KVM_CAP_MAX_VCPUS rule on all
>>> =C2=A0 architectures. [Sean Christopherson]
>>> 2) Make KVM_CAP_NR_VCPUS return num_online_cpus() and not an arbitrary
>>> =C2=A0 value of '710' on x86.
>>>
>>> Everything but x86 was only 'eyeball tested', the change is trivial
>>> but sorry in advance if I screwed up)
>>=20
>> Christian, can you look at this for s390?=C2=A0 Returning a fixed value =
seems wrong for KVM_CAP_NR_VCPUS.
>
> If we talk about recommended number, then num_online_cpus() also seems to=
 make sense on s390 so
> if you change that for s390 as well I can ACK this.

Thanks!

For KVM_CAP_MAX_VCPUS s390 code returns one of the three things:
KVM_S390_BSCA_CPU_SLOTS(64), KVM_MAX_VCPUS(255) or
KVM_S390_ESCA_CPU_SLOTS(248).

For KVM_CAP_NR_VCPUS, would it be better to return raw
num_online_cpus():

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 6a6dd5e1daf6..fcecbb762a1a 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -578,6 +578,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long =
ext)
                r =3D MEM_OP_MAX_SIZE;
                break;
        case KVM_CAP_NR_VCPUS:
+               r =3D num_online_cpus();
+               break;
        case KVM_CAP_MAX_VCPUS:
        case KVM_CAP_MAX_VCPU_ID:
                r =3D KVM_S390_BSCA_CPU_SLOTS;

or cap KVM_CAP_MAX_VCPUS value with num_online_cpus(), e.g.

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 6a6dd5e1daf6..1cfe36f6432e 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -585,6 +585,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long =
ext)
                        r =3D KVM_MAX_VCPUS;
                else if (sclp.has_esca && sclp.has_64bscao)
                        r =3D KVM_S390_ESCA_CPU_SLOTS;
+               if (ext =3D=3D KVM_CAP_NR_VCPUS)
+                       r =3D min_t(unsigned int, num_online_cpus(), r);
                break;
        case KVM_CAP_S390_COW:
                r =3D MACHINE_HAS_ESOP;

For reference, see our ARM discussion:
https://lore.kernel.org/kvm/20211111162746.100598-2-vkuznets@redhat.com/
though 390's situation is different, the returned value for
KVM_CAP_MAX_VCPUS is not VM-dependent.

--=20
Vitaly

