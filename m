Return-Path: <linux-mips+bounces-7983-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0F5A459D2
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 10:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F03C1887D26
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 09:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0A62135C8;
	Wed, 26 Feb 2025 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OV8WN3Qu"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479B1E5B85
	for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561524; cv=none; b=OVi7ZPXw1dfyXILoojADTqmoWDctrhiNUNzkjNppL2BRBaZYwYUziNiW2ashkuB3RYdaAi7IPCfQoJ4YI/o6NPf01yS1phoLGV0blQleUfCgLhJC3/HEElCWYDARuNFV5tvNVF/3K20LfrEAGO8RmMSJgzEQzCgK6jTCROQLikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561524; c=relaxed/simple;
	bh=5zEfvEUUsLGTCHX4AwEafQpReN3akvlINVbTahuLpDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4xrOi/Ji3Q5L9rdWj2HLeQJQHmE731sjR3DMpq48hcFb6gqHDSb3Irenf0arM+HSovf8fyk3XXvzrjwxGCWDb6LU8q0KuU7QUYW6Ium97o4AF46Uz9Eyumoqx0dNAVpFHJGZ/6CglqHP31CWzDXRlRKMa+VPO4Ym2UL9bUKT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OV8WN3Qu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=OV8WN3QuZRSS9QE/BbwWQ69pDKW/5o/ZD6/MJD1R5MXMhunftpXUtbDaZKD9/uD/9n/06G
	SYv5dzVm24aNW6NK1RBpb0aUbmYlZXJUPq2UhyHVbgI3Je2bq/nFJocy6UA5Rd5qX/YX8O
	TJfXROk0Kqdzemek7SAIRKmBTSPySgY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-m4BD520_NJOCJCzlrUqDkA-1; Wed, 26 Feb 2025 04:18:39 -0500
X-MC-Unique: m4BD520_NJOCJCzlrUqDkA-1
X-Mimecast-MFC-AGG-ID: m4BD520_NJOCJCzlrUqDkA_1740561518
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f27bddeeeso6823147f8f.3
        for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561518; x=1741166318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
        b=QX2v8Z1lQXnJIQRnzUFv4LSHjGEk6VlG2jq0aGGScod2ogHtFMEwjSXWti9uMsKQrX
         XbsYAatHDzuzV+VZs1pFvHILadFphgIXHF+LFVkIP9qVYnTQ6HWzvmMkiTMZsrk/6gKF
         JowmZa0n2PDEmYIoazIq6OKdr2OrExS+fX4bxIz5cskrQZWFppL5zV93J5ZvZEVdgwLj
         7wqXdy72AQ50VjSOIfN0zoAsqV2pfBiPpkuJC62MGBegR7XF4aouCW7SPs4TrsNSIKVA
         5WUH3yh3utg8cIHujSjC9/CFL9GWCXadEze/6tgCfnASUunXiBRhq1XxeRZ1xDAWqsMR
         zPbw==
X-Forwarded-Encrypted: i=1; AJvYcCXYhpGMjdMbgXKVQKeUb0E96upKsTNhVoDyaW/kFF5rXlUWupMcKypu2X+4EjofPS3SjJp3zcy5euLO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dudweKdoyabs8lyuyB0zn1vJeH7pYfahNoADk6bau9VPJEmZ
	7MWLfCZl8t+ybCpe50wxVip+MICk/F5pZtXYvcju2fHheMK81t8UvUHo0ZeOOAlWIjzBdZ3qx3u
	bz+l9mfXvKYGeVCCx7ej4U2cK4+ueG46UFHax1cn9dYMOBO2ExIdKRJ0AbUnzWL2YB8Or2YPQPR
	LhO7IC9W4hrr0eR4q3eO8Srx2kXOIMQrKqfA==
X-Gm-Gg: ASbGncvnrL3fVqY1/6SUkO5xov5sOUGmwExciJE0xqGP8K5aTvOTYGnf16re5KfF1xJ
	wv318+HrDz2kXfnqMaQedQYXJDFZLAZmgNFOE0zImQDe5wKLUNtiSxs4FjHmWI+g0inWGb7lL6A
	==
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id ffacd0b85a97d-390d61cc85fmr1296763f8f.46.1740561517831;
        Wed, 26 Feb 2025 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8QJcltKK3icbvaiTIyjEom27+uMjjmS3V6slM8kbmQaHs57lufLQIp1ODz/r9AND77qyPMNyl+BQOe7Hd40=
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id
 ffacd0b85a97d-390d61cc85fmr1296733f8f.46.1740561517436; Wed, 26 Feb 2025
 01:18:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com> <Z75f9GuA9NfKo37c@google.com>
In-Reply-To: <Z75f9GuA9NfKo37c@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Feb 2025 10:18:26 +0100
X-Gm-Features: AQ5f1JqpfKleIgYhNDBuhYOTkE7mUvo6hlKxjC4ts72PAS8Q4WmxhhjJCWdlkGA
Message-ID: <CABgObfZWqBm089dkOpWwX-d6Bgp84zP_0Gow4ow7ZKHov=8oxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:27=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> > On 2/25/25 00:55, Sean Christopherson wrote:
> > > Free vCPUs before freeing any VM state, as both SVM and VMX may acces=
s
> > > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that n=
eeds
> > > to be kicked out of nested guest mode.
> > >
> > > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destro=
y was
> > > called") partially fixed the issue, but for unknown reasons only move=
d the
> > > MMU unloading before VM destruction.  Complete the change, and free a=
ll
> > > vCPU state prior to destroying VM state, as nVMX accesses even more s=
tate
> > > than nSVM.
> >
> > I applied this to kvm-coco-queue, I will place it in kvm/master too unl=
ess
> > you shout.
>
> Depends on what "this" is :-)
>
> My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master

I meant only 1, but if you want to have 2 as well then that's fine too.

As to kvm-coco-queue, based on Yan's reply I have 1 (of course), 4 and
an extra patch to move kvm_x86_call(vm_destroy) at the very end of
kvm_arch_destroy_vm; I'll post everything as soon as I finish building
and testing.

Paolo

> rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on a=
dding a
> few more cleanups (though I think they're fully additive, i.e. can go on =
top).
>


