Return-Path: <linux-mips+bounces-4816-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579D94C262
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 18:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBBA61F23B15
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 16:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CCC84A36;
	Thu,  8 Aug 2024 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q357/xha"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76B2A8CD
	for <linux-mips@vger.kernel.org>; Thu,  8 Aug 2024 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723133782; cv=none; b=LGOHMZASd53LKVNv+kbbOde/W4rNo1oD7YoVrB1Z7naIkZTdetDtAK8swZhDfOfplpGiqkvMZNJRAb8mLPibSPIqzuEd/j6PdFwa7/0q2AtiCAbc1frIuJA6w4ZmwBLVPKA2NLAucRvKs6UnN9fCm/BgD1xwzH0hfAPV5qnuQm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723133782; c=relaxed/simple;
	bh=R8R/7XxJiD8SbGw4qFqr3w25VlObii1GrVvmAIP4ewA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hr1eZrj6CE8RvS/E6OVjhcV0XYlK6v7/PCAR/HvmchVwnE+1bgcMD7LECJVzkPhbywlMqspGD9jWB+ogtU2pFcRJM3MwYB+ynppGQv7wsExWD+tkW1zH7W1MOftC3cJzOc7bbPYdZyFa12V7cZ613tlZxgwVexac206Gsw4zS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q357/xha; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so12062371fa.1
        for <linux-mips@vger.kernel.org>; Thu, 08 Aug 2024 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723133779; x=1723738579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=q357/xhaX8+B9uqiRegLs63n/OipYuG36M23UmMKavLdEByApOcJ6b9u6FDyjTWlSv
         s2pVstliksWsU9xqkhPMqxvjDZNupDw/yl8sLJRf6EjP9dG5PBClbB03aY2huFVWP+/h
         g0a9+cH3hS0T9mWP8exkmaMYJZxAt92wDt/kuPYwp/VHhRRQDIqdmZWxqCmbaJ8K6h38
         bQcI/99KKl3nntuybmUWz1nD5ttbtsoxbAW+4qYbxCpdUJd9uHIHp8Q49pHuVmJd6MqD
         OFOwZ8Pod82PZV98/yubfqJ0dTYJUsU35WKkhShg3lDWD50D9YtaFgqi6MmzdCDb4AIU
         kvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723133779; x=1723738579;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=YDXiJmkBCRXuD3RSBo4AlwXv42OQpddqevpCbNy0oI6GCKE2PD2SCcrB+AGd6a8N50
         gOzuw18hT96bDLyLy5QxaxKkfZGRxLFbLYUUad1x143I39I4dzGucnHua3GrCoew51Pw
         tCgWK18iLRZNu6mWAF+bzs26LBzWna0szpJWxYumX/FYvzWSILTZdEM/oF8KRa8g3W13
         MDgkDXX+NbzMfkSKDytdWuFWkuz0qxK2OCROzngltOPJwoPjDDU849iHJJMHIGcs4aJh
         fcMxgBiypGMNoof4Xa/JjH6SG7RD/DJ6EooThY97NLRuhf010DPW0Zd4xef8JYoDMg7X
         Izqw==
X-Forwarded-Encrypted: i=1; AJvYcCUf658yBSdVwn7Ah9pFucgiG2CU81YN87G6NJJS243PlHpJPNERXGqRM7bgLwXvzTivkog6fW3Cj+EZl5zUaVlJy8lhcqrqqjMf4Q==
X-Gm-Message-State: AOJu0YzdvLMWDgS+jKCWf2we1xKxgycmaQ9SEJ2ZiHMrIHE9xgrxdhuM
	mFuRPTLICI/3wUKon1VyUW9zD3YOE4ej3r5nmBWFpAjuA185EoXY14YpQQGwvd0=
X-Google-Smtp-Source: AGHT+IFeg1aw2R2jdtW33+RTmD0GoFD4AbJwR/eufpV8IO4HacBEUsTerwG6znblRji34uNx3VzDqg==
X-Received: by 2002:a2e:331a:0:b0:2f0:2d85:2238 with SMTP id 38308e7fff4ca-2f19de75d02mr16453671fa.44.1723133777752;
        Thu, 08 Aug 2024 09:16:17 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27229eaasm2377515f8f.103.2024.08.08.09.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:16:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 824915F769;
	Thu,  8 Aug 2024 17:16:15 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <ZrTk4sQS8k1-GBb3@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 08:31:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
	<877ccrqc06.fsf@draig.linaro.org> <ZrTk4sQS8k1-GBb3@google.com>
Date: Thu, 08 Aug 2024 17:16:15 +0100
Message-ID: <8734nfq9bk.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>=20
>> > On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> >> Sean Christopherson <seanjc@google.com> writes:
>> >>=20
>> >> > Now that hva_to_pfn() no longer supports being called in atomic con=
text,
>> >> > move the might_sleep() annotation from hva_to_pfn_slow() to
>> >> > hva_to_pfn().
>> >>=20
>> >> The commentary for hva_to_pfn_fast disagrees.
>> >>=20
>> >>   /*
>> >>    * The fast path to get the writable pfn which will be stored in @p=
fn,
>> >>    * true indicates success, otherwise false is returned.  It's also =
the
>> >>    * only part that runs if we can in atomic context.
>> >>    */
>> >>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *=
pfn)
>> >>=20
>> >> At which point did it loose the ability to run in the atomic context?=
 I
>> >> couldn't work it out from the commits.
>> >
>> > It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic=
 context
>> > would still be functionally ok), rather the previous patch
>> >
>> >   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
>> >
>> > removed support for doing so in order to simplify hva_to_pfn() as a wh=
ole.
>>=20
>> It still sticks out given the only caller no longer enforces this.=20
>
> Oh, sorry, I should have been more explicit.  I'll fix the comment, I sim=
ply
> missed it.

No worries, with the fixed comment:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

