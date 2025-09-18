Return-Path: <linux-mips+bounces-10655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3525B3863A
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F341C20F03
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A42C2773FE;
	Wed, 27 Aug 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SSFbhUaY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC01277803
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756307748; cv=none; b=IIUJz/ttVBPW/eVahqQpIDrtGAGRL0Y2NJzcNsie3lprgez0FIMCOJJwkxbRyjxUCXqhPYHEy917AH1b+8CONASB9IFsdwWf4RmYau8sgrlzDotDrNxRanzfE2QzUqc88t9514LWaYLUqxxAG10/iUW4UJmGklz9q2RW1UAJr04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756307748; c=relaxed/simple;
	bh=PgEPxKHnOwEJrisDshuEuJU9SWQbfG1NSTYMYsAtWZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlFvxRviVMtBxzpRZrkLqKV6nTx/2i20gCAvkol1Uh/wShKShB0H8dDgegyF5PsxGxx/eitKFWpLUd47It/kvN1NyJyxqfWtoMkUzo5VCJSDWvRif3eellJ1mrqVZiiiAzVzaRIbG+OZSu3jTVg4NAZ1FQn/91tljuJbkD0ySBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SSFbhUaY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-248681b5892so229185ad.0
        for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756307744; x=1756912544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=SSFbhUaYSdGFBbG5CfGErl8PBJrdJ0XQ6Ofi8i4VHffvxMFqpxvd+tBC70A4/nMPRf
         ybU1ppZn3tbfrOKYfvpliGhWaHEjfd5gmSxVQ/LbuKHpjRkSVK/4QDjzT58X9EiCYNwA
         VD20oxfdWFrKFhsWdsiCSaeb4dGSHE6WYM7wX1tKv/9tXSTFRPgl7S0bV6soxF8q1uLR
         qxqz6E2uiRoLyV2iMsgCO9EDPozzvbWTmTIFD9Mqi0RfocbBhhawnxcyQPOk098SvjNw
         4KYeQe65GchDlKYvnMaty9HoninLLGNTawIlgfvoFCkk4VwTfWXkTNirqjX14LEt8qKn
         OHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307744; x=1756912544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=HPZSHXqEGxIr5jWRjfsdesuYSpkW20jT/3R8G37YP0ZPVW/qYxnxHyaOc4T5C1ucdI
         bMMFxXSnkm3ZGexmD1ykTkBLqL9TCEYYPaICZyz4LgjYvUczoWsCRW4kGWD8lfWaD5vZ
         XSHoO3OzNjMW+cHh/asLfl7JzXhThnGCooRhOT40T1KFm4AmCGTfZXyssxra8JobTzCL
         iV4XiNQFFIEkgzh/yDdrjoSMYN5XcMeCfK2zmLPX8WHJ1dx+uaKErFyDk3a4gLSBTtW7
         GRzJfYLvLWT4HMRL22it/UgG9LMvERU9Jvw7iQ5hkzx6I5o6Exgw1R/CCfTmH/EosxFA
         grZg==
X-Forwarded-Encrypted: i=1; AJvYcCX/y4sGM0/N3kiLfVIyZr+OHHAiKE/IGcEaE514eDVWOa+5fKp5EQMzfVjoSwZtdCu0trbAbi3gxW71@vger.kernel.org
X-Gm-Message-State: AOJu0YzMf7JLx430b/Wk11eoDy8OL61YCDgQpTWDR1sf8GIaAYNg9QYb
	5ZtoXaHLeo2jwRJLNwF/kcz8av2mgrcJuFY0NFgjhYuJve8RlKr+xBB94LX3rbVkbTorEnfts92
	StESGvgPx2JsgseU/xBRrZcPK0no5x8FO18QCwsnS
X-Gm-Gg: ASbGncsWnLOirlv/zbvYiVLd2MpPfjHn346Kbtey4YMO+MOKhg/adIx1iYJzRkf/DlC
	SkO9rvpMUStEY7mkUXJeSaSTIzTsBMamAvBHYsGQ+c5ukAmB7lr691ZlSvjrjgLbDDIxE1rlStP
	37VGIbvObuXtau+Lir31fACMPIrmdFZmKq6R6cdoxTV53inOJaj078DAxMt0OiPXT7kiMenWoQB
	kVCdzDFjCHwfvTHWgtg2TfbJsbnhx62Lh5xzAu+NCs=
X-Google-Smtp-Source: AGHT+IExi0QgPJP/5AblrVahQdACSVklatzIIhzDoM8PROF9H/mRXxhxpv9GhjknP28Wz6ljzGsei6gbP7f3oTXJLVM=
X-Received: by 2002:a17:902:ec87:b0:246:a8ac:1a36 with SMTP id
 d9443c01a7336-2485ba5311amr9397575ad.2.1756307741849; Wed, 27 Aug 2025
 08:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com> <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
 <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
In-Reply-To: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
From: Ian Rogers <irogers@google.com>
Date: Wed, 27 Aug 2025 08:15:29 -0700
X-Gm-Features: Ac12FXwUZ4TrRSXyzgr8XTQRkesJ87wwMtoKHvx086ZRlV4GbvgOq2WSyedNfZ4
Message-ID: <CAP-5=fU0-QDMP-VG3O1qBvJ8uzHHYCQ8j1Vrzy9a0YUk=UMvHw@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
	will@kernel.org, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 1:18=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Aug 26, 2025 at 11:48:48AM -0700, Ian Rogers wrote:
> > On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.=
com> wrote:
> > >
> > > On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > > > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> > > >> It may have been different long ago, but today it seems wrong for =
these
> > > >> drivers to skip counting disabled sibling events in group validati=
on,
> > > >> given that perf_event_enable() could make them schedulable again, =
and
> > > >> thus increase the effective size of the group later. Conversely, i=
f a
> > > >> sibling event is truly dead then it stands to reason that the whol=
e
> > > >> group is dead, so it's not worth going to any special effort to tr=
y to
> > > >> squeeze in a new event that's never going to run anyway. Thus, we =
can
> > > >> simply remove all these checks.
> > > >
> > > > So currently you can do sort of a manual event rotation inside an
> > > > over-sized group and have it work.
> > > >
> > > > I'm not sure if anybody actually does this, but its possible.
> > > >
> > > > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > > > periodically cycle which of the 5 events is off.
> >
> > I'm not sure this is true, I thought this would fail in the
> > perf_event_open when adding the 5th event and there being insufficient
> > counters for the group.
>
> We're talking specifically about cases where the logic in a pmu's
> pmu::event_init() callback doesn't count events in specific states, and
> hence the 5th even doesn't get rejected when it is initialised.
>
> For example, in arch/x86/events/core.c, validate_group() uses
> collect_events(), which has:
>
>         for_each_sibling_event(event, leader) {
>                 if (!is_x86_event(event) || event->state <=3D PERF_EVENT_=
STATE_OFF)
>                         continue;
>
>                 if (collect_event(cpuc, event, max_count, n))
>                         return -EINVAL;
>
>                 n++;
>         }
>
> ... and so where an event's state is <=3D PERF_EVENT_STATE_OFF at init
> time, that event is not counted to see if it fits into HW counters.

Hmm.. Thinking out loud. So it looked like perf with weak groups could
be broken then:
```
$ sudo perf stat -vv -e '{instructions,cycles}:W' true
...
perf_event_attr:
 type                             0 (PERF_TYPE_HARDWARE)
 size                             136
 config                           0x400000001
(cpu_core/PERF_COUNT_HW_INSTRUCTIONS/)
 sample_type                      IDENTIFIER
 read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING|ID|=
GROUP
 disabled                         1
 inherit                          1
 enable_on_exec                   1
------------------------------------------------------------
sys_perf_event_open: pid 3337764  cpu -1  group_fd -1  flags 0x8 =3D 5
------------------------------------------------------------
perf_event_attr:
 type                             0 (PERF_TYPE_HARDWARE)
 size                             136
 config                           0x400000000
(cpu_core/PERF_COUNT_HW_CPU_CYCLES/)
 sample_type                      IDENTIFIER
 read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING|ID|=
GROUP
 inherit                          1
------------------------------------------------------------
sys_perf_event_open: pid 3337764  cpu -1  group_fd 5  flags 0x8 =3D 7
...
```
Note, the group leader (instructions) is disabled because of:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/stat.c?h=3Dperf-tools-next#n761
```
/*
* Disabling all counters initially, they will be enabled
* either manually by us or by kernel via enable_on_exec
* set later.
*/
if (evsel__is_group_leader(evsel)) {
        attr->disabled =3D 1;
```
but the checking of being disabled (PERF_EVENT_STATE_OFF) is only done
on siblings in the code you show above. So yes, you can disable the
group events to allow the perf_event_open to succeed but not on the
leader which is always checked (no PERF_EVENT_STATE_OFF check):
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/arch/x86/events/core.c?h=3Dperf-tools-next#n1204
```
if (is_x86_event(leader)) {
        if (collect_event(cpuc, leader, max_count, n))
                return -EINVAL;
```

Thanks,
Ian

