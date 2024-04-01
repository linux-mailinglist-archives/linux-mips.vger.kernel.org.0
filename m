Return-Path: <linux-mips+bounces-2534-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D089416D
	for <lists+linux-mips@lfdr.de>; Mon,  1 Apr 2024 18:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01CA0B211B5
	for <lists+linux-mips@lfdr.de>; Mon,  1 Apr 2024 16:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AB14AECF;
	Mon,  1 Apr 2024 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n3zGUtc4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117254596E
	for <linux-mips@vger.kernel.org>; Mon,  1 Apr 2024 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711989717; cv=none; b=XjfTW7dd6BwoNkbXFeCN9lvqbwErDDBKO84icQvSgcCW3O6KDAI0FHkSNdMpVCTpiNv5SBnT6sij1hhGKQJOdPAKrRD7SWsAO45Nz4tiplLgqQECV8jEGRRGZYhbSMxtM+7iXB/Dr5JLKqFEjAs7Di2swuIJowNM393ur8SzAOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711989717; c=relaxed/simple;
	bh=/qz+y5YC2iKyofjEybG266txkeP8b0dMGw22Spe7v0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5IjA6yoNZsiLhgoEPwIw8D3oMxVrVLbUrsQAC7qBjOnT29KsdJVYDEr9y6kg0FT3A2SyESOnLcAlosPSz1pLcOQPT+HrZYVb9kz2UFz2/QVL3PC9L4J/JN3S9KeTYvLcdi2ZZBjh32MO4Q5RirPdq0zEDpE67X/aPejmlSRXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n3zGUtc4; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5a52c5c96feso1488159eaf.3
        for <linux-mips@vger.kernel.org>; Mon, 01 Apr 2024 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711989715; x=1712594515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm96Do3HD9Ni1RnQFtInuSgt43w6ZXYVK1hdTCMkucA=;
        b=n3zGUtc43hdlJzS0vlsQ9zojO+o3JLCLP8Knau9xVG4w1cEG3LDkcIOuLYNp7sjGZu
         I6vsz97YHQfSNd2A2IkpSq/LDUaZlmsjbdbwPZAUceHgfbmZRQNDMPO084xoAjzzr0eY
         JiYn+MiR591GvCKF+1tRNonooMpwCei0XARJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711989715; x=1712594515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm96Do3HD9Ni1RnQFtInuSgt43w6ZXYVK1hdTCMkucA=;
        b=CiA82Hx4O1FxfXLOAKnyCGA2CKJQgAWuX1QBkilraS+RXz6DfSBuNC8QIxwnTs4GRu
         Em5QExne7ZVASdU/AcjR5kTynGE+1KpgosTxh30Cj6YwphJCl5LJ0dTtsPZ/VMSJk5Dc
         kf6UjiEzBeHhWHs9fyglP4k9gie2iC/3LXVvK1YgLYvQlb47s2iOo8tcjlwPqhC42iwB
         OQqPZg9HzQFT252MiaKAxHYgbRb0InPQCjewaJKjGxBP33wuP4vfmt/JSMKKfsvmmra5
         JgpnvdsX7WZ6rvdatX4cRkjIsFgAaPcMovgdp47cSh22kluevSpVuMCBwqzIcTZ0OuuC
         iJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+nyia+IjB4BIUaz8gdfrJo9dxGu9sfrha4QbsINa1l1xgB9s8LL6zuofXNj7w2abmT6k9tY1PLlkGWR5dOgJCadQ8nmWvlgnuTg==
X-Gm-Message-State: AOJu0Yz/MLtLlGe+1yO0bxH7r2wxjtl6CB6c/K46wEfXsL1dsSgnZWJc
	AAXzqQs1dXtGgYOpi87bujj5AulJk1hnae/Y476RWyKrQVBCmIhg30hfaLhTNHDvAkSKPEBs+V0
	=
X-Google-Smtp-Source: AGHT+IG158V0LntM90aD+XVQRYgTLU9jjFJ92LLOUcdOIp60kMEjgsa5Ac+TPd9aoDDYUGvxWfY04A==
X-Received: by 2002:a05:6808:3a1b:b0:3c2:fef:2b5f with SMTP id gr27-20020a0568083a1b00b003c20fef2b5fmr16931761oib.32.1711989714723;
        Mon, 01 Apr 2024 09:41:54 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id bt3-20020ac86903000000b00432bbc3f544sm4149253qtb.57.2024.04.01.09.41.53
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42ee0c326e8so733481cf.0
        for <linux-mips@vger.kernel.org>; Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0Nm/KlCD1pxNPPTs6YnDXypC0xSateMShNp3K8mqnC612+THpnmdPh9WFBrEBMZVtx8Nz3KKsY+Xxuq7Y0lnNFgDPF3dYxjCwug==
X-Received: by 2002:a05:622a:5a89:b0:431:4e0b:d675 with SMTP id
 fz9-20020a05622a5a8900b004314e0bd675mr1027105qtb.18.1711989713017; Mon, 01
 Apr 2024 09:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-5-yaoma@linux.alibaba.com> <87zfuofzld.ffs@tglx> <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
In-Reply-To: <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Apr 2024 09:41:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xr8-rzANK8oKyEZpk1FZ2dy5HqBXKpk3O29PhG1fRowg@mail.gmail.com>
Message-ID: <CAD=FV=Xr8-rzANK8oKyEZpk1FZ2dy5HqBXKpk3O29PhG1fRowg@mail.gmail.com>
Subject: Re: [PATCHv12 4/4] watchdog/softlockup: report the most frequent interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, pmladek@suse.com
Cc: liusong@linux.alibaba.com, akpm@linux-foundation.org, kernelfans@gmail.com, 
	deller@gmx.de, npiggin@gmail.com, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, jan.kiszka@siemens.com, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 2:48=E2=80=AFAM Bitao Hu <yaoma@linux.alibaba.com> =
wrote:
>
> Hi, Thomas
>
> On 2024/3/24 04:43, Thomas Gleixner wrote:
> > On Wed, Mar 06 2024 at 20:52, Bitao Hu wrote:
> >> +    if (__this_cpu_read(snapshot_taken)) {
> >> +            for_each_active_irq(i) {
> >> +                    count =3D kstat_get_irq_since_snapshot(i);
> >> +                    tabulate_irq_count(irq_counts_sorted, i, count, N=
UM_HARDIRQ_REPORT);
> >> +            }
> >> +
> >> +            /*
> >> +             * We do not want the "watchdog: " prefix on every line,
> >> +             * hence we use "printk" instead of "pr_crit".
> >> +             */
> >
> > You are not providing any justification why the prefix is not
> > wanted. Just saying 'We do not want' does not cut it and who is 'We'. I
> > certainly not.
> >
> > I really disagree because the prefixes are very useful for searching lo=
g
> > files. So not having it makes it harder to filter out for no reason.
> >
>
>
> Regarding the use of printk() instead of pr_crit(), I have had a
> discussion with Liu Song and Douglas in PATCHv1:
> https://lore.kernel.org/all/CAD=3DFV=3DWEEQeKX=3Dec3Gr-8CKs2K0MaWN3V0-0yO=
suret0qcB_AA@mail.gmail.com/
>
> Please allow me to elaborate on my reasoning. The purpose of the
> report_cpu_status() function I implemented is similar to that of
> print_modules(), show_regs(), and dump_stack(). These functions are
> designed to assist in analyzing the causes of a soft lockup, rather
> than to report that a soft lockup has occurred. Therefore, I think
> that adding the "watchdog: " prefix to every line is redundant and
> not concise. Besides, the existing pr_emerg() in the watchdog.c file
> is already sufficient for searching useful information in the logs.
> The information I added, along with the call tree and other data, is
> located near the line with the "watchdog: " prefix.
>
> Are the two reasons I've provided reasonable?

FWIW I don't feel super strongly about this, but I'm leaning towards
agreeing with Bitao. The sample output from the commit message looks
like this:

[  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper/9=
:0]
[  638.870825] CPU#9 Utilization every 4s during lockup:
[  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardIRQ=
s:
[  638.873994]  #1: 330945      irq#7
[  638.874236]  #2: 31          irq#82
[  638.874493]  #3: 10          irq#10
[  638.874744]  #4: 2           irq#89
[  638.874992]  #5: 1           irq#102

...and in my mind the "watchdog: BUG: soft lockup - CPU#9 stuck for
26s! [swapper/9:0]" line is enough to grep through the dmesg. Having
all the following lines start with "watchdog:" feels like overkill to
me, but if you feel strongly that they should then it wouldn't bother
me too much for them all to have the "watchdog:" prefix.

Could you clarify how strongly you feel about this and whether Bitao
should spin a v13?

I believe that this is the only point of contention on the patch
series right now and otherwise it could be ready to land. I know in
the past Petr has wanted ample time to comment though perhaps the fact
that it's been ~1 month is enough. Petr: do you have anything that
needs saying before this patch series lands?

Thanks!

-Doug

