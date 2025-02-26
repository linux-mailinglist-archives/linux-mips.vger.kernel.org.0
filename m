Return-Path: <linux-mips+bounces-7968-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5818DA45172
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 01:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 116BD7A5E47
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 00:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9312533F7;
	Wed, 26 Feb 2025 00:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ECBLMxwA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5D480BEC
	for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740529655; cv=none; b=ogPVZXTVEex1cmolaR/LRLJmWSC3xrFoCiCbSqgGRnhNmv3LIn00V2sNnMyyVFniwsAcAQBjpUambKlnQIjsainzJjkWELJlgheglYgxnHoiV+Q9aRIkuAPYoqb8/Foe7nMsgLYtVuThEczCFgWTrvBgpL9VFI48VZRWBZQmNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740529655; c=relaxed/simple;
	bh=YFdIcmETOAJxtDEb1Ht/Nh5ABrjaWCQRix/l3XIAYQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=syA6tc9vzxkRkfYzg/NqVWhsJvCjPiY4l47aZbaxBwR9QPbLYpvil1BUURB0FP1J//7z5iyVWYSweLCM5hR0ysrmmZn6Hi4ylQI7AiAr8YN74vr6yhBf6XGttME5i7DJch6+Uwry9PnoLkZae00vhIKEkKW6TB9K3ACaCGnUMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ECBLMxwA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so13259118a91.2
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740529653; x=1741134453; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=ECBLMxwAsGRdP3VFzeMyGfZGaoY1Qb3UzSP2FRQkvEhGdgROep3X0hVvmxyoTyJC2z
         pW/3EM1QgRY5m3SamvrJNSeV75OeTTvLfYTkqARGd2eRw6jwmgidZIKsw5lWcqY2TFS9
         R2QQNRtcrhhHJPZqJ2ezvxSE1QPbN5yoQWY2K1P3keBz4ACvPkDk15arawiluShBVMaX
         Lyi8npD4Gyykc6lYzAaBsg5hdL/gr5HQP8GYf2+4QaW7QFutLufClTklFxnwaE9m81lY
         /sqDD4LLpqKp+ct0BFq9hWD3TqntV2pPCuYoF/wnFE0h/KI1NPbjfhoGv8vTby+XqJRG
         Ey8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529653; x=1741134453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=dHtnPPOZbMm+5nA8X995smdOOpY/bcNNHGiZ3E2Phd9cQPlu71aH/2KL7TFB2fgtR5
         6bXCAJ5NjN7LHfm/pggpvfuzvh1SVFZS2YBWqgCmQWKAEfHUt2UGdFIg72sYLXA5wgOC
         YaUHHYR8kmFH5AzQbo1F9aFF0xF1pQY4/vRUDQNnmiNcyikuMHakBRjwnwfzoMmOEz2F
         osaUwKsfRdu7BzzIPp2tVsIbCr6nTOKUe2XhwH27BaMsYde7+AtQL+1DqgUIiuwNXCt8
         hUR50VllB3oawqJFNC6Se9wSPm6uIuArLda4NOwTQGjomRU2ttGIrlAmxHmJTjW1RxdR
         kl1g==
X-Forwarded-Encrypted: i=1; AJvYcCW5BAjRbxlMLdpnfusvDEQLTY/lZJi2pNM9xRZ9jD7/qcIfkAQpeOPnHBKJKaEU7DhL0NK8uP/IfEd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq13wG6pr1L0Wbl+t5lCdPEQOtB+h2YVp8Zy1gQ+157v23ZMGK
	+DsRvmG64n4tGSdzMNj0lz+PYIPSlQanTUD205OJNEj22o3L0Hez6DY+e0uHD5msj+nhQyh+x8W
	hKg==
X-Google-Smtp-Source: AGHT+IHOUZMQJO44VDHKi6ofhJ07QZ2dZ6izn0Wyr9X1ZaSMCJ5d0/qSAVcldTsRp+dWt1bBYLTGrWWvHEg=
X-Received: from pjbsb8.prod.google.com ([2002:a17:90b:50c8:b0:2d8:8340:8e46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5483:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2fe7e218ab9mr2765842a91.0.1740529653271; Tue, 25
 Feb 2025 16:27:33 -0800 (PST)
Date: Tue, 25 Feb 2025 16:27:32 -0800
In-Reply-To: <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Message-ID: <Z75f9GuA9NfKo37c@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> On 2/25/25 00:55, Sean Christopherson wrote:
> > Free vCPUs before freeing any VM state, as both SVM and VMX may access
> > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
> > to be kicked out of nested guest mode.
> > 
> > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
> > called") partially fixed the issue, but for unknown reasons only moved the
> > MMU unloading before VM destruction.  Complete the change, and free all
> > vCPU state prior to destroying VM state, as nVMX accesses even more state
> > than nSVM.
> 
> I applied this to kvm-coco-queue, I will place it in kvm/master too unless
> you shout.

Depends on what "this" is :-)

My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master, but the
rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on adding a
few more cleanups (though I think they're fully additive, i.e. can go on top).

