Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8A14199CE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 18:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbhI0RA7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 13:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235425AbhI0RA6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 13:00:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C886C061740
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 09:59:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b15so79146029lfe.7
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=boyhOy7c3Zv3+YHD3yPMRV9jTZZHINKXKipnorJKcwg=;
        b=EFsgbbFE2kAt7wByLaFcasmCsfVIgNxk/m8G/nDr+HQQCPZquhtvMBtAa+Duc5+kXQ
         UtY1CeMLlZTD94anpjzQv4K2YgUm9xVsItVLuyYt7PzuN+o60dJjWiO6ZURLbhkP7mzD
         l/1wphgAzzIFt+bnAvBUh1vmO0XgUCFQbkR5nyhNqwPHp4lRcD3QYQpAbbn7KH5W/ysv
         OQmlCYcjYrF8BVfGjUkclx0OrNnd/IdHMhsMfPOv7/HS8Qxd6WyABtIhI1iDB0FR5uaE
         W0Ua9w0Kzy0A9r7i69bL0pt1y0fFyfV6OwYtL3O/7ZJwWx+dXki0Z+PUBsXBMwLQP/I9
         ShZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boyhOy7c3Zv3+YHD3yPMRV9jTZZHINKXKipnorJKcwg=;
        b=cVNFgpD44QCVVdXPRZPnBxvUAHWPg2tTg/REeWdRNW/A6mnO4C0GSiqerPx5yolwOq
         PP3wV5HqJs4Q9ndvsVOlFqQV98g0PxVrb60ywKBIuOOAmgMd4uHndfCZ0i9Hl9tZXCNS
         AJflQ9EKK2otFZ3toOm4PQuQyb6lweLGOMOLdUBxrKqHNm1Rh4XuQETr4Us/DcS5hiJx
         TrdOY7A97BWhREIPob7xeDiugj+7TyUYCw67O8FbYwnyAh7p21/OSNH8RdfeJ+M3FcZP
         NkOQK8GxeAchBJnDgvqsxBPMgYJFeuF1wzDg98XypSJS2ZEqikl04iJ6KeZlhlEnBPBQ
         dPHw==
X-Gm-Message-State: AOAM533ge5Ioyi8ux91XLZtyhbWuHR3ja0p34/3410eFapwkC9Lq0tX6
        H8wZ64hUU6t6778HCq0EY14GU5Y+/F0lwb3jLnT2gQ==
X-Google-Smtp-Source: ABdhPJyvrc2iIXbcC8YaiVkzYO41Psj9zevIrEPYYOmLf26TIPB4wujR7R6xkm6OJn238QJWJUKaISQGVYiRf4/ylng=
X-Received: by 2002:a19:c349:: with SMTP id t70mr843112lff.102.1632761958145;
 Mon, 27 Sep 2021 09:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210925005528.1145584-1-seanjc@google.com> <03f2f5ab-e809-2ba5-bd98-3393c3b843d2@de.ibm.com>
 <YVHcY6y1GmvGJnMg@google.com> <f37ab68c-61ce-b6fb-7a49-831bacfc7424@redhat.com>
 <43e42f5c-9d9f-9e8b-3a61-9a053a818250@de.ibm.com>
In-Reply-To: <43e42f5c-9d9f-9e8b-3a61-9a053a818250@de.ibm.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 27 Sep 2021 09:58:51 -0700
Message-ID: <CALzav=cxeYieTkKJhT0kFZOjdv6k5eCZXKWs=ZQGCJg0x-oFjQ@mail.gmail.com>
Subject: Re: disabling halt polling broken? (was Re: [PATCH 00/14] KVM:
 Halt-polling fixes, cleanups and a new stat)
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jon Cargille <jcargill@google.com>,
        Jim Mattson <jmattson@google.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jing Zhang <jingzhangos@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Janosch Frank <frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 27, 2021 at 8:17 AM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
>
>
> Am 27.09.21 um 17:03 schrieb Paolo Bonzini:
> > On 27/09/21 16:59, Sean Christopherson wrote:
> >>> commit acd05785e48c01edb2c4f4d014d28478b5f19fb5
> >>> Author:     David Matlack<dmatlack@google.com>
> >>> AuthorDate: Fri Apr 17 15:14:46 2020 -0700
> >>> Commit:     Paolo Bonzini<pbonzini@redhat.com>
> >>> CommitDate: Fri Apr 24 12:53:17 2020 -0400
> >>>
> >>>      kvm: add capability for halt polling
> >>>
> >>> broke the possibility for an admin to disable halt polling for already running KVM guests.
> >>> In past times doing
> >>> echo 0 > /sys/module/kvm/parameters/halt_poll_ns
> >>>
> >>> stopped polling system wide.
> >>> Now all KVM guests will use the halt_poll_ns value that was active during
> >>> startup - even those that do not use KVM_CAP_HALT_POLL.
> >>>
> >>> I guess this was not intended?
> >
> > No, but...
> >
> >> I would go so far as to say that halt_poll_ns should be a hard limit on
> >> the capability
> >
> > ... this would not be a good idea I think.  Anything that wants to do a lot of polling can just do "for (;;)".

I agree. It would also be a maintenance burden and subtle "gotcha" to
have to increase halt_poll_ns anytime one wants to increase
KVM_CAP_HALT_POLL.

> >
> > So I think there are two possibilities that makes sense:
> >
> > * track what is using KVM_CAP_HALT_POLL, and make writes to halt_poll_ns follow that
>
> what about using halt_poll_ns for those VMs that did not uses KVM_CAP_HALT_POLL and the private number for those that did.

None of these options would cover Christian's original use-case
though. (Write to module to disable halt-polling system-wide.)

What about adding a writable "enable_halt_polling" module parameter
that affects all VMs? Once that is in place we could also consider
getting rid of halt_poll_ns entirely.

> >
> > * just make halt_poll_ns read-only.
> >
> > Paolo
> >
