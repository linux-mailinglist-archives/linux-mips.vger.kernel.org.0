Return-Path: <linux-mips+bounces-1879-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B686BAE5
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 23:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3260B289365
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 22:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A9471ECB;
	Wed, 28 Feb 2024 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mXwQ62Ud"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E43FB98
	for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160321; cv=none; b=FbsilynLDRukiQTrNYCee7c0WOuRapGFtbaDcZ99wasIgFa4Nr6WRpotqqPTKOLjeL7yWU0LojlCLb3kwBgnI7C220GHCtUfqmlBaaIFkSc5t645CU3IxxtBDtIIlzpImB5kDD4P3imrrvB+hJJp7SyXHuKE2lDdNkcO4UosLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160321; c=relaxed/simple;
	bh=1/CGCY3jhF/evFGu5DL8ruxZKJOzhM2yszIHb1BXMFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cf8SHhcn/jj1H5VBKO9cAb4ajXfDZWvLX4WvRTbiFvR5fLWuR8I98U4a5sgbgRJzyElsAgl/rytXKfL9hqJF6Hn3HiYqm9an1WXQsvj2g/KF5ZK/Sv5o7HadTM/SnbGJeLeP7RKtVLytkTs6USwQIXeTnHBnARB5aTTnJeIqwgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mXwQ62Ud; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a443d2b78caso5136766b.1
        for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160316; x=1709765116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxABPZ28o1U9eMcO7y1qUMLxndBrASNoz0KbMJJ/fIg=;
        b=mXwQ62Uddw84ptR80TKBhSUme2ejc89wI2u4IXGI5gafJUr5OeOb6NMeLlYjdZDaRP
         YsoWhxwiWGuDDpJsQTrEDqKfIschzGLefwYRxQM2svHWk74i27M2zp9oyfud+AvZD5sw
         /kVdnuBJZ1LKvHdaYRcZfXR/UoXo3FOV0/Xwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160316; x=1709765116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxABPZ28o1U9eMcO7y1qUMLxndBrASNoz0KbMJJ/fIg=;
        b=rUmEN7hASvsvoqZrMFyEluMKo+7LPz+fZW/sEB9yBG89Zz4X1reHIa+82IF86Ic1JX
         TwjBt321IAQSdZqJ5NSJZiRyC3iF86+9wZWHIXutuEDOjGFGK+9MhATWlJKRM8syEVkr
         jNmHI+C3VPC9+IWmftOPq6SMq36YP9eAsdbpcrK4pZfHbgcZkVfPQyK08cTBKSGtk1M5
         V2EiZ5+P57NtiB5mnu45B8iqa2rOPip1L4KL0++AZXhMXkLCjVpeK/KJbHJgDxA1PBJ3
         pm7sAWKwFkAcQlrXR9qSxhuxoXWbCRk5zNYaJiWd0nLoHCtcrijoqog+AaJZEo/S5gTq
         8png==
X-Forwarded-Encrypted: i=1; AJvYcCV6WIbCO09IYEuZHKbGMZhgJcE4mP0b8xC2djo8XKq5LnBcGTogMhrVaMeDAQE0U0ZpmrKdQM0lU3yXUuEkS1+6koSs3SLYT9V2vQ==
X-Gm-Message-State: AOJu0YzFFeTJJF0RQr0c44buC3HA22o5vPh4cAOfb+a7f80mrH3rEbbH
	hlm+my+S3/qPydWkTkhb1VJm+jRjG0EjvBmtQfmdUsC8PrbZvEH6C270Pt6iwntHrDpVDzfj9Eg
	J21ug
X-Google-Smtp-Source: AGHT+IH0e85bxCKmNO5vNa0HIwRskSmtnfLeB7EL/6CREveyuKUjsSFZuDWMIp3C0AwYsRJEu/UPwA==
X-Received: by 2002:a17:906:d83:b0:a44:1cb4:2e85 with SMTP id m3-20020a1709060d8300b00a441cb42e85mr171677eji.52.1709160316137;
        Wed, 28 Feb 2024 14:45:16 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id t18-20020a1709061bf200b00a3ec216ec6csm2297225ejg.45.2024.02.28.14.45.14
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:15 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412a9f272f4so28345e9.0
        for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 14:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZvtqcUCp/KwezwtV8cid6rPqWHgxCsKmpZPYViGTjydJnMiJPyzL8DbWZGPrat1njD04/0EJ9kgQOTKr0hWo8F2dNtYhMq40PBA==
X-Received: by 2002:a05:600c:538f:b0:412:b689:5d88 with SMTP id
 hg15-20020a05600c538f00b00412b6895d88mr18372wmb.3.1709160314368; Wed, 28 Feb
 2024 14:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-5-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-5-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xgr4--NJ3dAh2ggxbFUV9-QR6rW+YXyMHZYXPVSkmaAw@mail.gmail.com>
Message-ID: <CAD=FV=Xgr4--NJ3dAh2ggxbFUV9-QR6rW+YXyMHZYXPVSkmaAw@mail.gmail.com>
Subject: Re: [PATCHv11 4/4] watchdog/softlockup: report the most frequent interrupts
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
> When the watchdog determines that the current soft lockup is due
> to an interrupt storm based on CPU utilization, reporting the
> most frequent interrupts could be good enough for further
> troubleshooting.
>
> Below is an example of interrupt storm. The call tree does not
> provide useful information, but we can analyze which interrupt
> caused the soft lockup by comparing the counts of interrupts.
>
> [  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper=
/9:0]
> [  638.870825] CPU#9 Utilization every 4s during lockup:
> [  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardI=
RQs:
> [  638.873994]  #1: 330945      irq#7
> [  638.874236]  #2: 31          irq#82
> [  638.874493]  #3: 10          irq#10
> [  638.874744]  #4: 2           irq#89
> [  638.874992]  #5: 1           irq#102
> ...
> [  638.875313] Call trace:
> [  638.875315]  __do_softirq+0xa8/0x364
>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  kernel/watchdog.c | 115 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 111 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

