Return-Path: <linux-mips+bounces-1880-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7C86BB03
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 23:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58C91F25516
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 22:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60723FB98;
	Wed, 28 Feb 2024 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="faR/DmgH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8C4086E
	for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160795; cv=none; b=PyCglXTCSzv5tnOvjfvvB34x8sTBXLTjFPiasY2yEWmzeHJknLnphzoIql382oXg0CkBHzydN303cuRSiFvneZbOco5vhXjOb4Gb2tjll5Xb/RMqdPmMjg06hUzB6RGWgv7T5KytP86AsIRGjzWQA8kbU/6aAdZh3/r+WionnrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160795; c=relaxed/simple;
	bh=Cbo16Kdpdj/Sou5J9lkN1s8YVlAEB7JmVmpKJ1D3TMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBaltYoWfqvWesnQMuJ2KDRosnEDkVBYB7ZjFUu2iqgXYs6iGx1Pl5A8jPS6oTNdI7nrLMdcO/Z0U9nxohhxxBbgyjoB8JYi7ONbUwCdjOjwsN29anWFFEnWKwJ3DQHmuzflJh75Ipc3BnSLWWeRTDrLIDljfv1JWw9EXve/AkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=faR/DmgH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a44360a8b9dso18731566b.2
        for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 14:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160792; x=1709765592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaIW3mETQDzZhGMK3PRFUOCtdSx2PTiCbd1xUJLaJyo=;
        b=faR/DmgH1TD5IO73xkUId/9gl+4afGIxieXJgdYtV24E1l2N2FRr3VMlahrH6ziC5U
         cEn3lnulex+AXtbGKiXTyLiTX6TQuJ4xtgzhJFthd4lFpWkNBWq6vWI+GQjOuApSpmTT
         UGu8lqXz0lav9sxl7nFFRX5/rLp4vZI/UXp3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160792; x=1709765592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaIW3mETQDzZhGMK3PRFUOCtdSx2PTiCbd1xUJLaJyo=;
        b=IVy7hwQPC/YWO2YPN9jGOehWJh2yEJrnxmDnRGChw4+gEeS3m3Yuc/m4G1jGuS9/tx
         19A04WDNIuF1Wb9MaXt+uizhB1fLpwuQ6THIoGZwAn46aT0uPTiQU9giKIHoa2RnLN72
         Dkza5Ey/8zGoGZ9+R9s3FyCjGfi0KykI4Y+xjkGkcMLfAeMxAD5PqQaScKIdoVxVyUWE
         xJUbPtz3WeugDUlmrHdNN1FvTqrQwHyydhXWRxFQpjB1RCo1nQ5oT3VdnlR03CJZja9P
         I0i6QVBsi/2zrocFXUf8yQl+6+0UtKviv1fieaca3A+HC2XeptN3nGXq5zeUfRnC00c1
         3khg==
X-Forwarded-Encrypted: i=1; AJvYcCVmjHXvtnfosZSiHSOEPANzuUyeRmbfbZ/TvZ3byhGt7nnxqhjwe1tCIC1SR9A4XmuVoenBspzFqtCYnchxHonRtYYkRkXygtRL7A==
X-Gm-Message-State: AOJu0YwJDsxGRuidSq/rJaA+ARPoSAt1HVBs/cpQWCzK8YDBAPnxmu+R
	DBP9khi15OXqeXAUaWzL9cGrcGWhzG2EAzs2qI357FAT/8aFRkzQzzgeyrYuGx8I4EGB9EXh7qy
	eM/LI
X-Google-Smtp-Source: AGHT+IHbM28aAZHI/woIpbfyk3FhiV4IebIYo3txGNtor7O5+o2vWGXI9bndybCS1zdTMnF1lujXiQ==
X-Received: by 2002:a17:906:3c14:b0:a43:e812:fbcd with SMTP id h20-20020a1709063c1400b00a43e812fbcdmr175812ejg.28.1709160792355;
        Wed, 28 Feb 2024 14:53:12 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id x23-20020a170906135700b00a3e4c47bad1sm3394ejb.8.2024.02.28.14.53.12
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:53:12 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56693f0d235so3374a12.0
        for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 14:53:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXU7t1uNNuZrrQyWEMLgE6WzzFdyP6MQHfVcf1J5fV9SUFsDBTymB1MxWbVPDdLGVAB/ylPZtQapxY++JJlmdj6c162axcx0vuFdw==
X-Received: by 2002:a05:600c:4e16:b0:412:b66f:3d0a with SMTP id
 b22-20020a05600c4e1600b00412b66f3d0amr20561wmq.6.1709160300349; Wed, 28 Feb
 2024 14:45:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-3-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-3-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Message-ID: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for interrupt statistics
To: Bitao Hu <yaoma@linux.alibaba.com>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 27, 2024 at 11:22=E2=80=AFPM Bitao Hu <yaoma@linux.alibaba.com>=
 wrote:
>
> The soft lockup detector lacks a mechanism to identify interrupt storms
> as root cause of a lockup. To enable this the detector needs a
> mechanism to snapshot the interrupt count statistics on a CPU when the
> detector observes a potential lockup scenario and compare that against
> the interrupt count when it warns about the lockup later on. The number
> of interrupts in that period give a hint whether the lockup might be
> caused by an interrupt storm.
>
> Instead of having extra storage in the lockup detector and accessing
> the internals of the interrupt descriptor directly, convert the per CPU
> irq_desc::kstat_irq member to a data structure which contains the
> counter plus a snapshot member and provide interfaces to take a
> snapshot of all interrupts on the current CPU and to retrieve the delta
> of a specific interrupt later on.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  arch/mips/dec/setup.c                |  2 +-
>  arch/parisc/kernel/smp.c             |  2 +-
>  arch/powerpc/kvm/book3s_hv_rm_xics.c |  2 +-
>  include/linux/irqdesc.h              | 14 ++++++++++--
>  include/linux/kernel_stat.h          |  3 +++
>  kernel/irq/internals.h               |  2 +-
>  kernel/irq/irqdesc.c                 | 34 ++++++++++++++++++++++------
>  kernel/irq/proc.c                    |  5 ++--
>  scripts/gdb/linux/interrupts.py      |  6 ++---
>  9 files changed, 51 insertions(+), 19 deletions(-)

I won't insist on it, but I continue to worry about memory
implications with large numbers of CPUs. With a 4-byte int, 8192 max
CPUs, and 100 IRQs the extra "ref" value takes up over 3MB of memory
(8192 * 4 bytes * 100).

Technically, you could add a new symbol like "config
NEED_IRQ_SNAPSHOTS". This wouldn't be a symbol selectable by the end
user but would automatically be selected by "config
SOFTLOCKUP_DETECTOR_INTR_STORM". If the config wasn't defined then the
struct wouldn't contain "ref" and the snapshot routines would just be
static inline stubs.

Maybe Thomas has an opinion about whether this is something to worry
about. Worst case it wouldn't be hard to do in a follow-up patch.

Everything else looks good to me. Given that I'm not insisting on
adding the extra CONFIG, I'm OK w/:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

