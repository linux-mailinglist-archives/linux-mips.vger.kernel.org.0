Return-Path: <linux-mips+bounces-1878-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490C86BAE2
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 23:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD9921F23511
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 22:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F138372921;
	Wed, 28 Feb 2024 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSevm7p0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E47290F
	for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160312; cv=none; b=OvpR6bDTgFz9Nb8n9O9OW2zdf1xugF+unMhnwx7/gbzNzWlVILVDwrl/29RIWrYLVcsBxkYle/ITR9on4exmi2F6orH5XSTrHhForRJ6hPZKQrgwsnakt3VkXAPuWvJM9Ee27N8oKk/lsu3wB1AsZ6vZx7/gmttIeHOBEEgdjfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160312; c=relaxed/simple;
	bh=g7xQFQu3lLzNX4Vd9so5KMCqq2700AsVTNNzgICe2Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4LcXyRztkI6cjbmh+YZII3MOCvNso/mf9H14rkjqqCupK0KqSkuK1KLxJQ3vz0G6skNBbGQNJqtuBzCsn3bhucXG3WaNFZff5Kpjyi5QqPJI8RkFPLSkl9+qVu7ZuipJmDaJtt3eJt5vThHKeRu4guwoMu9bb+7XRJM/X2XqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSevm7p0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a34c5ca2537so53707866b.0
        for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 14:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160309; x=1709765109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Wb6NhI/vtCiU6t546gnwmXs9J3vtrwxtAXa2CAncw=;
        b=NSevm7p0/+Zk7em18Ck+0Rb2qnr0fRvK8F/4/Zzp3gBR9J5KtphxV/bGXICmIVgK6Z
         l8KoFd0Q5qiZDlL4GKgQw1P5FNkbY9S7jt17UNyAWZfSS/3b8PxvSh1zqM5Nk8eHUmC5
         y/rYs80mHciF2EPNOABuiiqeOA9LUDyUI3Vz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160309; x=1709765109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Wb6NhI/vtCiU6t546gnwmXs9J3vtrwxtAXa2CAncw=;
        b=B3Oi6MIrZhST6uyT+pi5Fc2R/pYbK8CFIj2KdUujkZPd5YiJ3BsgG3W+pu0mMAu5/k
         fc1CGDIfOxKoIqUikebbE/41OQpuLdh5xB2RFG5jrqcGZC2Y4KDE9wNYSqLJ0JLUAxEW
         mPeOo3ba/8YcpWLXeOrRH/mlved54tfVnF7gqNR56TzsEUkNq+ccC4OrwA9tpIfmli3O
         Y8B5/9Sfj12cHtjYa0e2jq3/ofB1xaic2+ugIpY5Aj6eYwhCMVKcbUftYs6xB8GD+N8R
         3yh6Xhu9Bk5mp7ojGgWXP0AfML5WWCqNDe0iyIf8bnnmNAna+YlzzHtNQNlIAvnBmc5A
         1FGw==
X-Forwarded-Encrypted: i=1; AJvYcCWEiYfVxzlRliTmXJIT4ItZdZCguuQ+dl4EScaVP/OliyPRzRcHptjXnNO+2lTmlf8KH+RLZQq8lEWuLwBEmLmwl3c5yKxOeZlCsg==
X-Gm-Message-State: AOJu0Yz08ldXvnPMRtPe/DkRG5/rDL05tYxQ3HGDs9u0x7Um7O6pNWCk
	vHlb4jtMafbFd2xkV4dwTjZQ5FaV21zM/cwhYjscfOTRmHSa/6bZnRTty6/ZH7uw6Up6dkTty7W
	DZ7oF
X-Google-Smtp-Source: AGHT+IHOiyGG96BUXWmQ8OQIjGmkJzGMYHDq2+imUEfRz4x24DxDpt3uzowoxc39I1aDGQFoxKHejw==
X-Received: by 2002:a17:906:eb57:b0:a3e:63bd:3ae1 with SMTP id mc23-20020a170906eb5700b00a3e63bd3ae1mr199719ejb.9.1709160309067;
        Wed, 28 Feb 2024 14:45:09 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3d5efc65e0sm2311015ejc.91.2024.02.28.14.45.06
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:06 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so1878a12.1
        for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 14:45:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSEGxiNmfxpyiPvaSGY7mlKlu0TG5oWiPy+l3YZ0kaK/mWD6bMPjl5qnowz8XH5V7YV9lSdi3ZCUuyT7tdUMuyImBbUxdK+EI39g==
X-Received: by 2002:a50:8aca:0:b0:561:a93:49af with SMTP id
 k10-20020a508aca000000b005610a9349afmr11944edk.7.1709160305919; Wed, 28 Feb
 2024 14:45:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-4-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-4-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7gOpLw2VwRO7EwwNoqSJFM8iC0-R1GC4RHtz4=fwa5A@mail.gmail.com>
Message-ID: <CAD=FV=W7gOpLw2VwRO7EwwNoqSJFM8iC0-R1GC4RHtz4=fwa5A@mail.gmail.com>
Subject: Re: [PATCHv11 3/4] genirq: Avoid summation loops for /proc/interrupts
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
> show_interrupts() unconditionally accumulates the per CPU interrupt
> statistics to determine whether an interrupt was ever raised.
>
> This can be avoided for all interrupts which are not strictly per CPU
> and not of type NMI because those interrupts provide already an
> accumulated counter. The required logic is already implemented in
> kstat_irqs().
>
> Split the inner access logic out of kstat_irqs() and use it for
> kstat_irqs() and show_interrupts() to avoid the accumulation loop
> when possible.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  kernel/irq/internals.h |  2 ++
>  kernel/irq/irqdesc.c   | 16 +++++++++++-----
>  kernel/irq/proc.c      |  6 ++----
>  3 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

