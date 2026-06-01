Return-Path: <linux-mips+bounces-14846-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKQaEsxhHWojZwkAu9opvQ
	(envelope-from <linux-mips+bounces-14846-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:41:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD061DB60
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47310306B765
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA9A392C32;
	Mon,  1 Jun 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dsk+Czb3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FHD9osPh"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622939768F
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309782; cv=none; b=NsLZ79ADLVLC30LAuaZvR3JMPN6wBtH1pw03cyDEwALhhbIzf1wg7NMqIa9UmtoiHToDM7ZpTusKlGnc77bIcTEa14j1nd3mEw+6nnrfOZWLxWbGwWe2wj115LOfyJS0Sj6n1bpSSoZhSUwuK9+45CJnHE0mZLp9hRvKRE/xXV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309782; c=relaxed/simple;
	bh=4dKLYO7/xzvYtKg4HAIvf2hSPWCkn9FdTg30Var8HtI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QjPy1hd61Xdc/m/GJAMBqmSLwi57RXtxYsXjULJq32wA9TjpO50uG+Z+y9t+oZJipoDRnk+DJ9oMQwpc2M6QA2U5i5r1N2M9tIxZpBkit4inEEJrIIL9X8oKoHAauJeyKJ4zh1iG46Bcv79YHGjLD2e09L88OM1IWk5HeXLuo9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dsk+Czb3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FHD9osPh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NR4sOBYtM0bZ0iqX/XjOc3nz+SGcL1hWjzs/0wJdl4Y=;
	b=Dsk+Czb3U4o+9en4H+LoFWe6gyOGWczXE6ju7lBiYt73mjuYeL4W3H53GUL5oveS7op+uL
	duTz9ZtUnniwA+UxJslCzoo+tepSiJYkh+HlevX0tNkRscWwIwmbyZqDUuEmUC3IWFPKU0
	BuP55JWs9sgsdej230p9MoaW3opRLr0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-l10bY_P1N_K5Yfhglu7ogw-1; Mon, 01 Jun 2026 06:29:39 -0400
X-MC-Unique: l10bY_P1N_K5Yfhglu7ogw-1
X-Mimecast-MFC-AGG-ID: l10bY_P1N_K5Yfhglu7ogw_1780309778
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490af284fd8so1201305e9.3
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309778; x=1780914578; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR4sOBYtM0bZ0iqX/XjOc3nz+SGcL1hWjzs/0wJdl4Y=;
        b=FHD9osPhvq7EQG8AWkXATUhKhfOMXWTQn8L+z7j8Sx5FGbaapnYIrIy82dF06vyouX
         AgYVtqNT3DdJWjNgLMfF8k72jHSMWtn6/z+3V2Ua7d8mQTMpQqLW9h57EMtXk5pAmdFZ
         8hDdNA/NzzaMwwBzoQdRdAs0zrsc1TVQwFUvNcmphzRk+COg5FRrB3dcl+/OVl19H3+/
         DEBXPqE41FgfGUCF8hrP6ViTyMRoqO9FLoXFD4xqZU3j2F9dwpHDoGsgCBJvvrdnPKrt
         /9h6utdQgs7XKqSRegrDkFVS6W8DaMoYgtZddIuN6WcaBLhSwT9a+zoKK3RZYIv4CiaS
         39CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309778; x=1780914578;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR4sOBYtM0bZ0iqX/XjOc3nz+SGcL1hWjzs/0wJdl4Y=;
        b=W1MNJjkmk+n2Zgg6Lt/GqFgwi5SImFRXMr/TtDjcnn6Uk2qqD3AGLTqmMor4vg9hDh
         7StWX4Ee7jaLc8RCC9+uFrk0l6YuPk0PIANFzhRiIMox3J7xs65kzz9JtVL5ohBJX5q1
         o0uEEeg/XLCAPe0AII2x9Dn19ewCeMRlPjNy7+izmOv69obh9nAlZ/RG6D1rxMekPnyT
         HgDMMFVqTHH7P8lt4nFkLKLXrV1D5XzORbcn4vkAJ9RP+bcSqkJJ8H3NzH4gdm9GYAuv
         yaoqy4sctbe57yFElnK5IA3dRbHLPD47hYAZPve3DgHkTVWpwGR5LkOgnWGayVcwK3f8
         2cCg==
X-Forwarded-Encrypted: i=1; AFNElJ9lzwgrE8U3XFBjSYNcT9pcp4m+NLk+0C+ZYBV+YkxjNxpjlRUnU0kcaZq/e40Dwn+XRD7RqyOdQ+p7@vger.kernel.org
X-Gm-Message-State: AOJu0YwWadJBv/TlBnXuXd9bIcrXQKiBTxa/UTDhWAH5AtdfIkGhUY0U
	cxfrSPccHZRIkzYpdVo1yVDRqtjPofklaAmNlTPRLMvRIbWYKgs+DFll1H2L6hkpjg2qSWcgwH5
	Ve8wjez+nFvzNcSU2gntcPLMaQfMpEMOnxYsuu8Iu2jlHloYvkbOrypO3+5fqRGc=
X-Gm-Gg: Acq92OHQIUCsQQL5ITTk9qypQYyZqyMamNK+7VFf0BU5CzYJcX5YU/yb+LaZDFp10V4
	Hr9wG3nQ2EQBIhS2nLmDhch+WYysNLDZTC8QX2HTqfk+1mGITXiBmj4TA4tar6FC8IFkDWg9dZO
	U5/YFv7eIkLD4V/pCSQWZptI1r8Tid7e75U4f6h1Q8pjYdfvrTgjHSXommt8pKIUhLwpXWRIwaM
	vGswbuUSvK8+k4NrC/cqsDgJGak/b7bRbpHZXUSNCZhrgIq71gq5RZYEcg248VB9JABVLIHBkQU
	He3/0AVRVd8M0WjXudeqXxWi6lP0DYVPn7bKvctekVAiptFLsfv+229+SrnHWAp8Hpzqyc5h+S1
	fKn8Ln5jegUgTmcHjB/JSyz+Qg7UIrw05fIJl75hwmmFy6zAfVYddV9+7ZuhPxuFbQcbgUCSK+D
	URHcN0bv6pUvDPqiI=
X-Received: by 2002:a05:600d:8444:20b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-490a2947c86mr142093055e9.28.1780309778306;
        Mon, 01 Jun 2026 03:29:38 -0700 (PDT)
X-Received: by 2002:a05:600d:8444:20b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-490a2947c86mr142087935e9.28.1780309773155;
        Mon, 01 Jun 2026 03:29:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a037fsm25007994f8f.4.2026.06.01.03.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:29:32 -0700 (PDT)
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
Subject: Re: [PATCH v4 08/10] drm/damage-helper: Remove old state from
 drm_atomic_helper_damage_merged()
In-Reply-To: <20260530185716.65688-9-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-9-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:29:31 +0200
Message-ID: <87eciqlfjo.fsf@ocarina.mail-host-address-is-not-set>
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
	TAGGED_FROM(0.00)[bounces-14846-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: C1CD061DB60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Nothing in drm_atomic_helper_damage_merged() requires the old
> plane state. Remove the parameter and mass-convert callers.
>
> Most callers now no longer require the old plane state in their plane's
> atomic_update helper. Remove it as well.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


