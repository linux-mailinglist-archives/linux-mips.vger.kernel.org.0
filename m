Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A017E2043
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 12:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjKFLp3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 06:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFLp2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 06:45:28 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56506DF
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 03:45:24 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-77063481352so433614285a.1
        for <linux-mips@vger.kernel.org>; Mon, 06 Nov 2023 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699271123; x=1699875923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3+w7KiTzzQhCpJeg/0ek2R61CW1ssLM/7mTLxlOjqg=;
        b=4IwvNUR5qOPvn1KUD3+tl3uxvbjObIJMmG7O40nSKxNFcgMPoKK4MylCFywjpLnL6D
         CmFllknfWqjSUUI24y0/vVnrW23F0TciCzyTQ6EC74Sy2kgi8ZRg9ith8W2cAvMT/VtC
         DGwrVxqW2FT8pumfrCbLfJha50h5gSVuv+3ndrtxkKKSOv4H22ypNPsA8Fvr+bDMD6VA
         VrjsakR+SrzRRDUh/Tx/3hHz1viVqHAL4eNfrgVC3N1vAJ4bAYh+u95Cy6FOpuniWoP1
         9npXtgTaqaYJiaM8m4XVOZAS6IE6y2tLReV89otrKduKzHF8ThDRw+tUJhXsxM1+kQqh
         k0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271123; x=1699875923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3+w7KiTzzQhCpJeg/0ek2R61CW1ssLM/7mTLxlOjqg=;
        b=YQ3kpQS84Pmhb4Sc6gaJvRHugoxK7l5mV7x3zKQGiUvcPFmxJwscY4x1QNOmEl7dhI
         Ks4XEH7IYMYe5wNS3MsAolntUUW7NHiDKZXhONf0+vuUtgU1fHcLISTRELIk/IJtmu5o
         zNO3L6PQxC6kXi2GBntz616/6OVyNa6c0UQuOqm+/BmzFqj9EpYG/heeu3Rok/5BEUf3
         8gYfifFbEMZvh/nJll01dk1HAkbgCWgHrLZqvjJme4tpRac5SC57XsL1z1NYTg8qNJa2
         bJLzOqAgnoLgGuTV/+SI7dpVbU07TR+APbQLTnaLFnLgYIMtN6ohD3rI5zLPAYa+rIga
         zDzQ==
X-Gm-Message-State: AOJu0Yyhf98Hl7X6Ihkf21s+jbxOWHbb7cbbzl1Oa8waoGzio4KubqLM
        0s2JPNayHeHoG3rLk2zCWzJrDEeJb8OIKjb5ZhUVEw==
X-Google-Smtp-Source: AGHT+IEl8/TeQ8yyhv97l+6UdWpd06zPBShx21QRSHFWAyL7jvCOyQqirpZN3XS/gBNGYYwpqQ32Yp/yP3xLHN3ZnjE=
X-Received: by 2002:a05:6214:252f:b0:66d:13c2:1c31 with SMTP id
 gg15-20020a056214252f00b0066d13c21c31mr13196146qvb.24.1699271123298; Mon, 06
 Nov 2023 03:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-29-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-29-pbonzini@redhat.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Mon, 6 Nov 2023 11:44:47 +0000
Message-ID: <CA+EHjTyxH9JNL67Kz0y90CjrP_HMhmePav7qukJvMOcJrk81pg@mail.gmail.com>
Subject: Re: [PATCH 28/34] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
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
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
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
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add GUEST_SYNC[1-6]() so that tests can pass the maximum amount of
> information supported via ucall(), without needing to resort to shared
> memory.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-31-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  tools/testing/selftests/kvm/include/ucall_common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/t=
esting/selftests/kvm/include/ucall_common.h
> index ce33d306c2cb..0fb472a5a058 100644
> --- a/tools/testing/selftests/kvm/include/ucall_common.h
> +++ b/tools/testing/selftests/kvm/include/ucall_common.h
> @@ -52,6 +52,17 @@ int ucall_nr_pages_required(uint64_t page_size);
>  #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4) \
>                                 ucall(UCALL_SYNC, 6, "hello", stage, arg1=
, arg2, arg3, arg4)
>  #define GUEST_SYNC(stage)      ucall(UCALL_SYNC, 2, "hello", stage)
> +#define GUEST_SYNC1(arg0)      ucall(UCALL_SYNC, 1, arg0)
> +#define GUEST_SYNC2(arg0, arg1)        ucall(UCALL_SYNC, 2, arg0, arg1)
> +#define GUEST_SYNC3(arg0, arg1, arg2) \
> +                               ucall(UCALL_SYNC, 3, arg0, arg1, arg2)
> +#define GUEST_SYNC4(arg0, arg1, arg2, arg3) \
> +                               ucall(UCALL_SYNC, 4, arg0, arg1, arg2, ar=
g3)
> +#define GUEST_SYNC5(arg0, arg1, arg2, arg3, arg4) \
> +                               ucall(UCALL_SYNC, 5, arg0, arg1, arg2, ar=
g3, arg4)
> +#define GUEST_SYNC6(arg0, arg1, arg2, arg3, arg4, arg5) \
> +                               ucall(UCALL_SYNC, 6, arg0, arg1, arg2, ar=
g3, arg4, arg5)
> +
>  #define GUEST_PRINTF(_fmt, _args...) ucall_fmt(UCALL_PRINTF, _fmt, ##_ar=
gs)
>  #define GUEST_DONE()           ucall(UCALL_DONE, 0)
>
> --
> 2.39.1
>
>
