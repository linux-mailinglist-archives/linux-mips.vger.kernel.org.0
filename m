Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1856419C88
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 19:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbhI0R3y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 13:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32587 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238043AbhI0R0q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 13:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632763508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kNKGhtUzyDvvasjBG+sOupwAerMdbRFrkMWzt1aAAJI=;
        b=igcc98Lp3+uukWobFM1h4TWl+fdwPdfNYjGjAWKDEe7zxeLxVzKvlCcJ0HxilYgnd08vN1
        3KizvzzrbXl26zWnML1oQX4I9PJ7vnmgnam69AIPruGTaTMbb6po5JzYU7XSB2q2Yml0Wl
        kVMhaao6aX0yl3V/RNLbReqq6+UU1W0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Zf4ljpj2MFmNF9AlTAJx4g-1; Mon, 27 Sep 2021 13:25:06 -0400
X-MC-Unique: Zf4ljpj2MFmNF9AlTAJx4g-1
Received: by mail-pg1-f198.google.com with SMTP id n9-20020a63f809000000b0026930ed1b24so13333417pgh.23
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 10:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNKGhtUzyDvvasjBG+sOupwAerMdbRFrkMWzt1aAAJI=;
        b=17SbeoIZCdmcomg2zG6DGX6Cvl4Kc3+l/RYZq+Rxl0uZuU4XsIh+GQ3aBsSz24Mtq3
         6fE2F2ZaT/aLGQRZNFXJuNsroGOiVqMymwfH2W4TtPGeq/hnHYYAtOSCv5RkFOmPOpdI
         1SNFOw8iV3ipstvIkTKqjQgdrstxj8unX5PZcCxFG4oQA3ajIc5KLf5pmSXyawyIlbkd
         vcOuUPTDSytEtzvka37qqMka5+ngbwe8yMm0gaNIyGX3RUEnWu2f8z+Q0kqWCJdYiP5q
         mVsxglL7ZGtxGy17gjm6oQYoYHBy1fcE+tjG6k3vEBpPv/GSNU64lMkBLQhZKFfw9VNZ
         DgQg==
X-Gm-Message-State: AOAM532tPS+IDcgXCwlvzd3LGEZwMGR1eZsQiYfGvDpZiitPD4cExOwk
        FG0jYZJi8LpkXgobVqDmM0PSYDn0x/tjd5V8yyb/3bLWXN2hDQjlLu0EXh/pCfgiRAkbJ7Jph6S
        lUhoRLZWqgrVNU80KdcyAfgjBHBF2KmGHcopadg==
X-Received: by 2002:a17:902:e752:b0:13b:7e90:af8b with SMTP id p18-20020a170902e75200b0013b7e90af8bmr1093601plf.12.1632763503571;
        Mon, 27 Sep 2021 10:25:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnpQIKn1XEdvXS3sloEadlAQlrcu/KIkFx7e5cSy37I6kVkSfvfoO+V88kOShJrVeyAcUnkFvhI3opAAyj/w8=
X-Received: by 2002:a17:902:e752:b0:13b:7e90:af8b with SMTP id
 p18-20020a170902e75200b0013b7e90af8bmr1093572plf.12.1632763503267; Mon, 27
 Sep 2021 10:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210925005528.1145584-1-seanjc@google.com> <03f2f5ab-e809-2ba5-bd98-3393c3b843d2@de.ibm.com>
 <YVHcY6y1GmvGJnMg@google.com> <f37ab68c-61ce-b6fb-7a49-831bacfc7424@redhat.com>
 <43e42f5c-9d9f-9e8b-3a61-9a053a818250@de.ibm.com>
In-Reply-To: <43e42f5c-9d9f-9e8b-3a61-9a053a818250@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon, 27 Sep 2021 19:24:52 +0200
Message-ID: <CABgObfYtS6wiQe=BhF3t5usr7J6q4PWE4=rwZMMukfC9wT_6fA@mail.gmail.com>
Subject: Re: disabling halt polling broken? (was Re: [PATCH 00/14] KVM:
 Halt-polling fixes, cleanups and a new stat)
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        David Matlack <dmatlack@google.com>,
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
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        KVM ARM <kvmarm@lists.cs.columbia.edu>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kvm <kvm@vger.kernel.org>, kvm-ppc <kvm-ppc@vger.kernel.org>,
        "Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>,
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

On Mon, Sep 27, 2021 at 5:17 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
> > So I think there are two possibilities that makes sense:
> >
> > * track what is using KVM_CAP_HALT_POLL, and make writes to halt_poll_ns follow that
>
> what about using halt_poll_ns for those VMs that did not uses KVM_CAP_HALT_POLL and the private number for those that did.

Yes, that's what I meant.  David pointed out that doesn't allow you to
disable halt polling altogether, but for that you can always ask each
VM's userspace one by one, or just not use KVM_CAP_HALT_POLL. (Also, I
don't know about Google's usecase, but mine was actually more about
using KVM_CAP_HALT_POLL to *disable* halt polling on some VMs!).

Paolo

