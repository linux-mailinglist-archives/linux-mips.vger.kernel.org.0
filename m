Return-Path: <linux-mips+bounces-7851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B86A3BBFD
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 11:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 571E27A63E7
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 10:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CE21C07D5;
	Wed, 19 Feb 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB5IDDV8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24290195FE8;
	Wed, 19 Feb 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739962027; cv=none; b=l30Q7p1PGxBxUzJ0MjEasvT1WFMytK9fUDYAcxsF20vFSsZHlLq2oUYBVe1sEpTPwfxDnaxZotTjmmJs8AIG0U7pUBhE9GBBFbsHTxHP1YkYUhWcnBlkAP4SBpW5DaNo96UNxxT1Xg14sKlN2zzetNVWpmqfTAQaYXGGg1/CNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739962027; c=relaxed/simple;
	bh=X6XoxNT4Gz5IaIpfEgxxUsOFTWmm0YJ+0QKOHpxqt1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMZSTNRY4K8669FttTU4vCPc9mQV9YLhe1RSRcZDWc946Nft05P1lOJiG0Kej3sj2imcvoLSHdKiP70qt+mwwaKIt4iMOSjkemM2T1E7p76FIh6HsnZ/IuRymImFbCm7n4Zr/lFz6konfA+VwUKzNgjj9v99Zzi0iRyNubGebN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB5IDDV8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0ba9825e9so21233985a.0;
        Wed, 19 Feb 2025 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739962025; x=1740566825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6XoxNT4Gz5IaIpfEgxxUsOFTWmm0YJ+0QKOHpxqt1Y=;
        b=TB5IDDV8fRBpVsZKMsAyJCQzR/YFWO1GpN7HzjQ+xE75m/SARWBRB60YMw2UvVildr
         QdCk44lxbuuUCyRLQCLU1++yOZrQAVyhwvJX/p59+PPQuXn9hqOBHEFDpugsM7yBGeHl
         3ja+J5T/a7To37oJUWh3p6NusI3KVOi1jDFkruLVGxI65SkIwgx+S2BxHYA2La990QZ8
         xfsAurTPfJv8W7AQWW4ukZ6RN17k9uWbAKEec0nORVx4uENqyxnSY1gatIeHgQeH+b/s
         9gTcmHAlyAoVULLGh1hl+EjVcuFuJFNit66OpJA7xkYMtkhpsScWyEExy+C1skkBuAxT
         pZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739962025; x=1740566825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6XoxNT4Gz5IaIpfEgxxUsOFTWmm0YJ+0QKOHpxqt1Y=;
        b=PQwHke9m3VSbqJdSiW/u+QLhFso2hGwyIH3gbpVCIidkLr5JbmpLt/JgmFwR3m56S2
         zRDopdUAy7uf5jHE0cFMh+Odv3RdZ48wbZLgcEWWRLRQizA0vwMhOTc5N5KCvT67lqV/
         z5ySCpgZoRLzZuPga9xpXXjLtitXPl0mv/uJQg14cdOPAzcOTrT/JkO8ZcFLvu+FHMAb
         aX6JjDYYIITH/H+fUN3etEjiXnfYir53Dq4Cwt60YFpY7kXgSjA06wGOsL6cT+2rFNKp
         3TV6nGtE0+va0exXA5mMBigpoZI783Gpx4vLWkbYxtwRUu0X6KmQf1WL1o1CJKicb0uF
         uf9g==
X-Forwarded-Encrypted: i=1; AJvYcCVcj5Nj1LJ9kwblNofkZibq9P8nd7PTNrImhaqXYTk1MHcLQNVHXWHyANIXN6XvhOamkMFWsOc2VxCBvtYK@vger.kernel.org, AJvYcCWfr6/HgJD0aKYNESdpiMN3p+TXH0KgcWrXqekZT2IJjvKCxLrCwQFdnTn0RUow0oWkugIFC8V/ippM@vger.kernel.org, AJvYcCXN0+RGCtkQgKE/YD7M9mvhQMjHyiKDowytK1oM9hpMi0E6YL0z6EJNQyWF9Bc3T2v+eKzxB4xE/CqQ/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpTX+vXbNL8HarJV0HHGRMOgKWI7K9YZUz82rG4+8OvHRhl2h
	1RlV8OOshckXGOI9pZQFqD2t8Wtgd+puJgJujOF/u2An2rjggYubOt8BQjH23EDu3PgEMTVotpI
	mZgtYiGg3LFMLTAn/Ev4SoHKPsEs=
X-Gm-Gg: ASbGncubf2OPwyEM72fxWkOuHXhGZMtio8GvnhPNNWu434F7S6roPasnquz//D2OsSl
	9ksy9D66+XprrV+NFl1x/i4H/GudDoD2Tw18Jpmj0ZNYiNn1uLojTi7QmLcWDMQcFBeilDMXwuA
	==
X-Google-Smtp-Source: AGHT+IHoUm3poSol3l90aiabl2mWXMhem6BEH4WepFddvstmAy4EEuzF8+aa76Jy5xSJbqXxIdN1v8dRh6ukkUyfGm4=
X-Received: by 2002:a05:622a:10:b0:471:a523:6ac1 with SMTP id
 d75a77b69052e-4720825ec85mr34917921cf.6.1739962024842; Wed, 19 Feb 2025
 02:47:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028175935.51250-1-arikalo@gmail.com> <87ed0uvqf7.fsf@BLaptop.bootlin.com>
 <CAGQJe6qBpQhBwhoLss8Y4MRurRs2p6_vym5XAiMmnHqd=nQC8w@mail.gmail.com> <877c6lv8zo.fsf@BLaptop.bootlin.com>
In-Reply-To: <877c6lv8zo.fsf@BLaptop.bootlin.com>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Wed, 19 Feb 2025 11:46:53 +0100
X-Gm-Features: AWEUYZn_ROwRxNwqcIX9RIN3H3LNA4Ee1dLND4Pxi9rVmGnL_7MZJLG0olZGhmQ
Message-ID: <CAGQJe6pNU3y4TqC-mC5YsApR0A5WT02_jcZYHbe1W_7s72ph5Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/13] MIPS: Support I6500 multi-cluster configuration
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Theo Lebrun <theo.lebrun@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Paul Burton <paulburton@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

The new version, v9, is here:
https://lore.kernel.org/linux-mips/20250129123250.711910-1-arikalo@gmail.co=
m/

-- Aleksandar

> Hello Aleksandar,
>
> > On Wed, Jan 22, 2025 at 4:06=E2=80=AFPM Gregory CLEMENT
> > <gregory.clement@bootlin.com> wrote:
> >>
> >> Hello Aleksandar,
> >>
> >> > Taken from Paul Burton MIPS repo with minor changes from Chao-ying F=
u.
> >> > Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> >> > 1 cluster/4 VPU configurations.
> >>
> >> I tested your series on top of v6.13, with some patches already
> >> merged. Only the patch "[PATCH v8 09/13] MIPS: CPS: Boot CPUs in
> >> secondary clusters" encountered a merge issue. You can review the fixe=
d
> >> version I created as an attachment.
> >>
> >> With the v2 series I sent a few days ago, cluster support continued to
> >> work on EyeQ5 and EyeQ6. However, for specific needs requiring support
> >> of EyeQ6, I will send a new version that takes into account the feedba=
ck
> >> received.
> >>
> >> Gregory
> >
> > Hello Gregory,
> >
> > Thank you for your time.
> >
> > I agree with the change in the attachment. Will you send it to the
> > list or should I do it as a v9 version of the series?
>
> I will let you send a v9 version. Feel free to merge my series [1] with
> yours, as some of my patches depend on your series.
>
> [1]: https://lore.kernel.org/lkml/20250123-cluster-hci-broken-v3-0-8a7ec5=
7cbf68@bootlin.com/
>
> Thanks,
>
> Gregory
>
> --
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

