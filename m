Return-Path: <linux-mips+bounces-14372-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBkSDcjc72l/HAEAu9opvQ
	(envelope-from <linux-mips+bounces-14372-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 00:01:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA4B47B10A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 00:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA94D30FA8F8
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 21:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801E23A1D0C;
	Mon, 27 Apr 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UJl/zgqR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD7539FCAF
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327077; cv=none; b=K4wn3sFyLNAvb0fla4IO+rmU9/pXxjYQuyeknoyS3kx4JHpUXuZPXoth2DPpcMxyZZwUu/VXSS2zJK+yonaDXh5YNcaAMtWcsoCVU+jRHUge3JuoWBwlVDwHTd8klf+MfL3ZBsPmVFzS54SdlTpzvjXoRUKYFB0Ntg37Ze+QjKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327077; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vc73QUyYSdNPVTR71htyifBS9dXlA4iw++6MJnW/5SK0oBK/NIn4xYuAkATSavrEP5Gmp5C2AoKj5MM+CZOZ+SPcMHWZXZSUOjBQUGqFfenurT1vNUp3Tz8qi4BRWcG3UxHDeZmt7UzkfuD5ZRdsw5S6bhQinxzAMIttJfGHcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UJl/zgqR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f9568e074so1773076666b.0
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 14:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327074; x=1777931874; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=UJl/zgqRsI0e9gUfbjjoIXJ+ap/5tOCztviJfksGs+TLt3lA1WXDBfoQCm+ORRgGB3
         gNC43L9oCzmCA+Vy/dBRKIlu0wbjp4/yZFRAn94EZOSTUXFyNRp4VWBTeokbIP/aw1b2
         3T91icBG3dUVzSsqp/KDh1vLZhOH15XBrnG9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327074; x=1777931874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=pi3C/M8PC6HUW8SYtAJGYdrDgKdd7j86Wl+K0FEzYp8QUykbFe09Ue5orMxY0YegX9
         widAe46YK8nkleajJjyxmlrnfbEomXmuyF5gkjQp3Zlni0UOXdfHNqSgi1ft7DKBCAvI
         ndJAFhkk/DeYPrfxS+T3WKt1u5/QW/k0Pa6YGfD6SvF/APEAA4ygHbDdeCbQ3cveZUJy
         WK3YnWgxXIIGe21uvhlDvHQC2Q+Ru/BQGfiVZF1OI3ID9s2bbNSxI/xM+CRO1NFH+DCg
         OJa0MQqqrZcQCDHKKfZcEzrBKoEcPKaGUeziF01R0mielJrtxhHg5RT1uTugqHmwDU7g
         bySA==
X-Forwarded-Encrypted: i=1; AFNElJ/SYKWlMNAehTyA6iERw9ceiuiOqU+2I7pbEb1lyxw7RizMkql/n26CQ4n4L9E/WO0M3ggjYBcBQoCh@vger.kernel.org
X-Gm-Message-State: AOJu0YwezuYpYg0vMx2/SEjJ0kVK1OKHnPuQT4IWq36qsdRHgm/6B19G
	edXXrswQrOK0G+UxKZFY4WGNPRaLeP9sSAtw+XzalYERaA9mtVKyN8UFZo6KfzHTLS9EMx7GeUh
	PnSfWj26glA==
X-Gm-Gg: AeBDievz/J9fcuZ/oNR3Va5kvTkJjIaeFGaQhDE1UHf/q10qq40oFSUdsVeLmX3UWKp
	ebvlnEhOpU9PxbgnCAdM5bnmvcGrjSeHggu7ABv0VU0aBMaMbbtWP37Jhq59Hif/CAWuqV6rq34
	qrZ88fYhYWGc6ymhDT7WjHGvOIsf3yp1Qpv5h+nX+TodpbcdjeSY4MA2rQzokMA5Mg5ZOXKbMg5
	U8q4wR04YBjzRy23J/3pKo8ypMYXLjxrIzq2mwhzMsOXM344iHeZzosYkZUbS5e7RvwpvQ5ZmEl
	kHxWMIfQA9MWCeSv5/9jkj9z0RXa0qWgz6pAJ9WeC7T148Sf7y2sK8V9bvKIZC8Mn/VFBcoIG3X
	N72iW5LgQ0leiaR/NF1HJwGiDeslJ18PF5Lg04GMx6MHy23etJiOwAa2yirKp1VGt3B130gvA3S
	j0gOc9ITVOs4avMnhkeZpPS7odSd58X2D8KukfvgLDorrsfXUzgtr4fkQXZrnyjuiHl75z99/Zb
	mQAAMJ+afA=
X-Received: by 2002:a17:907:97c6:b0:ba7:3d21:c136 with SMTP id a640c23a62f3a-bb801ad7481mr26684266b.18.1777327073870;
        Mon, 27 Apr 2026 14:57:53 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b88698esm10214966b.44.2026.04.27.14.57.53
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:57:53 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10759059a12.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 14:57:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+REO8ByqQDwNQcveTZRCqwLGV8+aIQhMN8C69eoHGi3Xx+RHQTChBb08og/S35BIERpjz+J9qo4EKE@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
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
X-Rspamd-Queue-Id: 1EA4B47B10A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14372-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,mail.gmail.com:mid]

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus

