Return-Path: <linux-mips+bounces-14371-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFb2OKTZ72mvGwEAu9opvQ
	(envelope-from <linux-mips+bounces-14371-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 23:48:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A647AE7A
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 23:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A54F630347AE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 21:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63AF376BD9;
	Mon, 27 Apr 2026 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KOpBOAAi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC0D3002AB
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326316; cv=none; b=qqInvMZorUFxLpecU/QmTGIqI+N4MNGsM5P2WqU3uXoK5t3TGC3hi/f1Jt9+IErXLkVrb47BM0p264pRxiRt7OGOjO9/mG4xy7KfGRMIWAAN/Av9ztWFg2sWNs7oYaLo6tauscKyn2+4OuY5imZhf0/GIzfqPuNrd3b/Yjdmqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326316; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDz+TK6VUZkFw+1BY/q/3UN7jN7dAeedI1r0Son351ZA8MrT+CDgicEMUOlKHHixKA1uikuxsyYkBkcOtiWxTr/16qyY9LvXa3diWJz5WIr3B+0AjaKUomu+ZuSGXL9HiU5ZniXdni1zpD+VFmsKHkJiJj/vYIA5rJBprmy692w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KOpBOAAi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5632043a12.3
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 14:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326314; x=1777931114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=KOpBOAAiY/1C1ETKqHobBCEoiNFCjJCEell0UFms1TIlykUE9SSHaWo3QD/5awmamZ
         7VbrjOqrkPVf0wHwg8XNpeWyKQbKC9vY7BxIAxD1l9Y3E2iKkCO+xX2YaoaH9nN8VZMd
         AiIaL9Z2uC5eXPsQy/T75fHybBaPCka8GxyRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326314; x=1777931114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=IYog1v0OrKBeHyR3hWIAFnAS9garv/IS0Wry3MzIBuOkjkYd6In/9QSIMh98dizmBD
         Uz5eL1G2NtEgKx0Cg0+hHzjFvh8XsGdVqx4Pz5ez5R0jx1FaeHJiNaj1sZG+Yfx5+7UX
         UnVUVbt9wzOTFRX4S65+sFGlqzxIpknMc0AOXChfha0XaAraABTPA70VYsz+7fauEa/r
         /VFb48XXlmFCj4yKK4/Gw4hOTpkEInEVy/lfRghH6iu35SD9jZ1ofQsWGPqQMGm3IR4n
         /IKdAmedEnMbVDbqurt0jxzc3AeStqobJvhkFHgICSEI1iWCNekx5f4+1g+s0916zybj
         J9iw==
X-Forwarded-Encrypted: i=1; AFNElJ9kTrtTHHrZ5OZSS9e0zyq1WdOyjrKv7vIyNpvkTs0Hsa/REQtIHGKSwGfSJNv+YJ6c040LfJHzTh2C@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbAglOLQhiGszqt0m9qLTmlm4ch7SEV7Trgl50tqVxAu5b4kq
	a/Yn3gomydVVE9JDqX/ocHut0Z16s+tEjvnHktFv6+8u1/Nl0QKxEVmWfPTVv1qOZG562gqSU9k
	U/0zsV1WrQA==
X-Gm-Gg: AeBDiesmcIVTtKVjLLkcIpR0hdu/itHAN62c5/WdOaAEWBgz7EMXG2tOPeZLfkm9v7E
	C2C1C51UMX5XdI9xqnjlorWkSJ1vXD0o3xUZDZJ1Plc4N82FKB9VqhCxzWxB59VVkTtOmK7ZGxX
	Tb04rBb6zDijO2jlyDOyT6ect7jJXi+huTmeePsVTI72jNn+kTMPsNT438+8rafFfftbNRHpRfa
	1PTIW9bY1qfQQwri+6/KoOmPbO+kv/dkVFXamLsFLCausLCU23oM5J1SXNlqMZWe+KYmx3VfEp+
	LrltWu4HE1zvHJEH33tvXiCXwmN2DHKRNho7d0aydXCUvgX/lZDgXu7ZVYufl1mA4tbvv9tc4b9
	fTdGNonHpN6S9dQB5zWisJ8wQ7yp9CXm69CVXMAmwhiM0JggQof4FBzTXDrofwgPNzE/AX5E0zX
	9o2mw2WgsWdxsSH4oRryU609W0llURJ6Dt7eX2CkPTeyfgEHpPQHs4wYEOFnf9fqa2nXG5m7h78
	sq2yDqNPxA=
X-Received: by 2002:a17:907:9814:b0:ba4:ea47:5a2b with SMTP id a640c23a62f3a-bb80520b3damr26733066b.43.1777326313618;
        Mon, 27 Apr 2026 14:45:13 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808f2dcdfsm10214666b.22.2026.04.27.14.45.13
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:45:13 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso849366266b.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 14:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+lnBxNL1SxdTkA9tnZDmFKCb1N8cInVr1IkYKf/4OR4EB4eGL1rvAwCPyp9CXWXu8LbQCdo7GtTKMh@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9C4A647AE7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-14371-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-foundation.org:dkim]

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

