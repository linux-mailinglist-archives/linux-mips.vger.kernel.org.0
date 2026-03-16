Return-Path: <linux-mips+bounces-13708-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NMrCESRuGkUgAEAu9opvQ
	(envelope-from <linux-mips+bounces-13708-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 00:24:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A142A1EDD
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 00:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4863019F00
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 23:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F32A379EC6;
	Mon, 16 Mar 2026 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eZ2/MpmH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06961376468
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 23:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703398; cv=pass; b=Y6DID+Z1dPPjzbQTePM3JE3Q/QwPckaw7sEIG0RS2FFaurJ1HhpRrT17x6dGqagnAWXXtfL+K+GFjY6OVvbKnvcK+XSB2L7NYGonck7ciaRyk7ZOKD47eHytqNGt1FdBQHwMjgnRfOt3T0jgGwZLrXAzp/JZfQKvjX3+SeEJK3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703398; c=relaxed/simple;
	bh=XTOZYOCHUctLkYMS5qNPCkNocPEUYtAP2iODWNe7Wt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/QX0kU12U++MGM/3kr+kpy07J/+hshOOVmtEkOc7t7+yDfr8ZtQ3av7jOx50t717oyyKEJbJGJCCxdZA9Dhuy4yi7rrPT1I1iB0gEtytcGIrrQoDGxUOF4fwHR9PNpIxiByDM7lf0tTvXCkou/MuDapTaQ+STIXHp/rCrxzNBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eZ2/MpmH; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae3a2f6007so41327695ad.2
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 16:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773703396; cv=none;
        d=google.com; s=arc-20240605;
        b=NI1DvZhCy0Og5ytUxFffi96ITFlqKb8DZi+tcSsIkbxx9gwcUdSsePQrkyBTfj1QaE
         AJC+F2A/uO9wsEjxRnAcLNh3C5PVVbzs4QebCCWirtZth74hGiNsyaZqk+tfA+nrHP42
         P2MkMmUevMQH52m1shyYwgQA7IoM8MpL4dQ2maUBZucRXgM9SW6jvH+l5QUlZXPd7f4X
         Gl6dgZ+yT2CeGlSIDGkVtF7mLCmQWBtJBXL3absZnqfjvZNeh9U8z35e06sST3W7/8iO
         eVz2C33pGfYa7gNHwQv0aVNgzSudFacZUrjKtu5Awbd25fknh3o1jqec8UHk0rQAU93V
         659A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        fh=wUd/Uk3Z3DL6n3+BU8Fzhm8gshNYq6IjesbLj7/lXUs=;
        b=PXzq6baXVgGg+hKH3kD6phG+zrvmyQJQuTDkJnUdl19z4jwdAURvgJxfhx9t9EUmRJ
         2NflngTptUxkzVz/cjDZbTcQnxmtfrdB0k+3VczSZ+2Bl3S5K4NwzaSVrEn87Y21cn6i
         wrYzhWuWUDUFYvVECe6LGUiUUazmnWm5MTpbvrrl+XrqkFiSQsSD2hw2d2t6W/pL/zi0
         XxEtkwTR6zh6CBHwbJyUe6LcX4y10/wV2yH8N+5slenv9xRS1EbrSnN5znN1JbXyB6d6
         1LoWCLDTVYMLa44WIYRWUXBTOToFag7UKU0j1NP91KRDdn6iStuVaLXJHa9PI2OWtDl5
         6HyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773703396; x=1774308196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        b=eZ2/MpmHOTbFFzLcyxFQukFAMHAT6YzxNyylE8gye2eZalHZH61rGfghB43hOFP5Xv
         i8LhnDq4eVj23kn8GYeN6ZuTHEnAtMqLvYP09F5fURs+lpwlM3ncS4FXsfjjksGdZXZV
         9yjImmUjtDqg7ttiY4suwVHEZ7MAy1KjYM+0rSeHBMpOY3NWRyv7xLZdiy2DaYBIu66y
         s01hTO2v+R0ZTDj9a4iTTP6Bb3UMZ40Y9cer+/SzSmu6By5v2qA9I/rfZuhJQM6P5IN7
         sDRDxWgE2TUkrdSS43j55tIFZuKCmHxFtrHB3fL8Z7Gg1rjgs/kYO9IDpoPQRvu7wc6e
         sW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773703396; x=1774308196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        b=ZFKdN39adgaKb5yp56nHMsSAfpF8E0RJwhf4Cndb1lBZZU6BM//VJ2fN2oj69FEsWA
         3WH1oDHiqVFBvYGToL/FvdJKk08O9mI4ifwCpThB7xrIDKbL54ww5yYp6kAcJVt13jLo
         y2HzBzklzvn1r6EDdUDLRmMaAS0szIpcoe2cgRj0+LPO0DtQF+Yu5xVNPNbzloIRd7oT
         vE4uim6vIls41N7GSaXCoFJkHoe3/FVLjp0PsJDfXbx8YW1ixuKpVSIwL2Ec6+4yeOSq
         BbwuL8aAnZm9WBEqAl59e9bT6KWdDuV04FlyqwRIN4VZPOv2cqe33pr/9NfaU45klWsQ
         gPww==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ17rb6GjWJVtp6hWlB+Ue9RbnmtzqN3puxMPND3au1YkStwwYOvd0Byleyfdgwu1ldbaluLxv/3M@vger.kernel.org
X-Gm-Message-State: AOJu0YwNogEI7TMBp5MvMsSwiaGEjcqcYn3/C8Bi5RKVPGmrcxV8K2B9
	Sp9kPb0D2flkwKgz3tZptg3JAVY5Yu6YFUV5gEG0yNoYha2LCioWwRaxi5bcRMjMIr5WLxyndZf
	djwqtj00TPQeEqWEMk+D7bwmyGbmvtr9wUrp3nJE6
X-Gm-Gg: ATEYQzxFttrv/LhgSPF53Ig3I+iyvOvU1zWYZn02uckPD7nNnAZSrhI8tG3N50l8eoE
	D2YTX7/X2mX6T3Ld5Q/03fKInax35QBCJvoLhOJkcKGpuEYAVOyQETl5r05TB+4LVddjJpsdxJw
	HbhO/LpexfbKmOcrmFuRh3B7REKg8+IF5RWR4G69NTqjZ6jLsU7OHJyoOOsWPfBJDLe18IXJs3C
	cwHvWvsRuN/OOaSe4/XUT5KycCqqayPw/q4w/kjze3uJo1M8Co6YVOe33IC44GeDq/AHS4QNowH
	0eagrQJFePKeXPjekA==
X-Received: by 2002:a17:902:ea06:b0:2b0:5c3f:c0d8 with SMTP id
 d9443c01a7336-2b05c3fc4damr40223235ad.47.1773703396327; Mon, 16 Mar 2026
 16:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773665966.git.ljs@kernel.org> <063af0422d99bee0195589aa63f8f44edaf409fa.1773665966.git.ljs@kernel.org>
In-Reply-To: <063af0422d99bee0195589aa63f8f44edaf409fa.1773665966.git.ljs@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Mar 2026 19:23:04 -0400
X-Gm-Features: AaiRm50DdYFqfixz3H6HRwMmLfdf5osoLUZfr0b1blDqz3IzGNPvd_xOI_ajOas
Message-ID: <CAHC9VhR2T8ujtfvz-HgkgSFByptTLmhbCYS+scY53aYg=sgfqw@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] mm: convert do_brk_flags() to use vma_flags_t
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[paul-moore.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[paul-moore.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13708-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[paul-moore.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 79A142A1EDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 9:09=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> In order to be able to do this, we need to change VM_DATA_DEFAULT_FLAGS a=
nd
> friends and update the architecture-specific definitions also.
>
> We then have to update some KSM logic to handle VMA flags, and introduce
> VMA_STACK_FLAGS to define the vma_flags_t equivalent of VM_STACK_FLAGS.
>
> We also introduce two helper functions for use during the time we are
> converting legacy flags to vma_flags_t values - vma_flags_to_legacy() and
> legacy_to_vma_flags().
>
> This enables us to iteratively make changes to break these changes up int=
o
> separate parts.
>
> We use these explicitly here to keep VM_STACK_FLAGS around for certain
> users which need to maintain the legacy vm_flags_t values for the time
> being.
>
> We are no longer able to rely on the simple VM_xxx being set to zero if t=
he
> feature is not enabled, so in the case of VM_DROPPABLE we introduce
> VMA_DROPPABLE as the vma_flags_t equivalent, which is set to
> EMPTY_VMA_FLAGS if the droppable flag is not available.
>
> While we're here, we make the description of do_brk_flags() into a kdoc
> comment, as it almost was already.
>
> We use vma_flags_to_legacy() to not need to update the vm_get_page_prot()
> logic as this time.
>
> Note that in create_init_stack_vma() we have to replace the BUILD_BUG_ON(=
)
> with a VM_WARN_ON_ONCE() as the tested values are no longer build time
> available.
>
> We also update mprotect_fixup() to use VMA flags where possible, though w=
e
> have to live with a little duplication between vm_flags_t and vma_flags_t
> values for the time being until further conversions are made.
>
> Finally, we update the VMA tests to reflect these changes.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  arch/arc/include/asm/page.h        |  2 +-
>  arch/arm/include/asm/page.h        |  2 +-
>  arch/arm64/include/asm/page.h      |  3 +-
>  arch/hexagon/include/asm/page.h    |  2 +-
>  arch/loongarch/include/asm/page.h  |  2 +-
>  arch/mips/include/asm/page.h       |  2 +-
>  arch/nios2/include/asm/page.h      |  2 +-
>  arch/powerpc/include/asm/page.h    |  4 +--
>  arch/powerpc/include/asm/page_32.h |  2 +-
>  arch/powerpc/include/asm/page_64.h | 12 ++++----
>  arch/riscv/include/asm/page.h      |  2 +-
>  arch/s390/include/asm/page.h       |  2 +-
>  arch/x86/include/asm/page_types.h  |  2 +-
>  arch/x86/um/asm/vm-flags.h         |  4 +--
>  include/linux/ksm.h                | 10 +++----
>  include/linux/mm.h                 | 47 ++++++++++++++++++------------
>  mm/internal.h                      |  3 ++
>  mm/ksm.c                           | 43 ++++++++++++++-------------
>  mm/mmap.c                          | 13 +++++----
>  mm/mprotect.c                      | 46 +++++++++++++++++------------
>  mm/mremap.c                        |  6 ++--
>  mm/vma.c                           | 34 +++++++++++----------
>  mm/vma.h                           | 14 +++++++--
>  mm/vma_exec.c                      |  5 ++--
>  security/selinux/hooks.c           |  4 ++-
>  tools/testing/vma/include/custom.h |  3 --
>  tools/testing/vma/include/dup.h    | 42 ++++++++++++++------------
>  tools/testing/vma/include/stubs.h  |  9 +++---
>  tools/testing/vma/tests/merge.c    |  3 +-
>  29 files changed, 186 insertions(+), 139 deletions(-)

Not that the SELinux changes are really all that significant, but they
look fine to me.

Acked-by: Paul Moore <paul@paul-moore.com> (SELinux)

--=20
paul-moore.com

