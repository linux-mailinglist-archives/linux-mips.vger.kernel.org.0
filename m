Return-Path: <linux-mips+bounces-8000-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09966A4752E
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 06:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0208A168561
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 05:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008B51F78F3;
	Thu, 27 Feb 2025 05:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IItbCHa0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7D71EFF86
	for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 05:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740633868; cv=none; b=DuILYr/kmwOqPW8R3eyVJJ1ug2fSvvuYlDOLlEKsUk/a5Pk1zeHnvnMifoI0LF21gWOcWD/3yRJyEICB7tu/AqKlGzulXyc64b+2s8cPF4GK0nIATQYDXMcdVPwN+UPzJZGYArBZxAk8WxhT8G3ADb1fS7JW7N/igF/Nl4Z64pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740633868; c=relaxed/simple;
	bh=47ds+4hGrY28VgZ3hza+Gb+h0Ld/NmG/YiG2BZEJFxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0oYrMGTCKsbjAQsZrN1OBGarhzfawt0hCDJLlduOceZQecnx1izMEuYx+mH1WJGuU6yZEyb2bShuXRoTqgQucQjpKrIZY2f12opjIYCLXBvivHgZNjRmJMXlJLmtjDggoWhD59/dXxa6F5LrDUwmx1FqUGl4XsZGV1yCMryECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IItbCHa0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-221ac1f849fso67605ad.1
        for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 21:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740633867; x=1741238667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=;
        b=IItbCHa0uyx5fe4QzAMSNnHwSUfyk0nHp5n7jzYH6dClTko0A6V99uKRKYSs1dFR1t
         kEVBj9nNc8RJp4tMozfscA7F1mKNRs9acnvu1yZPR8GNwqJX0vF97m4EdjP8XFqOCljp
         HLORO3UYbBwQRpQIm57gtSISevHLrn79EF2TmhF7gmoUpwlaWpMQxT0++VzBG0qIpLoZ
         UxuFIqqM+bJe0uhAnfZCk4K6UUmDnZhD4nazM7rPKv/s14GvVblAYLnSs/9YwF47u+Qz
         D1lnsuUob66wr+BiY/ftAoDEokEE8g4W+rISMyKDL3jHdp7mlABQ+X+HIyT456XUxSOK
         WB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740633867; x=1741238667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnEz81f237FPFDdRQFlVRCVwc99gvba5x2QOCkc+RR0=;
        b=cQwQpTjW41ZOuUbl3Oo26891/PeeDrdLN7HhQhp3NCjLn3cpN7jPofy9iEJr6TTMtR
         2ptmsNAaFarNro4R0WSB+RU0sosFL2yaXztqfSXx373djItWzJy1g5adqVTfeh1sUDKX
         pxitudWAWgXWTlHDypEcEMPS5w/rE+DWRncY/YlVBX1TqrRmbBviCM+Zfs7IOzqutE6V
         Y660snp3SBoDuBKYeVm/SBUwuP1M65RvMPkPAhd8PBHqinyDVBM568CIRJX5qGPTrjYC
         Z6z+fNzdlS96ePmgsJtkE4amnJFoFxt/RHGrDG62YkKRiAeZaYu/Eem0NnjG3bk4Ezvm
         JQmw==
X-Forwarded-Encrypted: i=1; AJvYcCUCL8L2Zu7sPM1nnUCV8u18ae1w4EWx3wgKZe8CcnbNk3lhvFUObQSPCHiczXVIkdLZ/8DAi0kqUSO1@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjgDQVa6ZL7HCy4FyvxU0DkxpfuXsIdi7DWKVPdUSYf4TwJnf
	+bDzS7LpoLp1qPJ2CfqZIyAwBj+cocIbXqbfz31i5hGQS4+sb9XJaXnz+sIqaGkLSxPHLxZ2U+6
	4YlM2wXd67RP/uo3hzhs0QNuufJgsz+ijgmly
X-Gm-Gg: ASbGncvlwf1unnlzJZwjfT4uZIYlEb95w5+65SvaEKA0GLmBCH9RmjFEXhDpLbJiyZ4
	g9EAyMOIydArti3C8W9S5s6FWVXaFfDqKaMKE48rJS9PPmdllDd1XU6gsQRfalQVv85zp1PNRZR
	znRx/pSfRX
X-Google-Smtp-Source: AGHT+IESGHDEUIPVrjNTh39ynN60aQSgX7N+PvnUqhcTHIKp7IZB5bqsgXo3vv32FxrjQl6qmhQtj7bSXHofxTNEMow=
X-Received: by 2002:a17:902:f7cc:b0:200:97b5:dc2b with SMTP id
 d9443c01a7336-223517240a4mr1111615ad.15.1740633866391; Wed, 26 Feb 2025
 21:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com> <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com> <Z7-rN8iGUpPe6b-1@google.com>
In-Reply-To: <Z7-rN8iGUpPe6b-1@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 26 Feb 2025 21:24:15 -0800
X-Gm-Features: AQ5f1JpYoEre35TWzYAHXMZBSPsriPeINrD-jPxutBzlTEFdOvLRV6EZPh8_ULw
Message-ID: <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the build
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:00=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Mon, Feb 24, 2025 at 08:22:50PM -0800, Ian Rogers wrote:
> > On Mon, Feb 24, 2025 at 7:20=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > >
> > > On Wed, Feb 19, 2025 at 10:56:49AM -0800, Ian Rogers wrote:
> > > > This work builds on the clean up of system call tables and removal =
of
> > > > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > > >
> > > > The system call table in perf trace is used to map system call numb=
ers
> > > > to names and vice versa. Prior to these changes, a single table
> > > > matching the perf binary's build was present. The table would be
> > > > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > > > perf, the names and numbers wouldn't match.
> > > >
> > > > Change the build so that a single system call file is built and the
> > > > potentially multiple tables are identifiable from the ELF machine t=
ype
> > > > of the process being examined. To determine the ELF machine type, t=
he
> > > > executable's header is read from /proc/pid/exe with fallbacks to us=
ing
> > > > the perf's binary type when unknown.
> > >
> > > Hmm.. then this is limited to live mode and potentially detect wrong
> > > machine type if it reads an old data, right?
> > >
> > > Also IIUC fallback to the perf binary means it cannot use cross-machi=
ne
> > > table.  For example, it cannot process data from ARM64 on x86, no?  I=
t
> > > seems it should use perf_env.arch.
> >
> > The perf env arch is kind of horrid. On x86 it has the value x86 and
> > then there is an extra 64bit flag, who knows how x32 should be encoded
> > - but we barely support x32 as-is. I'd rather we added a new feature
> > for the e_machine/e_flags of the executable and worked with those, but
> > it is kind of weird with doing system wide mode. I didn't want to drag
> > that into this patch series anyway as there is already enough here.
>
> Right, I don't know how to handle x32 properly.  Maybe we can just
> ignore it for now.
>
> But anyway looking at /proc/PID for recorded data doesn't seem correct.
> Can you please add a flag to do that only from trace__run() and just use
> EM_HOST for trace__replay()?

So I was hoping at some later point the e_machine on the thread could
be populated from the data file - hence the accessor being on thread
and not part of the trace code. We could add a global flag to thread
to disable the reading from /proc but we do similar reading in
machine.c for /proc/version, /proc/kallsyms, /proc/modules, etc. I
think the chance a pid is recycled and the process has a different
e_machine are remote enough that it is similar in nature. Adding the
flag means we need to go and fix up all uses, we only need to set the
flag in builtin-trace.c currently, but we've been historically bad at
setting these globals and bugs creep in. I also don't think
record/replay is working well and I didn't want the syscalltbl cleanup
to turn into a perf trace record/replay fixing exercise.

Thanks,
Ian

> Later, we may need to add a misc flag or so to PERF_RECORD_FORK (and
> PERF_RECORD_COMM with MISC_COMM_EXEC) to indicate non-standard ABI for a
> new thread.  But it's not clear how to make it arch-independent.
>
> >
> > > One more concern is BPF.  The BPF should know about the ABI of the
> > > current process so that it can augment the syscall arguments correctl=
y.
> > > Currently it only checks the syscall number but it can be different o=
n
> > > 32-bit and 64-bit.
> >
> > That's right. This change is trying to clean up
> > tools/perf/util/syscalltbl.c and the perf trace usage. I didn't go as
> > far as making BPF programs pair system call number with e_machine and
> > e_flags, there is enough here and the behavior after these patches
> > matches the behavior before - that is to assume the system call ABI
> > matches that of the perf binary.
>
> Right, the next step would be adding a BPF kfunc to identify the current
> ABI.
>
> Thanks,
> Namhyung
>

