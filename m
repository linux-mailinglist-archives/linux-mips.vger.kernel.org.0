Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC0F7DD820
	for <lists+linux-mips@lfdr.de>; Tue, 31 Oct 2023 23:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344925AbjJaWTD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Oct 2023 18:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344917AbjJaWTC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Oct 2023 18:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C0FF3
        for <linux-mips@vger.kernel.org>; Tue, 31 Oct 2023 15:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698790699;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kfYGCdpNkdX5yz1jUhkJ/3qqRF866UiTHuuzMPk/uy0=;
        b=U/HXjC4KoPV/Btr64/oDMmCFswL4JdEWUn4iFg7PbR6UdUT1dd6oFwZb7jZHNNWz7DNOLc
        IJOCnsxuYILAR6fmdvARcSHeDfsbBnkn+LUGE/ZMRrZUi0MZcHESk15m8WxqI5yX5haiHd
        rYEWAv/sukBArIm1PoLdvJz0Oh2u6PE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-1zNwalV_O7mRCcDfBkWzPg-1; Tue, 31 Oct 2023 18:18:17 -0400
X-MC-Unique: 1zNwalV_O7mRCcDfBkWzPg-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-457bc85ac53so2026773137.3
        for <linux-mips@vger.kernel.org>; Tue, 31 Oct 2023 15:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698790697; x=1699395497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfYGCdpNkdX5yz1jUhkJ/3qqRF866UiTHuuzMPk/uy0=;
        b=wkNsY6P5cvs52bsiYLeizmYeAVqkoHrWeAxk4W40y7ab9GPRpGZ0hXStwaES2T/TEK
         SVw+z9piLv5MbI5e5bjjDXcOD2orXVRO3GGEpyGJsYpWZXLyxSSFhTU6/eomMDPZCNG8
         jqf7fXMyXrs6VRakHasSYTSR2KpVrAc1Os6es3IVCXByWfNLXrP+MMiiK90dg+1iUNCQ
         EcEDqlYKEtwCGEUvJ3PKkNJtHbr8z6s/7mWPEKr6OmYqKP1z1RS8EL9mV768ESOCEY7R
         HOCzDslBmgnXkJjAniP5iomaZDH5JRzMEUEYEAPcN1l8zIcwVu07gckpmgpwzMrctDZ5
         ty6A==
X-Gm-Message-State: AOJu0YyQ61dBpUqjcGLWecY3EaawTzHzb16kc655H10Mk3O6Q+T38K96
        GLPVUYkWvudP8XZTzEYT8zY9gHiC8lW+ChuJsVIT6X0V9k46ag5udaZeFDz1O0U6GV5oLIDcPdJ
        wWG1ROqT10Bu/DFbkd6jFMYBcaGbToF824Dxe7g==
X-Received: by 2002:a67:c218:0:b0:44e:99a2:a42 with SMTP id i24-20020a67c218000000b0044e99a20a42mr9981774vsj.11.1698790697107;
        Tue, 31 Oct 2023 15:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQrBiQJHLqXrbYP+Ue59NphHDME9ef8CfXr1engDM3UMhS/wxqjXJBm4DCAAdJKCtZSXIUO7Qf2zwxIf8biNY=
X-Received: by 2002:a67:c218:0:b0:44e:99a2:a42 with SMTP id
 i24-20020a67c218000000b0044e99a20a42mr9981736vsj.11.1698790696825; Tue, 31
 Oct 2023 15:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com> <ZUF8A5KpwpA6IKUH@google.com>
In-Reply-To: <ZUF8A5KpwpA6IKUH@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue, 31 Oct 2023 23:18:04 +0100
Message-ID: <CABgObfbLonVYk2WE4TC6-J_0ShanY7TbcLXStxji=XDU+9qQ7g@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To:     Sean Christopherson <seanjc@google.com>
Cc:     Fuad Tabba <tabba@google.com>, Marc Zyngier <maz@kernel.org>,
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
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 31, 2023 at 11:13=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> On Tue, Oct 31, 2023, Fuad Tabba wrote:
> > On Fri, Oct 27, 2023 at 7:23=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> Since we now know that at least pKVM will use guest_memfd for shared memo=
ry, and
> odds are quite good that "regular" VMs will also do the same, i.e. will w=
ant
> guest_memfd with the concept of private memory, I agree that we should av=
oid
> PRIVATE.
>
> Though I vote for KVM_MEM_GUEST_MEMFD (or KVM_MEM_GUEST_MEMFD_VALID or
> KVM_MEM_USE_GUEST_MEMFD).  I.e. do our best to avoid ambiguity between re=
ferring
> to "guest memory" at-large and guest_memfd.

I was going to propose KVM_MEM_HAS_GUESTMEMFD.  Any option
is okay for me so, if no one complains, I'll go for KVM_MEM_GUESTMEMFD
(no underscore because I found the repeated "_MEM" distracting).

Paolo

