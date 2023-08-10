Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A77778467
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 01:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbjHJX55 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Aug 2023 19:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbjHJX5z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Aug 2023 19:57:55 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D732D4F
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 16:57:49 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdf08860dso544576566b.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 16:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691711868; x=1692316668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhMgA7qBPuApMhQ4h1vJKFRA4DNp+2B2aFxUktI7jpQ=;
        b=fSbsTlZ9eRUEq1oc0qlT9VA71infat9B81M3qAFGPQLw+6DiL/k6IQBVuLqYpfm6zc
         JPbbQuf/OXWE0DDR3Vty3P+Ga7xRDAZJPbwv8Rh6DllYU5zj15degN0az+fa1E+ZZKui
         Zid/yQ06BXhwoDugW7aU7NJA5d/c3xUSIByYDVFEbgx0r3ZtD20CbtxCBNcFSIJefMq1
         tRA4cZrI4/sEiaraxlYyAq+sL65bMfdUmaPLsXuLObrwqiszX5v1AaY8IXbz4ltMaoUI
         FDZXJTolroDTYu55EKXzdNQ57eJWghsSQRQDYygik7m8uY2F9+yL1a51YFkAYkFi+S2u
         5sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691711868; x=1692316668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhMgA7qBPuApMhQ4h1vJKFRA4DNp+2B2aFxUktI7jpQ=;
        b=ITvdXTONmv1+gj6TbKCRbagPmde/ACEVKch0xL/Fc38l8l2dWiv0wbAWL9OZKniHbt
         C7T+QdrTOTiTGMlvym+0eCleGfjkE0ZPd/h2wPvGy2cgzecuV40d31WJft9TSY6eywXz
         Ic4C3TwcADC4BvVXC1MlFBnVKbrbVskcwEVO2XChp9dPDwGdligP1akx3r2eUs/oG7tk
         +KNSnZSWGTleYTeXjc/7r7pVv2JE1KQXF/MSSG5LCCQ5GgQuU9GuNoEnvsp3RjYmHLgf
         V3yFkdirjM63bIITSOry3BhVQnehf/XmkMGR0sP96mGyRqGXYebxjX1GA56D1j/R7z10
         O0OQ==
X-Gm-Message-State: AOJu0YwQNUh6K0BxZ5hgzGkeQjALFd6i67/1wqPQf+fRC3z1stjLcp/4
        FLwC+Tr4UdGsQHJl+33hmEkOgI89J0mdMAMDjRQY4A==
X-Google-Smtp-Source: AGHT+IExGyX6IQpw7nkPj/Oj8ZdeERAHUNFikZIEbAqLbQU3zHzZ+Xb2mqkLRl/UdYIm3ylJUJ+cypBkqHv5r6CLu/8=
X-Received: by 2002:a17:906:1d1:b0:99c:55c5:1c6e with SMTP id
 17-20020a17090601d100b0099c55c51c6emr519636ejj.8.1691711867870; Thu, 10 Aug
 2023 16:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
 <ZNKv9ul2I7A4V7IF@google.com>
In-Reply-To: <ZNKv9ul2I7A4V7IF@google.com>
From:   Vishal Annapurve <vannapurve@google.com>
Date:   Thu, 10 Aug 2023 16:57:36 -0700
Message-ID: <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To:     Sean Christopherson <seanjc@google.com>
Cc:     Ackerley Tng <ackerleytng@google.com>, pbonzini@redhat.com,
        maz@kernel.org, oliver.upton@linux.dev, chenhuacai@kernel.org,
        mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, willy@infradead.org,
        akpm@linux-foundation.org, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, chao.p.peng@linux.intel.com,
        tabba@google.com, jarkko@kernel.org, yu.c.zhang@linux.intel.com,
        mail@maciej.szmigiero.name, vbabka@suse.cz, david@redhat.com,
        qperret@google.com, michael.roth@amd.com, wei.w.wang@intel.com,
        liam.merwick@oracle.com, isaku.yamahata@gmail.com,
        kirill.shutemov@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 8, 2023 at 2:13=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> ...

> > + When binding a memslot to the file, if a kvm pointer exists, it must
> >   be the same kvm as the one in this binding
> > + When the binding to the last memslot is removed from a file, NULL the
> >   kvm pointer.
>
> Nullifying the KVM pointer isn't sufficient, because without additional a=
ctions
> userspace could extract data from a VM by deleting its memslots and then =
binding
> the guest_memfd to an attacker controlled VM.  Or more likely with TDX an=
d SNP,
> induce badness by coercing KVM into mapping memory into a guest with the =
wrong
> ASID/HKID.
>

TDX/SNP have mechanisms i.e. PAMT/RMP tables to ensure that the same
memory is not assigned to two different VMs. Deleting memslots should
also clear out the contents of the memory as the EPT tables will be
zapped in the process and the host will reclaim the memory.

Regards,
Vishal
