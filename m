Return-Path: <linux-mips+bounces-147-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCE7F3466
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 18:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D33DF282A6D
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 17:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB232563;
	Tue, 21 Nov 2023 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Db909ZoJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD58792
	for <linux-mips@vger.kernel.org>; Tue, 21 Nov 2023 09:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700586072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
	b=Db909ZoJYbcT2G6LLjfnci8yQDj6GeiSOnWmAa8m+VFijTu30q9djImk6aFIkpMgVdtS+Z
	c236IoYSFo0aEGPv7aYu++U66M0qv/B5ysNWiKeSjLp9LM0SBhlioFeP1Qc6bg1nFu6Qit
	IQjR/wgf7I/405DltkwXG0Kbe5KyMSs=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-VFLY9OiuMKOkZ_VD05X2Aw-1; Tue, 21 Nov 2023 12:01:10 -0500
X-MC-Unique: VFLY9OiuMKOkZ_VD05X2Aw-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6d63f6a5abcso6397837a34.2
        for <linux-mips@vger.kernel.org>; Tue, 21 Nov 2023 09:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586069; x=1701190869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
        b=apTWSIsqwMGN90zhRH8mWNBHVWzNfoKPqskfulX+gnPqR2l843chbh3Cnz91DA60Q8
         gzCrzgKUMyKposTZXjvdUKJuraGgAQzbgS6YzSIgCQEt4ceW6eWy7e13QgARdFhr1PBi
         wtm8cHqevARx7vKijrQbvvkUyBoO3Br7x0He3WgYwUneGyZeKQZ3C+kUqh+uGD0rS7/P
         VOrBiePVIB/BIt+rloQi9qV18/r58Lfi4ta0p0OnciSIs+Vis7ZMai+n0oLBVP12X0hO
         V4bggb6LvJNbB5/WB3l6/ucK/CGfk6T0qx+iCDgNYW3am/vV2YaCsrOQFfHIJy1kvjGY
         5+/Q==
X-Gm-Message-State: AOJu0YwfOkqGcTjmoNwjelnlWZpH3teBxGVhX8T7i6vydtcUIvQaHkpo
	S/qXXNhDx7Fx9chFxKhs4ZR1gSt0bt/HTo0wKzPcD0sx7+x9Ei69ZEpntg1LxXKTxPyfhKl7TKX
	s1CVDjQbulGl3GKLyIIMDhZ1q69TacgOo9nnopg==
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id p7-20020a0563587e4700b00169a9d43fafmr12581530rwm.11.1700586069088;
        Tue, 21 Nov 2023 09:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzwqwXTcQOMVq6+W/ToO1AFQnqdGCzNKV3DK3CezCKFyIOZTTVBddsfYxnVHAme/q2N84DW6rxhPtI5xPi31c=
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id
 p7-20020a0563587e4700b00169a9d43fafmr12581454rwm.11.1700586068588; Tue, 21
 Nov 2023 09:01:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com> <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
In-Reply-To: <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Nov 2023 18:00:56 +0100
Message-ID: <CABgObfZdk9Jn60QLJGweVZMN_yWsxo1d7W3Mu-NNTPZVO0uCnw@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
To: Mark Brown <broonie@kernel.org>
Cc: Anish Moorthy <amoorthy@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 3:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 08, 2023 at 05:08:01PM -0800, Anish Moorthy wrote:
> > Applying [1] and [2] reveals that this also breaks non-x86 builds- the
> > MEM_REGION_GPA/SLOT definitions are guarded behind an #ifdef
> > __x86_64__, while the usages introduced here aren't.
> >
> > Should
> >
> > On Sun, Nov 5, 2023 at 8:35=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> > >
> > > +       test_invalid_memory_region_flags();
> >
> > be #ifdef'd, perhaps? I'm not quite sure what the intent is.
>
> This has been broken in -next for a week now, do we have any progress
> on a fix or should we just revert the patch?

Sorry, I was away last week. I have now posted a patch.

Paolo


