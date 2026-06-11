Return-Path: <linux-mips+bounces-15048-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LhSBNzWKKmolsAMAu9opvQ
	(envelope-from <linux-mips+bounces-15048-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 12:13:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354E0670C02
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 12:13:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="fWqqg/qE";
	dkim=pass header.d=redhat.com header.s=google header.b="ON/ZQYvx";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15048-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15048-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25403357307
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 10:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B1E3CB2D9;
	Thu, 11 Jun 2026 10:10:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DA3CAA31
	for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 10:10:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172639; cv=none; b=DOwkNG+f/MwB5M72XkU++FR3THp9xD/dvo6gDUhPFzlR5vYk6SbhT31RlUbKMip8aGWfYh6SMI7HO5pt584l7G08Sm1vE4ZUFlsLu97Vs/eZD7lcuEYIwy5Duu8y3gg5c+dzZB4jWcec1Kgr06K9vUcb6dQCiHEbGwI6OAs5500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172639; c=relaxed/simple;
	bh=oPMscQPT7Ovr3uXegR35yeYCHSRNMFL4voLy9Xybado=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f4R34rfQkE0BmoQQLMoCsFKwvOkbbdac2RWlMtH3R1+ZtZgtDSQ8qB+85COaqZLgDi9nbu1nNJ5Jwp9iXasfW2jb5R9rsu0g/2/L44pGUgqBJgobiD+JtWwe9BxAD0edbfIA5lfMLTgL5U1XX5CRHc8kPtAbr5SaYw3KEr7H6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWqqg/qE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ON/ZQYvx; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781172636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
	b=fWqqg/qEEOeBhLTiXQh5WxsmVoRKTGr1GVdI4gJB/RA9tyWt61Ta7r5+D5i885hdF+V7hr
	b/+HE/ZO+JeZQG2lviWKUE/MbIKl66dSoE1DSNNFfYGYdYwL5xSyeSzlkRfNcD7R6XQ/NB
	RjtD+vlnBM15QU09C0/DzgBpVCzYt54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-5BcQ_KnsMWGw5PvAeHhTgA-1; Thu, 11 Jun 2026 06:10:35 -0400
X-MC-Unique: 5BcQ_KnsMWGw5PvAeHhTgA-1
X-Mimecast-MFC-AGG-ID: 5BcQ_KnsMWGw5PvAeHhTgA_1781172634
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490bfd70b0fso78196905e9.0
        for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781172634; x=1781777434; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
        b=ON/ZQYvxQ3Bu78N5dWf8rw9SrbxVOJL50Ud7/+h/gucmV9pPWOMNLIpgWaxFtpbI/4
         dEThp43yNKrJ8t2VT2CNU/tK6AI7AxAHhgWw1ArSRP9X9Y9CqmQ0LjByF7cPjfB0kcF9
         CL3RW4nbbMAQx/3cRcEc/f92jYdrk2sA62aHk9Yjb874c1vz2biqHN78GtI2IdgHtva5
         CvM2Wo7c4CyJir0RfXDWtbbz6Az9Dv1R+R+Pq21FTSPlttOvhnlKNdghkzIF67GH2fb9
         64PbydklVv2Shro/AxyT2fXD7oZiE6awOmDmFE/gDiSMFs59jMMu4yx3YtqwkV8qwL1N
         fIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172634; x=1781777434;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
        b=HDzLcWgre+cZB0U6iE9pfiBIyhlBePAN2gM3JJmbMOi/1GzJQ2DcdaQlgl25z2crH3
         RoBLMxblhkOidH2MLvMjgJoFNNs1waNmsx0w4Xq1GMEpj3LOt5K4VxMx537VxvdorMO0
         tWuptk9LOCYCMNSKX18VP8UAkQm9JtaDaIdiPKX+Cfku7LL7xhRA2QOaDZlegTmO8LLl
         UYyYJxecLd1plw2iA+1chJ6B9HX+vTLltXirEwThJ0XnZWaBHrPbqberdddBTyo5KoJV
         /bh6ElGABDUrq4rQQEHErkgCJpFyuwDwn7lmJafeiT2uvRM7oP9kAzl5shwnNl0viJKd
         cRfg==
X-Forwarded-Encrypted: i=1; AFNElJ/8eG1joV+kGxDyndoghszrvEyAh4gPXIYsRggYJqBQ8IwfwuUiqxZ+7VL1mzYLH5mMbqxnvRdds94c@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvGgX35yF1Sc/ogZGPH7m5gC/ckoGKzZbnI7uDSr7Vukvdosh
	EbnX8Ac+4p56bSqczfjZFwXvDYMNup762IZIcsXG+L5ujvQnmg17bs8JanZVnQjWPIqYdA0/kn0
	LBMrtwQZOuD8gyUkecH35CeMtAQlHS8Ihg7kxLxzz1KG4JMupF1pL/kVS3buJCMA=
X-Gm-Gg: Acq92OGki4rhZnYBSHCbEkETqj/mPOeUt/36STd0duueYJVDEH+YSQIbqxD4qfPqxqU
	htWHmeZYrcgmUQGBiUpBfq5cKxckqozTeDYxNov0ZQzbCHpouCxQw1PQft9qF26j7xIT6kkITgJ
	lJXqsR94q7edxcy/Z0nGIFAX8z/Z5cfyBC/Coq5t12Em4NdVIdlIvFlBLEV1MnxjwB8m1jvhRel
	GFpsaUPd2G3OcUeMZ2XR1TT7ckrxpBGn+jB0lVrL4kUhMwDH3CgpKtVX4NE8xAXeWz9WpL+Ax6c
	RZpt9MOvBhxAp+Cs/u8ovU1zr9DMp00JHSvDlhX17Y6KbfJiy/YXP2vCyLjzdjyvdH5vabyyu+z
	VbAv/DKaEOXw0tm65Lvu6QZ5q9JMWHnt0QRiceK71MXdF4WEjREQHnT3FXbGtkHUayNiryewtU4
	gq7MFKmTMiedqXw+s=
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id 5b1f17b1804b1-490e55dc1damr31237355e9.7.1781172633813;
        Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id 5b1f17b1804b1-490e55dc1damr31236645e9.7.1781172633469;
        Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm38076025e9.4.2026.06.11.03.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:32 -0700 (PDT)
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
Subject: Re: [PATCH v5 01/15] drm/amd/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-2-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-2-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:10:31 +0200
Message-ID: <87y0gl5qw8.fsf@ocarina.mail-host-address-is-not-set>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15048-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,suse.de:email,ocarina.mail-host-address-is-not-set:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354E0670C02

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in DCN code and do a full update in DCN code if it has
> been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. This driver does
> not do that, but DRM's damage iterator will soon rely on the flag.
> Therefore supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

I don't think that a Fixes tag is correct here? Your patch series
is changing the 'struct drm_plane_state.ignore_damage_clips' and
the changes make sense, but definitely isn't a fix in my opinion.

Having said that, the change look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


