Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEF67E5BE0
	for <lists+linux-mips@lfdr.de>; Wed,  8 Nov 2023 18:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjKHRAr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Nov 2023 12:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbjKHRAq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Nov 2023 12:00:46 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AEC1FFC
        for <linux-mips@vger.kernel.org>; Wed,  8 Nov 2023 09:00:43 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5872b8323faso3844181eaf.1
        for <linux-mips@vger.kernel.org>; Wed, 08 Nov 2023 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699462842; x=1700067642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LRS4MOzwpv79nEdyxX9W+Fzi/lnfht07XTGfi+1KqQ=;
        b=xm2zYdHdATIPwMb+Pzb/gwvnCgP8i28SFAzA7dtEO+O8HxNrPvGKqOIxAgKbAS1phM
         6YOhSIyIzYnTWXlbdcq9SOpw7lNuk+1kSLjK5jGwFaTslcIja4PlJIyLDccs9/Dn5Rd0
         srSpi5K5vrY7tFa+XUXCbnzgQKlk8D9vrB+4Z7TPDNIZZnxS0eMmD7bIs2j+wuNvGbxt
         yJ4xJEfTEfh2wPanjZt+6pwuZVTAwQuKD9izTG0NFMkKYdFDGu4Wd1lh1b88Bg+fmCGE
         I00F/2td8Q1KdHM3zZii9aivQ00ulfdKTPA9i2cynCqGzeJJrVzt6I/BAvHmMKp0WlWc
         L+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699462842; x=1700067642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LRS4MOzwpv79nEdyxX9W+Fzi/lnfht07XTGfi+1KqQ=;
        b=SwvAIIzua290XwGjApbEG+OeiO2Gvz/Ktl6SNjA+TH8p+EnCtaJN0wajyTBMTnpByF
         /+WH/MLJZdf6Wku3ZXSiRqyOEZHllY/qXg5LL/HXCs1fxAidzFAOW6xyFNirJQbGAMlq
         MXwdY8FN1ua4JGDxRtRLH3p9SfMC3byv+Hwr8AAhv6+ISwGuOextzUaQQ/6FoMywcao/
         S9+mBJFLSI+gtN90ISotiUGRYq/NAwZRyrNdv8LbY+ZtrOB66tzAlVQGh3S9QT54uv0h
         CtGTrhgQVQGgs1kdLOR8VMJ+GoPTv9izIszZGWhN+MZk9nXhRiJ+3B+W/mdIDndC22At
         FVkA==
X-Gm-Message-State: AOJu0YyTTGq7jWE91FQJo7ZjfSnjoR+DeGkzuy5muwjk1E6HlFRs+tL7
        lfgQgMIEHIzouxmsa4KRVbyys1MZ8Is1s8eq5pmsxQ==
X-Google-Smtp-Source: AGHT+IFUowk4ELsOivnzaXxc0QlUV4Wvcfh03Hm5SSyMQjwcPTJCFQB+7xIvrXwxFUaSBNJXJhJv8dNqTjB0k78gAdI=
X-Received: by 2002:a4a:bd87:0:b0:589:df75:2d83 with SMTP id
 k7-20020a4abd87000000b00589df752d83mr1373195oop.1.1699462842423; Wed, 08 Nov
 2023 09:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-28-pbonzini@redhat.com>
From:   Anish Moorthy <amoorthy@google.com>
Date:   Wed, 8 Nov 2023 09:00:00 -0800
Message-ID: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit breaks the arm64 selftests build btw: looks like a simple overs=
ight?

$ cd ${LINUX_ROOT}/tools/testing/selftests/kvm
$ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
# ...
aarch64/page_fault_test.c: In function =E2=80=98run_test=E2=80=99:
aarch64/page_fault_test.c:708:28: error: incompatible type for
argument 1 of =E2=80=98____vm_create=E2=80=99
  708 |         vm =3D ____vm_create(mode);
         |                            ^~~~
         |                            |
         |                            enum vm_guest_mode
In file included from include/kvm_util.h:10,
                 from aarch64/page_fault_test.c:14:
include/kvm_util_base.h:806:46: note: expected =E2=80=98struct vm_shape=E2=
=80=99 but
argument is of type =E2=80=98enum vm_guest_mode=E2=80=99
  806 | struct kvm_vm *____vm_create(struct vm_shape shape);
