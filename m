Return-Path: <linux-mips+bounces-14443-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BRkKo4i+Wmz5wIAu9opvQ
	(envelope-from <linux-mips+bounces-14443-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:49:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D00C4C4914
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A82B13034652
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 22:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB94387581;
	Mon,  4 May 2026 22:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QX/tt8cu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DCC36215A
	for <linux-mips@vger.kernel.org>; Mon,  4 May 2026 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934709; cv=pass; b=VJdbzQvklJrGW5ItEnjAGt/Jj5mR3mlWFP3Cp+ASPNVpKPGwKqOotz0FR6BDIhcmQTinOa+L5mVABjLtxSpbHliEabLe+zK2nweSzfGPYaNtXbGV8UsvduQIt7A8UllJz4Q4uUA8YdprqGDepGl/aiAME2pwdvXRSGkqGTGvx2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934709; c=relaxed/simple;
	bh=noNTHlOK1+XTXgECJLp1WELbdM2KwGW5uoEbbwKOcik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMHIc+ibb11fP9J2r20idS7sCzQDK5SDI+e2VXkUbsd8EBA4AX7FsaMvGBrinhRoR/XAlS3AymJbDEGaXNdkhkCQP0LKwVJ4NMRP+6AjKne93N+3gB4Ue+w7lyM+BMFpEH/EInQdNGx24eLE45m1LAbzOgHVAEcufEwKQLacvbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QX/tt8cu; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba6838e76f2so536314066b.2
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2026 15:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777934706; cv=none;
        d=google.com; s=arc-20240605;
        b=X6yUG/zBwCHQuW1m3kpu0QmBgYzE9tS0npMjEvHHBOZaSFv6F+JNWeY2Fvzh1mC2uE
         PgeC0OD0vqohWSUi327ZtFOnj7CC3/8fWEpETe4V5As+XDPdKyy9Jy+XmIRlKoXoSh8Z
         FST1Xlwup1VRiaULRxF7VzQE8ckCFfQcam47iD0DFSbUXowLB7osrvsUCedEF8Y5oM1Q
         cc7b5bNTNxed8bmoJmtQmfQKw4NhDN7SEZ/+KtpW4OnOSgedV67f2PkmgmKz3MB+caTF
         bn/wmZrvl2IVTVsu8NFiLjeqVUMeviNknTByWmKsY9qFMY2wB1asALLW74ecaJaU8Luj
         LUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agnS5syCqKso6alfew7fBrkBd9YsRa9Uue32+MAHthw=;
        fh=DIwoTFDdAGOiZHqB9PwU5JniS4anAumQZXNg3yI2Z3w=;
        b=N9AZrOzQqzaFQRkt/mXU5bMdoi+SyYHc+dfo1BoYB9yi6uf5z7qt98thv0ooB65J/o
         3P6wowBxDwk2/GVa75PQdpJ/DAlnYFuCEOBdUCouAEet8UC/t3dsCywp507DYNSVyXbX
         n1tREnyPzczxDxjhX3NE0e4uOgayO5jetievJhSaXJ1L5YHQWV3sx2DelVAdZtxIUIVg
         mwKTSh6MdcleydQbk4M/ARKOfZEdIte4IIlE3vC3rDYtSNws9x/gb2yjFBmeWDW+/jLN
         xlo+hG0BgL3C8/JnTYia06B3L8kfpsK4Pd8uKIHQRcsQzWcW7Jau2ND/XyhJ67ERAEvD
         hflQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934706; x=1778539506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agnS5syCqKso6alfew7fBrkBd9YsRa9Uue32+MAHthw=;
        b=QX/tt8cuc1b5We4qvS8AvrYPm6TkwnuMOJBuzLXAk8omSsIJc9g5GEPqewFW6hELT7
         jACJmnhuHQawMH8ZPd649EXgWglzJbnlYdEUdMk4YQlUmaO6kGQtPn7f2SdmsofhK6qb
         ucyKUCel5WeMkIkv4uvzg4LjTY5/aKJH7eXRQFNluZm3SZBk0xxlIioTC5VEC2m5nADb
         HN+77vvAj8QyZb9DLu9rGlIbSGKy0FW0nYQVjcma4v8ZtNICgWOBH/KNc7GyJKsoj/ph
         qkU6pZEWzYhdSU+MkWLFwA0vwZthfmA5W/wvdmEra99jaA/pCyLvkSiPlLxAFlQfti7N
         tX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934706; x=1778539506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agnS5syCqKso6alfew7fBrkBd9YsRa9Uue32+MAHthw=;
        b=ijuMwN+r6M7P/c+gz2hbRayH91Ad13KxGpjVa67Eb35K25BZykLmKUUF/5oq6Lme/N
         Y0+UOcOL1n8lpCeyu9UN6SjTE/guJUQtdXmon+Bi0d5fU7YXPtYgDXc7IzNhMtw2tOmt
         sxG4NZgCpyyoVDvWW0YTFlcz1w/iYwp3V/7w7y7fmhtv6dqIKd06f9WrDuUxS57/J4EJ
         c0OZ5k4V4Xai4bIOxrEi4NuCkZKznyb6QZOtoCltUM//iahvbxrWeZ+KqneVptCdanNr
         3V1xFmNyGj0doxrzuDIB18Xq0/6ALqgllhsxR/JqCt4A+AULOqM7GxQxHS158yQ+ECcZ
         wuZA==
X-Forwarded-Encrypted: i=1; AFNElJ/u/h+nIC7TredWHxmUrctYW/hI0lhp9E1Ab+tzgUqDBVA4IbJj5k8ZNqMkTwmw78XP3c1Uzzz5ur/u@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR0gw0iCleJtjE5foDD1k5+DRguXiN+s/+lIjRSTEEMZQvlSL
	h964D3uAykfedIfoi2S7Xp7V+yW3EmTSi7rxz7E3rk7KArumSyRBHPv1T/E6YvwH0Nq/VBFoSR7
	3g0lAwb/rhKLZ0Yqo1jswCP74dvnfB/bKoNj1y5Ni
X-Gm-Gg: AeBDietoThN58ftjv6h+fC0NBxojyNybYrTK7Bzr8lx6HaZOPWxnZDUU01lu3Ps4HR7
	30wzopi60rMOqirlM9aEzHRxaPwWvUcJzbtjqvQ/3qqSsvQtXNW04PTJ+z9CBFzqnWMq6dRuvHH
	752YXDmjRX1rLC2iB6iy0YUqJcSQHyaXGJgnwX7kTA6aNuXnvlw3jbjS75E8miE0WGuaTac2l6m
	j2dATdhy6fAa5/BoI9o2+q4Ll9YQVlVh/8LACQMQUwB1X3uNgrTlwA0dwTBe5DTChOqgZ6IXIza
	nNK67Q9balbNZX3MUm9iCaCS7x2KJ59FUwUV++ebpfFYJIFI5idDsgc6Ji/o9gsONDo7DeIOTed
	BoShJh4fzINwxtDuZ+/IWtspHRw==
X-Received: by 2002:a17:907:25c3:b0:bae:d2dc:1114 with SMTP id
 a640c23a62f3a-bbffaf48959mr603805766b.24.1777934705381; Mon, 04 May 2026
 15:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 4 May 2026 15:44:29 -0700
X-Gm-Features: AVHnY4ISX5UKNFbqEqHmUwKZ4SIZjTFpsV3ot1gYDHAioJIe9jsiBtFZaU7PN8U
Message-ID: <CADrL8HWLMEwwQgD954GOWo4n87Y_G0G700qx8mJisMD0SGr4gQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: Fix race conditions in kvm_arch_flush_shadow_all()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0D00C4C4914
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14443-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthoughton@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@google.co=
m> wrote:
>
> Hi Paolo,
>
> syzbot running on Google production kernels ran into a double-free on
> KVM/arm64 in kvm_mmu_free_memory_cache().

Here is the full splat:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 BUG: KASAN: double-free in kvfree+0x30/0x40 mm/slub.c:7247
Free of addr ffff000810394000 by task syz.25.15225/156017

CPU: 2 UID: 0 PID: 156017 Comm: syz.25.15225 Kdump: loaded Not tainted
6.18.16-smp-DEV #1 NONE
Hardware name: Google
Call trace:
  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
  __dump_stack+0x30/0x40 lib/dump_stack.c:94
  dump_stack_lvl+0x198/0x264 lib/dump_stack.c:120
  print_address_description mm/kasan/report.c:402 [inline]
  print_report+0xbc/0x254 mm/kasan/report.c:506
  kasan_report_invalid_free+0x80/0xd0 mm/kasan/report.c:581
 check_slab_allocation+0x134/0x1a0 mm/kasan/common.c:-1
  __kasan_slab_pre_free+0x30/0x40 mm/kasan/common.c:261
  kasan_slab_pre_free include/linux/kasan.h:199 [inline]
  slab_free_hook mm/slub.c:2535 [inline]
  slab_free mm/slub.c:6730 [inline]
  kfree+0x140/0x548 mm/slub.c:6941
  kvfree+0x30/0x40 mm/slub.c:7247
  kvm_mmu_free_memory_cache+0x22c/0x2a0 virt/kvm/kvm_main.c:679
  kvm_uninit_stage2_mmu+0x30/0x40 arch/arm64/kvm/mmu.c:1048
  kvm_arch_flush_shadow_all+0x178/0x198 arch/arm64/kvm/nested.c:1113
  kvm_flush_shadow_all virt/kvm/kvm_main.c:579 [inline]
  kvm_mmu_notifier_release+0x48/0xac virt/kvm/kvm_main.c:1287
  mn_hlist_release mm/mmu_notifier.c:321 [inline]
  __mmu_notifier_release+0x29c/0x46c mm/mmu_notifier.c:359
  mmu_notifier_release include/linux/mmu_notifier.h:406 [inline]
  exit_mmap+0x100/0xb08 mm/mmap.c:1265
  __mmput+0xb4/0x360 kernel/fork.c:1183
  mmput+0x70/0xa8 kernel/fork.c:1206
  exit_mm kernel/exit.c:616 [inline]
  do_exit+0xc1c/0x26f4 kernel/exit.c:1025
  do_group_exit+0x194/0x22c kernel/exit.c:1180
  get_signal+0x1614/0x197c kernel/signal.c:3056
  arch_do_signal_or_restart+0x25c/0x4a5c arch/arm64/kernel/signal.c:1637
  exit_to_user_mode_loop+0x84/0x230 kernel/entry/common.c:44
  exit_to_user_mode_prepare include/linux/irq-entry-common.h:228 [inline]
  arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:103 [inline]
  el0_svc+0x168/0x1dc arch/arm64/kernel/entry-common.c:750
  el0t_64_sync_handler+0x68/0xdc arch/arm64/kernel/entry-common.c:768
  el0t_64_sync+0x1b0/0x1b4 arch/arm64/kernel/entry.S:596

Allocated by task 156010:
  kasan_save_stack mm/kasan/common.c:57 [inline]
  kasan_save_track+0x30/0x68 mm/kasan/common.c:78
  kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:573
  poison_kmalloc_redzone mm/kasan/common.c:401 [inline]
  __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:418
  kasan_kmalloc include/linux/kasan.h:263 [inline]
  __do_kmalloc_node mm/slub.c:5712 [inline]
  __kvmalloc_node_noprof+0x4e0/0x7d0 mm/slub.c:7204
  kvmalloc_array_node_noprof include/linux/slab.h:1140 [inline]
  __kvm_mmu_topup_memory_cache+0x460/0x5b8 virt/kvm/kvm_main.c:638
  kvm_mmu_split_huge_pages+0x1d8/0x338 arch/arm64/kvm/mmu.c:143
  kvm_mmu_split_memory_region arch/arm64/kvm/mmu.c:1306 [inline]
  kvm_arch_commit_memory_region+0x648/0x814 arch/arm64/kvm/mmu.c:2432
  kvm_commit_memory_region virt/kvm/kvm_main.c:2244 [inline]
  kvm_set_memslot+0xbec/0x120c virt/kvm/kvm_main.c:2506
  kvm_set_memory_region+0x7f4/0x9ec virt/kvm/kvm_main.c:2643
  kvm_vm_ioctl_set_memory_region+0x74/0xdc virt/kvm/kvm_main.c:2677
  kvm_vm_ioctl+0xc28/0xe50 virt/kvm/kvm_main.c:6368
  vfs_ioctl fs/ioctl.c:52 [inline]
  __do_sys_ioctl fs/ioctl.c:598 [inline]
  __se_sys_ioctl fs/ioctl.c:584 [inline]
  __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:584
  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
  invoke_syscall+0xa4/0x25c arch/arm64/kernel/syscall.c:49
  el0_svc_common+0x13c/0x250 arch/arm64/kernel/syscall.c:132
  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:151
  el0_svc+0x5c/0x1dc arch/arm64/kernel/entry-common.c:749
  el0t_64_sync_handler+0x68/0xdc arch/arm64/kernel/entry-common.c:768
  el0t_64_sync+0x1b0/0x1b4 arch/arm64/kernel/entry.S:596

Freed by task 156010:
  kasan_save_stack mm/kasan/common.c:57 [inline]
  kasan_save_track+0x30/0x68 mm/kasan/common.c:78
  __kasan_save_free_info+0x54/0x6c mm/kasan/generic.c:587
  kasan_save_free_info mm/kasan/kasan.h:406 [inline]
  poison_slab_object mm/kasan/common.c:253 [inline]
  __kasan_slab_free+0x74/0xa4 mm/kasan/common.c:285
  kasan_slab_free include/linux/kasan.h:235 [inline]
  slab_free_hook mm/slub.c:2590 [inline]
  slab_free mm/slub.c:6730 [inline]
  kfree+0x17c/0x548 mm/slub.c:6941
  kvfree+0x30/0x40 mm/slub.c:7247
  kvm_mmu_free_memory_cache+0x22c/0x2a0 virt/kvm/kvm_main.c:679
  kvm_uninit_stage2_mmu+0x30/0x40 arch/arm64/kvm/mmu.c:1048
  kvm_arch_flush_shadow_all+0x178/0x198 arch/arm64/kvm/nested.c:1113
  kvm_flush_shadow_all virt/kvm/kvm_main.c:579 [inline]
  kvm_mmu_notifier_release+0x48/0xac virt/kvm/kvm_main.c:1287
  mmu_notifier_unregister+0xf0/0x330 mm/mmu_notifier.c:815
  kvm_destroy_vm virt/kvm/kvm_main.c:1767 [inline]
  kvm_put_kvm+0x664/0xaf0 virt/kvm/kvm_main.c:1825
  kvm_vm_release+0x4c/0x60 virt/kvm/kvm_main.c:1848
  __fput+0x340/0x754 fs/file_table.c:495
  ____fput+0x20/0x58 fs/file_table.c:523
  task_work_run+0x1d8/0x268 kernel/task_work.c:233
  exit_task_work include/linux/task_work.h:40 [inline]
  do_exit+0xcc0/0x26f4 kernel/exit.c:1037
  do_group_exit+0x194/0x22c kernel/exit.c:1180
  get_signal+0x1614/0x197c kernel/signal.c:3056
  arch_do_signal_or_restart+0x25c/0x4a5c arch/arm64/kernel/signal.c:1637
  exit_to_user_mode_loop+0x84/0x230 kernel/entry/common.c:44
  exit_to_user_mode_prepare include/linux/irq-entry-common.h:228 [inline]
  arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:103 [inline]
  el0_svc+0x168/0x1dc arch/arm64/kernel/entry-common.c:750
  el0t_64_sync_handler+0x68/0xdc arch/arm64/kernel/entry-common.c:768
  el0t_64_sync+0x1b0/0x1b4 arch/arm64/kernel/entry.S:596

The buggy address belongs to the object at ffff000810394000
 which belongs to the cache kmalloc-cg-8k of size 8192
The buggy address is located 0 bytes inside of
 8192-byte region [ffff000810394000, ffff000810396000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x810390
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff0008ceb3d481
anon flags: 0x100000000000040(head|node=3D0|zone=3D1)
page_type: f5(slab)
raw: 0100000000000040 ffff00001000b200 0000000000000000 0000000000000001
raw: 0000000000000000 0000000080020002 00000000f5000000 ffff0008ceb3d481
head: 0100000000000040 ffff00001000b200 0000000000000000 0000000000000001
head: 0000000000000000 0000000080020002 00000000f5000000 ffff0008ceb3d481
head: 0100000000000003 fffffdffe040e401 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask
0x1528c0(GFP_NOWAIT|__GFP_SENSITIVE|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_C=
OMP|__GFP_HARDWALL),
pid 18319, tgid 17452 (ContainerMgr), ts 882149108930, free_ts
882148954562
  set_page_owner include/linux/page_owner.h:32 [inline]
  __post_alloc_hook+0x268/0x288 mm/page_alloc.c:1962
  prep_new_page mm/page_alloc.c:1976 [inline]
  get_page_from_freelist+0x2dc0/0x2f1c mm/page_alloc.c:4089
  __alloc_frozen_pages_noprof+0x254/0x120c mm/page_alloc.c:6001
  alloc_pages_mpol+0x1e4/0x444 mm/mempolicy.c:2428
  alloc_frozen_pages_noprof+0xe0/0x210 mm/mempolicy.c:2499
  alloc_slab_page mm/slub.c:3106 [inline]
  allocate_slab+0xc0/0x48c mm/slub.c:3280
  new_slab mm/slub.c:3334 [inline]
  ___slab_alloc+0xc4c/0x13d4 mm/slub.c:4717
  __slab_alloc+0x3c/0x6c mm/slub.c:4840
  __slab_alloc_node mm/slub.c:4916 [inline]
  slab_alloc_node mm/slub.c:5338 [inline]
  __do_kmalloc_node mm/slub.c:5711 [inline]
  __kvmalloc_node_noprof+0x5dc/0x7d0 mm/slub.c:7204
  seq_buf_alloc fs/seq_file.c:38 [inline]
  seq_read_iter+0x510/0xd08 fs/seq_file.c:254
  proc_reg_read_iter+0x174/0x2a0 fs/proc/inode.c:299
  new_sync_read fs/read_write.c:491 [inline]
  vfs_read+0x580/0xac8 fs/read_write.c:572
  ksys_read+0x128/0x220 fs/read_write.c:715
  __do_sys_read fs/read_write.c:724 [inline]
  __se_sys_read fs/read_write.c:722 [inline]
  __arm64_sys_read+0x7c/0x90 fs/read_write.c:722
  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
  invoke_syscall+0xa4/0x25c arch/arm64/kernel/syscall.c:49
  el0_svc_common+0x13c/0x250 arch/arm64/kernel/syscall.c:132
page last free pid 18319 tgid 17452 stack trace:
  reset_page_owner include/linux/page_owner.h:25 [inline]
  __free_pages_prepare mm/page_alloc.c:1483 [inline]
  __free_frozen_pages+0x1274/0x1798 mm/page_alloc.c:3064
  free_frozen_pages+0x14/0x20 mm/page_alloc.c:3114
  free_large_kmalloc+0xc0/0x154 mm/slub.c:6867
  kfree+0x338/0x548 mm/slub.c:6935
  kvfree+0x30/0x40 mm/slub.c:7247
  seq_release+0x58/0x7c fs/seq_file.c:368
  proc_seq_release+0x9c/0xbc fs/proc/generic.c:623
  close_pdeo+0x1b0/0x340 fs/proc/inode.c:242
  proc_reg_release+0x144/0x174 fs/proc/inode.c:547
  __fput+0x340/0x754 fs/file_table.c:495
  fput_close_sync+0x110/0x2c0 fs/file_table.c:600
  __do_sys_close fs/open.c:1591 [inline]
  __se_sys_close fs/open.c:1576 [inline]
  __arm64_sys_close+0x7c/0x118 fs/open.c:1576
  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
  invoke_syscall+0xa4/0x25c arch/arm64/kernel/syscall.c:49
  el0_svc_common+0x13c/0x250 arch/arm64/kernel/syscall.c:132
  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:151
  el0_svc+0x5c/0x1dc arch/arm64/kernel/entry-common.c:749

Memory state around the buggy address:
 ffff000810393f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff000810393f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff000810394000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff000810394080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff000810394100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

