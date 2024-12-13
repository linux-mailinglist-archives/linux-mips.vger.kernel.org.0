Return-Path: <linux-mips+bounces-6997-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090049F0345
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 04:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3931884CE9
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 03:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02E815B10D;
	Fri, 13 Dec 2024 03:52:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.wilcox-tech.com (mail.wilcox-tech.com [45.32.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7287DA62
	for <linux-mips@vger.kernel.org>; Fri, 13 Dec 2024 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.32.83.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734061940; cv=none; b=UrZYBYIIxpF10w9l5Fml7OS8NNznJV206/QK7URSYeSNnDoAcJPJEn8xoSJstuAJGpEzsCU0lUg7Cr0I5VxBkl5/5KokbAdvovqeHdCz2ZMS/B/h8PRu6aQB5C6gRw+EQBzQRG6rdWJH6wrgbTMj/8iprl1bQbChMOsRRLvQzwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734061940; c=relaxed/simple;
	bh=zTn3PxlxF5bcug/5oevEdlwocu+z7R8NRL4NpTujYK8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LfTw/tUvD6h9vuPiiLk/SDuI4MYUmwnC57cPmvahpdXqhjkwdHZosjhXV2Y3EjtcY9uTqvF4P/U6myGf7Q5gabMeH5xEAczpkXKVDAK0IIOUoqPmJ66HQwZUc5rblFB0fd3x8ltIxDdd+MlhNxEItr9oRLEiXAlsVPLpN0qjT98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com; spf=pass smtp.mailfrom=Wilcox-Tech.com; arc=none smtp.client-ip=45.32.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Wilcox-Tech.com
Received: (qmail 15664 invoked from network); 13 Dec 2024 03:51:32 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 13 Dec 2024 03:51:32 -0000
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <20241212125516.467123-1-arnd@kernel.org>
Date: Thu, 12 Dec 2024 21:51:26 -0600
Cc: kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>,
 Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)

On Dec 12, 2024, at 6:55=E2=80=AFAM, Arnd Bergmann <arnd@kernel.org> =
wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> I submitted a patch to remove KVM support for x86-32 hosts earlier
> this month, but there were still concerns that this might be useful =
for
> testing 32-bit host in general, as that remains supported on three =
other
> architectures. I have gone through those three now and prepared =
similar
> patches, as all of them seem to be equally obsolete.
>=20
> Support for 32-bit KVM host on Arm hardware was dropped back in 2020
> because of lack of users, despite Cortex-A7/A15/A17 based SoCs being
> much more widely deployed than the other virtualization capable 32-bit
> CPUs (Intel Core Duo/Silverthorne, PowerPC e300/e500/e600, MIPS P5600)
> combined.


I do use 32-bit KVM on a Core Duo =E2=80=9CYonah=E2=80=9D and a Power =
Mac G4 (MDD), for
purposes of bisecting kernel issues without having to reboot the host
machine (when it can be duplicated in a KVM environment).

I suppose it would still be possible to run the hosts on 6.12 LTS for
some time with newer guests, but it would be unfortunate.

Best,
-arw


>=20
> It probably makes sense to drop all of these at the same time, =
provided
> there are no actual users remaining (not counting regression testing
> that developers might be doing). Please let me know if you are still
> using any of these machines, or think there needs to be deprecation
> phase first.
>=20
>      Arnd

--
Anna Wilcox (she/her)
SW Engineering: C++/Rust, DevOps, POSIX, Py/Ruby
Wilcox Technologies Inc.  |  Ad=C3=A9lie Linux=

