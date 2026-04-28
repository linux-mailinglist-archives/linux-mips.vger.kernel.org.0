Return-Path: <linux-mips+bounces-14377-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M/ABIOI8GnuUQEAu9opvQ
	(envelope-from <linux-mips+bounces-14377-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 12:14:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1A482627
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 12:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C482330E1649
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 09:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB92D3D9DBD;
	Tue, 28 Apr 2026 09:32:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6533B9DAE
	for <linux-mips@vger.kernel.org>; Tue, 28 Apr 2026 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368726; cv=none; b=Mii89M83fHhE66TrCfgqTQ6e0/j14RUJ9IhNIpp/Lw8iXxr7EJLgDO+m4D+SAXqQWlcUe/Rv/1bKcVF9Q9gS5YdnKeumhYLudMesuAxxgYZ27yMDocMw7SfAF5GD6bO/LBKEzE/stXc9yc80RIPkrRtlmiZLe7NNQH+eMOguoAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368726; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6Pb5ouCV47dfEEwunZvU8MbeAyiveDm11wP/ZPHqsS/Gu+Ha+b+FcQnY9C5keVcsp0jezNaOENKAjb4d8bydpAo7ULILKW2nuxXCqr1+oZzanTvpbZjZly9fnL78NN+/jPOX0NQD/df7Mb301XvgQroC+biVxUfIe9Cz5k6ZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b886fc047d5so2002955066b.3
        for <linux-mips@vger.kernel.org>; Tue, 28 Apr 2026 02:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368722; x=1777973522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=r1LL+UQwTfVmO1/eMMRe8bCkbQUERGKTuWwKiT/Or2Wi3KGNHXah2TFJus9SP3ArVI
         8kKQBLJkI1Efq2sD2SDNe/dmiGi/N5fP0/mr9gAiAhkvU1rTq7IaepFw2oxHex5ioyYt
         ESMolnZo0AQPxh4yzGZLbLZsKPskVO2Ku8MqhplZjlkwNA+eKum+em5bW0rYFjAiX/ph
         QTp71HJS5gybhbl6S27piyNdPdSAjJ+as+h+KAm4tJnCyRbhLc/80bO9oJPM+SRZG3jn
         TrlvUl1XJyoe6FC7A4CDUv/s8GQusVWZOyoi0Yc2uVisHjxe2UxCiqQRUx2ajHGzLvvj
         rpvg==
X-Forwarded-Encrypted: i=1; AFNElJ9zwdHRjC/klg7sSigix9rpSklthLaJpC6mQBIPhWCxFjDwBxzT43MG9xJVmWq5H9RylfmU6hrWDcXb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XqyOGpnfP+SFtHInueg7IzJ7OYN6C31pHTwyPEFjAGqyYRcU
	2X91jokCM8eQn2vAgYGm0Zf/OOWC9fiWYEwIes1n08YKaHkjYN1DL+kgjpr3bJmwVdg=
X-Gm-Gg: AeBDieslD2VbV7vqFL9cB6oI/w24h/kR0iMT9MuNS3OLNDx67bVaPQloi25UAqxiRsw
	xLzFVVMhd6UZdOChUII70s/goGLlpsM5e/syUr5h8BGC/KgVrnYAk5L0qduNMZ1wQq9iePf/NKp
	Vvkbff5mx9TTGEfL8RAgln8YF1VEmNlyrbmwGZH854j7Lk13ujgaksvNM514eHRjkRmOxkuPLnU
	Av6qRP6xAsjezz5BaVceh4c/Fv/TZMA+s5CUbox7jjbaGEUc+BorxIDEUyt0cH/PEaQK5b+hrK+
	SYYOx77+fYJygdpK/liT00D2veNULKCElXsK0KWmtCfOGjep1AphmG7rpMrJDn204z7um9XXLZa
	iALz/cZTIec0rExrIm1snBGZA/yr0lkxyFDKeS4xP7JcVda+6v+3XwmSCltlxqlbXlEdmayNtYw
	B6Xj9Zp1ALbQTA2l10Avnc6Wmw683smxKG9IhRH4xGcfMK0KC2ouY1jrIuiVmYyewXYgqmQX8=
X-Received: by 2002:a17:907:8745:b0:ba7:670b:f076 with SMTP id a640c23a62f3a-bb8020c9f60mr143856066b.2.1777368722181;
        Tue, 28 Apr 2026 02:32:02 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853ebfbsm73225266b.3.2026.04.28.02.32.01
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:32:01 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7378917a12.0
        for <linux-mips@vger.kernel.org>; Tue, 28 Apr 2026 02:32:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ840dG7rOHLeUCjYMsG4RXIO1Ap4hbAwjyj9RWfxj9/09aqIFOQqwcfgOMrBWiBcpH4jPIFPaU1kqbW@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 68C1A482627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-14377-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.155];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

