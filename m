Return-Path: <linux-mips+bounces-640-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D380BDB9
	for <lists+linux-mips@lfdr.de>; Sun, 10 Dec 2023 23:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3402B207A6
	for <lists+linux-mips@lfdr.de>; Sun, 10 Dec 2023 22:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC661D545;
	Sun, 10 Dec 2023 22:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2BQuK2lG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048FBE8
	for <linux-mips@vger.kernel.org>; Sun, 10 Dec 2023 14:53:16 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c2db0ca48so43015e9.1
        for <linux-mips@vger.kernel.org>; Sun, 10 Dec 2023 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702248794; x=1702853594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKS/AHcM2NBWqMD4zsEUfP2kt6MSIwHJfrO8WzI99T8=;
        b=2BQuK2lG0+aIH50Ea54CUN31I1TrzncC/ggR0YgAu2SbM6weqjLOXaKo2aSFeFgFBg
         ZUPZs9Me7ZSbqFQzQDyJn5gX/oCSHcKWBfckpo2QyDkkxBjzHZ5iFA4ut6P7OCj83SVM
         U4ewmmkGleUBg31U/cdfenkTUpBoGV3gyREB/BlXdq3thm35rbzXUeR545uuVoaAjZRN
         WM9VAMIV78RQGLc5G5OFlTbUWTRFASVV6wd4BzzN7Bwxc9rn8y9Vs2kgA1jEf3cdzzvx
         hx7dbOzjdVvVWY3EZTthVD3xsfYNTi6ANyCLJXfMAVERg+l6eyW+wg7kK1LxVCeFClSc
         V9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702248794; x=1702853594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKS/AHcM2NBWqMD4zsEUfP2kt6MSIwHJfrO8WzI99T8=;
        b=HsetRokI1fazZUFRt7q4+kMsDEhd9JqLQ6Bwo14vMCSB9nkVLtd1+Idzt3jeUNPrRQ
         E0YlpYpLmReOGoi/UwReeXotFXdrbF8L73ndGDsX5LVWyM9ONYqzMt5o3vG9NHpUfJRI
         YJx+D9AP8tndti7T+DDe5FYtqypD/AP7yjKKLhWDHEphlyG8Bp0nmlyrVXC9AzxMzz1O
         hUOjUe24uUrjdqaibOE3S4Dx5A+fmvEkYDOkTozZWxhbCE6llOiUxNmmNn1qlqdSC27B
         e48i/eAnqckQ85+fzoIKHJzqby3sxPFpd7ZQuxw4BOYyC4+FaydZOqN3CFwk/zUhq143
         SFxw==
X-Gm-Message-State: AOJu0Yx60biAo516bFATUX+x9c8T9I/lnBh9GAPp97GByvftzIk2udnm
	QAf587kGAQwcvqzU3UF2v21E8Qtw0MjnuI006klO1w==
X-Google-Smtp-Source: AGHT+IHfF/YK8dgWEfqDIfnTDLirkLeJB4fVu6OmnYB7yxbJvNgiVETL/lA8ongHRpHXQrS4L8RMiXwyvPov+eoWnK8=
X-Received: by 2002:a05:600c:5113:b0:40c:329:d498 with SMTP id
 o19-20020a05600c511300b0040c0329d498mr170595wms.1.1702248794289; Sun, 10 Dec
 2023 14:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com>
In-Reply-To: <ZXHw7tykubfG04Um@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 10 Dec 2023 14:52:59 -0800
Message-ID: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
To: Sean Christopherson <seanjc@google.com>
Cc: alexandru.elisei@arm.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atishp@atishpatra.org, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	james.morse@arm.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mlevitsk@redhat.com, 
	oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	pbonzini@redhat.com, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
> Doh.  We got the less obvious cases and missed the obvious one.
>
> Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().=
  That
> thing should really be folded into vmx_has_nested_events().
>
> Good gravy.  And vmx_interrupt_blocked() does the wrong thing because tha=
t
> specifically checks if L1 interrupts are blocked.
>
> Compile tested only, and definitely needs to be chunked into multiple pat=
ches,
> but I think something like this mess?

The proposed patch does not fix the problem. In fact, it messes things
up so much that I don't get any test results back.

Google has an internal K-U-T test that demonstrates the problem. I
will post it soon.

