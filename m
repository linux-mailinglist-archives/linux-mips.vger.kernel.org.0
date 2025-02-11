Return-Path: <linux-mips+bounces-7737-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66EA31452
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 19:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BAE3A0752
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 18:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94ED1253B43;
	Tue, 11 Feb 2025 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ICIs+km"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434681D7989
	for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299553; cv=none; b=R8eLSIB7UeM9SeTSq6O6iZCyGOIC62a+uMAEX/uo1KK/WnKtdIEiYODZ2IGDwsoR64aXLSjw0+RFWqdWjYWLEdHRdCdyTg1uQG7RDFddufPF179cLu2uvjgUObXrre3UPQTv06F2UT26OIQpAL+Fm0gV0gkmwrflJkrjZDWFZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299553; c=relaxed/simple;
	bh=iypHFQvapErVvgNM+puH+9um03GI3lSJujH4j3iqa9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJObggDwlhO5CHJWf6ZR/GTzAMRku5/P4zMybqX76yB4x31nn2BlGvRWFKxuRTgfFyjFcW6bh+TNwsPiR44T91513p1Z142BiuYaHkhDM4Vc+oi/AhVSV1gNVPG+gKsAlBIr/bq1rdXI+E39GneduKetFnHvbSWlH0tdHMhKtjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ICIs+km; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d05815e89dso9795ab.1
        for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 10:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739299549; x=1739904349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iypHFQvapErVvgNM+puH+9um03GI3lSJujH4j3iqa9M=;
        b=0ICIs+kmnIecDV+dG6CY3G+Vpmo58tDkS0ufk7XvEIWLuvv7JLozzegsJ99adZ/rAi
         20wbMI+QdXp5ieIftYhFZJz42H/DLJJC9nEmLSvbXlncw5RzwM39N3JLyijoU1a+llD6
         0YH+Zqru9DQXWW0Q/LRiijvOiIneaiE7KLTfaAq4cWSZjA8ZIdo1B5rXRFWSZh7beGUf
         FsbTMROjhGiV3iZ7GI800o8hzNtTkOKVkl8ff/vHUHRUYfqLM5qAvuSoYBDldu4YICLO
         l3xMu556wHdGRlOh+1J0rB8e3XzRxMVq5GzRehmu9qJD77OsqtDxRpedKlz4SdwVWSm5
         I4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299549; x=1739904349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iypHFQvapErVvgNM+puH+9um03GI3lSJujH4j3iqa9M=;
        b=MzBgf96sHsYmBRFROQ0I4qk/5wDDzx2NsMsK/Trd7h3mVWR6tVQcSYxzFQKwJnhU89
         L4S5uAz6aiwgTjpnTqHP15rWJtse+ctPZXR3GQWHDIMuALkQ/6+3gctPVkvPnPeuvaxf
         CIpXpj6WUSgqtnEOSttvVk5a0CjTlbDjoAMZLpazSv+bMgAGTXsAgnpCHA8ceYKr+9gZ
         zZp7Mnr1x6SlXFGeD2DokyNjuRMnHGNHrm57uIQEKekNHwU84e9xZujhivTwbped8mki
         4nyXqVjPlGQ5dospiZdfUtBhGmoNTJV+YIZIfxmA/YjavKMIvBZEl54Sz1MAkL5iifvT
         fSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2Y9VCMt6wDgZ9Un++1obdViH835/d6GqqPbFRf0Ada4mlHcPSOJmRGre/X1qKYGsf5i+tY5fpz93@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5xTKaHZUW53mPDYpk6gmkbwBoYagrwLAr4SAdAppd4guknMr
	OpdUc5qOT4sA0TtSu6WoCfeXZPEnozwgMXhUF0rKMSXwjq3aECZypSm4cDAWjPN47fwbbd8+PK4
	6XKjXgXW6Nrjxa11dPJtr6D6D3Q4Ilwxu6Nta
X-Gm-Gg: ASbGncufkFxgWEkZe/utWdj4PFBVMADwRc5RW2Ygq/WwnPtiakHUHI3jN8C4Kp1i4tV
	uW5H2k99qmGztYdXYH8zwhHjQoUE0ZGHxOkookfeTROMrxEar637Iz4uwFRsh0l5DpDWzMGgbl3
	MpAsItEZ3PY9qY/n1x5VzZ/2OF
X-Google-Smtp-Source: AGHT+IHqX3vr00VskyAmXO8pPWLaM+ymT5Q0Notk3eM864X6DrnAlyqB2GWGar0qHREmdunm54q6ghSQTM4GDELbVQ4=
X-Received: by 2002:a05:6e02:17cb:b0:3a7:e3b3:2e3 with SMTP id
 e9e14a558f8ab-3d171e154dcmr3944225ab.17.1739299548993; Tue, 11 Feb 2025
 10:45:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210165108.95894-1-irogers@google.com> <20250210165108.95894-6-irogers@google.com>
 <d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com> <CAP-5=fUi4RYebxCGYZVHVEt0BpWVmUA6+-vDQfbai25_KJRs7A@mail.gmail.com>
 <0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
In-Reply-To: <0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 11 Feb 2025 10:45:37 -0800
X-Gm-Features: AWEUYZmLh2xLEkqSk7Km_nwXZM8Hrzxp2BxzKEHyN48kgEtbMNsw6rc4K0YX_9w
Message-ID: <CAP-5=fULk0L4H23E_j2qktmLRJD8_iuLf=_UWK+pghSO+_eMGg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
To: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 9:53=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Feb 11, 2025, at 18:24, Ian Rogers wrote:
> > On Tue, Feb 11, 2025 at 12:09=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >> On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:
> >> > "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfile=
"
> >> > common,64,renameat,rlimit,memfd_secret EM_AARCH64
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) ||
> >> > defined(__aarch64__)
> >>
> >> Hardcoding the set of ABIs in the middle of the script seems
> >> too fragile to me, I'm worried that these get out of sync quickly.
> >
> > I agree, again this is carrying forward a behavior and at least after
> > these changes the location is just one place. Do you have any
> > suggestions on how to do better?
>
> Not sure, but I have some patches that I was planning to send
> that puts these into arch/*/kernel/Makefile.syscalls for all
> architectures in a consistent way. Ideally we'd use the same
> Makefile contents for tools/perf in order to trivially sync
> them, but I'm also happy to hear other suggestions.
>
> Your patches are currently ahead of mine, so I don't want to
> hold you up.
>
> > Fwiw, I wonder a related problem/question that has come up primarily
> > with Arnaldo and Howard is in having a way to determine system call
> > argument types so that perf trace can pretty print them. For example,
> > if via BTF it is found an argument is a "const char*" then it is
> > assumed to be a string, but a "char *" is not as it may just be an out
> > argument. There's a source for more information in the syzkaller
> > project:
> > https://github.com/google/syzkaller/blob/master/sys/linux/sys.txt
> > Perhaps there's a way to generate this information from the Linux
> > build and feed it into perf's build. It is out-of-scope for what I'm
> > trying to do here, but I thought it worth a mention given my general
> > ignorance on wider things.
>
> Yes, this is also something I've been trying to work on. In particular
> the calling conventions for 64-bit register arguments on 32-bit
> targets need some help. My plan for this is to have a consistent
> mapping of internal (sys_foo()) function names to argument lists,
> instead of having some calls that are slightly different depending
> on the architecture or ABI.
>
> This should be in a machine-readable format so it can be parsed
> not only by perf but also any other project that needs a list
> (libc, gdb, qemu, strace, rust, ...)

Awesome, thanks for working on this!

> >> > +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> >> > +EOF
> >> > +build_tables
> >> > "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfile=
"
> >> > common,64,n64 EM_MIPS
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> >>
> >> What about n32/o32? The syscall tables are completely different here.
> >
> > So perf hasn't historically supported them and no one is asking for
> > support. Generating more tables isn't the problem, but we need to have
> > some way of determining which table to use for n32/o32. I see
> > EF_MIPS_ABI_O32 and EF_MIPS_ABI_O64, so we could add support by
> > extending the lookup of the table to be both of e_machine and e_flags.
> > I'm less clear on choosing n32. That said, back in the 90s I was
> > working to port MIPS code to Itanium via binary translation. Given now
> > Itanium is obsolete, I'm not sure it is worth adding complexity for
> > the sake of MIPS. I'm happy to do what others feel is best here, but
> > my default position is just to carry what the existing behavior is
> > forward.
>
> I think the way it actually works on mips is that all syscalls are
> allowed in any task and the actual number identifies both the
> ABI and the syscall. In some variant, the same is true on arm
> (oabi/eabi) and x86-64 (64/x32), but oabi and x32 are both too
> obsolete to put much work into them.
>
> There is still some interest in mips, maybe you can poke the
> maintainers and see if someone is willing to help out since you
> have done the bulk of the work already.

Thanks, adding linux-mips@vger.kernel.org. Here is the original
feedback for them for context:
https://lore.kernel.org/lkml/07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastm=
ail.com/

> >> > +EOF
> >> > +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl"
> >> > "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> >>
> >> This skips the 32-bit table, though I think that one is already
> >> planned to be discontinued in the future.
> >
> > Thankfully we have awesome s390 devs on the mailing list, hopefully
> > they'll shout out if I'm doing things wrong.
>
> I also remembered that I had a patch to bring the s390 syscall.tbl
> into the same format as the others, since the behavior is currently
> a bit different for compat calls. I think there is also a chance
> that they want to discontinue 32-bit mode entirely, given that
> the last 32-bit machine was discontinued over 20 years ago, and
> support for native 32-bit kernels got removed 10 years ago
> after Debian 8 moved to 64 bit.
>
> If they are confident that there are no more remaining users that
> rely on 32-bit binaries, we could both save some work.
>
> >> > +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_6=
4__)
> >> > +EOF
> >> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tb=
l"
> >> > "$outfile" common,32,i386 EM_386
> >> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tb=
l"
> >> > "$outfile" common,64 EM_X86_64
> >> > +cat >> "$outfile" <<EOF
> >> > +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) ||
> >> > defined(__x86_64__)
> >>
> >> This misses the x32 table.
> >
> > Again I'm carrying forward a behavior. Would it be worth adding x32?
>
> I would probably document it in the file as an intentional
> omission, same as for arm oabi

Ack.

> > That said there is likely other context
> > that I'm unaware of as I'm surprised x32 still exists.
>
> There are a handful of people still testing it, and some still
> using it, but I agree it completely failed to get enough
> traction to be worth maintaining.
>
> I view x32 (and the corresponding arm64 ilp32 mode that never
> made it in) mostly as an exercise in benchmark(et)ing, since
> it showed noticeably higher results in some versions of specint
> and some compiler workloads, compared to both normal 32-bit and
> 64-bit modes. The time that we already wasted on maintaining
> it must have long surpassed any such benefits though, so I
> certainly don't want to waste more time on it.

:-) I ate part of a cake intended as a goodwill gesture toward getting
x32 into Android.

Thanks,
Ian

