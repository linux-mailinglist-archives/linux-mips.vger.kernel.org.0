Return-Path: <linux-mips+bounces-7498-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3BA14E65
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2025 12:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A083A8302
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2025 11:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29741FECA6;
	Fri, 17 Jan 2025 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPorRLND"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2A1FC7F0
	for <linux-mips@vger.kernel.org>; Fri, 17 Jan 2025 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737113024; cv=none; b=P1JnRmxpXjHZCJ5eWQZ/FnLEeu9FQfMJAZPTeBpMJQfGKG29m+l3A5ghxq6X+xzWLnoSkQYXgWb5AlaQpM+sI16A26/0ouNwaYRz8SeV7mpGyGA8Zp/dCGnInfYBV2GGPGS3RKc0Xp9SU8GnqlgFU9h00VYzFAFN8t84qJCXWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737113024; c=relaxed/simple;
	bh=0MfAagGyPmBC90JAAVPekQyRC26SLFPBltnUGhYKIEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fe3nxHqtS4EKD5tKTKgQFFfRw6X4wnede25cxP7I0Ibtwl22XgbCwynYKa+Pfwuxa+gfirSAEmb6ANDRDNIO+JVfU9DrjN5PBS0i1qM9Y73fTqijC14BElJvmJFR4/V+OG/LRcmLqhi1qoecqAK6Nz3pn8X9FzGQkLw6Iv4re68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPorRLND; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467896541e1so208311cf.0
        for <linux-mips@vger.kernel.org>; Fri, 17 Jan 2025 03:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737113021; x=1737717821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FIGX2U5Y620ytLuHZv9C2YKRXU6LkFVVh5lOzeeXil4=;
        b=PPorRLNDV4AQ8MwiqGru7nqq+V+H31WOvwoUgITsCd2kWqUJXQ0yhvhLdOXY3jfgdF
         kETx2BTwW1SrvyNs7aMKDcPh46hEYuh5pnW244DN+cgalqppCtqW9PT0LC1W+QxhOxKx
         wxdp9Wrw9hFlF2qqvRkZd+n+iIcj1M7gaV74qABa+iFHX6R0UklI/TNVU/cfq9IfCDgw
         R10IA7qqGnPlp7ySFSWytN+wNZX1iv50lOGLAQrK/1DZGVuVUOGRbSwrtFAH2dAer5jT
         h71ju9UbgO4pg4KHLkbvEdA1Br7PcZVKcBZSvZyJs1f8UMptW8QFmgjCjegxSvlO9U/r
         Tc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737113021; x=1737717821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIGX2U5Y620ytLuHZv9C2YKRXU6LkFVVh5lOzeeXil4=;
        b=gtfLvlexhaNokYdZEFy+1/wX6bRxvI35xGytzF1HZY4Tr5n6qf6hkA/x9N/BZbWlsG
         T2pSIPGhOvC4giVEsZyjcnG5wXDSJqlkgEbL5hlHHAjyrFr/YDVilZAYu8BY0Du9/UW4
         GHn18KpSr5YlPqwHRnc9LN/iGDx1hAsupw3J/5PS7/KpQnJ+hFntoLblkCB5AX6MwcX2
         ZfVVzD9mxV44+uWAI1G/iK2hO1ovCDGHeg1pbVwjNuQbAQGPHjh1JqYsK/mOBmzWT7+B
         aUISMfMRcErvd8QK4B9faL1df/5BF10zIOuOPc9h3G5+SLtVmFk5ntRKpYAUzm9XxqCX
         +h1A==
X-Forwarded-Encrypted: i=1; AJvYcCU+BmId2C4vD3UlQICFfvKSpI9nuVDLDC0aQbzipeGPbXTwrOJ6woeQBBN2zgpxK4IwMWWLx/xCBG3+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XOozbQfHuGViTFfEDflwNMtu/tgkYiVQievfAx55NEfHVGjO
	jpKWdQAXlvyCTfYYJEtuKfvPpJyo8sMrGpl8AXiLVF1CExbOA7fyKQTYCKJzv+Z+1/H6FMUSfBo
	FJtd4l7KaEbKR8mtzbsC5wGNQr/swUUwf3FCm
X-Gm-Gg: ASbGncuu+xz4fDLkgT2MWO1NGWY5Ot0GDjRM/kq429OjZ3gHbkPfAkPO+4RWYa+9Eaw
	zs3OudpPMy6Nup/Xw0Qu91K/M5NB5EwzfiGrjdoh1qkmi59vHfgqV7KMENmUDOa/NEGBN
X-Google-Smtp-Source: AGHT+IGncYyjy1GhHnzrsXOo74WzCLmIKZegqTWM730ikUDOlazbTaQH35QB0zgmvzL1yJ283cNPWINqKuKsZStNP0A=
X-Received: by 2002:a05:622a:1997:b0:466:923f:a749 with SMTP id
 d75a77b69052e-46e130af265mr2539121cf.15.1737113021050; Fri, 17 Jan 2025
 03:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com> <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
In-Reply-To: <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 17 Jan 2025 12:23:30 +0100
X-Gm-Features: AbW1kvZ_KaymUoc5jGYX-groCnX_p-Tg9PrSiJ2rBOnB_iSLYbhJZulsHf6-rd0
Message-ID: <CA+i-1C1JKEd43vtyGO6RLCQQA8qVCvALjm+q1oVTGMLtjo64iw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 16/29] mm: asi: Map kernel text and static data as nonsensitive
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 19:41, Brendan Jackman <jackmanb@google.com> wrote:
> +       asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd, VMEMMAP_START);
> +       asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
> +                     VMEMMAP_START + (1UL << PGDIR_SHIFT));

There's a bug here that Yosry has fixed in our internal version, I
neglected to incorporate that here.

Under KASLR, vmemmap is not necessarily exactly 2 PGDs like this is
assuming. In fact it can share a PGD entry with the vmalloc area. So
to be correct this cloning logic needs to actually look at the
alignment and then navigate the page table hierarchy appropriately.

To be fixed for the next version.

As Yosry noted internally we also need to think about vmmemap getting
updated under memory hotplug.

