Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D070774059
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjHHRCY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbjHHRBW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:01:22 -0400
Received: from mail-oo1-xc49.google.com (mail-oo1-xc49.google.com [IPv6:2607:f8b0:4864:20::c49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55FE1968C
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:00:58 -0700 (PDT)
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-560c7abdbdcso9448214eaf.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691510423; x=1692115223;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaiJ+rWGolW4ovI22gadBn2AFu8/7ikdaAkBdyz0qCk=;
        b=20HQMTORVLDVFv6fTfSRVJgW+TrHIxHg++CzjnZTJd7MF/zDHe4JkQXXxHg0rLg+bz
         UY8RrE+cpKBNITCvIWqTWika2bDDam67MdZwbfHYbi0DOkwrlyjzHT6eTBCJ2JNxPSzy
         7651EFNPzLz7im9XOdBFL5PuZ6jFoWVbnoaNrdvczLomDpbuyeUr9mwTvQz8feu/mx54
         5iYtDncMKr6Phh4A2hJM2Z4RbjrlEJ4dSkynygQWQjYIpCY0VR4kImTab8hvMh5LdxM9
         3GybIqbyAvbAVSKqWz6gh7xi2t+lY0jpQXrfV54q1LTk8HT21JlnDTIEAsKOh14dvnUn
         9scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510423; x=1692115223;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BaiJ+rWGolW4ovI22gadBn2AFu8/7ikdaAkBdyz0qCk=;
        b=XQ3rPUgX+9KJV0ARegYkGDFIwY6XMNJj3x7Md8JwKKY0LJXC+fBDeB5lCPU6S7caPK
         wwuloc8GXWryiHzD6MgmcMJTG6Zq+ryM18oc/fiWdlIrqsB7tCtINIGaFUoJBGrjlwC4
         i+3Vmk6a+eKvPfRtJS7v6WS7sp3Bo0ET2eVbKunvVMZpgMg29rqQRTQtxh1TcEYAKsAd
         lVloCRBswzZ6E2JVDSc93tmTIG6xrIQzKOX9Qpn33YciR3DnPmu6r9LNlDdOv3Qk3UZH
         dtHLQaxiHhb1LgfFFphSEAq8doUr4C2fwv1nrza6Owj8OI6oMzEkvOchP7wmOZWudY4P
         NtsQ==
X-Gm-Message-State: AOJu0YzKVzB6Nff+QrsP8epIavagkDMzxQQkhPWuVdmjSE3aHCepCbpD
        GSgNvpl/pUai9hniGzhnSupfLtgSc04=
X-Google-Smtp-Source: AGHT+IG5/N2ZE1Ejorc8NLEsKzeCITxV+EG+130yb+21WD/iP5VWmZCCV6UyxFu6UTgxWYvax2jHbb68fQQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3c11:0:b0:564:179a:d5cb with SMTP id
 j17-20020a633c11000000b00564179ad5cbmr56114pga.8.1691507265754; Tue, 08 Aug
 2023 08:07:45 -0700 (PDT)
Date:   Tue, 8 Aug 2023 08:07:43 -0700
In-Reply-To: <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
 <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
Message-ID: <ZNJaPxTtPRCv0HOl@google.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
From:   Sean Christopherson <seanjc@google.com>
To:     Raghavendra Rao Ananta <rananta@google.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 04, 2023, Raghavendra Rao Ananta wrote:
> On Wed, Aug 2, 2023 at 4:28=E2=80=AFPM Raghavendra Rao Ananta
> <rananta@google.com> wrote:
> >
> > Sure, I'll change it to kvm_arch_flush_vm_tlbs() in v8.
> >
> While working on the renaming, I realized that since this function is
> called from kvm_main.c's kvm_flush_remote_tlbs(). Do we want to rename
> this and the other kvm_flush_*() functions that the series introduces
> to match their kvm_arch_flush_*() counterparts?

Hmm, if we're going to rename one arch hook, then yes, I think it makes sen=
se to
rename all the common APIs and arch hooks to match.

However, x86 is rife with the "remote_tlbs" nomenclature, and renaming the =
common
APIs will just push the inconsistencies into x86.  While I 100% agree that =
the
current naming is flawed, I am not willing to end up with x86 being partial=
ly
converted.

I think I'm ok renaming all of x86's many hooks?  But I'd definitely want i=
nput
from more x86 folks, and the size and scope of this series would explode.  =
Unless
Marc objects and/or has a better idea, the least awful option is probably t=
o ignore
the poor "remote_tlbs" naming and tackle it in a separate series.

Sorry for not noticiing this earlier, I didn't realize just how much x86 us=
es
remote_tlbs.

> (spiraling more into this, we also have the 'remote_tlb_flush_requests' a=
nd
> 'remote_tlb_flush' stats)

Regardless of what we decide for the APIs, definitely leave the stats alone=
.  The
names are ABI.  We could preserve the names and changes the struct fields, =
but that
would be a net negative IMO.
