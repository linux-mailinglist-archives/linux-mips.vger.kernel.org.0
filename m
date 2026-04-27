Return-Path: <linux-mips+bounces-14356-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G6yJoan72mpDgEAu9opvQ
	(envelope-from <linux-mips+bounces-14356-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 20:14:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8F478512
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 20:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13879311432F
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5878E3EC2EC;
	Mon, 27 Apr 2026 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cPn+SATK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B93E9592
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313253; cv=none; b=SO2zUfuJ/SMb12WfxgK2Tqw3fFA+rtGqrZhimKebxjNqGqiIfV2Z1yi+Wf7WRPX85a7LWUuoPcn87msUdWBCJkkdIQKiCfUGaDzaR1DgRTzOpwU5eC0r7QapLILGi1fVJjrcEv4lRALKjNMbiEW8xDqgBe74tAndFf9T6UrFqCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313253; c=relaxed/simple;
	bh=LJB/6F8gRS18jiwpo8qTgtmT08hQ2iYqeOWrm4IbRjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BldjQnYYXYgpyDvP8HUGLI2wONd7sJMQ3WQ65Kf5Z7klp//PhhKyweD/TiHIGVIV/LqQaq6DCWoYE+TrooUPcYtYOvxJRgxodyXwNUMdGciWfYbwNkAkRxIXpz70nMgbXIXtYuyeTkAT8eoUDYvhg658GywZlaSV4yqY9iXuYWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cPn+SATK; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d780757eeso6990914f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777313250; x=1777918050; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=cPn+SATKuQe+JOM/S0y9YehIYvugeCOq5rAxKMXfxKK+HYTUjsNnOR0yVrIzvX4r2g
         DkCwv8WMJM0bFqL6Q1MTpaeN8Kzf/djGm/Z9E9tyzqUTSlefq/B1oqqWYHPq92z8599d
         jSJ34C9mcPaflWs9Lkrsod+7aOZ7q7kzlW2NaRw9K+M4/LVBB5Paus9kqhXbvh5xbusq
         6Zsgh/pkGT7LT1at8rk474twLKrJqcCWyaPawXIFA4F34mV6UVbAPFxd8BFU4K4U1vwG
         VusBi9r03Y/j7QAjoasRoSju4+uGyRT8cdp1YRZxubLO2i+2GANpj53djrwGbhJHU2Yb
         vaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313250; x=1777918050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=sdFaKYIu57B4lRdgNt3uVdJ9mss5zPEKODghWVdBCl9knxb4G+e7rf5juQ5Bd04vnD
         Q++5aMgSZjHp5IUtUCt5Q3aVI9yohNSNgzS7UFAGgsR+D3wcKwaGuDR6zYjFbDobPpK+
         4nJ18HMZ43rwwyfag8nZQrzubmyVPEBNvgveHs9cFJtwfQF13jKDnimym0uvuPXZwVbF
         wCbvDi2osBVaJ6Vs+JL1dNio96fwUKfL2YoLPBQjuGsWR6bfV23XCitmKxLI0sYmgPxk
         VzZtif5f0Yfp+5MLsaiyia6mRjNqX85lo15GkGXgpuDVfRFsImCz93kMGCrl6NsOT2Jl
         xjGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GHa5fGJ55WeIoqmBZWmfYr9Fe/rbdqB88waYLBNibJ7QZqBU/fuUVlBCjN+4SRJE4d/1zm9R+uIR6@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtSBu1eF8qt6yS3bV0vT4+3JhhGMj4C8vvme6IPzF/YjWRJUH
	U2uoE6/12S3UDvYcqDL9dmLqjJwO58ue9+/fcTSL+zuksp8gjet/+U//RpvN7RpbFBuAcCHu8eY
	H2olX5eyfKcG5sPl/Jw==
X-Received: from wrmd3.prod.google.com ([2002:adf:e883:0:b0:43d:7940:a11b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c7:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44636a393e7mr256856f8f.24.1777313249648;
 Mon, 27 Apr 2026 11:07:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:07:28 +0000
In-Reply-To: <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Message-ID: <ae-l4FGDPLwBuDXM@google.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
From: Alice Ryhl <aliceryhl@google.com>
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
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 22B8F478512
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14356-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 07:13:46PM +0200, Christophe Leroy (CS GROUP) wrote:
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index 01de4fbbcc84..710e07cd60ae 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -5,13 +5,13 @@
>  __rust_helper unsigned long
>  rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return copy_from_user(to, from, n);
> +	return copy_from_user_partial(to, from, n);
>  }
>  
>  __rust_helper unsigned long
>  rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return copy_to_user(to, from, n);
> +	return copy_to_user_partial(to, from, n);
>  }

No Rust code uses the return value for anything other than comparing it
with zero, so you can keep these as copy_[from|to]_user() without
issues.

Thanks, Alice

