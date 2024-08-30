Return-Path: <linux-mips+bounces-5252-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABA1966385
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2024 15:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7BA0284014
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2024 13:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135211B1D74;
	Fri, 30 Aug 2024 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3M58Dtm8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B81B011C
	for <linux-mips@vger.kernel.org>; Fri, 30 Aug 2024 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026239; cv=none; b=Qt1Ots55af/5yJ53X3xQ0XarJXChCy4Cts1Xh4fv6aA2cZmz7pwPtviIVAIWb61uPx3VcSM2mDRTf0gQvW9Bzyk9JRBooZZCXaZp8cNhG3hOCedVn114DTjSjDQxLBKu6TUYZsoSj0OqF1Jehzcuq1rXnL96aIxJI9nOVDiVCIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026239; c=relaxed/simple;
	bh=NUlKGhIyCsQGFAYIgqP91JPxVHe0dLUWSGpMcalpvoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=apxMb4NFs77aBVaYI4W0kzne3r+iXizQ/HHZDIQzAO5MNqCeRiMZZBwFhSGb20E5oaPYAEi9E3hPPlnwpUEgfqwk7Sj1z9H9dS6UVOjccv+Q1vNpqz4GpeO8CctGxCFkLg7vWbhtuq/FmW48ufknXkzAneeCa5iDJz81MtQGNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3M58Dtm8; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6507e2f0615so1631944a12.1
        for <linux-mips@vger.kernel.org>; Fri, 30 Aug 2024 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725026236; x=1725631036; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=58CvTL6COAyoekWQp05GB8r3Lb0Xc+vxoLW2O7LrDWY=;
        b=3M58Dtm8nuNnYELdLnsGKD+ir1BUWYX6KMaWNsdRaZlwUBjlODenA7kthE1jBOAUou
         ImtzeOJ2e68tgG+fdGNq2kPdTJvjZAseXOybzuNqxF93qfmN4/SLr4yPdIQ6YQjPTO/u
         5qNdRvUl1NbK8rrNaEQh5uaG4V5R9zepM163/bERDS7YXIB5c0KextBqXF8tfiw0PKNt
         YfVDSkNCbWkVYkZKVDbbgi6oPi8/QFSiypLGtqE2RsKJ06emUyTlX4ZZA1QwVpIfySex
         3oGLPOfa3iwUQR875Zs4igODpfEJfNtvHOEb0Ol2QUeWNE9rnF/OXm56pVsyIICKf8F8
         zyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026236; x=1725631036;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58CvTL6COAyoekWQp05GB8r3Lb0Xc+vxoLW2O7LrDWY=;
        b=abM6A95wN7ChsLxdEYWkg72bF8RNDG+rfSZ7NmVMb2/ReN6iQ0xmbAiHvzt/i1zbXx
         ZqZswO4X8MxUH9qXluYWgZuxeeCrQczjJImzr+zZacWU2g85q4iMJq6cJ0vK7w4q3OUS
         V6MYe/JhyTm8pWScj62qShe0QDKjiNhvk+dzWkpOPDUhMX9v2S0kLQN1n+tkAE33Z0W6
         9RGXYLHfCSrjlo3iAgLSlfLL3b53H4dIlpXfPpPOodbd93njEsFc+wZyrowDwDSqtAoL
         5KzksYNIoqKqtgtrPP0r1h3qYjAeSM3AZoLusKNH4JkrF1wFmMC/gzwisV73EOmuksz5
         P1yw==
X-Forwarded-Encrypted: i=1; AJvYcCWQqobkLboV5sRsDXxySTsJVFajfwR38f5MfodMEPSbbjVMICiy9BCWTNT0C9mEYIpAfsygXOrxTb7J@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCDvY4NckBklk5PNtra3iS434Oh3YZre2yDd62xci4ju87A6Z
	Im/nI68/m6ceVwykmJU2xRaWaWGg00l0jRq7YMJFUtmqEUWBeVgFyqLJoqQpUxlJ7l/ne1jayeD
	a2g==
X-Google-Smtp-Source: AGHT+IExGR2RCNKu/4M4z4IiNUcplAydPr67v3iYUD8ZfSJDuu52D1tVexWQwhZuKUP8XxVYEYjpc6MqNEc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f90b:b0:1fd:9d0c:999e with SMTP id
 d9443c01a7336-2052857ddfamr344725ad.9.1725026235523; Fri, 30 Aug 2024
 06:57:15 -0700 (PDT)
Date: Fri, 30 Aug 2024 06:57:14 -0700
In-Reply-To: <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com> <20240830043600.127750-2-seanjc@google.com>
 <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
Message-ID: <ZtHPusyTNkQ_a1Y-@google.com>
Subject: Re: [PATCH v4 01/10] KVM: Use dedicated mutex to protect
 kvm_usage_count to avoid deadlock
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Chao Gao <chao.gao@intel.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 30, 2024, Kai Huang wrote:
> 
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > Acked-by: Kai Huang <kai.huang@intel.com>
> > 
> 
> Hmm I must have done a lot for me to receive two credits (and for most patches
> in this series) :-)
> 
> I think one Reviewed-by tag is good enough :-)

Heh, indeed.  b4 has made me very lazy; I just `b4 am` the patches and let b4
grab all the trailers.  I'm guessing something went awry in that flow (or maybe
you acked a previous version or something?)

Anyways, one of Paolo or I can clean this up when applying, assuming we remember
to do so...

