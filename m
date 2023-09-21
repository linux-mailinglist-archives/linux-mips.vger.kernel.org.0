Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC22B7A98B7
	for <lists+linux-mips@lfdr.de>; Thu, 21 Sep 2023 19:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjIURvu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Sep 2023 13:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjIURvc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Sep 2023 13:51:32 -0400
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BA46CCBE
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:30:41 -0700 (PDT)
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-34fd68ca975so6963645ab.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695317431; x=1695922231; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFujV55InQpfIcmwhWIdcFo9LOSK6bP3ULKilR3pEPA=;
        b=Z/PgDGtiR13zc1qnF2UvJC7k96EAMw7IVs0ntkX5u8LqL7DGEsxmokAC14MPLyVdML
         uGUqiWSC2ufQJaA5ZfxoSPEjHaFTfhjyCz8MQcyuyn0frOGg6JZ/4nfpuh+aN0AoiiO6
         kh+V1wsR+Id7fnc5ucC/mvCgW/EfgDeVcHl2qvN522w3hyE4LPnH7xfiO8CSkY5DF51P
         dKkp8ObPEfW7BJNrMVtxoZvytKvuiUQg53XakiczAk2SoQXANw8T1g/109uSEDa8i91F
         5+Sky+xSLbWDaDQ+8X8M0DIg7p7f+zIAzOPfWGCZiiqnbf4LSRzXrk/vVTv5skQfggyG
         kiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317431; x=1695922231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFujV55InQpfIcmwhWIdcFo9LOSK6bP3ULKilR3pEPA=;
        b=ullTntWHH3goiwzPzbZxE6Qce4ll0ns4URK1sm35QVMMOm8UWfDskdQ7Px4lW4g5om
         iAyaeoMfED3DUBhnryG+uBLvQQW90s0Hao8OGEzl5FZ1/7krzf5DRIy5+Peh/jPW6km4
         MxzbW81xQYvjFeJwKyXnt4UDlNZmHbc0rcg7Fyewlhbc9nmqqBdks83H38FLqL2Uumyl
         4N+y4vzpBWKTBslF9dQhcBXRcc9ihlbCa1rlHy+dKumaiQYyXgUHN0Z3PA+TgRCecocI
         910DSCqxvlfmJVQYkflW8oglrkJk1FlpdbwTaSBDE1x7/PJ/B5l59ZJtNLGwXzEdNSIq
         l2Kg==
X-Gm-Message-State: AOJu0Yx0alacoa5dbv3Cw53Og6c1i/3BYdV47ElitQsUCXWZDglw9xbR
        USOXKNWeyL5XnvoWcWX7MXSqU5qusYg=
X-Google-Smtp-Source: AGHT+IGn6bxt0aytyfRrQvdNGXaSXeT8sIcIptWMB2qfEas65NY2TcrLdWuDyigFBOjNZ28AUG3erUeC33s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce86:b0:1c3:c127:558 with SMTP id
 f6-20020a170902ce8600b001c3c1270558mr71199plg.0.1695306271120; Thu, 21 Sep
 2023 07:24:31 -0700 (PDT)
Date:   Thu, 21 Sep 2023 07:24:29 -0700
In-Reply-To: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050> <ZQr5uXhV6Cnx4DYT@google.com> <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Message-ID: <ZQxSHXIGdWXy+zDU@google.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
From:   Sean Christopherson <seanjc@google.com>
To:     Xu Yilun <yilun.xu@intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
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
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 21, 2023, Xu Yilun wrote:
> When the invalidation acrosses multiple slots, I'm not sure if the
> contiguous HVA range must correspond to contiguous GFN range. If not,
> are we producing a larger range than required?

Multiple invalidations are all but guaranteed to yield a range that covers addresses
that aren't actually being invalidated.  This is true today.

> And when the invalidation acrosses multiple address space, I'm almost
> sure it is wrong to merge GFN ranges from different address spaces. 

It's not "wrong" in the sense that false positives do not cause functional
problems, at worst a false positive can unnecessarily stall a vCPU until the
unrelated invalidations complete.

Multiple concurrent invalidations are not common, and if they do happen, they are
likely related and will have spacial locality in both host virtual address space
and guest physical address space.  Given that, we chose for the simple (and fast!)
approach of maintaining a single all-encompassing range.
