Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D7C765181
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jul 2023 12:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjG0Kkn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jul 2023 06:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbjG0KkT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Jul 2023 06:40:19 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3B02703
        for <linux-mips@vger.kernel.org>; Thu, 27 Jul 2023 03:40:15 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-63d2b7d77bfso5754936d6.3
        for <linux-mips@vger.kernel.org>; Thu, 27 Jul 2023 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690454415; x=1691059215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sndfUp5VQwyYdDkfd9c4UQTPXsXPqaVmv/x1Ijy8DrI=;
        b=BRo0MX+z2r1SS6yWvALim/6/nbcuIraz/dvlfYWOZ9asJfVrKNdNm2FzRqaxLf+dSr
         gd8iH6tStNBkd23/w31KCfLL9pbPEeNVyPTR03aUqTDZY6wZTMoqJSnBUDPOFUCLZI8l
         DGkcMHGLOMeyEEgRm2q9vaf0Y5Q5Azvv1tkZ/xFOCXwAaoOvebuUDqbcoCdnlpWZyTyX
         q38zkUOHeP0Tt+nEWAcZ8JszB60VlCahpErQX1nO7BawFSz3QtUcVh1o5Am/iWB313H6
         H0uJV9FuYrV0GCIZde+45ERDs3S4qD78OMMR7S/b1svm4zQQyj/BCkUn3DI2PJoOlxx+
         Zjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690454415; x=1691059215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sndfUp5VQwyYdDkfd9c4UQTPXsXPqaVmv/x1Ijy8DrI=;
        b=iCWJwDvM+xMoPUnennNOM8rpeb5F7be07I71qmuPlm4TzJWkZEQ7zC8hZzS0YSXdL5
         Ql+qx+s1VxwF+vmgV/uSk4sr/80dAjjixloHoJFsPBE7PIjNFsp8261Co12ge5V6Rb0R
         un5F1dvZcFnoCDYrmKElxSV+LAhI6uHvNT9FVST4KhvjFHgY60a164WgwMysKqB09nEJ
         AIdXrtOk3aFpY/FE55Dpq+UFc/goPCKOcouzSfggLk9xP0EkdQmKiv2kuRoQ3KyXZ0d9
         eKyKz/it0XYctm5OH0oaAm9lAAz2LESCaDGxni5NYxx8kwBDeYK3DMw51shL8nYRf2Fs
         kg3g==
X-Gm-Message-State: ABy/qLYNjG1Fn/SiJFJyf5qiJ9ToNXtfkU3xqKIJ+MZ5dbRc4H757HrF
        3eweuaYxQ4gs79vvzDUFBFGIL7nYHAu3Fxp8wdL9fAExodZqPy+Q6qPSZg==
X-Google-Smtp-Source: APBJJlE+0dXFxcWiQX8kiDXJfKau+LxjypHc8uOGBYfuDsHhoPcJDBpq4NHTu2yqyvhkPVt07nS69cNqQCueoayyUeg=
X-Received: by 2002:a05:6214:12b:b0:63d:218:c83f with SMTP id
 w11-20020a056214012b00b0063d0218c83fmr4306083qvs.36.1690454414736; Thu, 27
 Jul 2023 03:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Thu, 27 Jul 2023 11:39:38 +0100
Message-ID: <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To:     Sean Christopherson <seanjc@google.com>
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
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sean,

<snip>
...

> @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
>         case KVM_GET_STATS_FD:
>                 r = kvm_vm_ioctl_get_stats_fd(kvm);
>                 break;
> +       case KVM_CREATE_GUEST_MEMFD: {
> +               struct kvm_create_guest_memfd guest_memfd;
> +
> +               r = -EFAULT;
> +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> +                       goto out;
> +
> +               r = kvm_gmem_create(kvm, &guest_memfd);
> +               break;
> +       }

I'm thinking line of sight here, by having this as a vm ioctl (rather
than a system iocl), would it complicate making it possible in the
future to share/donate memory between VMs?

Cheers,
/fuad
