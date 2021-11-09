Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7A544A6E6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 07:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243208AbhKIGjW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 01:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243056AbhKIGjW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 01:39:22 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93487C0613F5
        for <linux-mips@vger.kernel.org>; Mon,  8 Nov 2021 22:36:36 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id u17so19107728plg.9
        for <linux-mips@vger.kernel.org>; Mon, 08 Nov 2021 22:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AATbywRIxzxNd7Dax4ALazPHnAkn6LmLQvylgIQIjyU=;
        b=FAgrJIcp9K/wuOKtdkRL4PckOjCABsXpUO4MPD5n4K5Vj1gP1nmXD/DTYI2omaAPKd
         IPEDkGcxSS26vD88hXHjuAeUq39e7y13F3jFltUBvm7RA/sKHC3qPkTB29A/IAWmTlKO
         eLvOadXS51ygn8mx16s6rdM1q3tA4dlcMxD4lxSjK+m5UG04FTIutq6Wp6re2bFU2VcF
         sa7u0zJmghqP5KTPmHXyWqWLXAG+4njMABiZ7lbA1J5bfZS2s4NdUuQhyizKTCEuQfPV
         +SCglyyaiPDFkspKrNaQqCF22eKwrNDxnfwEgdFHKjVQIAQlqRs9jiw4rW75/WWZW1q5
         Db8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AATbywRIxzxNd7Dax4ALazPHnAkn6LmLQvylgIQIjyU=;
        b=tw2+K85sSnOJrK8yAV7/UduGX4JYFQvo2z7TGabazb7qNaEaIUdT+WkGJQnlZgZSl1
         lYx8uY5oDWFSPmquRtdBEZd6NW5FaTcNurIlJtJrQQLz3VNuwjxyo0Qq1Ao38AoofEtl
         jZenXfhcbeRX814IMqCTATm8BF1+G4BmVwESU8U/JHDnjUtUlgHssUxyXNI+tzLio71Z
         kg4Hsj5FB41hZyRcckCK/rUv5z18cuxG7AVNd0q663UxCK7uCvXe2lSYm2Qwm3Rltoz8
         +kozWVCMlfR+ELEW02KTa8+VBS+4AEmcysDX1A8LYanVKkVlaLAsJ8gil3uE5BdzxOoF
         sdHQ==
X-Gm-Message-State: AOAM531nP47QwYzOJQwjK98rjYhtCNVcOgmuOd2Sr6JNsIagzs9lk/Vy
        Gs5yGvelwSW/eUv2TmJQw6AZNHmLur6uEabXoPc4ZQ==
X-Google-Smtp-Source: ABdhPJw+hzZesb2M2vFbROCco526ACzQd7hh9Ygg7UDBQjJf0od5fbsPy4di9D+tqraqr5p9fkIf1Il82INo7scjgvk=
X-Received: by 2002:a17:90b:380d:: with SMTP id mq13mr4771617pjb.110.1636439795842;
 Mon, 08 Nov 2021 22:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com> <20211104002531.1176691-9-seanjc@google.com>
In-Reply-To: <20211104002531.1176691-9-seanjc@google.com>
From:   Reiji Watanabe <reijiw@google.com>
Date:   Mon, 8 Nov 2021 22:36:19 -0800
Message-ID: <CAAeT=FxcFq2SoM5xRYJfB=bBzGrY1uuEUhvFd+6sb86y-rg_Yw@mail.gmail.com>
Subject: Re: [PATCH v5.5 08/30] KVM: arm64: Use "new" memslot instead of
 userspace memory region
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
        Ben Gardon <bgardon@google.com>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        linux-riscv@lists.infradead.org, Joerg Roedel <joro@8bytes.org>,
        kvmarm@lists.cs.columbia.edu, kvm-ppc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jim Mattson <jmattson@google.com>,
        Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 3, 2021 at 5:26 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Get the slot ID, hva, etc... from the "new" memslot instead of the
> userspace memory region when preparing/committing a memory region.  This
> will allow a future commit to drop @mem from the prepare/commit hooks
> once all architectures convert to using "new".
>
> Opportunistically wait to get the hva begin+end until after filtering out
> the DELETE case in anticipation of a future commit passing NULL for @new
> when deleting a memslot.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Reiji Watanabe <reijiw@google.com>
