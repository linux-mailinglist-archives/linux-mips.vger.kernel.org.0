Return-Path: <linux-mips+bounces-11870-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D2C01F8A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Oct 2025 17:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94D43AD86E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Oct 2025 15:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C4A332EBD;
	Thu, 23 Oct 2025 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WTfHNZv0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC87332913
	for <linux-mips@vger.kernel.org>; Thu, 23 Oct 2025 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231602; cv=none; b=siLWSpZ7lq8Ft7j6AbuM5VoXv2dTabF3o/erZzBosUCDvsOLOHHQR/nR5vHOtk74VHBUmwQZ5vO2MUDBDv8nywgFh2jjQIVoqHOnT4/gzKcaKrs23vCqQPw9pEfOwFgGdeF8IlURSL1hGedr82JwALyiOdXpnhMhO71EJF86S84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231602; c=relaxed/simple;
	bh=cCjw14mLE9P+iI4RdSZoroo4x5ze1Fp0XffjVUeu23Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ear4uDl40FF3ALnoD96OaK9Hxl3//vO6Y/iVP7yCA9FFddB8kBJUTaJZxSF901Bs9OCGKqKDpejFiiSviCSyhoengO0Ih5pyNCeJBQRfEyf5s1SbY5Pa4BzVImjIdy/a8ikdHoCzmrsGupjH8YHm6Rgnk05H9DBCVRAiszYGHhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WTfHNZv0; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so982815a91.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Oct 2025 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761231600; x=1761836400; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
        b=WTfHNZv0eOCB05pI8Fvz11G2pvgQxEyAWzjc6AAIQ+Xjc49zNWsifCNy4m/+vLQBVg
         kZVP+Hg0M7LwEbmXb7ByiThUkv6/19ddTM8LGxukRy7KF6gFTr3tNlhDdX2HV+KGk02Z
         IfnT5hBhOqq0v9wCI1Q4URp+5eUeV+o7YwuKMeAV9tYPJzQN5YDBBKtvxR9Y+dWsQScx
         m6xDjv6QST1TfiU9Yqa6OaI7xUCKbbBWrpnb77BRUEULt4l/SB/qIW2/k5i2A/XsWhY1
         P2NSAJxsli0rRBj3RfHudL1wF0G/zUIz20jP2lqC0za1LCVL5GjoXjfpwZpHwNqdXXC9
         o52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231600; x=1761836400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
        b=rRMaZh0NVhHkkq4ADdbqXXNMVUaCFaH908j6rogw9KdWoMITVOZKabCqfPlcA9ZtzD
         mvmJ+qlN+Jaj8Xgfso6ETy/udTgTQBq7d78eNbHwYF12iqcPVV0vOwSshEniLyqViVYk
         qcnLVfu4aHyz3gdM8E7p0qDeXGCa9e+YK5NQQnGVj8YbrdI7R57JbwD+rnh2J0gmevD3
         k5Z3UDBMLfVc8aFl21aDRkRcaa559zCTJ/U9G+vUeg/IHbT/Fk//av3OfUCNSV9rqpCr
         4IwC2WTWaF9ny3tBWOR5/fE3HJRiT0c4GGxzDLN6lH564ciaUwY+QT8PBY3Ijd4kdb4y
         0H3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8s6n0Jgyu8UPazhzcYV80EhuK3TjqSweKsvHu9wFEoGtQE8I7VMy00mRVfVNaIE8WZYAd5BUX4waM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8a4AWzi0jKmQvWXVBMjn1iOYrath/MaKvGJs4aApWchaPcAH
	RYElHFZ+DPemB8BD+PG2nk5TXQH7LTuBtPKidcW1xN/S1i3OlTyFVDv1xSsYZW+Vj9LFpEVo2v9
	trtwULw==
X-Google-Smtp-Source: AGHT+IGIKST/5gTXkhLeNb6+zo5OEJ6E7Tz0ILKzp1TDg+5uVro2JJ+z5T3UkH4GmCDPjUQAuY2o81CumRA=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:330:a006:a384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5291:b0:32e:859:c79
 with SMTP id 98e67ed59e1d1-33bcec1ab25mr31136898a91.0.1761231599767; Thu, 23
 Oct 2025 07:59:59 -0700 (PDT)
Date: Thu, 23 Oct 2025 07:59:58 -0700
In-Reply-To: <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-10-seanjc@google.com>
 <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
Message-ID: <aPpC7mt3CwWuhv1p@google.com>
Subject: Re: [PATCH v3 09/25] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 23, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() to
> > avoid having to differnatiate between "zap", "drop", and "remove", and to
> 		  ^
> 		  differentiate
> 
> Nit: it's a wee bit confusing that you mentioned "zap", because after this
> patch tdx_sept_zap_private_spte() is still there.  But it may be only me
> feeling that way.

Hmm, yeah, I agree that's a confusing/misleading.  How about this?

  KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
  
  Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() as a
  step towards having "remove" be the only and only function that deals with
  removing/zapping/dropping a SPTE, e.g. to avoid having to differentiate
  between "zap", "drop", and "remove".  Eliminating the "drop" helper also
  gets rid of what is effectively dead code due to redundant checks, e.g. on
  an HKID being assigned.
  
  No functional change intended.

