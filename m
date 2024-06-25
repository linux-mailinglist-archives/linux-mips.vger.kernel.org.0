Return-Path: <linux-mips+bounces-3929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A0916100
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 10:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF4D283584
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 08:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCF9145FFE;
	Tue, 25 Jun 2024 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQGHrnSe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE29145B3E;
	Tue, 25 Jun 2024 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303783; cv=none; b=Kd4qHIGCruuRMdOSjE2h9e2zrnRKgb5DbjjaIDRCNOjMe3H00lCtjj/+GnbjqWHtsV0MD4FRgqrLvZFh5i5wf3WnoO2WDWIX9Iyb0tolSD7R8y0/16yknC9KNxPt1vrTxyx2mgR6O57C2OUuWcTlbgFetDW+rPZSYDo8ZDwgQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303783; c=relaxed/simple;
	bh=o4KIJ6Zs7UrMHBMSTDS4iO7pXNEXE+L1ytfyKNhhfmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdensY9wG0HllhVVzoCN5yS6RiV/IceIOBZicIwIgQ3v8D20NbUFLIXbh5FzxEQAAzWN0bUG28kAOF2XarHZiS6Idv2aN9TuHpWD+6Ni7wxsvH2zPqGv31jU/8tFjmaXzM2OzYHN4Aa/kWLkXfhdb/aATt5o31Cr2JCbQO2VMic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQGHrnSe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c7da220252so4203699a91.1;
        Tue, 25 Jun 2024 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719303782; x=1719908582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4KIJ6Zs7UrMHBMSTDS4iO7pXNEXE+L1ytfyKNhhfmo=;
        b=OQGHrnSe53tbt17uu3qs2LaWD9qgOO16uQwdw7bI40UbcOusa0cR2CRl8cmw3umhbt
         0CcKR41H/5qNXWU0OpHhIGN/09xfL9DnbRVbHywBIS9Szsz+C6nYNpIKMIKCYhZSBwvR
         aRQmALfQnhNpmHb5ypRSi+ui6iOxP+88+MUdu4pGYMxhnS0fpEBFIJWIw2sBcitAaYdw
         pJG7HUd22uSpVvjfX+SDSIuVj44PKlZXcwqLNmzLOGtUW1cT16hpZoKQC6/sNhGzNE+T
         7nBLkRVY6Nz1gT4pTEtbHI8zW5iJuLdKyIOzMZekdSHA2WvprZiM0z7bkKPNQqZfWxPN
         bYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303782; x=1719908582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4KIJ6Zs7UrMHBMSTDS4iO7pXNEXE+L1ytfyKNhhfmo=;
        b=oh3Bg6ULo7vTtnyXmO2rkfXifdyldr5/bOX1Q92C6dNHXBHTVOwMSJ/7Yoiodh/B8r
         nuCWaxqZe0DxJLgJ/gubwIWZPbSQmaGiEzDCbhMGofrQTJdpOYiUiXBj7TPqbUpkvGD6
         UK+G/gaUUEAhPbedaIPDucYlwCkiCXSmsz+CVlPqutpFgeLvOuTdBy+TQDMl3z7EiEoy
         a+TfMYx1/oWzhYWXaciFAHclBAOhb/bHPMlmGcYmnMFKlzrUGwd4UEXhMSUX6e0Cix7w
         2IbhmKgpD1SxHK9oeIAVFWjy7BpqkAhCHO8YKUR7GzCHlyKLJT6F+U87aK2RXODb4gts
         FekA==
X-Forwarded-Encrypted: i=1; AJvYcCURt5yJKDC7vBkaiLHpfgA7TyfCqZV0QEDQF/zgSVFJ3G7t8fzCmHSS9tdW6uThsLge91nsnBcs2prr1AZTGNMi3Y+TlQFC/TUl0cm9lzdZBniYr4oj/8ebVEDNkDmHNz7OVvN474YBRw==
X-Gm-Message-State: AOJu0YxbrvA9FPEBihYGJWP7r/1weUuZ/bLL4vrvJrUOP7BQzvPKNzWL
	dJO32sNKxA4vWmJlRLPTvJwW6gOO5rW2D0NxqWKOhKbO4hEfE2Ac03gL9p4288qXy2XyG1MUbZz
	2bEsYkI81Ee8vXPcGdqwwqEbzmac=
X-Google-Smtp-Source: AGHT+IHtxfqKapIy2VLc9XgQg+O6Y7/HP/S9K56/AJ1RUcRFmbfNHxw1sRRaimmn7/jQxwJepnGz2MVhXk7BZnGONNM=
X-Received: by 2002:a17:90b:1288:b0:2c7:7718:a9dc with SMTP id
 98e67ed59e1d1-2c86141e878mr6838662a91.46.1719303781854; Tue, 25 Jun 2024
 01:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com> <sshcqxwvt7gh4log4u7prw6udsd5k23wpautiocuwitapajhur@bffjuaeoxtaq>
In-Reply-To: <sshcqxwvt7gh4log4u7prw6udsd5k23wpautiocuwitapajhur@bffjuaeoxtaq>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Tue, 25 Jun 2024 10:22:50 +0200
Message-ID: <CAGQJe6qf=1DqaakO2HEkqaRyq4smxC4=J_NHwofb4yRuC24Xug@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
To: Serge Semin <fancer.lancer@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Thank you for the review and testing!

I will send a new version of the series soon. I will dump the FDC
changes (patches 12, 13, and 14) and include the requested changes.

-- Aleksandar

On Mon, Jun 24, 2024 at 10:12=E2=80=AFPM Serge Semin <fancer.lancer@gmail.c=
om> wrote:
> Finally got it tested on my P5600-based SoC. No problems has been
> spotted. So for the entire patchset:
>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
>
> To sum up I'd drop the FDC refactoring patches from these series and
> have them added to the patchset where the changes are actually needed
> (if there is one).
>

