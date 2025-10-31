Return-Path: <linux-mips+bounces-12001-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21387C264C3
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 18:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E59BD4E9804
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 17:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAEE3019BF;
	Fri, 31 Oct 2025 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wEp/Ypyw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCD2FF655
	for <linux-mips@vger.kernel.org>; Fri, 31 Oct 2025 17:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761930725; cv=none; b=bvMPa5+kGvo3z/4CO1D7hUp3gTfFTUJF3TefEDcIAVVrctERBtwum1AtceGg6KS+UpZ3jdT4oPJvr1HjXrqjOlluHQFf9wBXqToFkTU8UxlHwCERtxWh0Hi9RGv/5/LeLsF1B41V87ibBh7X3CS6W2BZ4C2Z/7bJoMMNJDSNZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761930725; c=relaxed/simple;
	bh=2Py81n9yIbaq9LVne2Z6xEysNPQOVrfItEqxp5YA7aE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QB21nf9sCsfPBnz3boc+yupoG2ZrqaeRCG5jVZ1XA6Gm3DLz1WhhG3kl/vqlYcH7Qcy78g3YDAvdFcJIVZYDeOI5pA2ua58cC8gu5niYmWtYlBk/VNdUlA6wgWeY1aTanFjvuTc/8KsKllIGzpSQWR53iC0RVbdmHeDe2rVoSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wEp/Ypyw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3405c46a22eso2291176a91.2
        for <linux-mips@vger.kernel.org>; Fri, 31 Oct 2025 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761930723; x=1762535523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=wEp/Ypyw9pl+GnTzz1vKb0RGbY/EfAz5fUPPu7aerHeC0w96sHPea1BAOM0s6PlJr0
         9WLki/KnBUA6ja9JQAjmB9V7M3CvhMrYYtbCcEoTVHzd/EQos/9pR9q93XJTyD+fEpfp
         FOYzkB//Kb64qm1hoWVjfj/A8+x0G4/n/VMfjcu6YHItgD3GEq1YnYNy7JZVSn/042YI
         kug1aYoEvl9wmCVb9Ubc2IdTQbe9Nysyo4dqm0g1UWpW0IyVOy/g4B3O4OP0miPxJTZz
         w/ZYlcmPl1PJZ8t9uFYGHHtF3ic1ZtvANTFSkFUWZlmS4lR5+vfQPj2llwDG1GYJcjTT
         U0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761930723; x=1762535523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=Npviy65UmyP+3oflvWtFgptD3qVhpnIf99QuBNJkZO2CsItJFLfzx5GZNoKKz6/x0D
         L8o9QzTNwDB7Fu+SQCsDhizSDZsDwrjn/as/rMRKAQvnZDC+fPM28W5sZ+M2QHY5LLYe
         oj41QuSwcjFqX/fq3a6UfrEthNsq/6vyXADvtAFU3Yig9dxJMiVRIsts/2xEWpDRvvwt
         kF6QsbAM+0v7Gf0NvtCfCQfBQ/wTO2ZSeVYI+ST93FOP3cfB4sm0XMKH2tFhR5CjF7lS
         cFwkLIzzJ1AurqY4axuwCgtWu9aVGlhsrqOR6ZQNcQAzJRPxXB+t0lbkTzMZ9NxwV/wE
         VJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDWAkBtSYM1SXNejlqvLtT51BRTjLOcUKEIHSMcQPJGr9/hPjPyw4zbVa9uwmhoTj0v+R69Uu4gpTP@vger.kernel.org
X-Gm-Message-State: AOJu0YyinbFwzskALiuXQ+VTZOcb13TypISzeqa3orhTutxKQxiqBatE
	CiIPYDW9MJDoLk6GjcksUtmw/z34kIa1VYuR+MEpHmSEyqDt5RLcvYnLcrkOAJebA2t+DmX9zOD
	ytzQzmg==
X-Google-Smtp-Source: AGHT+IGfSgMUQo+5u2P6PetuRGaKK3ywl60OSkXvDDKeMxjcSsBTGVvS+p3TiopL8XWw5d9McqxPGzj/wX4=
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:340:b55d:7a07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388d:b0:32e:d599:1f66
 with SMTP id 98e67ed59e1d1-34083089300mr5226937a91.30.1761930723259; Fri, 31
 Oct 2025 10:12:03 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:12:01 -0700
In-Reply-To: <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-9-seanjc@google.com>
 <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Message-ID: <aQTt4R4CflSuVnCX@google.com>
Subject: Re: [PATCH v4 08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 31, 2025, Yan Zhao wrote:
> >   - Increasing the folio reference count only upon S-EPT zapping failure[5].
> Nit: There's a warning:
> 
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)

Checkpatch is a (very helpful) tool, but it is not authoritative in any way.
Similar to the how "wrap at 80 chars" is a soft rule that can and should be
broken depending on context, checkpatch should also be ignored for things like
this.  If someone says that the period making the line "too long" actually makes
this unreadable for them, then they're just trolling at that point :-)

