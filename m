Return-Path: <linux-mips+bounces-15050-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J18fEwSKKmoOsAMAu9opvQ
	(envelope-from <linux-mips+bounces-15050-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 12:12:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9DC670BC5
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 12:12:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=jQH+Awhi;
	dkim=pass header.d=redhat.com header.s=google header.b=QR3XvazO;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15050-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15050-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37CAD3008080
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 10:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74053375CB;
	Thu, 11 Jun 2026 10:12:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DFB3C988D
	for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 10:12:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172732; cv=none; b=VPWb/KahcjONiC9j8lK7rY6cw9rFlstFvB9W/W+RJ4gy+KkGZtmcSSG7gLVhfwBGEEWDVhlbRmkRwB8yDQAixnBPFcpRl26HwlFqzpoxC9AQoGCM/NGXuzyLCPwAHBJWSXaSvU15G4ES5pVjSTLB+4X4rojRrm1jG0Ba3oDC7F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172732; c=relaxed/simple;
	bh=0DTkubvoxHBUMHmj/JTP8y1M7mVG+8twCULO8Aq9NZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZsJMF1T3RQ/pcxgenJwmKiXiEuheUAQGxa5Jt/+4rKD7j0MNEtMTIAq9Aqvn/DwuNgTgVP44tQHbkdJ+lZChtTGdZroOYbo4fTeIpJhSri9eMT7yUeSSiGkV3ErY0N7aGN4DkT7+b/PTgr8OJeWXW+BlE3SMFuG2/oVfiV83f3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQH+Awhi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QR3XvazO; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781172730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q0r9Bb05wU768Bts6kNipr0zjojivSJzgQogOHI5wH0=;
	b=jQH+AwhiNYfDNE+fpr4EyyfDzX+dLcde4fPwRfQtPkFv4U4Ir1NylXa63M2xY7sHY9Lsh0
	2QjNaTT2VebPP1X4WLmCuDf8Q08O5dzGXjc8KU7LN722trj0LbRBVADxg9kRbg8AOdBkGb
	FynE6i7WfrFwElLyvj9LvMXWaXI+0/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-ZBYNZ2fuMPqZLgOFOXoDpA-1; Thu, 11 Jun 2026 06:12:09 -0400
X-MC-Unique: ZBYNZ2fuMPqZLgOFOXoDpA-1
X-Mimecast-MFC-AGG-ID: ZBYNZ2fuMPqZLgOFOXoDpA_1781172728
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490c4f61a34so41269715e9.2
        for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781172728; x=1781777528; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0r9Bb05wU768Bts6kNipr0zjojivSJzgQogOHI5wH0=;
        b=QR3XvazOsjMUZk1ZXGzPlbIZJ65yiI1gk/o8VU5XSCgCZnJU8bl/twjoPQcdWbAdZX
         KdJ1vgB3WkGOxvyKlFmJzbxZtpUueoWp3eAMZRtTpz+PPmZoA9RbiKe5RdzGtJiUqnvS
         WVMqE+L/7wg+2Y3lczY7UNyXATbYk/0Zn/nfBSN/MwdTyAgfkHBq9bPh7QeAHhniaUQ/
         2NLUM/XdKhD+zdEqQlCdebSKp6IH3YdUT0fuLpL5IiNbG+dmC5429KH3FOX/v1951u1G
         8lP3yXir0mDlJOPir73L2UAUEoXWBLzqYyWcCyK0OvdEsrIa5MgaGkE8GANZORZtzRWY
         U15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172728; x=1781777528;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0r9Bb05wU768Bts6kNipr0zjojivSJzgQogOHI5wH0=;
        b=kLk4duA5Kf4fd1Fmbc3kUpkzcVeLY7CqTmEL440inA/FuEuhrVR4WQo2u63RNXD38R
         cLuz0AXsIUrUsGbV8CasEhbcgc3Ak0OhdhOZe1muiVlknnE2s2W1hhCa7VUIzU2Q0MMo
         idf6aPrIW7cAIUpfS1otMJMyWLSOFDWWZ4ceH0k8prp34msms5jvgO09aPEFvxhf4KOf
         lrsKxpVopCZBvcYjGIATCDbV1GaFZtmOMw9Fd3nTbXetJKPKdQdRm2zzCQUiIbZY5cNW
         kLukkOUAChMXTadjiRtbvIhPyX6ZLl/use8iRg7NzUjfts9Y5MFsB1B8xWL7HqNDu2Hs
         yYkA==
X-Forwarded-Encrypted: i=1; AFNElJ82QWiqq4DhPVzD3OGP7vX4VC5B6EpNls6M9hWwtFyVPw57Sq6QpA9rC+hqNDSIbqAJYVL5Knqxu42n@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFo4YPz1A77V2q5cDypH50sSygMXcGpBWBREEWEDS08j4+H/8
	AmDsk2t7hZThKkhkC9RIQclELIc1WtKtxwPN0JUxRyQpU5KwTDKMdHbs+tNeYRchlVmycV8+gqX
	gESwqh133Un2+SfwLzh0dED/CCxHdj8E6KvYXamjQZZ7fvHDsYC7MW3XLnArCjzQ=
X-Gm-Gg: Acq92OFxGt9jkci67V3HqE871oKKnuL2XErnB5e1kwq5ypmnwUBYtbJ4O1/87jj+qnY
	Jv6ryPL9/5DMnqPL4qb3Pqm5rO2sKAgBukmgrGDEAUPub/2OpBoK2Uplo6R9Y15J/m0sf76+9eJ
	bgNQIccMWVc8LTvAp3rCgzlqius+jXtoxd6I89PeMV//qem6jsAG09gqWOx4yi+TsbEsqxtVK4h
	Fd1pAXnCMNsV+Q08+3njUjO4uuzahma80Irg/I/ognPDazhBamxhqKpxVf/AsVYNDd2f1f1oemY
	mkC3DKz0fjW73lpYl4NyDcRZaH+5TVrvP7sQZMFZNG9S+pbraB/sRDlt8q3NN+cUmNfN29T1CTd
	3e8tV9lUBwmj6YVfrbgg0XUTCFOWILmaTUc7nFDmPGw44SISzD5FnK0OY78RuSVSKb5r8sUxYQH
	LuWFlh69t15wkhnR0=
X-Received: by 2002:a05:600c:a39b:b0:490:c08b:b24b with SMTP id 5b1f17b1804b1-490e5607e3cmr15876155e9.26.1781172728118;
        Thu, 11 Jun 2026 03:12:08 -0700 (PDT)
X-Received: by 2002:a05:600c:a39b:b0:490:c08b:b24b with SMTP id 5b1f17b1804b1-490e5607e3cmr15875655e9.26.1781172727683;
        Thu, 11 Jun 2026 03:12:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm51975965e9.14.2026.06.11.03.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:12:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 03/15] drm/vboxvideo: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-4-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-4-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:12:06 +0200
Message-ID: <87se6t5qtl.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15050-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[javierm@redhat.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:airlied@redhat.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:admin@kodeit.net,m:gargaditya08@proton.me,m:paul@crapouillou.net,m:jani.nikula@linux.intel.com,m:mhklkml@zohomail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-hyperv@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:amd-gfx@lists.freedesktop.org,m:zackr@vmware.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,zohomail.com,broadcom.com,amd.com,igalia.com,intel.com,ursulin.net,collabora.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ocarina.mail-host-address-is-not-set:mid,suse.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E9DC670BC5

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in the primary plane's atomic_update and do a full update
> if it has been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. Vboxvideo does not
> do that, but DRM's damage iterator will soon rely on the flag. Therefore
> supporting it here as well make sense for consistency.
>
> While at it, also replace uint32_t with the preferred u32.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

And for this one as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


