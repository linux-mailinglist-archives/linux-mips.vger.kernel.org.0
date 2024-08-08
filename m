Return-Path: <linux-mips+bounces-4813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B2194BE5F
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 15:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 520FAB253CB
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 13:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FDF18DF7D;
	Thu,  8 Aug 2024 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Vx6V86H"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C918DF76
	for <linux-mips@vger.kernel.org>; Thu,  8 Aug 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723123010; cv=none; b=aeczBvedPH2j3NOEUA7LENoliQ12rbZ/WQymUETt7GV/wAwuhIErN84uWRStJk0a18G/LP17ClK2NIbKcnQGfk0ueCrAiplrH8VGVzWdb3QvqkzqrRuAVBqrDlgPnKuJ+aqEOsVwr4NmS+3mvMDthhahLnc/elxKls1jYOITlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723123010; c=relaxed/simple;
	bh=SIRHTk+m4P1RNpcxL6rwR5xC8tZQja2BIbrMKp2HGV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XbhNpKlVvKyap+C9ThE7Uoorq0Dku4W6ubjVp1PumEyudO5sD6a/AGxRXpsW2sXOjmcPiwkcNh+YKKBpXxroYq0hO7qvsqq8Wlv7YsP9QPwck8q7Grb/0KItX7wCX0jqTJBFBtwvgvGKzoy24bw/fJ4MKibdlIMp6G1+9QplF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Vx6V86H; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d1d51f3e9so1230307b3a.0
        for <linux-mips@vger.kernel.org>; Thu, 08 Aug 2024 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723123008; x=1723727808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ep+xfrS41+80V4sejFNz0q3mTB6TQE8jTTfF1Jh5lTI=;
        b=0Vx6V86H118QZzXcLuXx5cYVlvtaxqcOyrEg1LmwlwoYluILVqVhvw4NdH/wOqy9U+
         H5h7eNi89+utF3KtdQa4FTY3sbEnU/T6+qf1gJS4TBXAw7DKi0pfiFGEMIzcFGFPH5TB
         VCZYiJHltvK5E3aBWqhUqBbAmg/3tUkSwqiPN8MGnh4zIMNE4au8CRz6Yb5Tfb9Qt9Ks
         zLLx9xL8arVUeRVArC8q2H1CmGM67bZorbKF9rk1vISHe30dby37R9w7fYgVN08m5lS8
         4ER8KzaWJIwKYgNSWl33nMf6q2En04mPh0ihepoA3Jif2xIofNF8YrG9ceG9gQWcmjJ2
         0xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123008; x=1723727808;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ep+xfrS41+80V4sejFNz0q3mTB6TQE8jTTfF1Jh5lTI=;
        b=AVP59dPvbhr7Buifv3lUJYw+IzagCFWL2Z222CWoJ8V8uz1aBanDoB3hBeN3dTPC/y
         wMfb+f/Iq6rl3LXDAZihIvyt0lVGnbJbCfd+LePPmv4SatfHRiEAOghDfg+TJ7aYb7+a
         oOmn1d3H3cVO2VlftGJoNiM6F/kvClALfo+O/n4kJ6IQUU7e9T+o5YwaeDJ4CAgupK8A
         BCGlZtvGwBeRVNM/jqH6ru1ZE0gGE0Roj2/2juk0nCbmHEHLhCNEyK7XZQwvh0P8gLn8
         kqGXutRW8ghUNH88pp5zbNT1x+v3zB4RwwFNHc0is5kgH6DQgoY6Jnr4ZeV6Q5IiggB/
         IxIg==
X-Forwarded-Encrypted: i=1; AJvYcCUWj7pl0q42GA3eNdX33ddUAFQKPxQEOBzl5NiKJxLCeT3/bLP4VIpkiwy07KcmgThRuHKom2tzy6l+yLrc+nCNV27EmqMEE8lpUg==
X-Gm-Message-State: AOJu0Yxpb7FmpUleHeFLKXDakio7dQNy+jFP8tiI4kSEumFOyePeLkNI
	EMv0Kuil9PDbPh3K3fv+Ul+HczgmioMvKbFLhweYRWV+3cy/HMWY729NuFavRADIKXkQT0eP6G1
	j+Q==
X-Google-Smtp-Source: AGHT+IHJBsGw5UgR/iugxzmSr+QeSrp5dZN/v/XODES4sTP0wn0G9d+/VHKS2R50We/GZxKaCQexvWJSP70=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d8c:b0:70d:2a24:245d with SMTP id
 d2e1a72fcca58-710cae763e9mr108614b3a.3.1723123007877; Thu, 08 Aug 2024
 06:16:47 -0700 (PDT)
Date: Thu, 8 Aug 2024 06:16:46 -0700
In-Reply-To: <87bk23ql6n.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-14-seanjc@google.com>
 <87bk23ql6n.fsf@draig.linaro.org>
Message-ID: <ZrTFPhy0e1fFb9vA@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
From: Sean Christopherson <seanjc@google.com>
To: "Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
> Sean Christopherson <seanjc@google.com> writes:
>=20
> > Now that hva_to_pfn() no longer supports being called in atomic context=
,
> > move the might_sleep() annotation from hva_to_pfn_slow() to
> > hva_to_pfn().
>=20
> The commentary for hva_to_pfn_fast disagrees.
>=20
>   /*
>    * The fast path to get the writable pfn which will be stored in @pfn,
>    * true indicates success, otherwise false is returned.  It's also the
>    * only part that runs if we can in atomic context.
>    */
>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
>=20
> At which point did it loose the ability to run in the atomic context? I
> couldn't work it out from the commits.

It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic cont=
ext
would still be functionally ok), rather the previous patch

  KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs

removed support for doing so in order to simplify hva_to_pfn() as a whole.

