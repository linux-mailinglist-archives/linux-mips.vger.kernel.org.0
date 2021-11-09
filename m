Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC3E44A414
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 02:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238954AbhKIBlo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 20:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhKIBll (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 20:41:41 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C353C03649E
        for <linux-mips@vger.kernel.org>; Mon,  8 Nov 2021 17:21:13 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id x131so12617403pfc.12
        for <linux-mips@vger.kernel.org>; Mon, 08 Nov 2021 17:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xrX5PIQ5N2CnAG0B54w4TYQMlOw3gRJk552Ipp+ebKw=;
        b=Stz43RdVom5q6hSvN+LnhdAH1B5D0RUDmznyrJp0pQFRjJeWUrzR/udLPaY2tilNCt
         XcgrdLFIIf2+mR8m54M6dT+Dbrc35be5RRM9b9uL9pOdJ4j7hQwoxKcdUZiCi2W8rFeo
         mmXBUYtpY4TQWJozh8/OxpMOOMnVYCLM8GwnYcFgDNGHVKOZqBpYEqqfKv0BxApaEO6w
         QHgCpUm2hA6iGp0NqZEk59gkrY4Hh/+mLGmE93ORS8+YVRoDiSXYWhEz8HkG7mLHejSo
         f65DHHDi9o/I209K1+WG4QDyN4k9mmBRl/VShVuSsU+pG0yGr+qfqYoTiN2J1n0hf0oV
         3pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xrX5PIQ5N2CnAG0B54w4TYQMlOw3gRJk552Ipp+ebKw=;
        b=tb7URKh03+pXNWLCibhhyH8Pb1wUUcfFuvAbXP0ySmirqw86QqN22albwXbz82k/o5
         mEYdMPblLHbpypNrB4s/SPQUSJimWwrakVRGIh10ZqkulAaDrATkZXf9xkQXIwMvVWiK
         kBsV241aHB4vlKDfCAHxInINKeKDH8DLWPMRhIynLbZmuy3eo0xagpU7Vcc7Oba6OVBR
         UUiYono+qBVSPH+AOzrTUOshJ36ZUS8+zoSYkXhP4BqFsp6VORXydYKV5shqMUf+N6Wv
         UrWD2btd5rejAITgBzvQ4g2zzj2/G4TXoWWdVSkPw2W6KaZAO84+GMZUPQOtk/kcU4Xs
         /jXQ==
X-Gm-Message-State: AOAM53229dzbxIpML8EcZDY0vuyHxv9f9A94D2cWuW0Hfs3y3dEN9qXO
        fQrigWWEhRqtSUZRRgA4dqsdUw==
X-Google-Smtp-Source: ABdhPJzT4cwDWE/OiPQTr+XYp5T2lNnL8iaG9fSc3ur50OFq8TyJ/z2y4+XiWK6EYq8MqHpQV5QIIA==
X-Received: by 2002:a63:8a4a:: with SMTP id y71mr2992478pgd.378.1636420872463;
        Mon, 08 Nov 2021 17:21:12 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id t13sm11751282pfl.214.2021.11.08.17.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 17:21:11 -0800 (PST)
Date:   Tue, 9 Nov 2021 01:21:07 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
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
        Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 00/30] KVM: Scalable memslots implementation
Message-ID: <YYnNA5lZNXXdX/ig@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> By the way, do you want your patches and my non-invasive patches (patches
> below number 23) merged without waiting for the rest of the series to be
> fully ready?
> 
> This way there is less risk of conflicting changes to KVM being merged
> in meantime while we are still discussing the remaining patches.
> Or worse - changes that don't conflict but subtly break some assumptions
> that the code relies on.
> 
> For this reason I am strongly for merging them independently from the
> more invasive parts.

Merging them as soon as they're ready would also be my preference.  That said,
I'm hoping we can get the entire implemenation queued up for 5.17 sooner than
later.  I'll do my best to respond quickly to try and make that happen.
