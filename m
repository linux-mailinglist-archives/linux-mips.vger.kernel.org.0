Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D457E61B4
	for <lists+linux-mips@lfdr.de>; Thu,  9 Nov 2023 02:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjKIBIl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Nov 2023 20:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbjKIBIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Nov 2023 20:08:40 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E552211F
        for <linux-mips@vger.kernel.org>; Wed,  8 Nov 2023 17:08:37 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5842c251d7cso170885eaf.1
        for <linux-mips@vger.kernel.org>; Wed, 08 Nov 2023 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699492117; x=1700096917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QtjMEn3JvZfL2+9Ot0aHfDjSbnUMOfTRHsLPFnN/cE=;
        b=vhiF8HHMq4Wd8cn65pkEiTzZFRa9GxYRRZtdB96C6qVy7NACqOoJzmTeJiZyFWFmny
         ARgHmOhotHju98RUn3mK9d4iZMGNKJSfyyss/ZULOD5dh/i1cx2TfHlRh6O+DVtmQpMM
         Dt9+mi9o2Uj+vEnt84zDOdgT3j4C8Ytibet3WHgzmJX4mfsS6NfgRvq9WRy+yTf/qAvh
         YsWKLLDiYJPc8Mf4hBxb7nxdVGsvuMemWO61R8M5YC8teqz7Nix6usKWXUfc1SdVDT8D
         982RxBjYKNC9vEVJc/xbU8wP/1kBVn2/cSImQD/Lw8E9oMZbOiycrradqa2WkXNsWDVN
         PyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699492117; x=1700096917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QtjMEn3JvZfL2+9Ot0aHfDjSbnUMOfTRHsLPFnN/cE=;
        b=MryQqe1BWeXkPsJXcQLT6IqApzZXEhiNwNJLACFvkmrIdDmH5f9TJE7B52cydU/UYy
         aqlc4hb7m5QqOaG8jlmf6jhVf0zUkM0fMEyzKDSAKwE7mzasJyJ0r+A+tJ++PmCl1DDo
         n1t7rC+X1sUq6hXLWdVl7ISivo1RgMdOTqW+JmbesmHYohWYtu8eS2vJZpRcZhwPL/c2
         6JPHiD6orAq4l4/bzI+CA43S04kMsmlaWXvP8Khp4Oodqovo7DOB/WXDOSIZfPMta0nG
         app9sXahuVlslkRoWFNeKOM8sX/NiqdYjDjJcG+0wq7nCFxBtciEnr4s7Zx2I8ihdFAQ
         xTVw==
X-Gm-Message-State: AOJu0Yw4gDBuM3V+dYZcpMKivQA5qy+ww1/P/RHGUTw8ZjdvrL7FdM+y
        1klNO3ebWqGId4lHgyXa+B4WuyrZujJ8yIzD3+fmKA==
X-Google-Smtp-Source: AGHT+IFaOEA03XuxazKl3zVOaUpDe2bAHjHbEU9NUIQA9ZcNh5LArgqxcn+4MTtdSbfjNu4oRqbtO3sH2+Wygyf9VBk=
X-Received: by 2002:a4a:e088:0:b0:587:873d:7e2c with SMTP id
 w8-20020a4ae088000000b00587873d7e2cmr3411182oos.1.1699492116891; Wed, 08 Nov
 2023 17:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-35-pbonzini@redhat.com>
From:   Anish Moorthy <amoorthy@google.com>
Date:   Wed, 8 Nov 2023 17:08:01 -0800
Message-ID: <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
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

Applying [1] and [2] reveals that this also breaks non-x86 builds- the
MEM_REGION_GPA/SLOT definitions are guarded behind an #ifdef
__x86_64__, while the usages introduced here aren't.

Should

On Sun, Nov 5, 2023 at 8:35=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> +       test_invalid_memory_region_flags();

be #ifdef'd, perhaps? I'm not quite sure what the intent is.

Side note: I wasn't able to get [2] to apply by copy-pasting the diff
and trying "git apply", and that was after checking out the relevant
commit. Eventually I just did it manually. If anyone can successfully
apply it, please let me know what you did so I can see what I was
doing wrong :)

[1] https://lore.kernel.org/kvm/20231108233723.3380042-1-amoorthy@google.co=
m/
[2] https://lore.kernel.org/kvm/affca7a8-116e-4b0f-9edf-6cdc05ba65ca@redhat=
.com/
