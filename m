Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8350F339D5E
	for <lists+linux-mips@lfdr.de>; Sat, 13 Mar 2021 10:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbhCMJf4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Mar 2021 04:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60430 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhCMJf2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Mar 2021 04:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615628127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GEXvJoFIMtu03gnrQoXoMyZklbH+XrN6f9pUvJEic0Q=;
        b=ZmbRXPzonAcM+GAumrgs+G0WXIAu1aUFgYdM3OWDkUg+I2V2JkyBEBajcQZwKjTT3qKtiN
        c2V7L6EXJTc3JIuRhAzjDSZlQNxl8LU1NSWwyN/GIKF81T2MQ36aPwuVM4JZMYgAUT2Pot
        SeG5gAMxqsIO0Lw5zy0FxkGhYHPT3XA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-iSb6aoX0OziNSYkTgHFS_A-1; Sat, 13 Mar 2021 04:35:24 -0500
X-MC-Unique: iSb6aoX0OziNSYkTgHFS_A-1
Received: by mail-wr1-f70.google.com with SMTP id v13so12379017wrs.21
        for <linux-mips@vger.kernel.org>; Sat, 13 Mar 2021 01:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GEXvJoFIMtu03gnrQoXoMyZklbH+XrN6f9pUvJEic0Q=;
        b=s9m5A0VzeFf+JU9tCWXcJ36FXSRyaWLd8J+t+VmA+N77Nkr1B8lFV3Gb23ItUp5Ykt
         4TSm9fapo9aFnvUm68IFu6NaVxQs8XrSIuSTZ5aOf6TLp5oDGWJ0pWLDjJtJaR8qTqod
         kxi3o4EPauyW7wucpPKHpTP425LoePCeLUk1rrmD8HY+T8WM95GRk4IYJLtHlSaJZMBQ
         PsajA42HUbIJ8NkHI89nfIa1yDeZpfDrWj+QZMtZehTOigY6bic/XRW/rGLxTWHlg+++
         apruKeDZm6OUvjH9VZFsdBzYxHNYg1YN2q8GU6d1Sq0Z/92XVczPVNrC22oEJVk9HNrF
         Ld3g==
X-Gm-Message-State: AOAM531PamYMzf5beEFYMJrL3nrBCr6iJQl738fpSGvyCn7L5n8l+zHy
        dmviPuxPm/pKpYD2eE3y+C99tuSA03psN8lcZfCVunpXijwkyGKXRGPkQO3fmO1tJMreembhUL+
        6DHpaLHbJRI3p+3egrzNrMw==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr17111377wmc.184.1615628123493;
        Sat, 13 Mar 2021 01:35:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZPtEFloConQy5tT04Uy7VF5TWLNu7KM1ZAXfW/KGrUv9L+W1l/kfjlKPOTxYm+VdwnnAdmg==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr17111339wmc.184.1615628123265;
        Sat, 13 Mar 2021 01:35:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id b17sm11575008wrt.17.2021.03.13.01.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Mar 2021 01:35:22 -0800 (PST)
To:     Jing Zhang <jingzhangos@google.com>
Cc:     KVM <kvm@vger.kernel.org>, KVM ARM <kvmarm@lists.cs.columbia.edu>,
        Linux MIPS <linux-mips@vger.kernel.org>,
        KVM PPC <kvm-ppc@vger.kernel.org>,
        Linux S390 <linux-s390@vger.kernel.org>,
        Linux kselftest <linux-kselftest@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
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
 <bb03107c-a413-50da-e228-d338dd471fb3@redhat.com>
 <CAAdAUtjj52+cAhD4KUzAaqrMSJXHD0g=ecQNG-a92Mqn3BCxiQ@mail.gmail.com>
 <ac7462de-1531-5428-5dca-4e3dfb897000@redhat.com>
 <CAAdAUtjV67hx5BAd31-RG6tjgfZ6tdyu_yLhkbR0d-3qm59mMA@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 3/4] KVM: stats: Add ioctl commands to pull statistics
 in binary format
Message-ID: <01a4619a-b36c-c08e-ff6e-7f8bc4d32771@redhat.com>
Date:   Sat, 13 Mar 2021 10:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAdAUtjV67hx5BAd31-RG6tjgfZ6tdyu_yLhkbR0d-3qm59mMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/03/21 23:27, Jing Zhang wrote:
>>>> 4 bytes flags (always zero)
> Could you give some potential use for this flag?

No idea, honestly.  It probably would signal the presence of more fields 
after "offset of the first stat value".  In general it's better to leave 
some room for extension.

>>>> 4 bytes number of statistics
>>>> 4 bytes offset of the first stat description
>>>> 4 bytes offset of the first stat value
>>>> stat descriptions:
>>>>     - 4 bytes for the type (for now always zero: uint64_t)
> Potential use for this type? Should we move this outside descriptor? Since
> all stats probably have the same size.

Yes, all stats should be 8 bytes.  But for example:

- 0 = uint64_t

- 1 = int64_t

- 0x80000000 | n: enum with n different values, which are stored after 
the name

>>>>     - 4 bytes for the flags (for now always zero)
> Potential use for this flag?

Looking back at Emanuele's statsfs, it could be:

- bit 0: can be cleared (by writing eight zero bytes in the statistics' 
offset)

- bit 1: cumulative value (count of events, can only grow) vs. 
instantaneous value (can go up or down)

This is currently stored in the debugfs mode, so we can already use 
these flags.

Paolo

