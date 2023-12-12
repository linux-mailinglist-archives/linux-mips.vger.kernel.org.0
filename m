Return-Path: <linux-mips+bounces-684-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3780F10B
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 16:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5580F281EA1
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 15:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48C876DDD;
	Tue, 12 Dec 2023 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BkYDT2p7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7741FC8
	for <linux-mips@vger.kernel.org>; Tue, 12 Dec 2023 07:28:57 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5e1ee53972dso8563027b3.1
        for <linux-mips@vger.kernel.org>; Tue, 12 Dec 2023 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702394936; x=1702999736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESTPXNxaOVzfRXXRx0Fvol8yzry2uxBEEuLKqef2q4U=;
        b=BkYDT2p7AZjoPKT1n33qcBzraBObsSid1Kav0bwVkxm03TEVNC9zjkvdoIvsP0gO75
         moN91EoItYKY7bE8DYrJiANZQGFCmkf5HIebed+p+oequNpXhL+YOR4EpL4dpgIKSQ5Q
         rdxafRPM1EMvN39DPwz196VoqroHUedjHpsNgY60Ny4L70huLqKg9p0/ZqM3NMyNGdm6
         B2u/IQXRbgTONYPciifuv1nD9dRK0KUIoy1No1oaQwluBNg6Ll9BXgX2qVuEIV52N94P
         uqorvgEZE7Y9ffnxMRIbnnF1PGv2zPAMLd+YB1lWZuWINHkNV+Y+C0LRq892mFgzBrA5
         /IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394936; x=1702999736;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ESTPXNxaOVzfRXXRx0Fvol8yzry2uxBEEuLKqef2q4U=;
        b=Yq0x+YeSu447Jv6MxFrwjABpe7STW0rqNuOgnf5gm2q+djMkJOSOetxKh6yIZb3Uxi
         RFYTL9jzZcWHHvk2FptkVORRKM7humEKC7EGW/YozkbpVprPDY0cQOgHE/au8CA9jk6O
         qqZ3q8Ifdp2KSW/+ZbJGY4FfBNx9VSh6cYG3ddet1d/CJQERBGUqn4SVfkCrPiqNLC7A
         EKOdEXXgdTxGdIzBt/xv6C7SJz3CyrOtnti3RfSaqIe7tra7Lk8Lad6Cr1YWG7y2bPeZ
         vpnkpPOOeunLq1RDHZ2RsDSKyVHjqUkUZmIwLwbjB1iDEyWAm9EjaSLt//dyNu5q+uqP
         MQTw==
X-Gm-Message-State: AOJu0YwlJFF9aarNpeY/4VZcUE8h09YIsG+luckCy4GcBp7QzLzh1CLa
	lhtkqa66pAfOUO1q+iVC8PXMtjIM7q8=
X-Google-Smtp-Source: AGHT+IHBX6jt6VDhWuABWGol0Nx+Ii84S8r8nT9g/gNamSIHnZwQhzhs+bFmpCR2BuKO/hKALNdpvESE74w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:db94:0:b0:db4:7ac:fea6 with SMTP id
 g142-20020a25db94000000b00db407acfea6mr41805ybf.7.1702394935890; Tue, 12 Dec
 2023 07:28:55 -0800 (PST)
Date: Tue, 12 Dec 2023 07:28:54 -0800
In-Reply-To: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Message-ID: <ZXh8Nq_y_szj1WN0@google.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: alexandru.elisei@arm.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atishp@atishpatra.org, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	james.morse@arm.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mlevitsk@redhat.com, 
	oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	pbonzini@redhat.com, suzuki.poulose@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023, Jim Mattson wrote:
> On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> > Doh.  We got the less obvious cases and missed the obvious one.
> >
> > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt(=
).  That
> > thing should really be folded into vmx_has_nested_events().
> >
> > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because t=
hat
> > specifically checks if L1 interrupts are blocked.
> >
> > Compile tested only, and definitely needs to be chunked into multiple p=
atches,
> > but I think something like this mess?
>=20
> The proposed patch does not fix the problem. In fact, it messes things
> up so much that I don't get any test results back.

Drat.

> Google has an internal K-U-T test that demonstrates the problem. I
> will post it soon.

Received, I'll dig in soonish, though "soonish" might unfortunately might m=
ean
2024.

