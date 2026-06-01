Return-Path: <linux-mips+bounces-14848-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIHHDwViHWojZwkAu9opvQ
	(envelope-from <linux-mips+bounces-14848-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:42:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38061DBB3
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E6D73056941
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A66F356773;
	Mon,  1 Jun 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQm6PenR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHurnysD"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B935200A
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309831; cv=none; b=JIGe/+Q2lrQ1E4XtoBZNGmfSGBoVP6yDiQpLEwN+j2Sz7a5tjYDWR8S7oK1Zd/agycRZV8dzgOncyfd305AfmUPmv5EIfLqQZ586WIo8zg2fFkHeLMFcKSjQOociKFpDpHsXbEJhODRFKDOC4hZ8ic+0PyZbssG5bjnuZxnW7iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309831; c=relaxed/simple;
	bh=QwPby8X/UWc3SSFrtbajyvQr/e6eT36Z4APpEAoWVYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VFDsJtoZbYJBMZiZec6fJnYuP3RJScHddN2Y6rMHA4SwzWV+J6yQQxJeDIn8R1OZG/6taJPAy7wPoezopcd9l3tdBUNXTtT7aJKRsqPr28MiSw+zpHCvlG13gvo0gT8ur1mKVGP6/sObWeKD9nf5EussGmwJgLlmMZwtT0Q/Py0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQm6PenR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHurnysD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m5PnIUHVz9ACSP+/e7SnC4cD1TL+Z3tg4EIuDM06718=;
	b=GQm6PenRqlHE5fwAvh+yBpQ2UAw1QmnxoIow7O6zDOsku8TzYA8QdOyu3j6l42Q8L6yizA
	5a51IR6zIJR1uWwRz+k2MmEajcFk0WuFqy9wnSqKh5LCcXCM5yv89TPmlIFNRY2FRoVaWv
	s6u9HfZ18Lg58gep2XyVg2OvnJBRT1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-0nlLcnFsPluSRfmKzR0A6g-1; Mon, 01 Jun 2026 06:30:27 -0400
X-MC-Unique: 0nlLcnFsPluSRfmKzR0A6g-1
X-Mimecast-MFC-AGG-ID: 0nlLcnFsPluSRfmKzR0A6g_1780309826
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490a762bcc6so11355085e9.0
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309826; x=1780914626; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5PnIUHVz9ACSP+/e7SnC4cD1TL+Z3tg4EIuDM06718=;
        b=UHurnysDfKjAHL3T1dknaMI8R1FlKid3c6TPkh531o9wZkrFPEoiFbgNG6yPU/JIM5
         1sxFfsbMqdSQShICtfO5CQzGHAvivHOZx1LPFV6GsxL3KChSb2ga/u6uvm7/6Rl9tXuc
         U8+DyLFsq3uZOTbUEZTRQ0vPvLgbKdBNSgzkyusmRZSEbHYKkC7hg/DYtylx3KS7wGkB
         WUbQxif7m7acWd2t2SVeq0tPH8IjWlze3HJNro4fiiOLAUbqLWqFVEkoAg+SjcI2qQki
         8msc4StfxC4eGGFaEVuSksC49XCD0vhGs41Wv5+v87L8pS1Gnu8yyo79bbG6NcNHi6UN
         iM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309826; x=1780914626;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5PnIUHVz9ACSP+/e7SnC4cD1TL+Z3tg4EIuDM06718=;
        b=FNIQjgzPoFI1lG7b/f2AM9DIhdCKU7ud4DhImyx9AH+1ldR2xKF+1jl59g9MaZiJ4G
         r/1MMA6oUP1uXMotf30+4Voma9Z6rxXvW+mZG3EvNkk8VnLpVj8wL/WVVhtG7h5/ekUH
         V8GMUU0AH1/8lpLzB9BvthkpM2DKt+x0zyaObkw3Y6OKJ79VQ54zYVybbskaLjyBban0
         rczv2hHCrB8wjK1cZbbvnh3x5b3y8OYe/vatq1O5/ehSc5DmKs8zZT9mt2PD09x2lx5g
         YxjOyFTf+OuNCX6UCC4AmdihjMXwxhDHDjntwzU9Db+9YDl6AFtgUwFzStzj7h+SC8If
         NOlg==
X-Forwarded-Encrypted: i=1; AFNElJ9m8N29xfA07R6AuV5zfpKF1/dbQiGY3+AgNw7HOKqvtEwE7MdkhURmqwJxD6mg94at/48CTjLTWn9/@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqQYourVV+YftSYxAB9Onu50uwtCV9/HMqn5NntNIn54CoidA
	ZaNNoVoDHnk5LmY9KVI50/xf7bB+5A1pCN2vbVXtPlQgg/ln0xKUazaXcUDxxz61TMf6e6a1rwn
	MbkQZIyxAdx/3+BqWzpmzicv+ODX9OxwGmd78xv4Oh/JwlxqO1qvRx/X2sS+FGXQ=
X-Gm-Gg: Acq92OHtbYhkFzvAJxohZWgYKGW7QowReAqzQEAWVG/g5sVDnNqXORoEEVFoPhWZoem
	B1oY3LoM0cThAHMgr8AnzAWgQ8PR0dAi2ShpvVgHlq/PkG22/8IozYH8gL/GQtxmO4RhlwnfebY
	KOQQFwJu9ADQ55p9L+O15X4FYO0dKcpZJbB2Pi/ev31UlMbbvaHHzgmjv4LuQWJiMIA65GzBlR/
	DfoXfABrIsSUzqm/V4hDNj5Mphvdm9UvlxZk/kMf9y44cGfhdm+aMK/2BSsQtnb3IQIH6bmFz3m
	dhCpmBX5QBdjbs0jxeLUsogDYQXhOtaxNJNYAlSPwRn4OxTEWdpawtmvDsMB7zkaAas6KlTlKjx
	DiXz9HeCPzuoTebT1wzGGgCnZ3ZjOP+m8FRFrhsS27Cwik6AJ0c+TRUtKGFHnK1Ovjo/kscADvZ
	Aw19KSpprZ1nZOsCU=
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490a293b7c1mr147144765e9.27.1780309826059;
        Mon, 01 Jun 2026 03:30:26 -0700 (PDT)
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490a293b7c1mr147143955e9.27.1780309825482;
        Mon, 01 Jun 2026 03:30:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490adb4381csm24027695e9.3.2026.06.01.03.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:30:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 10/10] drm/vmwgfx: Remove unused field struct
 vmwgfx_du_update_plane.old_state
In-Reply-To: <20260530185716.65688-11-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-11-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:30:23 +0200
Message-ID: <878q8ylfi8.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14848-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,outlook.com,broadcom.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,broadcom.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: DC38061DBB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Plane updates no longer require the old plane state. Remove the field
> from struct vmwgfx_du_update_plane and fix all callers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


