Return-Path: <linux-mips+bounces-12271-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB5CC6C031
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 00:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id DBF93291F6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Nov 2025 23:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499BC314D00;
	Tue, 18 Nov 2025 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OML4MOKh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843762E11BC
	for <linux-mips@vger.kernel.org>; Tue, 18 Nov 2025 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508687; cv=none; b=BDv7xh+SbhgyjJVh3oXZvk0q0vw9STZs6rx+ENtjtq6DwDdS8oL9h81BcdA6mulIyk81NszaP3sbVPIHjBLIoI+MmXXhiosWEWb5hfnCw6Bzwtcl8gpva1qJhGCbjzGI1jEUNpijhHI2S8btclPY9X/eW+LfPiC7krJZ9PHRGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508687; c=relaxed/simple;
	bh=5WBwqUVhmKiZfIpTpsQTwtOFw21J/JhhQ4L/zj7meTg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TwQhawweoGDKQ29kPR4P5F7TRXaOmqJ3rUImjGR2YcN0NGixOQ06xhB9rKsk/ATsxUxDvhVXGC+vY4grqiS/jBym70ZN8O4XPxTfrlUmKCLpYykKS/UUW0i8mmSJL9VYxcMlk+zanVUSi1oYL5ZWEDS3DbH9+dBQKR9FitH5FNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OML4MOKh; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-343daf0f488so7358882a91.1
        for <linux-mips@vger.kernel.org>; Tue, 18 Nov 2025 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763508685; x=1764113485; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbmIaudy7FUgPhz41c9iiSjQeSWp1bqqQI5ni0zcdI=;
        b=OML4MOKheSLDFF5wGADYxfgglixk1AIVnESB8GaZBfnXuNmzX16983P1seK/f1eu8m
         0a7ZpeGt9riD9v9/I+na3/LQVZXpDoEGJaau4BgBiurJmGy5cdj+HO/9zqCuIugCd9M0
         gdW2K4Ak8zmQ8ci9juoLItHcK1Zyj6j5bzmDNW1KCaGvf/oECwpX55lOhfnUBeRctEMe
         +hnba2fW99QeI5oSa8yKuHzhQPyNkvOyJVgHUwhQieUuo7QaeHXuHdGvfeZtp5bFPDnq
         2/9sNG5Rc2Fst6CUwSGDem+/1Zxmf2ylYYJrwA1Tb6IqRw4iuJEVU+V6ywNfh/7U6yeS
         HYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508685; x=1764113485;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbmIaudy7FUgPhz41c9iiSjQeSWp1bqqQI5ni0zcdI=;
        b=Ap8ldbFlNrGBb7bu3f7FEUrcIWxH6BvGD/nuirxm4VVKbO6ICxglyjEHaOb0vGsJia
         bYcRTIRCwltRJb3lSMz5WC9rSCPE7R4iK60RMQbbn421qR9oFwxhUzz5/eJzjq1Ne85Y
         pBJ4BtqbxsAntVMqV8h0bGWzQJY+kja/102BlMgmvKIuHHYZwTPTbswqK5L7VGx6a/EV
         gfSeFZgfHWFRkQAp4aYuNIcDX7hjIMGJhENsdvcJE/HBBlqgEcEY+Cd6hlIQdj9xgEe+
         9CNBNNTWqJAEwu4+QL0AHSkQVGJ8HBMK5Yg9tZc5a8fjtL4BqDrgvI2p2G2X1g+94bps
         omXw==
X-Forwarded-Encrypted: i=1; AJvYcCV0UMJasbH1CyvgDGrOWzzfZdelPp+XKgt0j6NRkrwrjTqG5VtXvmB6lNqFoQphO2uJozquPPZeQ0dA@vger.kernel.org
X-Gm-Message-State: AOJu0YwreGQ5ayRDW+DcTCs5ic1lJ8YUaVFqG2KtECxW3HEX4OLBLx3u
	UlqFPjS83/Roa6V6eTFCoZFLJ/1m9Oaqgi9UJn6W7Gy/Yllg7gmDcnv4//nv0ejMiCJvJdlxWfg
	mCY8Hgw==
X-Google-Smtp-Source: AGHT+IE1o3OuDgEYh+WwImWCZtj32ss/bDTcBxOCjrPrz1sqG0DLMNd/QRhOEpFCg6/bq23FewNy3cS6Bik=
X-Received: from pjbpd18.prod.google.com ([2002:a17:90b:1dd2:b0:340:e8f7:1b44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5484:b0:341:124f:474f
 with SMTP id 98e67ed59e1d1-343fa6390cfmr19214010a91.32.1763508684387; Tue, 18
 Nov 2025 15:31:24 -0800 (PST)
Date: Tue, 18 Nov 2025 15:31:22 -0800
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aP-1qlTkmFUgTld-@google.com> <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Message-ID: <aR0Byu3bd3URxzhu@google.com>
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: ackerleytng@google.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	binbin.wu@linux.intel.com, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, ira.weiny@intel.com, 
	kai.huang@intel.com, kas@kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, maddy@linux.ibm.com, maobibo@loongson.cn, 
	maz@kernel.org, michael.roth@amd.com, oliver.upton@linux.dev, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	zhaotianrui@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 27, 2025, Rick Edgecombe wrote:
> Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
> meeting contention during retries in some no-fail MMU paths.
> 
> The TDX module takes various try-locks internally, which can cause
> SEAMCALLs to return an error code when contention is met. Dealing with
> an error in some of the MMU paths that make SEAMCALLs is not straight
> forward, so KVM takes steps to ensure that these will meet no contention
> during a single BUSY error retry. The whole scheme relies on KVM to take
> appropriate steps to avoid making any SEAMCALLs that could contend while
> the retry is happening.
> 
> Unfortunately, there is a case where contention could be met if userspace
> does something unusual. Specifically, hole punching a gmem fd while
> initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().
> 
> The resource being contended is called the "TDR resource" in TDX docs 
> parlance. The tdh_vp_init() can take this resource as exclusive if the 
> 'version' passed is 1, which happens to be version the kernel passes. The 
> various MMU operations (tdh_mem_range_block(), tdh_mem_track() and 
> tdh_mem_page_remove()) take it as shared.
> 
> There isn't a KVM lock that maps conceptually and in a lock order friendly 
> way to the TDR lock. So to minimize infrastructure, just take MMU lock 
> around tdh_vp_init(). This makes the operations we care about mutually 
> exclusive. Since the other operations are under a write mmu_lock, the code 
> could just take the lock for read, however this is weirdly inverted from 
> the actual underlying resource being contended. Since this is covering an 
> edge case that shouldn't be hit in normal usage, be a little less weird 
> and take the mmu_lock for write around the call.
> 
> Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Hi,
> 
> It was indeed awkward, as Sean must have sniffed. But seems ok enough to
> close the issue.
> 
> Yan, can you give it a look?
> 
> Posted here, but applies on top of this series.

In the future, please don't post in-reply-to, as it mucks up my b4 workflow.

Applied to kvm-x86 tdx, with a more verbose comment as suggested by Binbin.

[1/1] KVM: TDX: Take MMU lock around tdh_vp_init()
      https://github.com/kvm-x86/linux/commit/9a89894f30d5

